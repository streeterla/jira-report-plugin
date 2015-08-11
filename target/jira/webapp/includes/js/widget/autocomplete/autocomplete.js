/**
 * Ajax autocomplete
 *
 * @module jira.widget.autocomplete
 * @author Scott Harwood
 * @requires jQuery > v1.2, jira.widget.fauxSelect
 * @since 4.0
 *
 */


jQuery.namespace("jira.widget.autocomplete");

/**
 * Designed for prototypial inhertiance !!Abstract only
 * @abstract autocomplete
 */
jira.widget.autocomplete = function() {

    var inFocus;

    /**
     * Calls a callback after specified delay
     * @method {private} delay
     * @param {Integer} l - length of delay in <em>seconds</em>
     * @param [Function} callback - function to call after delay
     */
    var delay = function(callback,l) {
        if (delay.t) {
            clearTimeout(delay.t);
            delay.t = undefined;
        }
        delay.t = setTimeout(callback, l * 1000);
    };

    /**
     * Checks if the key pressed is NOT a modifier key
     * @method {private} isValidKey
     * @param {Integer} keyCode
     */
    var isValidKey = function(keyCode) {
      var invalidKeys = [13,38,14,25,27,40,9,224];
      for (var i = 0; i < invalidKeys.length; i++) {
          if (invalidKeys[i] === keyCode) {
              return false;
          }
      }
      return true;
    };

    return {

        /**
        * Checks whether a saved version (cached) of the request exists, if not performs a request and saves response,
        * then dispatches saved response to <em>renderSuggestions</em> method.
        *
        * @method {public} dispatcher
        */
        dispatcher: function() {},


        /**
         * Gets cached response
         *
         * @method {public} getSavedResponse
         * @param {String} val
         * @returns {Object}
         */
        getSavedResponse: function() {},

        /**
         * Saves response
         *
         * @method {public} saveResponse
         * @param {String} val
         * @param {Object} response
         */
        saveResponse: function() {},

        /**
         * Called to render suggestions. Used to define interface only.
         * Rendering is difficult to make generic, best to leave this to extending prototypes.
         *
         * @method {public} renderSuggestions
         * @param {Object} res - results object
         */
        renderSuggestions: function() {},

        /**
         * Disables autocomplete. Useful for shared inputs.
         * i.e The selection of a radio button may disable the instance
         * @method {Public} disable
         */
        disable: function() {
            this.disabled = true;
        },

        /**
         * Enables autocomplete. Useful for shared inputs.
         * i.e The selection of a radio button may disable the instance
         * @method {Public} enable
         */
        enable: function() {
            this.disabled = false;
        },

        /**
         * Sets instance variables from options object
         * to do: make function create getters and setters
         * @method {public} set
         * @param {Object} options
         */
        set: function(options) {
            for (var name in options) {
                // safe gaurd to stop looping up the inhertiance chain
                if (options.hasOwnProperty(name)) {
                    this[name] = options[name];
                }
            }
        },

        /**
         * Adds value to input field
         * @method {public} completeField
         * @param {String} value
         */
        completeField: function(value) {
            if (value) {
                this.field.val(value).focus();
            }
        },



        /**
         * Allows users to navigate/select suggestions using the keyboard
         * @method {public} addSuggestionControls
         */
         addSuggestionControls: function(suggestionNodes) {

            // reference to this for closures
            var that = this;

            /**
             * Make sure the index is within the threshold
             * Looks ugly! Has to be a better way.
             * @method {private} evaluateIndex
             * @param {Integer} idx
             * @param {Integer} max
             * @return {Integer} valid threshold
             */
            var evaluateIndex = function(idx, max) {
                var minBoundary = (that.autoSelectFirst === false) ? -1 : 0;
                if (that.allowArrowCarousel) {
                    if (idx > max) {
                        return minBoundary;
                    } else if (idx < minBoundary) {
                        return max;
                    } else {
                        return idx;
                    }
                }
                else {
                    if (idx > max) {
                        return max;
                    } else if (idx < minBoundary) {
                        that.responseContainer.scrollTop(0);
                        return minBoundary;
                    } else {
                        return idx;
                    }
                }
            };

            /**
             * Highlights focused node and removes highlight from previous.
             * Actual highlight styles to come from css, adding and removing classes here.
             * @method {private} setActive
             * @param {Integer} idx - Index of node to be highlighted
             */
            var setActive = function(idx) {

                    // if nothing is selected, select the first suggestion
                    if (that.selectedIndex !== undefined && that.selectedIndex > -1) {
                        that.suggestionNodes[that.selectedIndex][0].removeClass("active");
                    }
                    that.selectedIndex = evaluateIndex(idx, that.suggestionNodes.length-1);
                    if (that.selectedIndex > -1) {
                        that.suggestionNodes[that.selectedIndex][0].addClass("active");
                    }
            };

             /**
              * Checks to see if there is actually a suggestion in focus before attempting to use it
              * @method {private} evaluateIfActive
              * @returns {boolean}
              */
             var evaluateIfActive = function() {
                return that.suggestionNodes && that.suggestionNodes[that.selectedIndex] &&
                       that.suggestionNodes[that.selectedIndex][0].hasClass("active");
             };


            /**
             * When the responseContainer (dropdown) is visible listen for keyboard events
             * that represent focus or selection.
             * @method {private} keyPressHandler
             * @param {Object} e - event object
             */
            var keyPressHandler = function(e) {
                // only use keyboard events if dropdown is visible
                if (that.responseContainer.is(":visible")) {
                    // if enter key is pressed check that there is a node selected, then hide dropdown and complete field
                    if (e.keyCode === 13) {
                        if (evaluateIfActive()) {
                            that.completeField(that.suggestionNodes[that.selectedIndex][1]);
                        }
                        e.preventDefault();
                    }
                }
            };

            /**
            * sets focus on suggestion nodes using the "up" and "down" arrows
            * These events need to be fired on mouseup as modifier keys don't register on keypress
            * @method {pivate} keyUpHandler
            * @param {Object} e - event object
            */
            var keyboardNavigateHandler = function(e) {

                // only use keyboard events if dropdown is visible
                if (that.responseContainer.is(":visible")) {

                    // keep cursor inside input field
                    that.field.focus();
                    // move selection down when down arrow is pressed
                    if (e.keyCode === 40) {
                        setActive(that.selectedIndex + 1);
                        if (that.selectedIndex >= 0) {
                            // move selection up when up arrow is pressed
                            var containerHeight = that.responseContainer.height();
                            var bottom = that.suggestionNodes[that.selectedIndex][0].position().top + that.suggestionNodes[that.selectedIndex][0].outerHeight() ;

                            if (bottom - containerHeight > 0){
                                that.responseContainer.scrollTop(that.responseContainer.scrollTop() + bottom - containerHeight + 2);
                            }
                        } else {
                            that.responseContainer.scrollTop(0);
                        }
                        e.preventDefault();
                    } else if (e.keyCode === 38) {
                        setActive(that.selectedIndex-1);
                        if (that.selectedIndex >= 0) {
                            // if tab key is pressed check that there is a node selected, then hide dropdown and complete field
                            var top = that.suggestionNodes[that.selectedIndex][0].position().top;
                            if (top < 0){
                                that.responseContainer.scrollTop(that.responseContainer.scrollTop() + top - 2);
                            }
                        }
                        e.preventDefault();
                    } else if (e.keyCode === 9 && evaluateIfActive()) {
                        that.completeField(that.suggestionNodes[that.selectedIndex][1]);
                        e.preventDefault();
                    }
                }
             };

            if (suggestionNodes.length) {

                this.selectedIndex = 0;
                this.suggestionNodes = suggestionNodes;

                for (var i=0; i < that.suggestionNodes.length; i++) {

                    // closure to retain correct index
                    (function(idx){

                        that.suggestionNodes[idx][0]
                        .mouseover(function(){
                            // on mouseover highlight element
                            if (that.dropdownController.displayed) {
                                setActive(idx);
                            }
                        })
                        // on mouseover remove highlight
                        .mouseout(function(){
                            if (idx === 0) {
                                that.selectedIndex = -1;
                            }
                            jQuery(this).removeClass("active");
                        })
                        // on click add selection to input field
                        .click(function(){
                            that.completeField(that.suggestionNodes[idx][1]);
                        });
                    })(i);
                }

                // make sure we don't bind more than once
                if (!this.keyboardHandlerBinded) {
                    jQuery(this.field).keypress(keyPressHandler);
                    if (jQuery.browser.mozilla) {
                        jQuery(this.field).keypress(keyboardNavigateHandler);
                    } else {
                        jQuery(this.field).keydown(keyboardNavigateHandler);
                    }
                    this.keyboardHandlerBinded = true;
                }

                // automatically select the first in the list
                if(that.autoSelectFirst === false) {
                    setActive(-1);
                } else {
                    setActive(0);
                }

                // sets the autocomplete singleton infocus var to this instance
                // is used to toggle event propagation. In short, the instance that it is set to will not hide the
                // dropdown each time you click the input field
                inFocus = this;
            }

        },


        /**
         * Uses jquery empty command, this is VERY important as it unassigns handlers
         * used for mouseover, click events which expose an opportunity for memory leaks
         * @method {public} clearResponseContainer
         */
        clearResponseContainer: function() {
            this.responseContainer.empty();
            this.suggestionNodes = undefined;
        },

        /**
         * function {Privileged} delay
         * @param response
         */
        delay: delay,

        /**
         * Builds HTML container for suggestions.
         * Positions container top position to be that of the field height
         * @method {public} buildResponseContainer
         */
        buildResponseContainer: function() {
            var inputParent = this.field.parent().addClass("atlassian-autocomplete");
            this.responseContainer = jQuery(document.createElement("div"));
            this.responseContainer
            .addClass("suggestions")
            .css({top: this.field.outerHeight() + "px"})
            .appendTo(inputParent);
        },

        /**
         * Validates the keypress by making sure the field value is beyond the set threshold and the key was either an
         * up or down arrow
         * @method {public} keyUpHandler
         * @param {Object} e - event object
         */
        keyUpHandler: function(e) {
            // only initialises once the field length is past set length
            if (this.field.val().length > this.minQueryLength - 1) {

                // don't do anything if the key pressed is "enter" or "down" or "up" or "right" "left"
                if ((this.responseContainer && !this.responseContainer.is(":visible") && (e.keyCode == 38 || e.keyCode == 40)) || isValidKey(e.keyCode)) {

                    if (!this.responseContainer) {
                        this.buildResponseContainer();
                    }

                    // send value to dispatcher to check if we have already got the response or if we need to go
                    // back to the server
                    this.dispatcher(this.field.val());
                }
            }

            return e;
        },

        /**
         * Adds in methods via AOP to handle multiple selections
         * @method {Public} addMultiSelectAdvice
         */
        addMultiSelectAdvice: function(delim) {

            // reference to this for closures
            var that = this;

            /**
             * Alerts user if value already exists
             * @method {private} alertUserValueAlreadyExists
             * @param {String} val - value that already exists, will be displayed in message to user.
             */
            var alertUserValueAlreadyExists = function(val) {

                // check if there is an existing alert before adding another
                if (!alertUserValueAlreadyExists.isAlerting) {

                    alertUserValueAlreadyExists.isAlerting = true;

                    // create alert node and append it to the input field's parent, fade it in then out with a short
                    // delay in between.
                    //TODO: JRA-1800 - Needs i18n!  
                    var userAlert = jQuery(document.createElement("div"))
                    .css({"float": "left", display: "none"})
                    .addClass("warningBox")
                    .html("Oops! You have already entered the value <em>" + val + "</em>" )
                    .appendTo(that.field.parent())
                    .show("fast", function(){
                        // display message for 4 seconds before fading out
                        that.delay(function(){
                            userAlert.hide("fast",function(){
                                // removes element from dom
                                userAlert.remove();
                                alertUserValueAlreadyExists.isAlerting = false;
                            });
                        }, 4);
                    });
                }
            };

          // rather than request the entire field return the last comma seperated value
            jQuery.aop.before({target: this, method: "dispatcher"}, function(innvocation){
                // matches everything after last comma
                innvocation[0] = jQuery.trim(this.field.val().match(new RegExp("[^"+delim+"]*$"))[0]);
                return innvocation;
            });

            // rather than replacing this field just append the new value
            jQuery.aop.before({target: this, method: "completeField"}, function(arguments){
                var valueToAdd = arguments[0],
                // create array of values
                untrimmedVals = this.field.val().split(delim);
                // trim the values in the array so we avoid extra spaces being appended to the usernames - see JRA-20657
                var trimmedVals = jQuery(untrimmedVals).map(function() {
                        return jQuery.trim(this);
                   }).get();
                // check if the value to append already exists. If it does then call alert to to tell user and sets
                // the last value to "". The value to add will either appear:
                // 1) at the start of the string
                // 2) after some whitespace; or
                // 3) directly after the delimiter
                // It is assumed that the value is delimited by the delimiter character surrounded by any number of spaces.
                if (!this.allowDuplicates && this.field.val().match(new RegExp("((^)|(\\s+)|(" + delim + "))" + valueToAdd + "\\s*" + delim))) {
                    alertUserValueAlreadyExists(valueToAdd);
                    trimmedVals[trimmedVals.length-1] = "";
                } else {
                    // add the new value to the end of the array and then an empty value so we
                    // can get an extra delimiter at the end of the joined string
                    trimmedVals[trimmedVals.length-1] = valueToAdd;
                    trimmedVals[trimmedVals.length] = "";
                }

                // join the array of values with the delimiter plus an extra space to make the list of values readable
                arguments[0] = trimmedVals.join(delim.replace(/([^\s]$)/,"$1 "));

                return arguments;
            });
        },


        /**
         * Adds and manages state of dropdown control
         * @method {Public} addDropdownAdvice
         */
        addDropdownAdvice: function() {

            // add dropdown functionality to response container
            jQuery.aop.after({target: this, method: "buildResponseContainer"}, function(args){
                this.dropdownController = jira.widget.dropdown.Autocomplete({target: this, method: "renderSuggestions"}, this.responseContainer);
                return args;
            });

            // display dropdown afer suggestions are updated
            jQuery.aop.after({target: this, method: "renderSuggestions"}, function(args){

                if (this.responseContainer.outerWidth() < 460) {
                    this.responseContainer.css({width: "460px"});
                }
                if (args && args.length > 0) {
                    this.dropdownController.displayDropdown();
                } else {
                    this.dropdownController.hideDropdown();
                }
                return args;
            });

            // hide dropdown after suggestion value is applied to field
            jQuery.aop.after({target: this, method: "completeField"}, function(args){
                this.dropdownController.hideDropdown();
                return args;
            });

            jQuery.aop.after({target: this, method: "keyUpHandler"}, function(e) {
                // only initialises once the field length is past set length
                if ((!(this.field.val().length > this.minQueryLength - 1) || e.keyCode === 27)
                        && this.dropdownController && this.dropdownController.displayed) {
                    this.dropdownController.hideDropdown();
                    if (e.keyCode === 27) {
                        e.stopPropagation();
                    }
                }
                return e;
            });
        },

        /**
         * Initialises autocomeplete by setting options, and assigning event handler to input field.
         * @method {public} init
         * @param {Object} options
         */
        init: function(options) {
            var that = this;
            this.set(options);
            this.field = jQuery("#" + this.fieldID)
             // turn off browser default autocomplete
            .attr("autocomplete","off")
            .keyup(function(e){
                if (!that.disabled) {
                    that.keyUpHandler(e);
                }
            })
            .keydown(function (e) {
                var ESC_KEY = 27;
                // do not clear field in IE
                if (e.keyCode === ESC_KEY && that.responseContainer && that.responseContainer.is(":visible")) {
                    e.preventDefault();
                }
            })
            // this will stop the dropdown with the suggestions hiding whenever you click the field
            .click(function(e){
                if (inFocus === that) {
                    e.stopPropagation();
                }
            });

            this.addDropdownAdvice();

            if (options.delimChar) {
                this.addMultiSelectAdvice(options.delimChar);
            }
        }
    };

}();


