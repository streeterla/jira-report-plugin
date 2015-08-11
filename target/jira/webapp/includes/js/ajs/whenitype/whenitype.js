
/**
 * A collection of common controls
 * @module Controls
 * @requires AJS, jQuery, jQuery.hotkeys
 */

/**
 * Keyboard commands with syntactic sugar.
 *
 * <pre>
 * <strong>Usage:</strong>
 * AJS.whenIType("gh").or("gd").goTo("/secure/Dashboard.jspa");
 * AJS.whenIType("c").click("#create_link");
 * </pre>
 *
 * @class whenIType
 *
 * @constuctor whenIType
 * @namespace AJS
 * @param keys - Key combinations, modifier keys are "+" deliminated. e.g "a+b"
 */

jQuery(document).bind("iframeAppended", function (e, iframe) {
    jQuery(iframe).load(function () {

        var target = jQuery(iframe).contents();

        target
        .bind("keyup keydown keypress", function (e) {
            // safari propagates keypress events from iframes
            if (jQuery.browser.safari && e.type === "keypress") {
                return;
            }
            if (!jQuery(e.target).is(":input")) {
                jQuery(document).trigger(e);
            }
        });
    });
});

AJS.whenIType = function (keys) {

    var executer,

        bindKeys = function (keys) {
            if (/\?/.test(keys)) {
                jQuery(document).bind('keypress', {combi: keys, disableInInput: true}, function () {
                    if (!AJS.popup.current && executer) {
                        executer();
                    }
                });
            } else {
                if (keys == "/") {
                    jQuery(document).bind('keypress keydown', {combi: keys, disableInInput: true}, function (e) {
                        e.preventDefault();
                    });
                }
                jQuery(document).bind('keyup', {combi: keys, disableInInput: true}, function () {
                    if (!AJS.popup.current  && executer) {
                        executer();
                    }
                });
            }
        },

        addShortcutTitle = function (selector) {
            var elem = jQuery(selector),
                title = elem.attr("title") || "",
                keyArr = keys.split("");

            if (elem.data("kbShortcutAppended")) {
                appendShortcutTitle(elem, keyArr, title);
                return;
            }

            title += " ( " + AJS.params.keyType + " '" + keyArr.shift() + "'";
            jQuery.each(keyArr, function () {
                title += " " + AJS.params.keyThen + " '" + this + "'";
            });
            title += " )";
            elem.attr("title", title);
            elem.data("kbShortcutAppended", true);
        },

        appendShortcutTitle = function (elem, keyArr, title) {
            title = title.replace(/\)$/, " OR ");
            title += "'" + keyArr.shift() + "'";
            jQuery.each(keyArr, function () {
                title += " " + AJS.params.keyThen + " '" + this + "'";
            });
            title += " )";
            elem.attr("title", title);
        };

    bindKeys(keys);

    return {

        /**
         * Scrolls to and adds <em>focused</em> class to the next item in the jQuery collection
         *
         * @method moveToNextItem
         * @param selector
         */
        moveToNextItem: function (selector) {
            executer = function () {
                var index,
                    transition = true,
                    items = jQuery(selector),
                    focusedElem = jQuery(selector + ".focused");

                if (!executer.blurHandler) {
                    jQuery(document).one("keypress", function (e) {
                        if (e.keyCode === 27 && focusedElem) {
                            focusedElem.removeClass("focused");
                        }
                    });
                }
                
                if (focusedElem.length === 0) {
                    transition = false;
                    focusedElem = jQuery(selector).eq(0);
                } else {
                    focusedElem.removeClass("focused");
                    index = jQuery.inArray(focusedElem.get(0), items);
                    if (index < items.length-1) {
                        index = index +1;
                        focusedElem = items.eq(index);
                    } else {
                        focusedElem.removeClass("focused");
                        focusedElem = jQuery(selector).eq(0);
                        transition = false;
                    }
                }
                if (focusedElem && focusedElem.length > 0) {
                    focusedElem.addClass("focused");
                    focusedElem.moveTo(transition);
                    focusedElem.find("a:first").focus();
                }
            };
        },
        /**
         * Scrolls to and adds <em>focused</em> class to the previous item in the jQuery collection
         *
         * @method moveToPrevItem
         * @param selector
         */
        moveToPrevItem: function (selector) {
            executer = function () {

                var index,
                    transition = true,
                    items = jQuery(selector),
                    focusedElem = jQuery(selector + ".focused");

                if (!executer.blurHandler) {
                    jQuery(document).one("keypress", function (e) {
                        if (e.keyCode === 27 && focusedElem) {
                            focusedElem.removeClass("focused");
                        }
                    });
                }

                if (focusedElem.length === 0) {
                    transition = false;
                    focusedElem = jQuery(selector + ":last");
                } else {

                    focusedElem.removeClass("focused");
                    index = jQuery.inArray(focusedElem.get(0), items);
                    if (index > 0) {
                        index = index -1;
                        focusedElem = items.eq(index);
                    } else {
                        focusedElem.removeClass("focused");
                        focusedElem = jQuery(selector + ":last");
                        transition = false;
                    }
                }
                if (focusedElem && focusedElem.length > 0) {
                    focusedElem.addClass("focused");
                    focusedElem.moveTo(transition);
                    focusedElem.find("a:first").focus();
                }
            };
        },

        /**
         * Clicks the element specified by the <em>selector</em> argument.
         *
         * @method click
         * @param selector - jQuery selector for element
         */
        click: function (selector) {

            addShortcutTitle(selector);

            executer = function () {
                var elem = jQuery(selector);
                if (elem.length > 0) {
                    elem.click();
                }
            };
        },

        /**
         * Navigates to specified <em>location</em>
         *
         * @method goTo
         * @param {String} location - http location
         */
        goTo: function (location) {

            executer = function () {
                window.location.href = contextPath + location;
            };
        },

        /**
         * navigates browser window to link href
         *
         * @method followLink
         * @param selector - jQuery selector for element
         */
        followLink: function (selector) {

            addShortcutTitle(selector);

            executer = function () {
                var elem = jQuery(selector);
                if (elem.length > 0 && elem.attr("nodeName").toLowerCase() === "a") {
                    window.location.href = elem.attr("href");
                }
            };
        },

        /**
         * Executes function
         *
         * @method execute
         * @param {function} func
         */
        execute: function (func) {
            executer = function () {
                func();
            };
        },

        /**
         * Scrolls to element if out of view, then clicks it.
         *
         * @method moveToAndClick
         * @param selector - jQuery selector for element
         */
        moveToAndClick: function (selector) {

            addShortcutTitle(selector);

            executer = function () {
                var elem = jQuery(selector);
                if (elem.length > 0) {
                    elem.click();
                    elem.moveTo();
                }
            };
        },

        /**
         * Scrolls to element if out of view, then focuses it
         *
         * @method moveToAndFocus
         * @param selector - jQuery selector for element
         */
        moveToAndFocus: function (selector) {

            addShortcutTitle(selector);

            executer = function () {
                var elem = jQuery(selector);
                if (elem.length > 0) {
                    elem.focus();
                    elem.moveTo();
                }
            };
        },

        /**
         * Binds additional keyboard controls
         *
         * @method or
         * @param {String} keys - keys to bind
         * @return {Object}
         */
        or: function (keys) {
            bindKeys(keys);
            return this;
        }
    };
};