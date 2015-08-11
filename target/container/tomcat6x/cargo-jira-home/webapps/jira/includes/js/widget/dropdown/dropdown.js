/**
 * Creates a dropdown list from a JSON obect
 * @module dropdown
 * @author Scott Harwood
 * @requires jQuery > v1.2
 */


jQuery.namespace("jira.widget.dropdown");

/**
 * @abstract dropdown
 */
jira.widget.dropdown = function() {

    // private

    var instances = [];

    return {

        // public

        /**
         * Adds this instance to private var <em>instances</em>
         * This reference can be used to access all instances
         * @function {public} addInstance
         */
        addInstance: function() {
            instances.push(this);
        },


        /**
         * Calls the hideList method on all instances of <em>dropdown</em>
         * @function {public} hideInstances
         */
        hideInstances: function() {
            var that = this;
            jQuery(instances).each(function(){
                if (that !== this) {
                this.hideDropdown();
                }
            });
        },

        
        getHash: function () {
            if (!this.hash) {
                this.hash = {
                    container: this.dropdown,
                    hide: this.hideDropdown,
                    show: this.displayDropdown
                };
            }
            return this.hash;
        },

        /**
         * Calls <em>hideInstances</em> method to hide all other dropdowns.
         * Adds <em>active</em> class to <em>dropdown</em> and styles to make it visible.
         * @function {public} displayDropdown
         */
        displayDropdown: function() {
            jira.widget.dropdown.current = this;
            this.hideInstances();
            this.dropdown
            .css({display: "block"})
            .parent()
            .css({position: "relative", zIndex: 9000})
            .addClass("active");
            this.displayed = true;
        },

        /**
         *
         * Removes <em>active</em> class from <em>dropdown</em> and styles to make it hidden.
         * @function {public} hideDropdown
         */
        hideDropdown: function() {
            jira.widget.dropdown.current = null;
            this.dropdown
            .css({display: "none"})
            .parent()
            .removeClass("active");
            this.dropdown.parent().css({zIndex: "1"});
            this.displayed = false;
        },

         /**
         * Workaround for IE that inserts an iframe before dropdown to ensure that it zIndex is high enough to sit over
         * the top of select boxes, pure CSS solutions will not do
         * (http://dotnetjunkies.com/WebLog/jking/archive/2003/07/21/488.aspx).
         * @function {public} addShim
         */
        addShim: function() {

            // hide the shim whenever the dropdown is hidden.
            jQuery.aop.after({target: this, method: "hideDropdown"}, function(){
                if (this.shim) {
                    this.shim.css("display","none");
                }
            });

            // show the shim whenever the dropdown is shown.
            // height is adjusted each set each time to account for any dynamic elements added in between
            jQuery.aop.after({target: this, method: "displayDropdown"}, function(){
                if (!this.shim) {
                    this.shim = jQuery(document.createElement("iframe"));
                    this.shim
                    .attr({
                        marginWidth: "0",
                        marginHeight: "0",
                        scrolling: "no",
                        frameBorder: 0,
                        align: "left"
                    })
                    .css({
                        position: "absolute",
                        top: this.dropdown.css("top"),
                        display: "none",
                        left: this.dropdown.css("left"),
                        right: this.dropdown.css("right"),
                        height: 0,
                        width: 0,
                        listStyle: "none",
                        border: "3",
                        margin: "0",
                        zIndex: "-1" // the magic that gives it the zindex to sit over a select box.
                    })
                    .insertBefore(this.dropdown);
                } else {
                    this.shim.css({display: "block", height: this.dropdown.outerHeight() + "px", width: this.dropdown.outerWidth() + "px"});
                }
            });

        },

        /**
         * scrolls dropdown into view
         * @function {public} addPageScroller
         */
        addPageScroller: function() {

            var that = this,

            /**
             * Calculates how far it needs to scroll to make the entire dropdown visible
             * @function {private} getScrollPosition
             * @return {Integer} position to scroll to
             */
            getScrollPosition = function() {
                return (that.dropdown.offset().top - jQuery(window).height()) + that.dropdown.height();
            },

            /**
             * Removes event blocker
             * @function {private} enableDisplay
             */
            enableDisplay = function() {
                that.displayed = true;
                that.eventBlockerEl.css({display: "none"});
            };
             // Display event blocker each time when displayDropdown is called
             // set height each time to account for elements that may have been dynamically inserted after it was
             // last displayed.
            jQuery.aop.before({target: this, method: "displayDropdown"}, function(){
                if (!this.eventBlockerEl) {
                    // this element is used to block events (e.g mouseover) on the dropdown
                    // until the dropdown has finished scrolling into view. Otherwise the links display there hover state
                    // as the page scrolls.
                    this.eventBlockerEl = jQuery(document.createElement("div"));
                    this.eventBlockerEl
                    .appendTo(this.dropdown.parent())
                    .css({position: "absolute", zIndex:"9999", top:0});
                }

                this.eventBlockerEl.css({
                    height: this.dropdown.height() + "px",
                    width: this.dropdown.width() + "px",
                    left: this.dropdown.css("left"),
                    right: this.dropdown.css("right"),
                    display: "block"
                });
            });

            // Check if the dropdown is not fully visible (outside of viewport), if it's not smooth scroll into view.
            jQuery.aop.after({target: this, method: "displayDropdown"}, function(){
                if (getScrollPosition() > jQuery(window).scrollTop()) {
                    jQuery("html,body").animate({scrollTop: getScrollPosition()}, 300, "linear", function(){
                        enableDisplay();
                    });
                } else {
                    enableDisplay();
                }
            });

            // if the dropdown is hidden stop all animations (ie page scrolling) that may still be running
            jQuery.aop.after({target: this, method: "hideDropdown"}, function(){
                if (jQuery("html,body").is(":animated")) {
                    jQuery("html,body").stop();
                }
            });
        },

        /**
         * Initialises instance by, applying primary handler, user options and a Internet Explorer hack.
         * function {public} init
         * @param {HTMLelement} trigger
         * @param {HTMLelement} dropdown
         */
        init: function(trigger, dropdown) {

            var that = this;

            this.addInstance(this);
            this.dropdown = jQuery(dropdown);

            this.dropdown.css({display: "none"});

            // scrolls dropdown into view if outside of viewport
            this.addPageScroller();

            // if browser is Internet explorer apply a fix that will let it display over the top of select boxes.
            if (jQuery.browser.msie) {
                this.addShim();
            }

            // hide dropdown on tab
            jQuery(document).keydown(function(e){
                if(e.keyCode === 9) {
                    that.hideDropdown();
                }
            });

            // this instance is triggered by a method call
            if (trigger.target) {
                jQuery.aop.before(trigger, function(){
                    if (!that.displayed) {
                        that.displayDropdown();
                    }
                });

            // this instance is triggered by a click event
            } else {
                that.dropdown.css("top",jQuery(trigger).outerHeight() + "px");
                trigger.click(function(e){
                    if (!that.displayed) {
                        that.displayDropdown();
                        e.stopPropagation();
                        // lets not follow the link (if it is a link)
                    } else {
                        that.hideDropdown();
                    }
                    e.preventDefault();
                });
            }

            // hide dropdown when click anywhere other than on this instance
            jQuery(document.body).click(function(){
                if (that.displayed) {
                    that.hideDropdown();
                }
            });
        }
    };

}();