/**
 * Designed for prototypial inhertiance !!Abstract only
 * @abstract REST
 */
jira.widget.autocomplete.REST = function() {

    // prototypial inheritance (http://javascript.crockford.com/prototypal.html)
    var that = begetObject(jira.widget.autocomplete);

   /**
    * Checks whether a saved version (cached) of the request exists, if not performs a request and saves response,
    * then dispatches saved response to <em>renderSuggestions</em> method.
    * @method {public} dispatcher
    * @param {String} reqFieldVal
    */
    that.dispatcher = function(reqFieldVal) {

        // reference to "this" for use in closures
         var that = this;

         if (reqFieldVal.length < this.minQueryLength) {
             return;
         }

         if (!this.getSavedResponse(reqFieldVal)) {
            // Add a delay so that we don't go the server for every keypress,
            // some people type fast and may have already typed an entire word by the time the server comes
            // back with a response

            this.delay(function(){
                var params = that.getAjaxParams();
                params.data.query = reqFieldVal;
                params.success = function(data){
                    // for use later so we don't have to go back to the server for the same query
                    that.saveResponse(reqFieldVal, data);
                    // creates html elements from JSON object
                    that.responseContainer.scrollTop(0);
                    that.renderSuggestions(data);

                };
                AJS.$.ajax(params);

            }, that.queryDelay);
        } else {
            that.renderSuggestions(that.getSavedResponse(reqFieldVal));
            that.responseContainer.scrollTop(0);
        }
    };


    that.getAjaxParams = function(){};

    /**
     * Gets cached response from <em>requested</em> object
     * @method {public} getSavedResponse
     * @param {String} val
     * @returns {Object}
     */
    that.getSavedResponse = function(val) {
        if (!this.requested) {
            this.requested = {};
        }
        return this.requested[val];
    };

    /**
     * Saves response to <em>requested</em> object
     * @method {public} saveResponse
     * @param {String} val
     * @param {Object} response
     */
    that.saveResponse = function(val, response) {
        if (typeof val === "string" && typeof response === "object") {
            if (!this.requested) {
                this.requested = {};
            }
            this.requested[val] = response;
        }
    };

    return that;

}();

