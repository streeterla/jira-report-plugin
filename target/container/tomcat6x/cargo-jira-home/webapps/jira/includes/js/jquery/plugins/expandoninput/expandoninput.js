/**
 *
 * @module Controls
 * @requires AJS, jQuery, jQuery.moveTo
 */

/**
 * On first <em>keypress</em> in textarea element, will expand textarea to 15 rows and ensure visible in viewport.
 *
 * <pre>
 * <strong>Usage:</strong>
 * jQuery("textarea").expandOnInput();
 * </pre>
 *
 * @class expandOnInput
 * @constuctor expandOnInput
 * @namespace jQuery.fn
*/

(function () {

    jQuery.fn.expandOnInput = function () {

        function setHeight () {

            if (!that.is(":visible")) {
                return;
            }

            var maxHeight = parseInt(that.css("maxHeight"), 10),
                scrollHeight = parseInt(that.attr("scrollHeight"), 10);

            if (isNaN(maxHeight) || scrollHeight <= maxHeight) {
                if (scrollHeight  - 5 > that.height()) {
                    that.css("overflowY", "hidden").height(scrollHeight);
                }
            } else if (that.height !== scrollHeight) {
                that.height(scrollHeight).css({
                    overflowY: "",
                    overflowX: "hidden"
                });
            }
            jQuery(that).trigger("stalkerHeightUpdated");
        }

        var that = this;

        if (this.length === 0) {
            return this;
        }

        this.bind("refreshInputHeight", function () {
            that.height("");
            setHeight();
        });

        this.unbind("keyup", setHeight).bind("keyup", function (e) {
            setHeight();
            e.preventDefault();
        });


        // ie8 needs it in a setTimeout for some bizzare reason
        window.setTimeout(function () {
            setHeight();
            setHeight(); // don't ask. In ie8 it works second time for some reason
        }, 0);

        return this;
    };
})();
