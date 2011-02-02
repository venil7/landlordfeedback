// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//dependency: jquery, google maps

(function($) {
    //(c) douglas crockford funcs x 2
    if (!String.prototype.trim) {
        String.prototype.trim = function () {
            return this.replace(/^\s*(\S*(?:\s+\S+)*)\s*$/, "$1");
        };
    }
    if (!String.prototype.supplant) {
        String.prototype.supplant = function (o) {
            return this.replace(/{([^{}]*)}/g,
                function (a, b) {
                    var r = o[b];
                    return typeof r === 'string' || typeof r === 'number' ? r : a;
                }
            );
        };
    }
    //jQuery plugins
    $.fn.swapAttr = function(a1,a2){
      var that = $(this);
      var save1 = that.attr(a1);
      var save2 = that.attr(a2);
      $(this).attr(a2,save1).attr(a1,save2);
    };
    //jQuery utility functions
    if (!$.submit) {
        $.submit = function(url, map, method) {
                url = url || window.location;
                map = map || {};
                method = method || "POST";
                var fields = "";
                $.each(map, function(i,v){
                    fields += $("<p></p>").append($("<input/>").attr({type:'hidden',name:i,value:v})).html();
                });
                $("<form></form>").attr({action:url,method:method}).append(fields).appendTo('body').submit();
        };
    }
    //some additional utility funcs
    if (!String.prototype.isValidPostcode) {
        String.prototype.isValidPostcode = function() {
            var postcodeRegEx = /^([A-PR-UWYZ0-9][A-HK-Y0-9][AEHMNPRTVXY0-9]?[ABEHMNPRVWXY0-9]?\s*[0-9][ABD-HJLN-UW-Z]{2}|GIR 0AA)$/i;
	        return postcodeRegEx.test(this);
	    };
    }
    
    if (!String.prototype.strip) {
        String.prototype.strip = function(exp) {
             return this.replace(exp?exp:/\s/g,"");
	    };
    }
    //llfb namespaces
    window.LLFB = {};
    window.LLFB.utils = {};
    window.LLFB.map = {};
    //site wide constants
    LLFB.constants = {};
    LLFB.constants.REG_ICON = "/images/map/icon2.png";
    LLFB.constants.ADD_ICON = "/images/map/icon3.png";
    LLFB.constants.LONDON = {lat:51.49,lng:-0.12};
    //other functions
    LLFB.utils.contains = function(a, v, p) {
        a = a || [];
        v = v || {};
        p = p || function(x, y) { return x === y; };
        for(var i in a) {
            if (p(a[i], v)) {
                return true;
            }
        }
        return false;
    };
    LLFB.utils.geocodeToPlace = function(obj) {
        obj = obj || {};
        var loc = (obj.geometry && obj.geometry.location) ? obj.geometry.location : new google.maps.LatLng(0,0);
        var address = obj.formatted_address ? obj.formatted_address : "specify address";
        var postcode = "";
        if ($.isArray(obj.address_components)) {
            var pcodes = $.grep(obj.address_components, function(v,i){
                return $.inArray("postal_code", v.types);
            }, true);
            postcode = pcodes.length > 0 ? pcodes[0].long_name.trim().strip().toUpperCase() : postcode;
        }
        return {id:0, lat:loc.lat(), lng:loc.lng(), address:address, postcode:postcode};
    };
    LLFB.utils.getCurrentPosition = function(callback) {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position){
          var loc = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
          callback(loc);
        });
      } 
    };
    //throttler
    LLFB.utils.Throttler = function(delay) {
        this.handlers = [];
        this.delay = delay ? parseInt(delay, 10) : 1000;
    };
    LLFB.utils.Throttler.prototype.add = function(name, func, delay) {
        if (typeof name === "string" && typeof func === "function") {
            var customDelay = delay ? parseInt(delay, 10) : this.delay;
            if (name in this.handlers) {
                clearTimeout(this.handlers[name]);
            }
            this.handlers[name] = setTimeout(func, customDelay);
        } 
    };
    LLFB.utils.Throttler.prototype.remove = function(name) {
      var deleted = "__deleted"
      this.handlers[name]=deleted;
      this.handlers = this.handlers.splice(this.handlers.indexOf(deleted), 1);
    };
})(jQuery);    


//this script runs on all pages on DOM-ready
$(function() {
    //common functionality, dependant on 3d party plugins
    LLFB.utils.notify = function(text, type, life) {
      type = type ||"notice";
      life = life || 7000;
      var sticky = typeof life === "boolean" ? life : false;
      $.jnotify(text, {type:type, delay:life, sticky:sticky});
    };
    
    //jquery ui defaults
    $.datepicker.setDefaults({ 
      dateFormat:'yy-mm-dd', 
      changeMonth:true, 
      changeYear:true 
    });
    
    //jquery ajax defaults
    $.ajaxSetup({ 
      error:function(XMLHttpRequest, textStatus, errorThrown) {
        LLFB.utils.notify("there was an error processing your request: {error}".supplant({error:textStatus}));
      }
    });
    
    //unfolders
    $(".unfolder").click(function(){
      var that = $(this);
      var id = that.attr("data_unfolder_id");
      if (that.hasClass('hideself')) {
        that.hide();
      }
      $("#"+id).fadeToggle();
      
    });
    
    //hidden elements
    $(".hidden").hide();
    
    //ajax upload behavior
    $('#upload_form').iframePostForm({
      complete:function(response){
        var obj = typeof response === "string" ? $.parseJSON(response) : (typeof response === "object" ? response : false);
        if (obj) {
          if (obj.success) {
            $("#photo-container").prepend($("<img/>").attr('src',obj.thumb_url));
            LLFB.utils.notify("photo uploaded successfully");
          } else {
            LLFB.utils.notify("Failed to upload your image..");
          }
          $('#upload_form').find("input[type=file]").val('');
        }
      }
    });
    //watremarks
    $("#sidesearch").find("input[type=text]").add("#searchaddress").watermark("UK Address or Postcode", {className: "watermark"});
    //calendars
    $("input.calendar").datepicker();
    //notifications
    $("p.flash").each(function(){
      var that = $(this);
      var type = "notice";
      if (that.hasClass('success')) {
        type = "success";
      } else
      if (that.hasClass('error')) {
        type = "error";
      }
      LLFB.utils.notify(that.html(), type);
    });
    //disallow double submits
    $("form").not(".ajax").submit(function(){
      var that = $(this);
      if (that.data('submitted')) {
        return false;
      } else {
        that.data('submitted', true);
        return true;
      }
    });
});