/**
 * User picker - converted from YUI based autocomplete. There is some code in here that probably isn't necessary,
 * if removed though selenium tests would need to be re-written.
 * @constructer Users
 * @param options
 * @returns {Object}
 */
jira.widget.autocomplete.Users = function(options) {

    // prototypial inheritance (http://javascript.crockford.com/prototypal.html)
    var that = begetObject(jira.widget.autocomplete.REST);

    that.getAjaxParams = function(){
        return {
            url: contextPath + "/rest/api/1.0/users/picker",
            data: {
                fieldName: options.fieldID
            },
            dataType: "json",
            type: "GET"
        };
    };

    /**
     * Create html elements from JSON object
     * @method renderSuggestions
     * @param {Object} response - JSON object
     * @returns {Array} Multidimensional array, one column being the html element and the other being its
     * corressponding complete value.
     */
    that.renderSuggestions = function(response) {


        var resultsContainer, suggestionNodes = [];

        // remove previous results
        this.clearResponseContainer();


        if (response && response.users && response.users.length > 0) {

            resultsContainer = jQuery("<ul/>").appendTo(this.responseContainer);

            jQuery(response.users).each(function() {

                // add html element and corresponding complete value  to sugestionNodes Array
                suggestionNodes.push([jQuery("<li/>")
                .html(this.html)
                .appendTo(resultsContainer), this.name]);

            });
        }

        if (response.footer) {
            this.responseContainer.append(jQuery("<div/>")
            .addClass("yui-ac-ft")
            .html(response.footer)
            .css("display","block"));
        }

        if (suggestionNodes.length > 0) {
            that.addSuggestionControls(suggestionNodes);
        }

        return suggestionNodes;

    };

    // Use autocomplete only once the field has atleast 2 characters
    options.minQueryLength = 2;

    // wait 1/4 of after someone starts typing before going to server
    options.queryDelay = 0.25;

    that.init(options);

    return that;

};

