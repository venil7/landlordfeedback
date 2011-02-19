//add map page
$(function() {
  (function(LLFB) {
    var mapElement = document.getElementById('add-map');
    var lat = $("#property_lat").val();
    var lng = $("#property_lng").val();
    var geocoder = new google.maps.Geocoder();
    var center = new google.maps.LatLng(lat || LLFB.constants.LONDON.lat, lng || LLFB.constants.LONDON.lng);
    var options = {
        zoom: 16,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        disableDoubleClickZoom: true,
        streetViewControl: false,
        mapTypeControl: false
    };
    var map = new google.maps.Map(mapElement, options);
    map.setCenter(center);
    var marker = new google.maps.Marker({
      map: map, 
      position: center,
      draggable: true,
      cursor: 'move',
      icon: LLFB.constants.ADD_ICON,
      animation: google.maps.Animation.BOUNCE
    });
    
    //pans map to position, and updates
    var updateMap = function(position) {
      map.panTo(position);
      $("#property_lat").val(position.lat());
      $("#property_lng").val(position.lng());
    };

    var onDragEnd = function() {
      return function() {
        var position = marker.getPosition();
        updateMap(position);
        geocoder.geocode({latLng:position}, onReverseGeoCode());
      };
    };
    
    var onDoubleClick = function () {
      return function(m) {
        marker.setPosition(m.latLng);
        google.maps.event.trigger(marker, 'dragend');
      };
    };
    
    var combinedAddress = function() {
      var address = $("#property_address").val().trim();
      var postcode = $("#property_postcode").val().trim();
      var result = ((address)||(postcode)) ? "{address}, {postcode}, United Kingdom".supplant({address:address,postcode:postcode}) : false;
      return result;
    };
    
    var onReverseGeoCode = function() {
      return function(results, status){
        if (status == google.maps.GeocoderStatus.OK) {
          var place = LLFB.utils.geocodeToPlace(results[0]);
          //update address
          $("#property_address").val(place.address);
          //only change postcode if u've got one
          if(place.postcode) {
            $("#property_postcode").val(place.postcode);
          }
          LLFB.utils.notify("Address updated based on a new position on map. Please update form if neccessary.");
        } else {
          LLFB.utils.notify("Address not found");
        }
      };
    };
    
    var onGeoCode = function(callback){
      return function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          if (typeof(callback) === "function") {
            var result = [];
            for(var i in results) {
              var item = LLFB.utils.geocodeToPlace(results[i]);
              result.push({label:item.address,address:item});
            }
            callback(result);
          } else {
            var item = LLFB.utils.geocodeToPlace(results[0]);
            var position = new google.maps.LatLng(item.lat, item.lng);
            marker.setPosition(position);
            updateMap(position);
          }
        }
      };
    };

    var onAddressChanged = function() {
      return function(term, callback) {
        var query = combinedAddress();
        if (query) {
          geocoder.geocode({address:query}, onGeoCode(callback));
        }
      };
    };
    
    var onAutocompleteSelect = function() {
      return function(event, ui) {
        var addr = ui.item.address;
        var position = new google.maps.LatLng(addr.lat, addr.lng);
        marker.setPosition(position);
        updateMap(position);
      };
    };
    //register events
    google.maps.event.addListener(marker, 'dragend', onDragEnd());
    google.maps.event.addListener(map, 'dblclick', onDoubleClick());
    $("#property_address").autocomplete({delay:500,source:onAddressChanged(),minLength:5,select:onAutocompleteSelect()});
    $("#property_postcode").change(onAddressChanged());
    
    
    //main
    if (!(lat && lng)) {
      LLFB.utils.getCurrentPosition(function(position) {
        map.setCenter(position);
        marker.setPosition(position);
        google.maps.event.trigger(marker, 'dragend');
      });
    }
  })(window.LLFB);
});
