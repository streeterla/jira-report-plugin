(function(){

/*
 * This is a bridge for jQuery ajax to open social make request. Please note that some options have been ommitted, Some
 * others have been added.
 *
 * Available options include ->
 *
 * beforeSend:
 * You may return false in function to cancel the request.
 *
 * complete:
 * A function to be called when the request finishes (after success and error callbacks are executed). The
 * function gets passed two arguments: The response object and settings
 *
 * contentType:
 * When sending data to the server, use this content-type. Default is "application/x-www-form-urlencoded",
 * which is fine for most cases.
 *
 * data:
 * Data to be sent to the server. It is converted to a query string, if not already a string. It's appended to the
 * url for GET-requests. Object must be Key/Value pairs. If value is an Array, jQuery serializes multiple values with
 * same key i.e. {foo:["bar1", "bar2"]} becomes '&foo=bar1&foo=bar2'.
 *
 * dataType:
 * The type of data that you're expecting back from the server.
 *
 * error:
 * A function to be called if the request fails.
 * The function is passed two arguments: the response object & settings
 *
 * global:
 * Whether to trigger global AJAX event handlers for this request. The default is true.
 * Set to false to prevent the global handlers like ajaxStart or ajaxStop from being triggered.
 * This can be used to control various .
 *
 * success: A function to be called if the request succeeds. The function gets passed two arguments: The data returned
 * from the server, formatted according to the 'dataType' parameter, and a string describing the status.
 *
 * type:
 * The type of request to make ("POST" or "GET"), default is "GET". Note: Other HTTP request methods, such as PUT and
 * DELETE, can also be used here, but they are not supported by all browsers.
 *
 * url: The URL to request.
 * 
 */

/* need to override serializeArray because it will not serialize multi selects if no selection is made. See JRA-17827. */
AJS.$.fn.serializeArray = function() {
    return this.map(function(){
        return jQuery.nodeName(this, "form") ?
            jQuery.makeArray(this.elements) : this;
    })
    .filter(function(){
        return this.name && !this.disabled &&
            (this.checked || /select|textarea/i.test(this.nodeName) ||
                /text|hidden|password/i.test(this.type));
    })
    .map(function(i, elem){
        var val = jQuery(this).val();

        if (val == null) {
            val = "";
        }

        return val.constructor == Array ?
            jQuery.map( val, function(val, i){
                return {name: elem.name, value: val};
            }) :
            {name: elem.name, value: val};
    }).get();
};


AJS.$.extend({

    /**
     * @method put
     * @param url
     * @param data
     * @param callback
     * @param type
     */
    put: function (url, data, callback, type) {
        if ( jQuery.isFunction( data ) ) {
			callback = data;
			data = {};
		}

		return AJS.$.ajax({
			type: "PUT",
			url: url,
			data: data,
			success: callback,
			dataType: type
		});
    },

    del: function (url, data, callback, type) {
        if ( jQuery.isFunction( data ) ) {
			callback = data;
			data = {};
		}

		return AJS.$.ajax({
			type: "delete",
			url: url,
			data: data,
			success: callback,
			dataType: type
		});
    },

	ajax: function(ajax) {

        var activeReq = 0, dressResponse = function (xhr) {
            var res = {};
            res.rc = xhr.status;
            if (xhr.responseText !== "") {
                res.data = gadgets.json.parse(xhr.responseText);
            }
            return res;
        };

        AJS.$.each( "ajaxOpen,ajaxClosed,ajaxOauthApproval".split(","), function(i,o){
            AJS.$.fn[o] = function(f){
                return this.bind(o, f);
            };
        });


        AJS.$().ajaxSend(function(evt, req, options){
            if (++activeReq === 1) {
               AJS.$.event.trigger("ajaxOpen", [req, options]);
            }
        });

        AJS.$().ajaxComplete(function(evt, req, options){
            if (--activeReq === 0) {
                AJS.$.event.trigger("ajaxClosed", [req, options]);
            }
        });

        AJS.$.fn.ajaxComplete = function(f){
            f = function (actualF) {
                return function(evt, response, options) {
                    if (response.status) {
                        actualF.call(this, evt, response, options);
                    } else {
                        actualF.apply(this, arguments);
                    }
                };
            }(f);
            return this.bind("ajaxComplete", f);
        };

        AJS.$.fn.ajaxError = function(f){
            f = function (actualF) {
                return function(evt, response, options) {
                    if (response.status) {
                        actualF.call(this, evt, dressResponse(response), options);
                    } else {
                        actualF.apply(this, arguments);
                    }
                };
            }(f);
            return this.bind("ajaxError", f);
        };


        return function (usrOptions) {
            // creating seperate request options for opensocial params "just in case" of matching keys
            var reqOptions = {};

            // for single param get requests
            if (typeof options === "string") {
                options = {url: options};
            }

            var options = usrOptions;

            for (var name in AJS.$.ajaxSettings) {
                if (!options[name] && options[name] !== false) {
                    options[name] = AJS.$.ajaxSettings[name];
                }
            }


            if (options.baseUrl) {
                if (!/^(http)|(https):\/\//.test(options.url)){
                    options.url = options.baseUrl + options.url;
                }
            }

            // we are on the same domain so we can use a standard ajax request, without the need to use shindig as a proxy

            if (typeof atlassian !== "undefined" && atlassian.util) {
                if (atlassian.util.getRendererBaseUrl() === options.baseUrl && new RegExp(options.baseUrl).test(options.url)) {
                    // make response object similar to response object from gadgets.io.makeRequest
                    if (options.error) {
                        options.error = function (error) {
                            return function (xhr, type) { 
                                if (!xhr.responseText) {
                                    options.success.apply(this, arguments);
                                } else {
                                    error.call(this, dressResponse(xhr));
                                }

                            };
                        }(options.error);
                    }


                    return ajax.call(this, options);
                }
            }

            reqOptions[gadgets.io.RequestParameters.METHOD] = gadgets.io.MethodType[options.type.toUpperCase()];
            //gadgetContentType only supports DOM, FEED, JSON or TEXT.
            var gadgetContentType = options.dataType.toUpperCase();
            if(gadgetContentType === "XML") {
                gadgetContentType = "DOM";
            } 
            reqOptions[gadgets.io.RequestParameters.CONTENT_TYPE] = gadgets.io.ContentType[gadgetContentType];

            reqOptions.url = options.url;

            if (options.headers) {
                reqOptions[gadgets.io.RequestParameters.HEADERS] = options.headers;
            }

            if (options.authorization) {
                reqOptions[gadgets.io.RequestParameters.AUTHORIZATION] =
                gadgets.io.AuthorizationType[options.authorization.toUpperCase()];
            }

            if (options.useToken) {
                reqOptions["OAUTH_USE_TOKEN"] = options.useToken;
            }

            if (options.summaries) {
                reqOptions[gadgets.io.RequestParameters.GET_SUMMARIES] = options.summaries;
            }

            if (options.entries) {
                reqOptions[gadgets.io.RequestParameters.NUM_ENTRIES] = options.entries;
            }

            if (options.data) {
                if (options.type.toLowerCase() === "get") {
                    if (typeof options.data === "string") {
                        reqOptions.url += ("?" + options.data.replace(/^\?/,""));
                    } else {
                        reqOptions.url += ("?" + gadgets.io.encodeValues(options.data).replace(/^\?/,""));
                    }
                } else {
                    reqOptions[gadgets.io.RequestParameters.POST_DATA] = options.data;
                }
            }

            reqOptions.success = function (response) {

                if (options.complete) {
                    options.complete(response, options);
                }

                if (options.global) {
                    AJS.$.event.trigger("ajaxComplete", [response, options] );
                }

                if (response.errors && response.errors.length || response.oauthError) {
                    if (options.error) {
                        options.error(response, options);
                    }
                    if (options.global) {
                        AJS.$.event.trigger("ajaxError", [response, options] );
                    }
                    return;
                }

                // parse error
                if (options.dataType.toLowerCase() === "json" && typeof response.data === "string") {
                    if (options.error) {
                        options.error(response, options);
                    }
                    if (options.global) {
                        AJS.$.event.trigger("ajaxError", [response, options] );
                    }
                    return;
                }

                if (response.rc !== 200) {
                    if (options.error) {
                        options.error(response, options);
                    }
                    if (options.global) {
                        AJS.$.event.trigger("ajaxError", [response, options] );
                    }
                    return;
                }
                if (options.success && (response || response.oauthApprovalUrl)) {

                    options.success(response.data || response);
                }
                if (options.global) {
                    AJS.$.event.trigger("ajaxSuccess", [response.data, options] );
                }
            };

            if (options.ajaxSend) {
                options.ajaxSend(options);
            }
            if (options.global) {
                AJS.$.event.trigger("ajaxSend", [options] );
            }

            // Need to return as plain old javascript object because the Internet Explorer activeX object that
            // we get will not let us append arbitary attributes to it.
            return gadgets.io.makeRequest(reqOptions.url, reqOptions.success,  reqOptions);

        };
    }(AJS.$.ajax)

});AJS.$.namespace("AJS.gadgets.templater");/**
 * sdfg
 * @class Templater
 * @private
 */
AJS.gadgets.templater.Base = function () {

	var

    /**
     * Specifies if the result of the template rendering should be cached for next time.
     * @property  cache
	 * @private
	 * @type Boolean
     */
    cache,

	/**
	 * Template url
	 *
	 * @property  template
	 * @private
	 * @type String
	 */
	template,

	/**
	 * Reference to descriptor function
	 *
	 * @property descriptor
	 * @private
	 * @type Function
	 */
	descriptor = function (args) {
        return args;
    },

	/**
	 * Callback for when element has been built
	 *
	 * @property callbacks
	 * @private
	 * @type Array
	 */
	callbacks = [],

	/**
	 * An array of objects that specify remote datasources that will need to be passed to the descriptor
	 *
	 * @property remoteArgs
	 * @private
	 * @type Array
	 */
	remoteArgs = [],



	/**
	 * An array of objects that will be passed to the descriptor.
	 *
	 * @property args
	 * @private
	 * @type Array
	 */
    args = [],

	/**
	 * Using a provided template and descriptor returns a html string
	 *
	 * @method renderTemplate
	 * @private
	 * @param {String} str - template
	 * @param {Object} data - json object returned from descriptor
	 * @return {String} html
	 */
	renderTemplate = function () {

		var cache = {};

		return function (str, data){
            var fn;
            if (!/\W/.test(str)){
                fn = cache[str];
            } else {
                var fnString = "var p=[], print=function(){p.push.apply(p,arguments);};" +

		        // Introduce the data as local variables using with(){}
		        "with(obj){p.push('" +

		        // Convert the template into pure JavaScript
		        str
		          .replace(/[\r\t\n]/g, " ")
		          .split("<%").join("\t")
		          .replace(/((^|%>)[^\t]*)'/g, "$1\r")
		          .replace(/\t=(.*?)%>/g, "',$1,'")
		          .split("\t").join("');")
		          .split("%>").join("p.push('")
		          .split("\r").join("\\'")
		            + "');}return p.join('');";

                fn = new Function("obj", fnString);
            }
		    // Provide some basic currying to the user
		    return data ? fn( data ) : fn;
	    };
	}();


	return {

        /**
         * Retrieves any remote arguments via ajax along with already populated arguments. Formats each argument into
         * a key value pair, passing them onto the callback.
         *
         * The format of remote arguments can be specified in a number of different forms.
         *
         * Examples:
         *
         * 1. {key: "myRemoteArgument", ajaxOptions: {url: "http://www.example.com"}}
         * 2. {key: "myRemoteArgument", ajaxOptions: "http://www.example.com"}
         * 3. {key: "myRemoteArgument", ajaxOptions: function() { return {url: "http://www.example.com"}};
         *
         * Local arguments are specified as:

         * {key: "myLocalArgument", data: "Some data"}
         *
         * @method getDescriptorData
         * @private
         * @param {Function} callback - the function to be called with formatted arguments
         */
        getDescriptorData: function (callback) {

            var argLengthComparator = 0, that = this, formattedArgs = {};

            if (remoteArgs.length < 1) {
                AJS.$(args).each(function(){
                    formattedArgs[this.key] = this.data;
                });
                if (callback) {
                    callback.call(that, descriptor(formattedArgs));
                } else {
                    return descriptor(formattedArgs);
                }
            }

            AJS.$(remoteArgs).each(function(i, item){
                var reqOptions;

                if (typeof item.ajaxOptions === "string") {
                    reqOptions = {url: this.ajaxOptions};
                } else if (AJS.$.isFunction(item.ajaxOptions)) {
                    reqOptions = item.ajaxOptions();
                } else {
                    reqOptions = item.ajaxOptions;
                }
                reqOptions.success = function (response) {
                    ++argLengthComparator;
                    formattedArgs[remoteArgs[i].key] = response;
                    if (argLengthComparator === remoteArgs.length) {
                        var excuter = function () {
                            if (callback) {
                                callback.call(that, descriptor(formattedArgs));
                            } else {
                                return descriptor(formattedArgs);
                            }
                            return arguments.callee;
                        }();
                        if (cache !== false) {
                            that.getDescriptorData = excuter;
                        }
                    }
                };
                AJS.$.ajax(reqOptions);
            });
        },

        disableCache: function () {
            cache = false;
        },

		/**
		 * Sets the url to load template from
		 *
		 * @method setTemplate
		 */
		setTemplate: function (templ) {
            template = templ;
		},

		/**
		 * Sets the descriptor. The descriptor is a function that returns a json object that describes to the template
		 * how to construct the html. Each template is likely to have a different structure.
		 *
		 * @method setDescriptor
		 * @param {Function} desc
		 */
		setDescriptor: function (desc) {
			descriptor = desc;
		},

		/**
		 * Method to be called after the templated element is built. The method will be called in the context of this object.
		 *
		 * @method setCallback
		 * @param {Function} func
		 */

        addCallback: function (func) {
            callbacks.push(func);
        },

		/**
		 * Often the descriptor needs additional data in order to form the correct json. This method allows you to specify
		 * params to request remote json data. The response of this request is appened, using the key provided, to a json
		 * object that is passed as the first argument to the descriptor. For ajax options please refer to
		 * <a href="http://docs.jquery.com/Ajax/jQuery.ajax#options">jQuery documentation</a>
		 *
		 * @method setRemoteDescriptorArg
		 * @param {String} key - Key to be mapped to json object
		 * @param {Object} ajaxOptions - request options for remote data
		 */
		setRemoteDescriptorArg: function (key, ajaxOptions) {
			remoteArgs.push({key: key, ajaxOptions: ajaxOptions});
		},

        setDescriptorArg: function (arg) {
            args.push(arg);
        },

		/**
		 * Builds html string using template and data returned from descriptor. All the specified remote arguments
		 * are requested and given to the descriptor in the form of a json object.
		 *
		 * Any subsequent times this method is called template and remote data is restored from internal cache.
		 *
		 * @method build
		 * @param {Object} data
		 */
		build: function (data) {
			var that = this;

			if (!data && data !== false) {
				this.getDescriptorData(this.build);
			} else if (data !== false) {

                if (typeof template === "string" && document.getElementById(template)) {
                    that.build.template = AJS.$(template).html();
                    var fragment = renderTemplate(that.build.template, data);
                    AJS.$(callbacks).each(function(){
                        this.call(that, AJS.$(fragment), data);
                    });
                } else if (AJS.$.isFunction(template)) {
                    template(data);
                    AJS.$(callbacks).each(function(){
                        this.call(that, data);
                    });
                // this is really dodgy
                } else if (template.length > 50) {
                    that.build.template = template;
                    var fragment = renderTemplate(that.build.template, data);
                    AJS.$(callbacks).each(function(){
                        this.call(that, AJS.$(fragment), data);
                    });
                } else {
                     if (!that.build.template) {
                        AJS.$.ajax({
                            url: template,
                            dataType: "text",
                            success: function (response) {
                                that.build.template = response;
                                var fragment = renderTemplate(that.build.template, data);
                                AJS.$(callbacks).each(function(){
                                    this.call(that, AJS.$(fragment), data);
                                });
                            }
                        });
                    } else {
                        var fragment = renderTemplate(that.build.template, data);
                        AJS.$(callbacks).each(function(){
                            this.call(that, AJS.$(fragment), data);
                        });
                    }
                }
			}
		}
	};
};/**
 * For building elements, using custom templates
 *
 * @class Custom
 * @namespace AJS.gadgets.templater
 * @constructor
 * @param {Object} options
 */
AJS.gadgets.templater.Custom = function (options) {
    var templater = AJS.gadgets.templater.Base();
    templater.setTemplate(options.template);
    if (options.descriptor) {
        templater.setDescriptor(options.descriptor);
    }
    if (options.callback) {
        templater.addCallback(options.callback);
    }
    if (options.cache === false) {
        templater.disableCache();
    }
    AJS.$.extend(templater, {
        getTarget: function () {
            return options.target;
        }
    });
    if (options.args) {
		AJS.$(options.args).each(function() {
            if (this.ajaxOptions) {
			    templater.setRemoteDescriptorArg(this.key, this.ajaxOptions);
            } else {
                templater.setDescriptorArg(this);
            }
		});
	}
	return templater;
};/**
 * For building forms
 *
 * @class Form
 * @namespace AJS.gadgets.templater
 * @constructor
 * @param {Object} options
 */
AJS.gadgets.templater.Form = function (options) {
	return AJS.gadgets.templater.Custom(AJS.$.extend({
		template: AJS.gadgets.templater.Form.template,
        baseUrl: AJS.gadget.getBaseUrl(),
		callback: function(response, data) {
            if (options.target) {
                options.target.html(response);
                if (options.submit) {
                    AJS.$("form", options.target).submit(options.submit);
                }
                if (options.cancel) {
                    AJS.$("input.cancel", options.target).click(options.cancel);
                }
                AJS.$(data.fields).each(function(){

                    if (this.type === "callbackBuilder"){
                        var targetDiv = AJS.$("div#" + this.id);
                        this.callback(targetDiv);
                   }
                });
            } else {
                return response;
            }
        }
	}, options));
};AJS.gadgets.templater.Table = function (options) {

    var table, sortCol, sortOrd = [],

    sort = function (data, column, order) {
        data.cols[column].theme = order;
        // string/number sort
        if (!data.cols[column].sorted) {
           data.data.sort(function (item, compareItem) {
               var dataItem = item[column].value, dataItemCompare = compareItem[column].value;
               if (!isNaN(parseFloat(dataItem)) && !isNaN(parseFloat(dataItemCompare))) {
                   dataItem = parseFloat(dataItem);
                   dataItemCompare = parseFloat(dataItemCompare);
               }
               if (dataItem > dataItemCompare) {
                    return 1;
               } else if (dataItem < dataItemCompare) {
                    return -1;
               } else {
                    return 0;
               }
           });
        }
        if (order === "desc") {
            data.data.reverse();
        }
        return data;
    },

    templater =  AJS.gadgets.templater.Custom(AJS.$.extend({
        template: AJS.gadgets.templater.Table.template,
        baseUrl: AJS.gadget.getBaseUrl(),
        cache: false
    },options));

    if (options.sortable) {
        templater.addCallback = function (addCallback) {
            return function (callback) {
                addCallback(function (wrappedCallback) {
                    return function (newTable) {
                        AJS.$("th", newTable).click(function() {
                            sortCol = AJS.$.inArray(this, AJS.$("th", newTable));
                            if (sortOrd[sortCol]) {
                                sortOrd[sortCol].reverse();
                            }
                            templater.build();
                        });
                        if (table) {
                            table.replaceWith(newTable);
                        }
                        table = newTable;
                        wrappedCallback.call(templater, table);
                    };
                }(callback));
            };
        }(templater.addCallback);

        templater.build = function (build) {
            return function (data) {
                if (data) {
                    if (sortCol === undefined) {
                        AJS.$(data.cols).each(function(i){
                            if (this.sort) {
                                sortCol = i;
                                if (!sortOrd[sortCol]) {
                                    sortOrd[sortCol] = [this.sort, this.sort == "asc" ? "desc" : "asc"];
                                }
                            }   
                        });
                    }
                    if (sortCol !== undefined) {
                        if (!sortOrd[sortCol]) {
                            sortOrd[sortCol] = ["desc", "asc"];
                        }
                        data = sort(data, sortCol, sortOrd[sortCol][0]);
                    }
                }
                build.call(templater, data);
            };
        }(templater.build);

    }

    return templater;
};AJS.gadgets.templater.Form.template ="<% var i18nHelper = new gadgets.Prefs(); %><% function createCheckboxGroup (field) { %><fieldset class=\"group<% if (field.styleClass) { %><%= gadgets.util.escape(field.styleClass) %><% } %>\"        <% if (field.id) { %>id=\"<%= gadgets.util.escape(field.id) %>\"<% } %>    ><% if ( field.label ) { %><legend><span><%= gadgets.util.escape(field.label) %></span></legend><% } %>        <% for (var i=0; i < field.options.length; i++) { %>            <div class=\"checkbox\">                <input type=\"checkbox\"                    <% if (field.options[i].id) { %>                        id=\"<%= gadgets.util.escape(field.options[i].id) %>\"                    <% } else { %>                        id=\"<%= gadgets.util.escape(field.userpref + \"-\" + i) %>\"                    <% } %>                    <% if ( field.value === \"true\" ) { %>                        checked = \"checked\"                    <% } %>                    <% if (field.value === \"false\") { field.value = \"true\"; } %>                    value=\"<%= field.value %>\"                    name=\"<%= gadgets.util.escape(field.userpref) %>\"                />                <% if (field.options[i].label) { %>                    <label                        <% if (field.options[i].id) { %>                            for=\"<%= gadgets.util.escape(field.options[i].id) %>\"                        <% } else { %>                            for=\"<%= gadgets.util.escape(field.userpref + \"-\" + i) %>\"                        <% } %>                    ><%= gadgets.util.escape(field.options[i].label) %></label>                <% } %>                <span class=\"error\"></span>            </div>        <% } %>        <% if (field.description) { %>    <div><span class=\"description\"><%= field.description %></span></div>        <% } %></fieldset><% } %><% function createRadioGroup (field) { %><fieldset class=\"group<% if (field.styleClass) { %><%= gadgets.util.escape(field.styleClass) %><% } %>\"        <% if (field.id) { %>id=\"<%= gadgets.util.escape(field.id) %>\"<% } %>    ><% if ( field.label ) { %><legend><span><%= gadgets.util.escape(field.label) %></span></legend><% } %><div><% for (var i=0; i < field.options.length; i++) { %><div class=\"radio\"><input type=\"radio\"<% if (field.options[i].id) { %>id=\"<%= gadgets.util.escape(field.options[i].id) %>\"<% } else { %>id=\"<%= gadgets.util.escape(field.userpref + \"-\" + i) %>\"<% } %><% if (field.selected === field.options[i].value || field.options[i].selected) { %>checked = \"checked\"<% } %>                        <% if ( field.options[i].value ) { %>                            value=\"<%= gadgets.util.escape(field.options[i].value) %>\"                        <% } %>name=\"<%= gadgets.util.escape(field.userpref) %>\"/><label<% if (field.options[i].id) { %>for=\"<%= gadgets.util.escape(field.options[i].id) %>\"<% } else { %>for=\"<%= gadgets.util.escape(field.userpref + \"-\" + i) %>\"<% } %>><%= gadgets.util.escape(field.options[i].label) %></label><span class=\"error\"></span></div><% } %></div>        <% if (field.description) { %>    <div><span class=\"description\"><%= field.description %></span></div>        <% } %></fieldset><% } %><% function createHiddenInput (field) { %><input type=\"hidden\" name=\"<%= gadgets.util.escape(field.userpref) %>\" value=\"<%= gadgets.util.escape(field.value) %>\" /><% } %><% function createTextInput (field) { %><input type=\"<%= gadgets.util.escape(field.type) %>\"<% if (field.styleClass) { %>class=\"<%= gadgets.util.escape(styleClass) %>\"<% } else { %>class=\"<%= gadgets.util.escape(field.type) %>\"<% } %>        <% if (field.value) { %>            value=\"<%= gadgets.util.escape(field.value) %>\"        <% } %>        <% if (!field.id) { %>id=\"<%= gadgets.util.escape(field.userpref) %>\"<% } else { %>id=\"<%= gadgets.util.escape(field.id) %>\"<% } %>name=\"<%= gadgets.util.escape(field.userpref) %>\"/>    <span class=\"error\"></span>    <% if (field.description) { %>        <span class=\"description\"><%= field.description %></span><% } %><% } %><% function createLabel (field) { %><label for=\"<%= gadgets.util.escape(field.userpref) %>\"><%= gadgets.util.escape(field.label) %></label><% } %><% function createTextarea (field) { %><textarea <% if (field.styleClass) { %>class=\"<%= gadgets.util.escape(field.styleClass) %>\"<% } %>        <% if (!field.id) { %>id=\"<%= gadgets.util.escape(field.userpref) %>\"<% } else { %>id=\"<%= gadgets.util.escape(field.id) %>\"<% } %>name=\"<%= gadgets.util.escape(field.userpref) %>\"><% if (field.value) { %><%= gadgets.util.escape(field.value) %><% } %></textarea><span class=\"error\"></span><% if (field.description) { %>        <span class=\"description\"><%= field.description %></span>    <% } %><% } %><% function createSelect (field) { %><% function createOption (item) { %><option    <% if ( item.id) { %>    id = \"<%= gadgets.util.escape(item.id) %>\"<% } %>    value=\"<%= gadgets.util.escape(item.value) %>\"<% if ( field.selected === item.value || item.selected) { %>    selected = \"selected\"<% } %>><%= gadgets.util.escape(item.label) %></option><% } %><select<% if (field.styleClass) { %>class=\"<%= gadgets.util.escape(field.styleClass) %>\"<% } else { %>            class=\"select\"        <% } %><% if (!field.id) { %>id=\"<%= gadgets.util.escape(field.userpref) %>\"<% } else { %>id=\"<%= gadgets.util.escape(field.id) %>\"<% } %>name=\"<%= gadgets.util.escape(field.userpref) %>\"><% for ( var i = 0; i < field.options.length; i++ ) { %><% if ( field.options[i].group ) { %><optgroup label=\"<%= gadgets.util.escape(field.options[i].group.label) %>\">                   <% if (field.options[i].group.options) { %>                        <% for ( var x = 0; x < field.options[i].group.options.length; x++ ) { %>                            <% createOption(field.options[i].group.options[x]); %>                        <% } %>                   <% } %></optgroup><% } else { %><% createOption(field.options[i]); %><% } %><% } %></select><span class=\"error\"></span><% if (field.description) { %>        <span class=\"description\"><%= field.description %></span>    <% } %><% } %><% function createMultiSelect (field) { %><% function createOption (item) { %><option    <% if ( item.id) { %>    id = \"<%= gadgets.util.escape(item.id) %>\"<% } %>value=\"<%= gadgets.util.escape(item.value) %>\"<%  var selected = false;if(field.value !== undefined && field.value.length > 0) {    for(var i = 0; i < field.value.length; i++) {        if(field.value[i] === item.value) {            selected = true;            break;        }    }}if (selected) { %>    selected = \"selected\"<% } %>><%= gadgets.util.escape(item.label) %></option><% } %><select multiple=\"multiple\"<% if (field.styleClass) { %>class=\"<%= gadgets.util.escape(field.styleClass) %>\"<% } else { %>            class=\"multi-select\"        <% } %><% if (!field.id) { %>id=\"<%= gadgets.util.escape(field.userpref) %>\"<% } else { %>id=\"<%= gadgets.util.escape(field.id) %>\"<% } %>name=\"<%= gadgets.util.escape(field.userpref) %>\"><% for ( var i = 0; i < field.options.length; i++ ) { %><% if ( field.options[i].group ) { %><optgroup label=\"<%= gadgets.util.escape(field.options[i].group.label) %>\"><% for ( var x = 0; x < field.options[i].group.options.length; x++ ) { %><% createOption(field.options[i].group.options[x]); %><% } %></optgroup><% } else { %><% createOption(field.options[i]); %><% } %><% } %></select><span class=\"error\"></span><% if (field.description) { %>        <span class=\"description\"><%= field.description %></span>    <% } %><% } %><% function createField(field, type) { %><% if (type !== \"inline\" && field.type !== \"radio\" && field.type !== \"checkbox\" && field.type !== \"hidden\") { %>        <div><% } %><% if (field.type !== \"radio\" && field.type !== \"checkbox\"&& field.type !== \"hidden\") { %><% createLabel(field); %><% } %><% if (field.type == \"select\") { %><% createSelect(field); %>    <% } else if (field.type == \"multiselect\") { %><% createMultiSelect(field); %><% } else if (field.type == \"textarea\") { %><% createTextarea(field); %><% } else if (field.type == \"radio\") { %><% createRadioGroup(field); %><% } else if (field.type == \"checkbox\") { %><% createCheckboxGroup(field); %><% } else if (field.type == \"custom\" && field.template) { %><%= field.template() %>        <span id=\"<%= field.userpref %>-error\" class=\"error\"></span><% } else if (field.type == \"callbackBuilder\") { %>        <% if (field.id){%>            <div id=\"<%=field.id%>\" class=\"builder-container\"></div>        <% } else { %>            <div class=\"builder-container\"></div>        <% } %>        <span id=\"<%= field.userpref %>-error\" class=\"error\"></span><% } else if (field.type == \"hidden\") { %><% createHiddenInput(field); %><% } else { %><% createTextInput(field); %><% } %><% if (type !== \"inline\" && field.type !== \"radio\" && field.type !== \"checkbox\" && field.type !== \"hidden\") { %></div><% } %><% } %><% function createFieldset (fieldset, type) { %><fieldset><% if (fieldset.title) { %><legend><span><%= gadgets.util.escape(fieldset.title) %></span></legend><% } %><% if (fieldset.description) { %><p><%= gadgets.util.escape(fieldset.description) %></p><% } %><% for ( var i = 0; i < fieldset.fields.length; i++ ) { %><% createField(fieldset.fields[i], type); %><% } %></fieldset><% } %><form action=\"<%= gadgets.util.escape(obj.action || \'\') %>\" method=\"post\" class=\"aui <%= gadgets.util.escape(obj.theme || \'\') %>\">    <% if (obj.title) { %>        <h2><%= gadgets.util.escape(obj.title) %></h2><% } %><% if (obj.description ) { %><p><%= gadgets.util.escape(obj.description) %></p><% } %><% if (obj.fieldsets) { %><% for ( var i = 0; i < obj.fieldsets.length; i++ ) { %><% createFieldset(obj.fieldsets[i], obj.type); %><% } %><% } else if (obj.fields && obj.fields.length > 0) { %><% for ( var i = 0; i < obj.fields.length; i++ ) { %><% createField(obj.fields[i], obj.theme); %><% } %><% } %><div class=\"submit\"><input class=\"button save\" type=\"submit\" value=\"<%= i18nHelper.getMsg(\'gadget.common.save\') %>\"><input class=\"button cancel\" type=\"button\" value=\"<%= i18nHelper.getMsg(\'gadget.common.cancel\') %>\"></div></form>";AJS.gadgets.templater.Table.template ="<table class=\"aui\" cellspacing=\"0\" border=\"0\">     <% if (obj.cols) { %>     <thead>         <tr>             <% AJS.$(obj.cols).each(function () { %>                 <th                 <% if (this.theme) { %>                      class=\"<%= this.theme %>\"                 <% } %>                 ><div><%= this.header %></div></th>             <% }); %>         </tr>     </thead>     <% } %>     <% if (obj.data) { %>     <tbody>         <% AJS.$(obj.data).each(function (i) { %>             <tr             <% if (i%2) { %>                  class=\"even\"             <% } %>             >                 <% AJS.$(this).each(function () { %>                     <td><%= this.label %></td>                 <% }); %>             </tr>         <% }); %>     </tbody>     <% } %> </table>";AJS.$.namespace("AJS.gadget");/**
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
                
                ajax({
					authorization: "oauth",
                    url: options.useOauth,
                    data:  {cacheBuster: new Date().getTime()},
                    useToken: "always",
                    complete: function (response) {
                        if (response.oauthApprovalUrl || response.rc === 403) {
                            
                            gadget.approvalUrl = response.oauthApprovalUrl;

                            if (response.oauthApprovalUrl) {
                                gadget.approvalRequest = queue[0];
                            }

                            handleOauthApproval();
                        } else if (response.data) {
                            

                            gadget.appendApprovedButton();

                            makeOAuthRequests();
                        }
                    }
                });
            },

            trustedAppsAccepted = function () {
				
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
                                     

                                    if (gadget.appendFooterApproval) {
                                        gadget.appendFooterApproval(request);
                                    }

                                } else if (gadget.appendViewApproval && gadget.approvalRequest) {

                                     

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

};/**
 * Standard Gadget object. Gadgets using this constructor are unconfigurable and simply render a view.
 *
 * @class Standard
 * @constructor
 * @protected
 * @param {Object} options
 *
 * <ul>
 *      <li><strong>baseUrl:</strong> String that will prefix any remote request url</li>
 *
 *      <li><p><strong>useOauth:</strong> Used to determine what authorisation headers (if any) are required for
 *      requests. Using the provided url, gadget will request resource without oauth headers, if data
 *      comes back in the response, all subsequent requests will not use oauth headers. If response does not
 *      return data, subsequent requests will use oauth.
 *      <a href="https://extranet.atlassian.com/display/JIRADEV/OAuth+and+Gagdets+with+anonymous+access">Full
 *      implementation details available here</a>.</p>
 *
 *      <p>Alternatively you can provide the string "always" which will force all requests to use oauth. Please
 *      note this removes the ability to provide data to anonymous users (@AnonymousAllowed)</p></li>
 *
 *
 *      <li>
 *
 *          <p><strong>view:</strong></li> Used by templater to construct primary content (view). The view has parameter
 *          has a number of options, provided as a JSON object:</p>
 *
 *          <ul>
 *              <li>
 *                  <p><strong>{Function, Array} args</strong> - Either an array of objects or function that returns one.
 *                  The objects in this array have two keys: </p>
 *                  <ol>
 *                      <li>{String} key - name of key that will be used to access the data from within the template.</li>
 *                      <li>{Object} ajaxOptions - set of request options to retrieve data from remote resource. Options
 *                      are <a href="http://docs.jquery.com/Ajax/jQuery.ajax#options">available here</a></li>
 *                  </ol>
 *              </li>
 *
 *              <li>
 *                  <p><strong> {Function, String} template </strong> - The function or microtemplate that will be
 *                  executed to render the view (primary content).</p>
 *
 *                  <p>In the case of a function being provided, it will be called with a single argument. This argument is
 *                  a map (object) of the request responses defined in the args array. (See param args above)</p>
 *
 *                  <p>In the case of a string being provided, a &lt;script&gt;, with an ID that matches the provided
 *                  string is located. This script must have a type set to "text/html" also. The innerHTML of this script
 *                  is then used to generate a (x)HTML string using
 *                  <a href="http://ejohn.org/blog/javascript-micro-templating/">Resig's Micro-Templating.</a></p>
 *              </li>
 *          </ul>
 *      </li>
 *
 *      <li>
 *          <em>optional</em> <strong> {Boolean} onResizeReload </strong> - if browser window is resized, view
 *          will be reloaded. This is useful for graphical elements, such as charts where the graphic can be resized
 *          relative to the window.
 *      </li>
 *      <li>
 *          <em>optional</em> <strong> {Boolean} onResizeAdjustHeight </strong> - if browser window is resized, gadget.resize()
 *          will be called to make sure that the gadget height will cope with line wraps that may have occured.
 *      </li>
 * 
 * </ul>
 *
 */
var Standard = function (options) {

    // extend abstract Gadget class
    var gadget = Gadget(options);
    AJS.$.extend(gadget, {

        constructor: Standard,

        getView: function () {
            var view = AJS.$("<div />").addClass("view").appendTo(gadget.getGadget());
            return function () {
                return view;
            };
        }(),

        getFooter: function () {
            var footer = AJS.$("<div />").addClass("footer").appendTo(gadget.getGadget());
            AJS.$("body").addClass("has-footer-options");
            this.getFooter = function () {
                return footer;
            };
            return footer;
        },

        getOauthPopup: function (request) {

            if (request !== undefined) {
                gadget.lastRequest = request;
            }

            request = gadget.lastRequest;

            return new gadgets.oauth.Popup(gadget.approvalUrl, null, function(){}, function() {
                request.success = function () {
                    window.location.reload();
                };
                request.useToken = "always";
                AJS.$.ajax(request);
            });
        },

        getApprovalButton: function (request) {
            var popup = gadget.getOauthPopup(request);
            return AJS.$("<button class='oauth'>").html("<img src='"
                    + options.baseUrl + "/images/gadgets/btn-locked.png' />"
                    + "<span>"+ gadget.getMsg("gadget.common.oauth.approve.button") + "</span>")
                    .click(popup.createOpenerOnClick());
        },

        appendApprovedButton: function () {
            AJS.$("<span class='oauth-approved' />").appendTo(gadget.getFooter());
        },

        appendViewApproval: function (request)  {
            var approvalButton = gadget.getApprovalButton(request).appendTo("body");
            AJS.$("body").addClass("oauth-view-approval");
            gadget.resize();
            return approvalButton;
        },

        appendFooterApproval: function (request) {
            var popup,
                oauthButton = AJS.$(".oauth", gadget.getFooter());
            if (oauthButton.length === 0) {
                popup = gadget.getOauthPopup(request);
                return AJS.$("<button />").addClass("oauth").click(popup.createOpenerOnClick())
                    .appendTo(gadget.getFooter());
            } else {
                return oauthButton;
            }
        },

        containWidthOverflow: function () {
            var bodyWidth = AJS.$("body").outerWidth();
            gadget.getView().css("overflowX", "");
            gadget.getView().css("width", "");
            if (bodyWidth < parseInt(AJS.$(".view").attr("scrollWidth"))) {
                gadget.getView().width(bodyWidth).css("overflowX", "scroll");
                gadget.resize();
            } else if (gadget.getView().css("overflowX") === "scroll" &&
                        parseInt(gadget.getView().attr("scrollWidth")) === gadget.getView().width()) {
                gadget.getView().css("overflowX", "");
                gadget.getView().css("width", "");
            }
        },

        executeAfterLoading: function (invocation) {
            if (AJS.$("body").hasClass("loading")) {
                gadget.hideLoading.callbacks = gadget.hideLoading.callbacks || [];
                gadget.hideLoading.callbacks.push(invocation.proceed);
            } else {
                return invocation.proceed();
            }
        },

        /**
         * Object responsible for displaying primary gadget content
         *
         * @property viewTemplate
         * @type Object
         * @private
         */
        viewTemplate: AJS.gadgets.templater.Custom ({
            template: function(args) {
                if (gadgets.views) {
                    gadget.setViewMode(gadgets.views.getCurrentView().getName());
                }
                options.view.template.call(gadget, args);
                gadget.showView(false, false);
            },
            cache: false,
            // Loop through all the remote args if ajaxOptions is a function then ensure it is
            // called by the templater in the context of the gadget
            args: function() {
                var args = [];
                AJS.$(options.view.args).each(function(){
                    if (AJS.$.isFunction(this.ajaxOptions)) {
                        var that = this;
                        args.push({
                            key: this.key,
                            ajaxOptions: function (args) {
                                return that.ajaxOptions.call(gadget, args);
                            }
                        });
                    } else {
                        args.push(this);
                    }
                });
                return args;
            }()
        })
    });


    AJS.$.aop.around({target: gadget.viewTemplate, method: "addCallback"},  gadget.executeAfterLoading);
    AJS.$.aop.around({target: gadget, method: "resize"}, function (invocation) {
        if (!gadget.resize.pending) {
            gadget.resize.pending = true;
            gadget.executeAfterLoading.call(this, invocation);
        }
    });

    gadget.getViewResizeHeight = function () {
            var configHeight = gadget.getView().outerHeight(),
                footerHeight = jQuery(".footer", gadget.getGadget()).length === 1 ? gadget.getFooter().outerHeight() : 0;
            return configHeight + footerHeight;
    };

    /**
     * shows primary content
     *
     * @method showView
     * @param {Boolean} refresh - flag that specifies to reload content
     */
    gadget.showView = function () {
        gadget.viewTemplate.addCallback(function () {
            gadget.resize(gadget.getViewResizeHeight());
        });
        if (AJS.$.browser.msie) {
            gadget.viewTemplate.addCallback(gadget.containWidthOverflow);
        }
        return function (refresh, resize) {
            if (refresh) {
                gadget.viewTemplate.build();
            } else {
                gadget.getView().show();
                if (resize !== false) {
                    gadget.resize();
                }
            }
        };
    }();

    if (AJS.$.browser.msie) {
        AJS.$(window).resize(gadget.containWidthOverflow);
    }

    if (options.view.onResizeReload) {
        AJS.$(window).resize(function () {
            var width = gadgets.window.getViewportDimensions().width;
            return function () {
                if (gadget.getView().is(":visible")) {
                    var newWidth = gadgets.window.getViewportDimensions().width;
                    if (width > (newWidth + 50) || width < (newWidth - 50)) {
                        gadget.showView(true);
                        width = newWidth;
                    }
                }
            };
        }());
    }

    if (options.view.onResizeAdjustHeight) {
        AJS.$(window).resize(function () {
            var width = gadgets.window.getViewportDimensions().width;
            return function () {
                var newWidth = gadgets.window.getViewportDimensions().width;
                if (width > (newWidth + 50) || width < (newWidth - 50)) {
                    gadget.resize();
                    width = newWidth;
                }
            };
        }());
    }

    return gadget;

};/**
 * Standard Gadget object. This is constuctor is used when a gadget has previously been configured, but now locked
 * (read only).
 *
 * @class Configured
 * @constructor
 * @protected
 * @param {Object} options
 *
 * <ul>
 *      <li><strong>baseUrl:</strong> String that will prefix any remote request url</li>
 *
 *      <li><p><strong>useOauth:</strong> Used to determine what authorisation headers (if any) are required for
 *      requests. Using the provided url, gadget will request resource without oauth headers, if data
 *      comes back in the response, all subsequent requests will not use oauth headers. If response does not
 *      return data, subsequent requests will use oauth.
 *      <a href="https://extranet.atlassian.com/display/JIRADEV/OAuth+and+Gagdets+with+anonymous+access">Full
 *      implementation details available here</a>.</p>
 *
 *      <p>Alternatively you can provide the string "always" which will force all requests to use oauth. Please
 *      note this removes the ability to provide data to anonymous users (@AnonymousAllowed)</p></li>
 *

 *      <li>
 *
 *          <p><strong>view:</strong></li> Used by templater to construct primary content (view). The view has parameter
 *          has a number of options, provided as a JSON object:</p>
 *
 *          <ul>
 *              <li>
 *                  <p><strong>{Function, Array} args</strong> - Either an array of objects or function that returns one.
 *                  The objects in this array have two keys: </p>
 *                  <ol>
 *                      <li>{String} key - name of key that will be used to access the data from within the template.</li>
 *                      <li>{Object} ajaxOptions - set of request options to retrieve data from remote resource. Options
 *                      are <a href="http://docs.jquery.com/Ajax/jQuery.ajax#options">available here</a></li>
 *                  </ol>
 *              </li>
 *
 *              <li>
 *                  <p><strong> {Function, String} template </strong> - The function or microtemplate that will be
 *                  executed to render the view (primary content).</p>
 *
 *                  <p>In the case of a function being provided, it will be called with a single argument. This argument is
 *                  a map (object) of the request responses defined in the args array. (See param args above)</p>
 *
 *                  <p>In the case of a string being provided, a &lt;script&gt;, with an ID that matches the provided
 *                  string is located. This script must have a type set to "text/html" also. The innerHTML of this script
 *                  is then used to generate a (x)HTML string using
 *                  <a href="http://ejohn.org/blog/javascript-micro-templating/">Resig's Micro-Templating.</a></p>
 *              </li>
 *          </ul>
 *      </li>
 *
 *      <li>
 *          <em>optional</em> <strong> {Boolean} onResizeReload </strong> - if browser window is resized, view
 *          will be reloaded. This is useful for graphical elements, such as charts where the graphic can be resized
 *          relative to the window.
 *      </li>
 *      <li>
 *          <em>optional</em> <strong> {Boolean} onResizeAdjustHeight </strong> - if browser window is resized, gadget.resize()
 *          will be called to make sure that the gadget height will cope with line wraps that may have occured.
 *      </li>
 *
 * </ul>
 *
 */
var Configured = function (options) {

    var gadget = Standard(options);

    gadget.constructor = Configured;

    

    /* validation errors */
    gadget.ajaxErrorHandler.handle400 = function (evt, response) {

        /* stop double append */
        if (AJS.$("body").hasClass("config-unavailable")) {
            return;
        }

        var
        errorContainer = AJS.$("<div class='message info' />")
                .append("<p>" + gadget.getMsg("gadget.common.config.unavailable") + "</p>")
                .appendTo(gadget.getView()),

        errorList = AJS.$("<ul />")
                .appendTo(errorContainer);

        AJS.$("body").addClass("config-unavailable");

        AJS.$(response.data.errors).each(function(){
            AJS.$("<li />").append("<strong>" + gadget.getMsg(this.error, this.params) + "</strong>").appendTo(errorList);
        });

        gadget.resize();
    };

    if (options.view.enableReload) {

        

        if (gadget.getPref("refresh") !== "" && gadget.getPref("refresh") !== "false") {
            window.setInterval(function () {
                gadget.showView(true);
            }, 60000 * gadget.getPref("refresh"));
        }

        gadget.addReloadButton = function () {
            gadget.addMenuItem("reload", gadget.getMsg("gadget.common.reload"), function (e) {
                gadget.showView(true);
                e.preventDefault();
            });
        };

        gadget.viewTemplate.addCallback(gadget.addReloadButton);

    }
    return gadget;
};/**
 * Standard Gadget object. This is constuctor is used when a gadget has previously been configured, but now locked
 * (read only).
 *
 * @class Configurable
 * @private
 * @constructor
 * @protected
 * @param {Object} options
 *
 * <ul>
 *      <li><strong>baseUrl:</strong> String that will prefix any remote request url</li>
 *
 *      <li><p><strong>useOauth:</strong> Used to determine what authorisation headers (if any) are required for
 *      requests. Using the provided url, gadget will request resource without oauth headers, if data
 *      comes back in the response, all subsequent requests will not use oauth headers. If response does not
 *      return data, subsequent requests will use oauth.
 *      <a href="https://extranet.atlassian.com/display/JIRADEV/OAuth+and+Gagdets+with+anonymous+access">Full
 *      implementation details available here</a>.</p>
 *
 *      <p>Alternatively you can provide the string "always" which will force all requests to use oauth. Please
 *      note this removes the ability to provide data to anonymous users (@AnonymousAllowed)</p></li>
 *
 *      <li>
 *
 *          <p><strong>config:</strong></li> Used by templater to construct the configuration form. The
 *          config parameter has a number of options, provided as a JSON object:</p>
 *
 *          <ul>
 *              <li>
 *                  <p><strong>{Function, Array} args</strong> - Either an array of objects or function that returns one.
 *                  The objects in this array have two keys: </p>
 *                  <ol>
 *                      <li>{String} key - name of key that will be used to access the data from within the template.</li>
 *                      <li>{Object} ajaxOptions - set of request options to retrieve data from remote resource. Options
 *                      are <a href="http://docs.jquery.com/Ajax/jQuery.ajax#options">available here</a></li>
 *                  </ol>
 *              </li>
 *              <li><Strong>{Function} descriptor</strong> - specifies the fields you would like to display for the
 *              user to set preferences. The structure of the form is described using a descriptor. The descriptor
 *              must be a function and return an object with valid form values. Valid form values are yet to be
 *              documented.</li>
 *          </ul>
 *      </li>
 *
 *
 *      <li>
 *
 *          <p><strong>view:</strong></li> Used by templater to construct primary content (view). The view has parameter
 *          has a number of options, provided as a JSON object:</p>
 *
 *          <ul>
 *              <li>
 *                  <p><strong>{Function, Array} args</strong> - Either an array of objects or function that returns one.
 *                  The objects in this array have two keys: </p>
 *                  <ol>
 *                      <li>{String} key - name of key that will be used to access the data from within the template.</li>
 *                      <li>{Object} ajaxOptions - set of request options to retrieve data from remote resource. Options
 *                      are <a href="http://docs.jquery.com/Ajax/jQuery.ajax#options">available here</a></li>
 *                  </ol>
 *              </li>
     *
     *              <li>
     *                  <p><strong> {Function, String} template </strong> - The function or microtemplate that will be
     *                  executed to render the view (primary content).</p>
     *
     *                  <p>In the case of a function being provided, it will be called with a single argument. This argument is
     *                  a map (object) of the request responses defined in the args array. (See param args above)</p>
     *
     *                  <p>In the case of a string being provided, a &lt;script&gt;, with an ID that matches the provided
     *                  string is located. This script must have a type set to "text/html" also. The innerHTML of this script
     *                  is then used to generate a (x)HTML string using
     *                  <a href="http://ejohn.org/blog/javascript-micro-templating/">Resig's Micro-Templating.</a></p>
     *              </li>
     *          </ul>
     *      </li>
     *
     *      <li>
     *          <em>optional</em> <strong> {Boolean} enableReload </strong> - if true will add a list of reload
     *          intervals to the configuration form. When gadget loads timer will initiate, when interval is hit, view
     *          will be reloaded
     *      </li>
     *
     *      <li>
     *          <em>optional</em> <strong> {Boolean} onResizeReload </strong> - if browser window is resized, view
     *          will be reloaded. This is useful for graphical elements, such as charts where the graphic can be resized
     *          relative to the window.
     *      </li>
     *      <li>
     *          <em>optional</em> <strong> {Boolean} onResizeAdjustHeight </strong> - if browser window is resized, gadget.resize()
     *          will be called to make sure that the gadget height will cope with line wraps that may have occured.
     *      </li>
     *
     * </ul>
     *
     */
    var Configurable =  function (options) {

        var gadget = Configured(options);

        

        AJS.$.extend(gadget, {

            constructor: Configurable,

            appendFooterApproval: function (superAppendFooterApproval) {
                return function (request) {
                    if (AJS.$(".info.footer-message").length < 1) {
                        AJS.$("<div id='oauth-inline-approval' />").addClass("info footer-message")
                            .html("<p>" + gadget.getMsg("gadget.common.oauth.approve.message") + "</p>")
                            .append(gadget.getApprovalButton(request)).insertBefore(AJS.$(":first", gadget.configTemplate.getTarget()));
                        gadget.resize();
                    }
                    superAppendFooterApproval.apply(gadget, arguments);
                };
            }(gadget.appendFooterApproval),

            getOauthPopup: function (request) {

                if (request !== undefined) {
                    gadget.lastRequest = request;
                }

                request = gadget.lastRequest;

                return new gadgets.oauth.Popup(gadget.approvalUrl, null, function(){}, function() {
                    request.success = function () {

                        function persistFormInHash () {
                            window.location.href += "&" + AJS.$("form", gadget.configTemplate.getTarget()).serialize() + "}";
                        }

                        if (gadget.getPrefs().getBool("isConfigured") && !/isConfigured=true/.test(window.location.href)) {
                            persistFormInHash();
                            window.top.location.reload();
                        } else {
                            persistFormInHash();
                            window.location.reload();
                        }
                    };
                    request.useToken = "always";
                    AJS.$.ajax(request);
                });
            },

            /**
             * Object responsible for building configuration form & saving preferences
             *
             * @property configTemplate
             * @type Object
             * @private
             */
            configTemplate: AJS.gadgets.templater.Form ({

                // target of html injection
                target: AJS.$("<div id='config' />").insertAfter(gadget.getView()),

                // proxy to user defined descriptor to ensure descriptor has gadget context
                // we can also append additional configuration options, not set by user, to config form.
                descriptor: function (args) {
                    var descriptor = options.config.descriptor.call(gadget, args);
                    if (options.view.enableReload) {
                        descriptor.fields.push({
                            userpref: "refresh",
                            label: gadget.getMsg("gadget.common.refresh.label"),
                            description: gadget.getMsg("gadget.common.refresh.description"),
                            selected: gadget.getPref("refresh"),
                            options: [
                                {value: "false", label: gadget.getMsg("gadget.common.refresh.never")},
                                {value: "15", label: AJS.format(gadget.getMsg("gadget.common.refresh.minutes"), 15)},
                                {value: "30", label: AJS.format(gadget.getMsg("gadget.common.refresh.minutes"), 30)},
                                {value: "60", label: AJS.format(gadget.getMsg("gadget.common.refresh.hour"), 1)},
                                {value: "120", label: AJS.format(gadget.getMsg("gadget.common.refresh.hours"), 2)}
                            ],
                            type: "select"
                        });
                    }
                    return descriptor;
                },

                // Loop through all the remote args if ajaxOptions is a function then ensure it is
                // called by the templater in the context of the gadget
                args: function() {
                    var args = [];

                    // we need to make requests to trigger oauth request, so if config has no args we are going to fire
                    // requests for the view.

                    if (AJS.$.isFunction(options.config.args)) {
                        options.config.args = options.config.args();
                    }

                    AJS.$(options.config.args).each(function() {
                        var that = this;
                        if (AJS.$.isFunction(this.ajaxOptions)) {
                            args.push({key: this.key, ajaxOptions: function (args) {
                                return that.ajaxOptions.call(gadget, args);
                            }});
                        } else {
                            args.push(this);
                        }
                    });

                    return args;
                }(),

                // Method called when the cancel button on the form is clicked
                cancel: function (e) {
                    gadget.showView();
                    e.preventDefault();
                },

                // Method called when form is submitted
                submit: function (e) {
                    var form = AJS.$(this),
                    save = function () {
                        // save form configuration to user prefs
                        AJS.$(form.serializeArray()).each(function(){
                            gadget.savePref(this.name, this.value);
                        });
                        // hide form
                        gadget.showView(true);
                    };
                    if (form.attr("action") !== "") {
                        AJS.$.ajax({
                            type: "get",
                            url: form.attr("action"),
                            data: form.serialize(),
                            global: false, // we don't want the global error handler coming into play

                            // if the configuration passed server side validation
                            success: function () {
                                var fieldValues = {};

                                // save form configuration to user prefs
                                AJS.$(form.serializeArray()).each(function(){
                                    var fieldVal = fieldValues[this.name];
                                    if (!fieldVal) {
                                        fieldVal = this.value;
                                    } else if (AJS.$.isArray(fieldVal)) {
                                        fieldVal.push(this.value);
                                    } else {
                                        fieldVal = [fieldVal, this.value];
                                    }
                                    fieldValues[this.name] = fieldVal;
                                });

                                AJS.$(":checkbox:not(:checked)", form).each(function () {
                                    fieldValues[this.name] = "false";
                                });

                                for (var name in fieldValues) {
                                    gadget.savePref(name, fieldValues[name]);
                                }

                                // hide form
                                gadget.showView(true);
                            },
                            error: function (response, settings) {
                                gadget.ajaxErrorHandler.execute(null, response, AJS.$.extend(settings, {isConfig: true}));
                            }
                        });
                    } else {
                        save();
                    }
                    e.preventDefault();
                }
            }),


            /**
             * Gets config object, wrapper div for config form (jQuery Object)
             *
             * @method getConfig
             * @return {Object} jQuery object
             */
            getConfig: function () {
                return gadget.configTemplate.getTarget();
            }
        });

        /**
         * shows configuration
         *
         * @method showConfig
         */
        gadget.showConfig = function () {

            var restoreValuesFromHash = function () {
                
                var options, fields;

                /* If preselected form fields have been serialized to the end of the hash */
                if (/#rpctoken/.test(window.location.href) && !/#rpctoken=[0-9]+$/.test(window.location.href)) {
                    fields = window.location.href.replace(/.*?#/,"").split("&");
                    AJS.$.each(fields, function () {
                        var name = this.split("=")[0], val = this.split("=")[1], field = AJS.$(":input[name=" + name + "]");
                        if (field.length > 0) {
                            if (field.is("select")) {
                                options = val.split(",");
                                AJS.$.each(options, function () {
                                    AJS.$("option[value=" + this + "]", field).attr("selected", "selected");
                                });
                            } else if (field.is(":radio,:checkbox")) {
                                field.attr("checked", "checked");
                            } else {
                                field.val(val);
                            }
                        }
                    });
                    window.location.href = window.location.href.replace(/(#rpctoken=[0-9]+).*/,"$1");
                }
            };

            gadget.configTemplate.addCallback(function(){

                /* Having issues with ie calculating correct height, so doing it the manual way */
                function getResizeHeight () {
                    var configHeight = gadget.getConfig().outerHeight(),
                        footerHeight = jQuery(".footer", gadget.getGadget()).length === 1 ? gadget.getFooter().outerHeight() : 0;
                    return configHeight + footerHeight;
                }

                AJS.$("body").addClass("config-active");
                gadget.configTemplate.getTarget().show();
                // Restores the values of a partly completed form. This happens in the case of an oauth approval, the
                // iframe is refreshed. Before we refresh though we save the value to the hash to restore, which we are doing now.
                restoreValuesFromHash();
                if (gadget.approvalRequest) {
                    gadget.appendFooterApproval(gadget.approvalRequest);
                }
                AJS.$("button", ".footer").hide();
                gadget.resize(getResizeHeight());
            });
            return function () {
                gadget.configTemplate.build();
            };
        }();

        /**
         * shows primary content
         *
         * @method showView
         * @param {Boolean} refresh - flag that specifies to reload content
         * @override
         */
        gadget.showView = function (refresh, resize) {

            gadget.addMenuItem("configure", gadget.getMsg("gadget.common.configure"), function (e) {
                gadget.showConfig();
                e.preventDefault();
            });

            if (gadget.addReloadButton) {
                gadget.addReloadButton();
            }

            if (refresh) {
                gadget.viewTemplate.build();
            } else {
                AJS.$("body").removeClass("config-active");
                gadget.configTemplate.getTarget().hide();

                if (resize !== false) {
                    gadget.resize(gadget.getViewResizeHeight());
                }
                AJS.$("button", ".footer").show();
            }
        };

        /**
         * Handles validation errors
         *
         * @method ajaxErrorHandler.handle500
         * @private
         */
        gadget.ajaxErrorHandler.handle400 = function (superHandle400) {

            var validationErrors,

            showFormErrors = function () {
                AJS.$(".error", gadget.configTemplate.getTarget()).hide();
                AJS.$(validationErrors).each(function(){
                    var msg = gadget.getMsg(this.error, this.params);
                    AJS.$(":input[name='" + this.field + "']")
                    .parent()
                    .find(".error")
                    .text(msg)
                    .show();
                    AJS.$("#" + this.field + "-error").text(msg).show();
                });
                gadget.resize();
                validationErrors = null;
            };


            gadget.configTemplate.addCallback(function () {
                if (!gadget.getPrefs().getBool("isConfigured") || validationErrors) {
                    AJS.$("input.cancel", gadget.configTemplate.getTarget()).hide();
                }
                if (validationErrors) {
                    showFormErrors();
                }
                gadget.removeMenuItem("configure");
                gadget.removeMenuItem("reload");
            });

            return function (evt, response, settings) {
                validationErrors = response.data.errors;
                if (!settings.isConfig) {
                    superHandle400.apply(gadget, arguments);
                } else {
                    showFormErrors();
                }
            };

        }(gadget.ajaxErrorHandler.handle400);

        return gadget;
    };/**
 * Standard Gadget object. This is constuctor is used when a gadget has previously been configured, but now locked
 * (read only).
 *
 * @class AJS.Gadget
 * @constructor
 * @protected
 * @param {Object} options
 *
 * <ul>
 *      <li><strong>baseUrl:</strong> String that will prefix any remote request url</li>
 *
 *      <li><p><strong>useOauth:</strong> Used to determine what authorisation headers (if any) are required for
 *      requests. Using the provided url, gadget will request resource without oauth headers, if data
 *      comes back in the response, all subsequent requests will not use oauth headers. If response does not
 *      return data, subsequent requests will use oauth.
 *      <a href="https://extranet.atlassian.com/display/JIRADEV/OAuth+and+Gagdets+with+anonymous+access">Full
 *      implementation details available here</a>.</p>
 *
 *      <p>Alternatively you can provide the string "always" which will force all requests to use oauth. Please
 *      note this removes the ability to provide data to anonymous users (@AnonymousAllowed)</p></li>
 *
 *      <li>
 *
 *          <p><strong>view:</strong></li> Used by templater to construct primary content (view). The view has parameter
 *          has a number of options, provided as a JSON object:</p>
 *
 *          <ul>
 *              <li>
 *                  <p><strong>{Function, Array} args</strong> - Either an array of objects or function that returns one.
 *                  The objects in this array have two keys: </p>
 *                  <ol>
 *                      <li>{String} key - name of key that will be used to access the data from within the template.</li>
 *                      <li>{Object} ajaxOptions - set of request options to retrieve data from remote resource. Options
 *                      are <a href="http://docs.jquery.com/Ajax/jQuery.ajax#options">available here</a></li>
 *                  </ol>
 *              </li>
 *
 *              <li>
 *                  <p><strong> {Function, String} template </strong> - The function or microtemplate that will be
 *                  executed to render the view (primary content).</p>
 *
 *                  <p>In the case of a function being provided, it will be called with a single argument. This argument is
 *                  a map (object) of the request responses defined in the args array. (See param args above)</p>
 *
 *                  <p>In the case of a string being provided, a &lt;script&gt;, with an ID that matches the provided
 *                  string is located. This script must have a type set to "text/html" also. The innerHTML of this script
 *                  is then used to generate a (x)HTML string using
 *                  <a href="http://ejohn.org/blog/javascript-micro-templating/">Resig's Micro-Templating.</a></p>
 *              </li>
 *          </ul>
 *      </li>
 *
 *      <li>
 *
 *          <p><em>optional</em> <strong>{Object} config:</strong></li> Used by templater to construct the configuration form. The
 *          config parameter has a number of options, provided as a JSON object:</p>
 *
 *          <ul>
 *              <li>
 *                  <p><strong>{Function, Array} args</strong> - Either an array of objects or function that returns one.
 *                  The objects in this array have two keys: </p>
 *                  <ol>
 *                      <li>{String} key - name of key that will be used to access the data from within the template.</li>
 *                      <li>{Object} ajaxOptions - set of request options to retrieve data from remote resource. Options
 *                      are <a href="http://docs.jquery.com/Ajax/jQuery.ajax#options">available here</a></li>
 *                  </ol>
 *              </li>
 *              <li><Strong>{Function} descriptor</strong> - specifies the fields you would like to display for the
 *              user to set preferences. The structure of the form is described using a descriptor. The descriptor
 *              must be a function and return an object with valid form values. Valid form values are yet to be
 *              documented.</li>
 *          </ul>
 *      </li>
 *
 *      <li>
 *          <em>optional</em> <strong> {Boolean} enableReload </strong> - if true will add a list of reload
 *          intervals to the configuration form. When gadget loads timer will initiate, when interval is hit, view
 *          will be reloaded
 *      </li>
 *
 *      <li>
 *          <em>optional</em> <strong> {Boolean} onResizeReload </strong> - if browser window is resized, view
 *          will be reloaded. This is useful for graphical elements, such as charts where the graphic can be resized
 *          relative to the window.
 *      </li>
 *      <li>
 *          <em>optional</em> <strong> {Boolean} onResizeAdjustHeight </strong> - if browser window is resized, gadget.resize()
 *          will be called to make sure that the gadget height will cope with line wraps that may have occured.
 *      </li>
 *
 * </ul>
 *
 */
AJS.Gadget = function (options) {

    var gadget, pubInterface,

    /**
     * Detects if the user is gadget owner and has permissions to configure. If an external container writable
     * param will be undefined and we default to allow permissions.
     *
     * @method isWriteable
     * @private
     * @return {Boolean} if user has permissions to configure.
     */
    isWriteable = function () {
        if (gadgets.views) {
            return gadgets.views.getParams().writable === undefined || gadgets.views.getParams().writable === "true";
        }
        
    },

    getStandardInterface = function () {
        return {
            showMessage: gadget.showMessage,
            savePref: gadget.savePref,
            setViewMode: gadget.setViewMode,
            getViewMode: gadget.getViewMode,
            getBaseUrl: gadget.getBaseUrl, 
            getPrefs: gadget.getPrefs,
            getPref: gadget.getPref,
            getPrefArray: gadget.getPrefArray,
            getMsg: gadget.getMsg,
            getGadget: gadget.getGadget,
            resize: gadget.resize,
            showLoading: gadget.showLoading,
            hideLoading: gadget.hideLoading,
            createCookie: gadget.createCookie,
            readCookie: gadget.readCookie,
            eraseCookie: gadget.eraseCookie,
            isLocal: gadget.isLocal,
            addMenuItem: gadget.addMenuItem,
            removeMenuItem: gadget.removeMenuItem
        };
    },

    getConfiguredInterface = function () {
        return AJS.$.extend(getStandardInterface(), {
            getView: gadget.getView,
            showView: gadget.showView,
            getFooter: gadget.getFooter
        });
    },

    getConfigurableInterface = function () {
        return AJS.$.extend(getConfiguredInterface(), {
            showConfig: gadget.showConfig,
            getConfig: gadget.getConfig
        });
    };
    if (options.view && !options.config) {
        gadget = Standard(options);
        pubInterface = getStandardInterface();
        gadget.showView(true);
    } else if (options.view && options.config && !isWriteable()) {
		
		gadget = Configured(options);
        pubInterface = getConfiguredInterface();
        if (gadget.getPrefs().getBool("isConfigured")) {
            gadget.showView(true);
        }



    } else if (options.view && options.config && isWriteable()) {
        gadget = Configurable(options);
        pubInterface = getConfigurableInterface();
        if (!gadget.getPrefs().getBool("isConfigured")) {
            gadget.showConfig();
        } else {
            gadget.showView(true);
        }
    }

    return pubInterface;
};

// support legacy constuctor
AJS.gadget.Configurable = AJS.Gadget;})();