/**
 * @constructer Issues
 * @param options
 */
jira.widget.autocomplete.Issues = function(options) {

    // prototypial inheritance (http://javascript.crockford.com/prototypal.html)
    var that = begetObject(jira.widget.autocomplete.REST);


    that.getAjaxParams = function(){
        return {
            url: contextPath + "/rest/api/1.0/issues/picker",
            data: options.ajaxData,
            dataType: "json",
            type: "GET"
        };
    };

    /**
     * @method renderSuggestions
     * @param {Object} response
     */
    that.renderSuggestions = function(response) {

        var resultsContainer, suggestionNodes = [];

        // remove previous results
        this.clearResponseContainer();

        if (response && response.sections && response.sections.length > 0) {

            resultsContainer = AJS.$("<ul/>").appendTo(this.responseContainer);

            AJS.$(response.sections).each(function() {
                var section = this;
                var subSection = AJS.$("<div/>").attr("id", options.fieldID + "_s_" + section.id).addClass("yag").text(section.label);
                if (section.sub){
                    subSection.append(AJS.$("<span/>").addClass("yagt").text("(" + section.sub + ")"));
                }
                resultsContainer.append(AJS.$("<li/>").append(subSection).mouseover(function(){
                        AJS.$(this).addClass("active");
                    }).mouseout(function(){
                        AJS.$(this).removeClass("active");
                    })
                );

                if (section.msg){
                    // add message node
                    var msg = AJS.$("<div/>").attr("id", options.fieldID + "_i_" + section.id + "_n").addClass("yad").text(section.msg);
                    resultsContainer.append(AJS.$("<li/>").append(msg).mouseover(function(){
                            AJS.$(this).addClass("active");
                        }).mouseout(function(){
                            AJS.$(this).removeClass("active");
                        })
                    );
                }

                if (section.issues && section.issues.length > 0){
                    AJS.$(section.issues).each(function(){
                        // add issue
                        var imgUrl;
                        if (/^http/.test(this.img)){
                            imgUrl = this.img;
                        } else {
                            imgUrl =  contextPath + this.img;
                        }
                        var issueNode = AJS.$("<li/>").append(
                            AJS.$("<div/>").attr("id", options.fieldID + "_i_" + section.id + "_" + this.key).addClass("yad").append(
                                AJS.$("<table/>").addClass("yat").attr({
                                    cellpadding: "0",
                                    cellspacing: "0"
                                }).append(
                                    AJS.$("<tr/>").append(
                                        AJS.$("<td/>").append(
                                            AJS.$("<img/>").attr("src", imgUrl)
                                        )
                                    ).append(
                                         AJS.$("<td/>").append(
                                            AJS.$("<div/>").addClass("yak").html(this.keyHtml)
                                        )
                                    ).append(
                                         AJS.$("<td/>").css("width", "100%").html(this.summary)
                                    )
                                )
                            )
                        );

                        resultsContainer.append(issueNode);
                        suggestionNodes.push([issueNode, this.key]);
                    });                    
                }
            });

            that.addSuggestionControls(suggestionNodes);

            return suggestionNodes;

        }
    };
    options.minQueryLength = 1;
    options.queryDelay = 0.25;

    that.init(options);

    return that;

};