/**
 * Standard dropdown constructer 
 * @constucter Standard
 * @param {HTMLelement} trigger
 * @param {HTMLelement} dropdown
 * @return {Object} - instance
 */
jira.widget.dropdown.Standard = function(trigger, dropdown) {

    var that = begetObject(jira.widget.dropdown);
    that.init(trigger, dropdown);

    return that;
};

/**
 * Standard dropdown constructer
 * @constucter Standard
 * @param {HTMLelement} trigger
 * @param {HTMLelement} dropdown
 * @return {Object} - instance
 */
jira.widget.dropdown.Autocomplete = function(trigger, dropdown) {

    var that = begetObject(jira.widget.dropdown);

    that.init = function(trigger, dropdown) {

        this.addInstance(this);
        this.dropdown = jQuery(dropdown).click(function(e){
            // lets not hide dropdown when we click on it
            e.stopPropagation();
        });
        this.dropdown.css({display: "none"});

        // scrolls dropdown into view if outside of viewport
        this.addPageScroller();

        // if browser is Internet explorer apply a fix that will let it display over the top of select boxes.
        if (jQuery.browser.msie) {
            this.addShim();
        }

        // this instance is triggered by a method call
        if (trigger.target) {
            jQuery.aop.before(trigger, function(){
                if (!that.displayed) {
                    that.displayDropdown();
                }
            });

        // this instance is triggered by a click event
        } else {
            trigger.click(function(e){
                if (!that.displayed) {
                    that.displayDropdown();
                    e.stopPropagation();
                }
            });
        }

        // hide dropdown when click anywhere other than on this instance
        jQuery(document.body).click(function(){
            if (that.displayed) {
                that.hideDropdown();
            }
        });
    };

    that.init(trigger, dropdown);

    return that;
};