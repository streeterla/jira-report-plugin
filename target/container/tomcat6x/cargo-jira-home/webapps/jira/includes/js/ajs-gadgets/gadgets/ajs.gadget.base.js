/**
 * Abstract Gadget object. This object provides the baseline functionality from which other objects can extend.
 *
 * @class Gadget
 * @constructor
 * @protected
 * @param {Object} options
 *
 * <ul>
 *      <li><strong>baseUrl:</strong> String that will prefix any remote request url</li>
 *      <li><p><strong>useOauth:</strong> Used to determine what authorisation headers (if any) are required for
 *      requests. Using the provided url, gadget will request resource without oauth headers, if data
 *      comes back in the response, all subsequent requests will not use oauth headers. If response does not
 *      return data, subsequent requests will use oauth. Full implementation details available here:
 *      https://extranet.atlassian.com/display/JIRADEV/OAuth+and+Gagdets+with+anonymous+access.</p>
 *
 *      <p>Alternatively you can provide the string "always" which will force all requests to use oauth. Please
 *      note this removes the ability to provide data to anonymous users (@AnonymousAllowed)</p>
 *
 *      </li>
 * </ul>
 *
 */

if (!console.warn) {
    console.warn = function () {};
}

var Gadget = function (options) {

    // private

    var

    /**
     * User preferences
     *
     * @property prefs
     * @type Object
     * @private
     *
     */
    prefs = new gadgets.Prefs(),


    /**
     * Stores the current mode the view is in. For example "canvas"
     *
     * @property view
     * @type Object
     * @private
     */
    viewMode,


    isAtlassianContainer = function () {
        return window._args && _args().container === "atlassian" &&
               window.top.AG && window.top.AG.DashboardManager;
    },

    getMenu = function () {
        var res = {};

        function getFooterMenu () {
            if (!getMenu.dropdown) {
                res.$("<div class='aui-dd-parent'><a href='#' class='aui-dd-link'><span></span></a><ul class='hidden aui-dropdown'></ul></div>")
                        .appendTo(gadget.getFooter());
                getMenu.elem = res.$(".aui-dropdown", gadget.getFooter());

                getMenu.dropdown = res.$(".footer .aui-dd-parent").dropDown("Standard", {
                    trigger: ".aui-dd-link",
                    selectionHandler: function (e) {
                        e.preventDefault();
                    }
                })[0];
                AJS.$(".gadget").addClass("needs-min");

            }

            return getMenu.elem;
        };

        

        if (isAtlassianContainer()) {
            res.$ = window.top.AJS.$;
            getMenu.dropdown = res.$("#" + window.name + "-renderbox").get(0).getGadgetInstance().getElement().dropdown;
            res.elem = getMenu.dropdown.$;
        } else {
            res.$ = AJS.$;
            res.elem = getFooterMenu();
        }
        
        return res;
    },


    message = function () {

        var popup;

        return {

            /**
             * Displays a message in dialog box
             *
             * @method message.show
             * @param {String, Object} msg - A html string or jQuery object containing message
             * @param {String} classNm - className used for styling of message
             * @param {String} dismissible - if set to false no cancel button will be available
             */
            show: function (msg, classNm, dismissible) {

                var messageEl, buttons, cancelButton, buttonPanel;

                // we create the message node first and append it to the body. We can then use it to determine the
                // height of dialog box we need.
                messageEl = AJS.$("<div />").addClass(classNm).css({
                    width: 260,
                    visiblity: "hidden"
                }).html(msg).appendTo("body");

                // if there are any buttons in the argumented message then put them alongside the cancel button
                buttons = AJS.$("button", messageEl);
                if (dismissible !== false) {
                    cancelButton = AJS.$("<button class='cancel'>").text(prefs.getMsg("gadget.common.cancel")).click(message.hide);
                }
                if (buttons.length > 0 || cancelButton) {
                    buttonPanel = AJS.$("<div class='buttons'>").append(buttons).append(cancelButton);
                    messageEl.append(buttonPanel);
                }

                // if there is already a dialog showing, remove it.
                message.hide();

                popup = new AJS.popup(messageEl.outerWidth(), messageEl.outerHeight(), "message");
                popup.element.html(messageEl);
                popup.show();

                // hack because AJS.popup is failing to show blanket if popup is instanciated more then once.
                AJS.$(".blanket").show();
            },

            /**
             * Destroys message
             *
             * @method message.hide
             */
            hide: function () {
                if (popup) {
                    popup.remove();
                    // fix for bug in AJS, blanket will not hide
                    AJS.$(".blanket").remove();
                    AJS.dim.dim = undefined;
                }
            }
        };

    }(),

    gadget = {

        addMenuItem: function (clss, title, handler) {
            var menu = getMenu(true);
            if (menu.$("." + clss, menu.elem).length === 0) {
                menu.$("<li class='" + clss + "'><a class='no_target' href='#'>" + title + "</a></li>").click(handler).appendTo(menu.elem);
                if (!menu.elem.is(":visible")) {
                    menu.elem.parent().show();
                }
            } else {
                // We need to re-bind in the case iframe is refreshed. (JRA-18879)
                menu.$("." + clss, menu.elem).unbind("click").bind("click", handler);
            }
            getMenu.dropdown.reset();
        },

        removeMenuItem: function (clss) {
            var menu = getMenu();
            if (menu) {
                window.setTimeout(function() {
                    menu.$("." + clss, menu.elem).remove();
                    if (menu.$("li", menu.elem).length === 0) {
                        menu.elem.parent().hide();
                    }
                }, 10);
            }
            getMenu.dropdown.reset();
        },

        /**
         * When calling createCookie() you have to give it three bits of information: the name and value of the
         * cookie and the number of days it is to remain active
         *
         * @method createCookie
         * @param name
         * @param value
         * @param days
         */
        createCookie: function(name, value, days) {
            if (days) {
                var date = new Date();
                date.setTime(date.getTime()+(days*24*60*60*1000));
                var expires = "; expires="+date.toGMTString();
            }
            else var expires = "";
            document.cookie = window.name + name+"="+value+expires+"; path=/";
        },

        /**
         * To read out a cookie, call this function and pass the name of the cookie. Put the name in a variable.
         * First check if this variable has a value (if the cookie does not exist the variable becomes null, which
         * might upset the rest of your function), then do whatever is necessary.
         *
         * @method readCookie
         * @param name
         */
        readCookie: function (name) {
            var nameEQ = window.name +name + "=";
            var ca = document.cookie.split(';');
            for(var i=0;i < ca.length;i++) {
                var c = ca[i];
                while (c.charAt(0)==' ') c = c.substring(1,c.length);
                if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
            }
            return null;
        },

        /**
         * Removes cookie
         *
         * @method eraseCookie
         * @param name
         */
        eraseCookie: function (name) {
            gadget.createCookie(window.name + name,"",-1);
        },

        /**
         * Displays a message in dialog box
         *
         * @method showMessage
         * @private
         * @param {String} type - style of message. Options include "error, info"
         * @param {String, Object} msg - A html string or jQuery object containing message
         * @param {String} dismissible - if set to false no cancel button will be available
         */
        showMessage: function (type, msg, dismissible) {
            if (type === "error") {
                message.show(msg,"error-inner", dismissible);
            } else if (type === "info") {
                message.show(msg,"info-inner", dismissible);
            }
        },

        /**
         * Saves user preferences locally and to the database
         *
         * @method savePref
         * @private
         * @param {String} name
         * @param {String, Array} value
         */
        savePref: function (name, value) {
            if (!AJS.$.isArray(value)) {
                prefs.set(name, value);
            } else {
                prefs.setArray(name, value);
            }

        },

        /**
         * Toggles class of gadget to the specified view. This class is used to style the view accordingly.
         *
         * @method setViewMode
         * @param {String} mode
         */
        setViewMode: function (mode) {
            if (viewMode) {
                gadget.getGadget().removeClass(viewMode);
            }
            gadget.getGadget().addClass(mode);
            viewMode = mode;
        },

        /**
         * Returns the current view mode. For example "Canvas".
         *
         * @method getViewMode
         * @return [String} view mode
         */
        getViewMode: function () {
            return viewMode;
        },

        /**
         * Helper function to get the context path for jira. Necessary for remote requests.
         *
         * @method getBaseUrl
         * @return {String} url
         */
        getBaseUrl: function () {
            return options.baseUrl;
        },

        /**
         * Gets user preference object
         *
         * @method getPrefs
         * @return {Object} user preference object
         */
        getPrefs: function () {
           return prefs;
        },

        /**
         * Some sugar for getting a preference by name
         *
         * @method getPref
         * @param {String} name - Specify an explicit preference to return.
         * @return {Object}
         */
        getPref: function (name) {
            return prefs.getString(name);
        },

        /**
         * Gets user pref as an array
         *
         * @method getPrefArray
         * @param name
         * @return {Array} user pref as an array
         */
        getPrefArray: function (name) {
            return prefs.getArray(name);
        },

        /**
         * Gets il8n string
         *
         * @method getMsg
         * @param {String} key
         * @param {String, Array} params to be injected in to message string using java message format
         * @return {String} il8n string for given key
         */
        getMsg: function (key, params) {
            var msg = prefs.getMsg(key);
            if (params instanceof Array) {
                params.splice(0,0, msg);
                msg = AJS.format.apply(window, params);
            } else if (typeof params === "string") {
                msg = AJS.format.apply(window, [msg, params]);
            }
            return msg !== "" ? msg : key;
        },

        /**
         * Gets gadget object, wrapper div for all gadget html (jQuery Object)
         *
         * @method getPrefs
         * @return {Object} jQuery object
         */
        getGadget: function () {
            var gadget = AJS.$("<div />").addClass("gadget").appendTo("body");
            return function () {
                return gadget;
            };
        }(),

        /**
         * Resizes iframe to fit content
         *
         * @method resize
         */
        resize: function (size) {
            if (gadgets.window.adjustHeight) {
                gadget.resize.pending = false;
                gadgets.window.adjustHeight(size);
            }
        },

        isLocal: function () {
            if (typeof atlassian !== "undefined" && atlassian.util) {
                return atlassian.util.getRendererBaseUrl() === options.baseUrl;
            }
        },

        /**
         * Shows loading indicator
         *
         * @method showLoading
         */
        showLoading: function () {
            if (gadgets.window.getViewportDimensions && gadgets.window.getViewportDimensions().width < 250){
                AJS.$("body").addClass("loading-small");
            } else {
                AJS.$("body").addClass("loading");
            }
        },

        /**
         * Hides loading indicator
         *
         * @method hideLoading
         */
        hideLoading: function () {
            AJS.$("body").removeClass("loading").removeClass("loading-small");
            if (!AJS.$("body").hasClass("loading") && gadget.hideLoading.callbacks) {
                AJS.$.unique(gadget.hideLoading.callbacks);
                AJS.$.each(gadget.hideLoading.callbacks, function () {
                    this();
                });
                delete gadget.hideLoading.callbacks;
            }
        },

        /**
         * Object responsible for generic handling of request errors
         *
         * @property ajaxErrorHandler
         * @type Object
         * @private
         */
        ajaxErrorHandler: {

            /**
             * Handles server errors
             *
             * @method ajaxErrorHandler.handle500
             * @private
             */
            handle500: function (evt, response, settings) {
                gadget.showMessage("error", AJS.format(gadget.getMsg("gadget.common.error.500"),
                        settings.url, settings.url));
            },
            handle503: function(evt, response, settings) {
                gadget.showMessage("error", response.data.errorMessages);
            },
            /**
             * Handles page not found errors
             *
             * @method ajaxErrorHandler.handle500
             * @private
             */
            handle404: function (evt, response, settings) {
                gadget.showMessage("error", AJS.format(gadget.getMsg("gadget.common.error.404"),
                        settings.url, settings.url));
            },

            /**
             * Executes, if it exists, the correct error handler using of the response code
             *
             * @method ajaxErrorHandler.execute
             * @private
             * @param evt - request event
             * @param response - response from server
             * @param settings - settings for request
             */
            execute: function (evt, response, settings) {
                if (response && gadget.ajaxErrorHandler["handle" + response.rc]) {
                    gadget.ajaxErrorHandler["handle" + response.rc].apply(gadget, arguments);
                }
            }
        }

    };

    /* debug */
    AJS.$(["error.500", "error.404", "oauth.approve.button", "oauth.approve.message", "container.login"]).each(function(){
        if (prefs.getMsg("gadget.common." + this) === "") {
            console.warn("il8n key missing:\"" + "gadget.common." + this + "\"");
        }
    });

    if (!options.baseUrl) {
        throw "@constructor Gadget: \n baseUrl is required but has not been set";
    }

    if (!(gadgets && gadgets.oauth && gadgets.oauth.Popup)) {
        throw "@constructor Gadget: \n This framework requires support for oauth. Please add the following lines to"
        + "<ModulePrefs> in your gadget XML:\n"
        + "<Require feature=\"oauthpopup\" />\n"
        + "#oauth";
    }
    /* debug end */

    function setTarget () {
        if (!AJS.$(this).attr("target")) {
            AJS.$(this).attr({target: "_parent"});
        }
    }

    AJS.$("a:not(.no_target), area")
            .live("click", setTarget)
            .live("mouseover", setTarget);

    /* export for utility methods */
    AJS.gadget.getBaseUrl = function () {
        return options.baseUrl;
    };

    if (options.useOauth && window.location.href.indexOf(options.baseUrl) !== 0) {


        AJS.$.ajax = function (ajax) {

            var queue = [],

            trustedAppsDenied = function () {
                /* debug */
                console.log("@method trustedAppsDenied:\nNot using trusted apps");
                console.log("@method trustedAppsDenied:\nChecking for oauth token");
                /* debug end */
                ajax({
					authorization: "oauth",
                    url: options.useOauth,
                    data:  {cacheBuster: new Date().getTime()},
                    useToken: "always",
                    complete: function (response) {
                        if (response.oauthApprovalUrl || response.rc === 403) {
                            /* debug */
                            console.log("@method trustedAppsDenied:\noauth token not found");
                            console.log("@method trustedAppsDenied:\nstoring approval url\n" + response.oauthApprovalUrl);
                            /* debug end */
                            gadget.approvalUrl = response.oauthApprovalUrl;

                            if (response.oauthApprovalUrl) {
                                gadget.approvalRequest = queue[0];
                            }

                            handleOauthApproval();
                        } else if (response.data) {
                            /* debug */
                            console.log("@method trustedAppsDenied:\noauth token found");
                            console.log("@method trustedAppsDenied:\nrequesting resource using oauth");
                            /* debug end */

                            gadget.appendApprovedButton();

                            makeOAuthRequests();
                        }
                    }
                });
            },

            trustedAppsAccepted = function () {
				/* debug */
				console.log("@method trustedAppsAccepted: \nDetected trusted apps. Using gadgets.io.makeRequest.");
				/* debug end */
                AJS.$.ajax = ajax;
                AJS.$(queue).each(function(){
                    AJS.$.ajax(this);
                });
            },

            makeOAuthRequests = function () {
                AJS.$.ajax = ajax;
                AJS.$.ajaxSetup({authorization: "oauth", useToken: "always"});
                AJS.$(queue).each(function() {
                    AJS.$.ajax(this);
                });
            },

            handleOauthApproval = function () {
				/* debug */
				console.log("@method handleOauthApproval: \noauth available");
				/* debug end */

                /* debug */
				console.log("@method handleOauthApproval: \nDetecting if @anonymous access is available");
				/* debug end */

                AJS.$.ajaxSetup({
                    authorization: "oauth",
                    useToken: "if_available"
                });

                var attachApprovalAdvice = function (request, idx) {
                    var cacheBuster = new Date().getTime();

                    request.complete = function (complete) {
                        return function (response) {
                            if (idx === queue.length-1 && gadget.approvalRequest) {

                                if (response.rc === 200 || response.rc === 400 && response.data) {
                                     /* debug */
                                    console.log("@method handleOauthApproval: \n@anonymous access available. "
                                            + "Proceeding with anonymous data.");
                                    console.log("@method handleOauthApproval: \nAppending approve button to footer");
                                    /* debug end */

                                    if (gadget.appendFooterApproval) {
                                        gadget.appendFooterApproval(request);
                                    }

                                } else if (gadget.appendViewApproval && gadget.approvalRequest) {

                                     /* debug */
                                    console.log("@method handleOauthApproval: \n@anonymous access NOT available. ");
                                    console.log("@method handleOauthApproval: \nClearing view and displaying approve "
                                             + "button in center of gadget");
                                    /* debug end */

                                    gadget.appendViewApproval(request);
                                }
                            }
                            if (complete) {
                                complete.apply(AJS.$.ajax, arguments);
                            }
                        };
                    }(request.complete);

                    if (typeof request.data === "object") {
                        request.data.cacheBuster = cacheBuster;
                    } else if (typeof request.data === "string") {
                        request.data += "&cacheBuster=" + cacheBuster;
                    } else {
                        request.data = "cacheBuster=" + cacheBuster;
                    }

                    // do not want to trigger default error handling
                    if (!gadget.approvalRequest) {
                        request.global = false;
                        request.error = function (response) {
                            if (response.rc === 400) {
                                AJS.$("body").addClass("login").append(gadget.getMsg("gadget.common.container.login"));
                                if (window.top.document) {
                                    AJS.$("#" + window.name + "-chrome", window.top.document).css("opacity", 0.7);
                                }
                                gadget.resize();
                            }
                        };
                    }

                    return request;
                };

                AJS.$.ajax = ajax;

                AJS.$(queue).each(function(i) {
                    AJS.$.ajax(attachApprovalAdvice(this, i));
                });

            };

            return function (settings) {
                if (options.useOauth === "always") {
                    AJS.$.ajaxSetup({authorization: "oauth", useOauth: "always"});
                    settings.success = function (success) {
                        return function (response) {
                            if (response.oauthApprovalUrl) {
                                gadget.approvalUrl = response.oauthApprovalUrl;
                                gadget.appendViewApproval(settings);
                            } else if (success) {
                                gadget.appendApprovedButton();
                                success.apply(AJS.$.ajax, arguments);
                            }
                        };
                    }(settings.success);
                    AJS.$.ajax = ajax;
                    settings.useToken = "always";
                    AJS.$.ajax(settings);
                } else {

                    // if requests are attempted while we are resolving authentication method, store them for later.
                    AJS.$.ajax = function (ajaxSettings) {
                        queue.push(ajaxSettings);
                        return arguments.callee;
                    }(settings);

                    /* debug */
                    console.log("@method AJS.$.ajax (pointcut):\nDetecting if trusted app");
                    /* debug end */
                    ajax({
                        url: options.useOauth,
                        data:  {cacheBuster: new Date().getTime()},
                        complete: function (response, settings) {

                            /* oauth */
                            if (response.rc === 401) {
                                trustedAppsDenied(response, settings);
                            } else if (response.data) {
                                trustedAppsAccepted();
                            }
                            /* debug */
                            else if (response.rc === 404) {
                                console.error("AJS.$.ajax (pointcut): "
                                        + AJS.format("@method AJS.$.ajax (pointcut):\nYou have specified '{0}' as the "
                                        + "resource to validate authentication type (if any), however it does not exist."
                                        , settings.url));
                            }
                            /* debug end */
                        }
                    });
                }
            };

        }(AJS.$.ajax);
    }


    /*
     * Because gadgets exist inside of iframes dropdowns need to act differently. This method basically captures requests
     * to the dropdown constructor and appends some additional functionality to them. The functionality varies between
     * browsers.
     *
     * - Closes dropdowns from parent window when gadget dropdown is opened and vise versa (All browsers)
     *
     * - Removes the dropdown from the gadget iframe and appends to parent window, allowing for overflow. Note, this only
     * occurs when the dropdown overflows the height of the iframe and gadget exists on the same domain.
     * (Firefox & Safari)
     *
     * - Resizes the height of the gadget iframe to allowing for height of dropdown. Note, this only occurs if the browser
     * is either opera or MSIE, or in the case of the gadget iframe being on a different domain  (All browsers)
     *
     * - Modifies default selection handler so that selected links will be loaded in parent window rather then iframe.
     *
     */

    (function(){
        function canBeMovedToParentFrame () {
             return !AJS.$.browser.msie && !AJS.$.browser.opera && isAtlassianContainer();
        }

        function overflowsIframeHeight () {
            return parseInt(AJS.$("body").attr("scrollHeight")) > AJS.$("body").outerHeight();
        }

        function adjustDDPositioning () {
            if (AJS.dropDown.current && AJS.dropDown.current.calculateDDPosition) {
                AJS.dropDown.current.updateDDPosition();
            }
        }

        function parentAsContainerHandler () {
            if (!this.positionMeInParent) {
                this.$.remove().addClass("gadget-dropdown");
                this.shadow.remove();
                this.shadow.appendTo(window.top.document.body);
                this.$.appendTo(window.top.document.body);
                this.positionMeInParent = function () {

                    var dropdownOffsets;
                    function getLeftInPercent (left) {
                        return left / window.top.AJS.$("body").width() * 100 + "%";
                    }

                    function calculateOffsets () {
                        var dropdownOffset = this.trigger.offset(),
                                iframeOffset = window.top.AJS.$("#" + window.name).offset();
                        return {
                            top: dropdownOffset.top + this.trigger.outerHeight() + iframeOffset.top,
                            left: dropdownOffset.left + iframeOffset.left + this.trigger.outerWidth() - this.$.outerWidth(),
                            width: this.$.outerWidth()
                        };
                    }

                    if (!this.trigger.is(":visible")) {
                        this.hide();
                    } else {
                        dropdownOffsets = calculateOffsets.call(this);
                        this.$.css({
                            top: dropdownOffsets.top,
                            margin:0,
                            left: getLeftInPercent(dropdownOffsets.left),
                            right: "auto"
                        });
                        this.shadow.css({
                            left: getLeftInPercent(dropdownOffsets.left - 7),
                            top: dropdownOffsets.top,
                            right: "auto"
                        });
                    }
                };
            }

            this.positionMeInParent();
        };

        var iframeAsContainerHandler = {
            show: function () {
                if (overflowsIframeHeight() && gadgets.window.adjustHeight) {
                    gadget.resize(AJS.$("body").attr("scrollHeight"));
                }
            },
            hide: function () {
                if (AJS.dropDown.current) {
                    gadget.resize(iframeAsContainerHandler.restoreHeight);
                    delete iframeAsContainerHandler.restoreHeight;
                }
            }
        };

        AJS.$(window).resize(adjustDDPositioning);


        AJS.dropDown.Standard = function (dropDown) {


            return function (options) {

                var dropdowns;

                options.selectionHandler = options.selectionHandler || function (e, item) {
                    if (item[0].nodeName === "A") {
                        window.top.location.href = item.attr("href");
                    }
                    else {
                        window.top.location.href = AJS.$("a", item).attr("href");
                    }
                };

                dropdowns = dropDown.call(this, options);

                AJS.$.each(dropdowns, function () {
                    if (canBeMovedToParentFrame()) {
                        if (options.positionOnShow !== false) {
                            this.addCallback("show", function () {
                                parentAsContainerHandler.call(this);
                            });
                        }
                    }
                    else {
                        this.trigger.focus(function () {
                            if (!iframeAsContainerHandler.restoreHeight) {
                                iframeAsContainerHandler.restoreHeight = AJS.$("body").outerHeight();
                            }
                        });
                        this.addCallback("show", iframeAsContainerHandler.show);
                        this.addCallback("hide", iframeAsContainerHandler.hide);
                    }
                    this.trigger.mousedown(function () {
                        AJS.$.ajaxSetup({globalThrobber: false});
                    });
                });

                return dropdowns;
            };
        }(AJS.dropDown.Standard);

        AJS.dropDown.Ajax = function (dropDown) {

            return function (options) {

                options.positionOnShow = false;

                var dropdowns = dropDown.call(this, options);
                AJS.$.each(dropdowns, function () {

                    this.$.addClass("loading");

                    this.addCallback("reset", function () {
                        this.$.removeClass("loading");
                    });

                    if (canBeMovedToParentFrame()) {
                        this.addCallback("reset", function () {
                            var that = this;
                            parentAsContainerHandler.call(that);
                        });
                    } else {
                        this.addCallback("reset", iframeAsContainerHandler.show);
                    }
                });
                return dropdowns;
            };

        }(AJS.dropDown.Ajax);

    })();

    // prevent IE from caching requests
    AJS.$.aop.around( {target: gadgets.io, method: 'makeRequest'}, function(invocation) {
        var url = invocation.arguments[0];
        if (!/\?/.test(url)) url += "?";
        else url += "&";
        invocation.arguments[0] = url + "cacheBuster=" + new Date().getTime();
        return invocation.proceed();
    });

    /* set some defaults for ajax requests */
    AJS.$.ajaxSetup({
        cache: false,
        dataType: "json",
        type: "get",
        baseUrl: options.baseUrl
    });

    // make sure we call the extending error handlers instead of the ones from this class
    AJS.$().ajaxError(gadget.ajaxErrorHandler.execute);

    // throbber display
    AJS.$().ajaxOpen(function (evt, req, options) {
       if (options && options.globalThrobber !== false) {
            gadget.showLoading.apply(this, arguments);
       }
    });
    AJS.$().ajaxClosed(gadget.hideLoading);

    return gadget;

};