jira.widget.autocomplete.Users.init = function(parent){
    AJS.$(".user-picker-params", parent).each(function(){
        var params = {};
        AJS.$(this).find("input").each(function(){
            var $this = AJS.$(this);
            params[$this.attr("id")] = $this.val();
        });

        AJS.$("#" + params.fieldName + "_container a.popup-trigger").click(function(e){
            if (!params.formName)
            {
                params.formName = AJS.$(":input[name='" + params.fieldName +"']").parents("form").attr("name");
            }
            var url = contextPath;

            if (params.actionToOpen){
                url = url + params.actionToOpen;
            }else {
                url = url + '/secure/popups/UserPickerBrowser.jspa';
            };
            url += '?formName=' + params.formName + '&';
            url += 'multiSelect=' + params.multiSelect + '&';
            url += 'element=' + params.fieldName;

            var vWinUsers = window.open(url, 'UserPicker', 'status=yes,resizable=yes,top=100,left=200,width=580,height=750,scrollbars=yes');
            vWinUsers.opener = self;
            vWinUsers.focus();
            e.preventDefault();
        });


        if (params.userPickerEnabled === "true" ){
            jira.widget.autocomplete.Users({
                fieldID: params.fieldName,
                delimChar: params.multiSelect === "false"? undefined : ",",
                ajaxData: {
                    fieldName: params.fieldName
                }
            });
        }
    });
};
jira.widget.autocomplete.Issues.init = function(){
   AJS.$(".issue-picker-params").each(function(){
        var params = {};
        AJS.$(this).find("input").each(function(){
            var $this = AJS.$(this);
            params[$this.attr("id")] = $this.val();
        });

        AJS.$("#" + params.fieldName + "_container a.popup-trigger").click(function(e){
            var url = contextPath + '/secure/popups/IssuePicker.jspa?';
            url += 'formName=' + params.formName + '&';
            url += 'linkFieldName=' + params.fieldName + '&';
            url += 'currentIssue=' + params.currentIssue + '&';
            url += 'singleSelectOnly=' + params.singleSelectOnly + '&';
            url += 'showSubTasks=' + params.showSubTasks + '&';
            url += 'showSubTasksParent=' + params.showSubTaskParent;
            if (params.selectedProjectId && params.selectedProjectId != "")
            {
                url += '&selectedProjectId=' + params.selectedProjectId;
            }

            var vWinUsers = window.open(url, 'IssueSelectorPopup', 'status=no,resizable=yes,top=100,left=200,width=620,height=500,scrollbars=yes,resizable');
            vWinUsers.opener = self;
            vWinUsers.focus();
            e.preventDefault();
        });

        if (params.issuePickerEnabled === "true" ){
            jira.widget.autocomplete.Issues({
                fieldID: params.fieldName,
                delimChar: params.singleSelectOnly === "true"? undefined : ",",
                ajaxData: params
            });
        }
    });
};
AJS.$(function(){
    jira.widget.autocomplete.Users.init();
    jira.widget.autocomplete.Issues.init();
});

