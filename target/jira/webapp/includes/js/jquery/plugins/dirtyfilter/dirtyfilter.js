


jQuery.fn.isDirty = function () {

    var pageModified, fields = [];

    window.onbeforeunload = function () {

        var onunload = window.onbeforeunload;

        if (pageModified !== false) {
            jQuery.each(fields, function (){
                if (this.initVal !== AJS.$(this).val()) {
                    pageModified = true;
                    return false;
                }
            });
        }

        if (pageModified) {
            // dirty dirty hack to stop firefox from calling event twice
            window.onbeforeunload = null;
            window.setTimeout(function(){
                jQuery(document).bind("mousemove", function(){
                    window.onbeforeunload = onunload;
                    jQuery(document).unbind("mousemove", arguments.callee);
                });
            }, 1000);
            // reset
            pageModified = undefined;
            return AJS.params.dirtyMessage;
        }
    };

    return function (options) {

        if (this.length === 0) {
            return;
        }

        function storeField (e) {
            var $this = jQuery(this);
            jQuery.fn.isDirty.fieldInFocus = jQuery(this);
            if (jQuery.inArray(this, fields) === -1) {
                this.initVal = $this.val();
                fields.push(this);

                $this.die(e.type, storeField);
            }
        };

        jQuery(":not(:input)").live("mousedown", function () {
            delete jQuery.fn.isDirty.fieldInFocus;
        });

        jQuery(":input[type != hidden]", this.selector)
            .bind("keydown", storeField)
            .bind("keypress", storeField)
            .bind("click", storeField);

        jQuery(options.ignoreUnloadFromElems).live("mousedown", function () {
            pageModified = false;
        });

        this.each(function () {

            this.onsubmit = function (onsubmit) {
                return function () {
                    pageModified = false;
                    if (onsubmit) {
                        return onsubmit.apply(this, arguments);
                    }
                };
            }(this.onsubmit);

            AJS.$(this).submit(function () {
                pageModified = false;
            });

        });
    };
}();


jQuery(function() {
    jQuery("form[name=jiraform], #jqlform, form[name=filterform]").isDirty({
        ignoreUnloadFromElems: "#switchnavtype, #refresh-dependant-fields, #projectRefreshPanel"
    });
});




