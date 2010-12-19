$(function() {
        (function(LLFB) {
            //const
            var DEFAULT_ZOOM = 14;
            
            //variables
            var london = new google.maps.LatLng(LLFB.constants.LONDON.lat, LLFB.constants.LONDON.lng);
            var add_marker = false;
            var infowindow = new google.maps.InfoWindow({});
            var options = {
                zoom: DEFAULT_ZOOM,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                mapTypeControl: false
            };
            //extensions
            google.maps.LatLngBounds.prototype.containsBounds = function(latLngBounds) {
              return this.contains(latLngBounds.getNorthEast()) && this.contains(latLngBounds.getNorthEast());
            };
            //funcs 
            var searchLocation = function(address){
                geocoder.geocode({address:address}, onGeoCode(address));
            };
            var enterAddLocationMode = function() {
                map.setOptions({draggableCursor:'crosshair'});
                map.addLocationModeHandler = google.maps.event.addDomListener(map, 'click', onAddLocationModeClick());
                LLFB.utils.notify('Click on a map to add a location');
            };
            var leaveAddLocationMode = function() {
                map.setOptions({draggableCursor:null});
                google.maps.event.removeListener(map.addLocationModeHandler || null);
            };
            //event handlers
            var onAddLocationModeClick = function() {
                return function(mouseEvent) {
                    var loc = mouseEvent.latLng;
                    if (!add_marker) {
                        add_marker = new google.maps.Marker({
                            map: map, 
                            position: loc,
                            draggable: true,
                            cursor: 'move',
                            icon: LLFB.constants.ADD_ICON
                        });
                        google.maps.event.addListener(add_marker, 'click', onAddMarkerClick(add_marker));
                        google.maps.event.addListener(add_marker, 'dragstart', onAddMarkerDragStart(add_marker));
                        google.maps.event.addListener(add_marker, 'dragend', onAddMarkerDragEnd(add_marker));
                    } else {
                      add_marker.setPosition(loc);
                    }
                    geocoder.geocode({latLng:loc}, onReverseGeoCode(add_marker));
                    leaveAddLocationMode();
                };
            };
            var onSearchSubmit = function() {
                return function() {
                    var address = $("#searchaddress").val();
                    window.location.hash = "#search="+address;
                    //searchLocation(address);
                    return false;
                };
            };
            var onAddPropertyFeedbackClick = function() {
                var toggle = true;
                return function () {
                    toggle ? enterAddLocationMode() : leaveAddLocationMode();
                    toggle = !toggle;
                };
            };
            var onMapMove = function() {
                var contains = LLFB.utils.contains;
                var compare = function(m,p){ return m.place.id === p.id; };
                var old_bounds = map.getBounds();
                return function() {
                    var mb = map.getBounds();
                    if (!old_bounds || !old_bounds.equals(mb)) {
                      old_bounds = mb;
                      throttler.add('bounds_changed', function(){
                          var ne = mb.getNorthEast();
                          var sw = mb.getSouthWest();
                          var bounds = {start_lat:sw.lat(),start_lng:sw.lng(),end_lat:ne.lat(),end_lng:ne.lng()};
                          $.post("/ajax/props/", bounds, function(json){
                              for(var i in json) {
                                  var place = json[i];
                                  if (!contains(markers, place, compare)) {
                                      var marker = new google.maps.Marker({
                                          map: map, 
                                          position: new google.maps.LatLng(place.lat, place.lng),
                                          title:place.address,
                                          icon: LLFB.constants.REG_ICON
                                      });
                                      marker.place = place;
                                      markers.push(marker);
                                      google.maps.event.addDomListener(marker, 'click', onMarkerClick(marker));
                                  }
                              }
                          });
                      });
                    }
                };
            };
            var onAddMarkerDragStart = function(marker) {
                return function(event) {
                    //only close if iw is attached to this particular marker
                    if (infowindow.getPosition().equals(marker.getPosition())) {
                        infowindow.close();
                    }
                };
            };
            var onAddMarkerDragEnd = function(marker) {
                return function(event) {
                    geocoder.geocode({location:marker.getPosition()}, onReverseGeoCode(marker));
                };
            };
            var onAddMarkerClick = function(marker) {
                var content = "{address}<br/><a href=\"/property/add/?{params}\">add</a>";
                return function(event) {
                    marker.place.params = $.param(marker.place, true);
                    infowindow.setContent(content.supplant(marker.place));
                    infowindow.setPosition(marker.getPosition());
                    infowindow.open(map, marker);
                };
            };
            var onMarkerClick = function(marker) {
                var content = "{address}<br/>rating: {rating} x <img src='/images/rating/star-bubble.png'><br/><a href='/property/view/{id}'>feedback..</a>";
                return function (event) {
                    infowindow.setContent(content.supplant(marker.place));
                    infowindow.setPosition(marker.getPosition());
                    infowindow.open(map, marker);    
                };
            };
            var onGeoCode = function(address, add) {
                add = add || false;
                return function (results, status){
                    if (status == google.maps.GeocoderStatus.OK) {
                        var loc = results[0].geometry.location;
                        var obj = {address:address.strip().toLowerCase(),lat:loc.lat(),lng:loc.lng()};
                        map.setCenter(loc);
                        map.setZoom(DEFAULT_ZOOM);
                        /*if (add) {
                            if (!add_marker) {
                                add_marker = new google.maps.Marker({
                                    map: map, 
                                    position: loc,
                                    draggable: true,
                                    cursor: 'move'
                                });
                                google.maps.event.addListener(add_marker, 'click', onAddMarkerClick(add_marker));
                                google.maps.event.addListener(add_marker, 'dragstart', onAddMarkerDragStart(add_marker));
                                google.maps.event.addListener(add_marker, 'dragend', onAddMarkerDragEnd(add_marker));
                            } else {
                                add_marker.setPosition(loc);
                            }
                            add_marker.place = geocodeToPlace(results[0]);
                            //virtually click on it 
                            google.maps.event.trigger(add_marker, 'click');
                        }*/
                    } else {
                        LLFB.utils.notify("Nothing found for this address: {address}".supplant({address:address}));
                    }
                };
            };
            var onReverseGeoCode = function(marker) {
                return function(results, status){
                    if (status == google.maps.GeocoderStatus.OK) {
                        marker.place = LLFB.utils.geocodeToPlace(results[0]);
                        //virtually click on it 
                        google.maps.event.trigger(marker, 'click');
                    } else {
                        LLFB.utils.notify("Could not reverse geocode..");
                    }
                };
            };
            var onWindowHashChanged = function(hash) {
              var search_rx = /^search=(.+)$/i;
              switch (true)  {
                case search_rx.test(hash):
                    searchLocation(search_rx.exec(hash)[1]);
                    break;
                default:
                    LLFB.utils.getCurrentPosition(function(position) {
                      map.setCenter(position);
                    });
              }
            };
            //variables
            var mapElement = document.getElementById('map');
            var map = new google.maps.Map(mapElement, options);
            var markers = [];
            var geocoder = new google.maps.Geocoder();
            var throttler = new LLFB.utils.Throttler(3000);
            map.setCenter(london);
            $("#propertysearch").submit(onSearchSubmit());
            //event listeners
            google.maps.event.addDomListener(document.getElementById('addbutton'), "click", onAddPropertyFeedbackClick());
            google.maps.event.addListener(map, "bounds_changed", onMapMove());
            //hash-changed
            $(window).hashchange(function(){
              onWindowHashChanged(window.location.hash.replace(/#/, ''));
            });
            $(window).hashchange();
        })(window.LLFB);
});