AJS.$(function(){
    AJS.$(".user-searcher-params").each(function(){
        var params = {};
        AJS.$(this).find("input").each(function(){
            var $this = AJS.$(this);
            params[$this.attr("id")] = $this.val();
        });

        if (params.userPickerEnabled === "true" ){
            var autocompleter = jira.widget.autocomplete.Users({
                fieldID: params.fieldName,
                delimChar: params.multiSelect === "true"? "," : undefined,
                ajaxData: {
                    fieldName: params.fieldName
                }
            });
        }

        var setupFields = function(related){
            var field = AJS.$("#" + params.fieldName);
            var userImage = AJS.$("#" + params.fieldName + "Image");
            var groupImage = AJS.$("#" + params.fieldName + "GroupImage");
            var fieldDesc = AJS.$("#" + params.fieldName + "_desc");
            if (related === "select.list.none"){
                field.val("").attr("disabled", "true");
                userImage.hide();
                groupImage.hide();
                fieldDesc.hide();
            } else{
                field.removeAttr("disabled");
                if (related === "select.list.group"){
                    userImage.hide();
                    groupImage.show();
                    if (params.userPickerEnabled === "true" ){
                        autocompleter.disable();
                        fieldDesc.hide();
                    }
                } else {
                    userImage.show();
                    groupImage.hide();
                    if (params.userPickerEnabled === "true" ){
                        autocompleter.enable    ();
                        fieldDesc.show();
                    }
                }
            }
        };

        AJS.$("#" + params.userSelect).change(function(){
            var related = AJS.$(this).find("option:selected").attr("rel");
            setupFields(related);
        }).find("option:selected").each(function(){
            setupFields(AJS.$(this).attr("rel"));
        });

        AJS.$("#" + params.fieldName + "_container a.user-popup-trigger").click(function(e){
            var url = contextPath + '/secure/popups/UserPickerBrowser.jspa?';
            url += 'formName=' + params.formName + '&';
            url += 'multiSelect=' + params.multiSelect + '&';
            url += 'element=' + params.fieldName;

            var vWinUsers = window.open(url, 'UserPicker', 'status=yes,resizable=yes,top=100,left=200,width=580,height=750,scrollbars=yes');
            vWinUsers.opener = self;
            vWinUsers.focus();
            e.preventDefault();
        });

        AJS.$("#" + params.fieldName + "_container a.group-popup-trigger").click(function(e){
            var url = contextPath + '/secure/popups/GroupPickerBrowser.jspa?';
            url += 'formName=' + params.formName + '&';
            url += 'multiSelect=' + params.multiSelect + '&';
            url += 'element=' + params.fieldName;

            var vWinUsers = window.open(url, 'GroupPicker', 'status=yes,resizable=yes,top=100,left=200,width=580,height=750,scrollbars=yes');
            vWinUsers.opener = self;
            vWinUsers.focus();
            e.preventDefault();
        });
    });
});