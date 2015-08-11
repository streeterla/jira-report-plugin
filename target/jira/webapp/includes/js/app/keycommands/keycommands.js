jQuery(function () {

    function blurTargetField (e) {
        if (e.keyCode === 27 && jQuery(e.target).is(":input")) {
            jQuery(e.target).blur();
        }
    }

    //AJS.keys is defined by the keyboard-shortcut plugin.
    if (AJS.keys) {
        // blur field when esc is clicked
        jQuery(document).keyup(blurTargetField);

        jQuery(document).bind("iframeAppended", function (e, iframe) {
            jQuery(iframe).load(function () {
                var jQuery;
                if (iframe.contentWindow && iframe.contentWindow.jQuery) {
                    jQuery = iframe.contentWindow.jQuery;
                    jQuery("body").keyup(blurTargetField);
                }
            });
        });
        jQuery.each(AJS.keys.shortcuts, function () {
            var operation = this.op,
                param = this.param;
            jQuery.each(this.keys, function () {
                if(operation === "execute") {
                    //need to turn function string into function object
                    param = new Function(param);
                }
                AJS.whenIType(this)[operation](param);
            });
        });       
    }
});