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
      animation: google.maps.Animation.BOUNCE,
    });
    
    var onDragEnd = function() {
      return function() {
        var position = marker.getPosition();
        map.panTo(position);
        $("#property_lat").val(position.lat());
        $("#property_lng").val(position.lng());
        geocoder.geocode({latLng:position}, onReverseGeoCode());
        //marker.setAnimation(null);
      };
    };
    var onDoubleClick = function () {
      return function(m) {
        marker.setPosition(m.latLng);
        google.maps.event.trigger(marker, 'dragend');
      };
    };
    var onReverseGeoCode = function() {
      return function(results, status){
        if (status == google.maps.GeocoderStatus.OK) {
          var place = LLFB.utils.geocodeToPlace(results[0]);
          $("#property_address").val(place.address);
          $("#property_postcode").val(place.postcode);
          LLFB.utils.notify("Address updated based on a new position on map. Please update form if neccessary.");
        } else {
          LLFB.utils.notify("Address not found");
        }
      };
    };

    google.maps.event.addListener(marker, 'dragend', onDragEnd());
    google.maps.event.addListener(map, 'dblclick', onDoubleClick());
    
    if (!(lat && lng)) {
      LLFB.utils.getCurrentPosition(function(position) {
        map.setCenter(position);
        marker.setPosition(position);
        google.maps.event.trigger(marker, 'dragend');
      });
    } 
  })(window.LLFB);
});
