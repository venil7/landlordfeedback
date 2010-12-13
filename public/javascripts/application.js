// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

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
})(jQuery);    


//this script runs on all pages on DOM-ready
$(function() {
    //common functionality, dependant on 3d party plugins
    LLFB.utils.notify = function(text, life, header) {
      header = header || "";
      life   = life || 7000;
      $.noticeAdd({
          text: text,
          stay: false,
          stayTime: life
      });
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
      var id = $(this).attr("data_unfolder_id");
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
            LLFB.utils.notify("photo uploaded successfully")
          } else {
            LLFB.utils.notify("Failed to upload your image..");
          }
          $('#upload_form').find("input[type=file]").val('');
        }
      }
    });
    
});
