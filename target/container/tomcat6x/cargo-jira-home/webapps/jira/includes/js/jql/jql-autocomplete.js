(function (){
var jql_operators = [{value:"=", displayName:"="}, {value:"!=", displayName:"!="}, {value:"~", displayName:"~"}, {value:"<=", displayName:"&lt;="}, {value:">=", displayName:"&gt;="}, {value:">", displayName:"&gt;"}, {value:"<", displayName:"&lt;"}, {value:"!~", displayName:"!~"}, {value:"is not", displayName:"is not"}, {value:"is", displayName:"is"}, {value:"not in", displayName:"not in"}, {value:"in", displayName:"in"}];
var jql_logical_operators = [{value:"AND", displayName:"AND"}, {value:"OR", displayName:"OR"}];
var jql_logical_operators_and_order_by = [{value:"AND", displayName:"AND"}, {value:"OR", displayName:"OR"}, {value:"ORDER BY", displayName:"ORDER BY"}];
var jql_order_by_direction = [{value:"ASC", displayName:"ASC"}, {value:"DESC", displayName:"DESC"}];
var empty_operand = [{value:"EMPTY", displayName:"EMPTY", types:["java.lang.Object"]}];
var jql_not_logical_operator = [{value:"NOT", displayName:"NOT"}];

jira.widget.autocomplete.JQL = function (options) {

    var that = begetObject(jira.widget.autocomplete);
    var parser = options.parser;
    var result;
    var jql_field_names = jQuery.grep(options.jqlFieldNames, function(arrValue){
            // We only want the searchable fields
            return arrValue.searchable;
    });
    var jql_order_by_field_names = jQuery.grep(options.jqlFieldNames, function(arrValue){
            // We only want the orderable fields
            return arrValue.orderable;
    }); 
    var jql_function_names = options.jqlFunctionNames;
    var errorID = options.errorID;
    var suggestionCount = 0;

    that.renderSuggestions = function (suggestions, moreSuggestions) {
        var suggestionNodes = [];
        this.clearResponseContainer();
        if (suggestions instanceof Array)
        {
            if (suggestions.length < 1 && (moreSuggestions && moreSuggestions.length < 1))
            {
                return suggestionNodes;
            }
            else
            {
                var length = (suggestions.length > 15) ? 15 : suggestions.length;
                for (var i=0; i < length; i++)
                {
                    var actualValueSug;
                    var displayNameSug;
                    // We may have an object with displayName and value OR it may just be a string
                    if (suggestions[i].value)
                    {
                        var resultSug = suggestions[i];
                        if (result)
                        {
                            // This is a hack that adds an initial ( when the value is the first completed in a list
                            // We only do this for suggestions and not moreSuggestions since we know that this is
                            // the position that the values will take, moreSuggestions will be function suggestions
                            actualValueSug = ((result.getNeedsOpenParen()) ? "(" : "") + resultSug.value;
                        }
                        else
                        {
                            actualValueSug = resultSug.value;
                        }
                        displayNameSug = resultSug.displayName;
                    }
                    else
                    {
                        displayNameSug = suggestions[i];
                        actualValueSug = displayName;
                    }

                    suggestionNodes.push([jQuery("<li id='jql_value_suggest_" + i + "'>").html(displayNameSug).appendTo(this.responseContainer), actualValueSug]);
                }

                if (moreSuggestions && moreSuggestions.length > 0)
                {

                    length = (moreSuggestions.length > 15) ? 15 : moreSuggestions.length;
                    for (var j=0; j < length; j++)
                    {
                        var actualValue;
                        var displayName;
                        // We may have an object with displayName and value OR it may just be a string
                        if (moreSuggestions[j].value)
                        {
                            var resultSug2 = moreSuggestions[j];
                            actualValue = resultSug2.value;
                            displayName = resultSug2.displayName;
                        }
                        else
                        {
                            displayName = moreSuggestions[j];
                            actualValue = displayName;
                        }

                        var suggestionEl = jQuery("<li id='jql_func_suggest_" + j + "'>").html(displayName);
                        // Add the separator if needed
                        if (j === 0 && suggestions.length !== 0)
                        {
                            suggestionEl.addClass("groupmarker");
                        }
                        suggestionNodes.push([suggestionEl.appendTo(this.responseContainer), actualValue]);
                    }

                }
            }
        }

        if (suggestionNodes.length > 0)
        {
            that.addSuggestionControls(suggestionNodes);
        }

        return suggestionNodes;
    };

    that.completeField = function(value)
    {
        var start = that.getReplacementStartIndex(result);

        var end = that.getReplacementEndIndex(result, start);

        that.replaceValue(start, end, value);

        // Parse the whole thing again with the full string so we can set the parse/not parse indicator correctly, possibly a third parse, this is starting to get crazy
        var newToken = parser.parse(this.field.val());
        that.updateParseIndicator(newToken);
    };

    that.dispatcher = function (val) {

        var that = this;
        var selectionRange = jQuery(that.field).selectionRange();
        var parseValue = val.substring(0, selectionRange.start);
        result = parser.parse(parseValue).getResult();
        // We will always make a suggestion from here so lets increment the count
        suggestionCount++;
        // In this case we suggest operators
        if (result.getNeedsField())
        {
            that.renderSuggestionsFromMap(that.stripEscapeCharacters(result.getLastFieldName()), jql_field_names, jql_not_logical_operator, true);
        }
        else if (result.getNeedsOperator())
        {
            that.renderSuggestionsForOperators(result.getLastOperator(), jql_operators);
        }
        else if (result.getNeedsLogicalOperator())
        {
            if (result.getNeedsOrderBy())
            {
                var value = (result.getLastOrderBy() === null) ? result.getLastLogicalOperator() : result.getLastOrderBy();
                that.renderSuggestionsFromMap(value, jql_logical_operators_and_order_by, false);
            }
            else
            {
                that.renderSuggestionsFromMap(result.getLastLogicalOperator(), jql_logical_operators, false);
            }
        }
        else if (result.getNeedsOrderByField())
        {
            that.renderSuggestionsFromMap(that.stripEscapeCharacters(result.getLastOrderByFieldName()), jql_order_by_field_names, true);
        }
        else if (result.getNeedsOrderByDirection())
        {
            that.renderSuggestionsFromMap(result.getLastOrderByDirection(), jql_order_by_direction, false);
        }
        else if (result.getNeedsOperand())
        {
            var fieldName = result.getLastFieldName();

            var canAutoComplete = false;
            // If we know that we are only suggesting empty then we do not need to suggest values
            if (!that.isEmptyOnlyOperator(result.getLastOperator()))
            {
                for (var i = 0; i < jql_field_names.length; i++)
                {
                    if (that.equalsIgnoreCase(result.getUnquotedString(jql_field_names[i].value), fieldName) ||
                        (jql_field_names[i].cfid && that.equalsIgnoreCase(jql_field_names[i].cfid, fieldName)))
                    {
                        canAutoComplete = jql_field_names[i].auto;
                        break;
                    }
                }
            }

            var functionSuggestions = (that.isEmptyOnlyOperator(result.getLastOperator())) ? empty_operand : jql_function_names;

            if (canAutoComplete)
            {
                var currentSuggestionCount = suggestionCount;
                var fieldValue = (result.getLastOperand() === null) ? "" : that.stripEscapeCharacters(result.getLastOperand());
                var fieldNameValueKey = fieldName + ":" + fieldValue;
                var data = {fieldName:that.stripEscapeCharacters(fieldName)};
                if (result.getLastOperand() !== null)
                {
                    data.fieldValue = fieldValue;
                }
                if (!that.getSavedResponse(fieldNameValueKey)) {
                    // We only delay the AJAX request, if it comes back and we have already suggested something else then the results will be dropped because of suggestionCount
                    this.delay(function(){
                        
                        jQuery.ajax({
                            url: contextPath + "/rest/api/1.0/jql/autocomplete",
                            dataType: "json",
                            data: data,
                            success: function (response) {
                                var results;
                                if (response !== null && response.results !== null)
                                {
                                    results = response.results;
                                }
                                else
                                {
                                    results = [];
                                }
                                // Cache the results
                                that.saveResponse(fieldNameValueKey, results);
                                that.renderSuggestionsForOperands(fieldValue, results, functionSuggestions, currentSuggestionCount);
                            },
                            error: function () {
                                that.renderSuggestionsForOperands(fieldValue, [], functionSuggestions, currentSuggestionCount);
                            }
                        });
                    }, that.queryDelay);
                }
                else
                {
                    that.renderSuggestionsForOperands(fieldValue, that.getSavedResponse(fieldNameValueKey), functionSuggestions, currentSuggestionCount);
                }
            }
            else
            {
                // We should at least render the function suggestions
                that.renderSuggestionsForOperands(that.stripEscapeCharacters(result.getLastOperand()), [], functionSuggestions, suggestionCount);
            }
        }
        else
        {
            that.dropdownController.hideDropdown();
        }

        // Need to update the parse/not parse indicator
        that.parse(val);
    };

    that.stripEscapeCharacters = function(val) {

        if (val == null)
        {
            return val;
        }
        var newVal = "";
        var strArr = val.split("");
        for(var i = 0; i < strArr.length; i++)
        {
            if (strArr[i] == '\\')
            {
                // If we are a unicode string then we just consume it like normal
                if (!val.substring(i, val.length).match(/^u[a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]/))
                {
                    // Just chew past the escape and use the next char, the parser has already made sure this is cool
                    i++;
                    if (i >= val.length)
                    {
                        break;
                    }
                }
            }
            newVal += strArr[i];
        }
        return newVal;
    };

    that.parse = function(val) {
        var newToken = parser.parse(val);
        that.updateParseIndicator(newToken);
        that.updateColumnLineCount();
        return newToken.getResult();
    };

    that.renderSuggestionsFromMap = function(stringVal, list, otherSuggestions, showFull)
    {
        if (!otherSuggestions)
        {
            otherSuggestions = {};
        }
        var suggestions = that.slimListForMapResults(stringVal, list, showFull);
        var relevantOtherSuggestions = that.slimListForMapResults(stringVal, otherSuggestions, showFull);
        that.boldMatchingString(stringVal, relevantOtherSuggestions);
        that.boldMatchingString(stringVal, suggestions);

        that.renderSuggestions(suggestions, relevantOtherSuggestions);
        if (suggestions.length === 0 && relevantOtherSuggestions.length === 0)
        {
            that.dropdownController.hideDropdown();
        }
    };

    that.renderSuggestionsForOperators = function(stringVal, list)
    {
        var suggestions = that.slimListForMapResults(stringVal, list, false);

        var fieldName = result.getLastFieldName();
        // Find the current field, if we know about it and get the supported operators
        var supportedOperators;
        for (var i = 0; i < jql_field_names.length; i++)
        {
            if (that.equalsIgnoreCase(result.getUnquotedString(jql_field_names[i].value), fieldName) ||
                (jql_field_names[i].cfid && that.equalsIgnoreCase(jql_field_names[i].cfid, fieldName)))
            {
                supportedOperators = jql_field_names[i].operators;
                break;
            }
        }

        // Now lets run through the remaining list and if we can identify the field we can see if that field
        // supports which operators
        if (supportedOperators)
        {
            suggestions = jQuery.grep(suggestions, function(arrValue){
                return jQuery.inArray(arrValue.value, supportedOperators) > -1;
            });
        }
        that.boldMatchingString(stringVal, suggestions);

        that.renderSuggestions(suggestions);
        if (suggestions.length === 0)
        {
            that.dropdownController.hideDropdown();
        }
    };

    that.renderSuggestionsForOperands = function(stringVal, ajaxSuggestions, functions, providedSuggestionCount)
    {
        // Only render the suggestions if we are the current suggestion
        if (providedSuggestionCount === suggestionCount)
        {
            // Don't need to slim the ajaxSuggestions since they came from the server slimmed down
            var fucntionsSuggestions = that.slimListForFunctionResults(stringVal, functions, result.getLastOperator());
            that.boldMatchingString(stringVal, fucntionsSuggestions);
            that.renderSuggestions(ajaxSuggestions, fucntionsSuggestions);

            if (ajaxSuggestions.length === 0 && fucntionsSuggestions.length === 0)
            {
                that.dropdownController.hideDropdown();
            }
        }
    };

    // This bolds the beginning portion of the matching string and converts the list to be value/displayName. This
    // assumes that all strings in the list have already been confirmed to match the incomming stringVal
    that.boldMatchingString = function(stringVal, list)
    {
        if (stringVal == null || list.length === 0)
        {
            return;
        }

        var stringValArr = stringVal.split("");
        var boldLength = stringValArr.length;
        // Run through all the characters looking for html escape characters so we can include their extra length in
        // the bold length
        for(var j = 0; j < stringValArr.length; j++)
        {
            if (stringValArr[j] === "<" || stringValArr[j] === ">")
            {
                // We have one character representing this already, lets add the other 3 for &lt; or &gt;
                boldLength = boldLength + 3;
            }
            else if (stringValArr[j] === "&")
            {
                // We have one character representing this already, lets add the other 4 for &amp;
                boldLength = boldLength + 4;
            }
            else if (stringValArr[j] === "\"")
            {
                // We have one character representing this already, lets add the other 5 for &quot;
                boldLength = boldLength + 5;
            }
        }

        for(var i = 0; i < list.length; i++)
        {
            if (list[i].displayName)
            {
                var origVal = list[i].displayName;
                // Create a new copy of the object so we don't mess up the original list
                list[i] = {value:list[i].value, displayName:"<b>" + origVal.substring(0, boldLength) + "</b>" + origVal.substring(boldLength)};
            }
            else
            {
                // Add a displayName so we don't mess up the value
                list[i] = {value:list[i], displayName:"<b>" + list[i].substring(0, boldLength) + "</b>" + list[i].substring(boldLength)};
            }
        }
    };

    that.htmlEscape = function(stringVal)
    {
        if (stringVal == null)
        {
            return null;
        }
        var escapedVal = "";
        var strArr = stringVal.split("");
        // Run through all the characters looking for html escape characters so we can include their extra length in
        // the bold length
        for(var j = 0; j < strArr.length; j++)
        {
            if (strArr[j] === "<")
            {
                escapedVal += "&lt;";
            }
            else if(strArr[j] === ">")
            {
                escapedVal += "&gt;";
            }
            else if (strArr[j] === "&")
            {
                // We have one character representing this already, lets add the other 4 for &amp;
                escapedVal += "&amp;";
            }
            else if (strArr[j] === "\"")
            {
                // We have one character representing this already, lets add the other 5 for &quot;
                escapedVal += "&quot;";
            }
            else
            {
                escapedVal += strArr[j];
            }
        }
        return escapedVal;
    },

    that.getReplacementStartIndex = function(result)
    {
        var jQueryReference = jQuery(this.field);
        var start;
        if (result.getNeedsField())
        {
            start = result.getLastFieldNameStartIndex();
        }
        else if(result.getNeedsOperator())
        {
            start = result.getLastOperatorStartIndex();
        }
        else if(result.getNeedsOperand())
        {
            start = result.getLastOperandStartIndex();
        }
        else if(result.getNeedsOrderByField())
        {
            start = result.getLastOrderByFieldNameStartIndex();
        }
        else if(result.getNeedsOrderByDirection())
        {
            start = result.getLastOrderByDirectionStartIndex();
        }
        else if(result.getNeedsLogicalOperator())
        {
            if (result.getLastLogicalOperatorStartIndex() !== null && result.getLastLogicalOperatorStartIndex() !== 0)
            {
                start = result.getLastLogicalOperatorStartIndex();
            }
            else
            {
                if (result.getLastOrderBy() !== null && result.getLastOrderByStartIndex() !== 0)
                {
                    start = result.getLastOrderByStartIndex();
                }
                else
                {
                    start = jQueryReference.selectionRange().start - 1;
                }
            }
        }
        else
        {
            start = jQueryReference.selectionRange().start - 1;
        }
        return start;
    };

    that.getReplacementEndIndex = function(result, start)
    {
        var jQueryReference = jQuery(this.field);
        var selectionRange = jQueryReference.selectionRange();
        var end = null;
        // We only need to do a second parse if we have no highlighted selection AND we are not at the end of the input string
        // otherwise we just use the selectionEnd
        if (selectionRange.start === selectionRange.end && selectionRange.end !== this.field.val().length)
        {
            // Lets get the token number from the first parse, this is the token we are currently on
            var currentTokenIdx = result.getTokens().length - 1;

            // Parse it again, but this time the full string so we know what the full token is that we are trying to replace
            // with the selected completion
            var token = parser.parse(this.field.val());
            if (!token.getParseError())
            {
                // The user has not highlighted text so lets assume we are completing to the end of the current token
                // Ask the newly parsed result for the complete token we are in the middle of
                var fullTokenValue = token.getResult().getTokens()[currentTokenIdx];
                // This is a special case, we don't want to replace the '(' or ')' instead we want to add inside
                if (fullTokenValue !== null && fullTokenValue !== '(' && fullTokenValue !== ')' )
                {
                    var fullTextVal = this.field.val();
                    // Lets get the start position in the string
                    var remainingString = fullTextVal.substring(start, fullTextVal.length);
                    // We know that we are going to see the fullTokenValue next, but there may be some whitespace between
                    // here and there, lets make sure we ditch the whitespace as well.
                    var remainingStringArr = remainingString.split("");
                    var whitespaceCount = 0;
                    for(var i = 0; i < remainingStringArr.length; i++)
                    {
                        if (remainingStringArr[i].match(/^\s/))
                        {
                            whitespaceCount++;
                        }
                        else
                        {
                            // Stop as soon as we no longer see whitespace
                            break;
                        }
                    }
                    end = start + fullTokenValue.length + whitespaceCount;
                }
            }
        }
        
        if (end === null)
        {
            end = selectionRange.end;
        }
        return end;
    };

    that.replaceValue = function(start, end, newValue)
    {
        var jQueryReference = jQuery(this.field);
        // Lets reset the selection range to include the characters that the user has already typed
        jQueryReference.selectionRange(start, end);
        // Lets replace the value with the autocomplete selected value
        jQueryReference.selection(newValue);
        // Lets stop the replaced bit from being highlighted
        var newEnd = jQueryReference.selectionRange().end;
        jQueryReference.selectionRange(newEnd, newEnd);
    };

    that.slimListForMapResults = function (stringVal, list, showFull)
    {
        var escString = that.htmlEscape(stringVal);
        var slimedList = jQuery.grep(list, function(arrValue){
            return that.startsWithIgnoreCaseNullsMeanAll(escString, arrValue.displayName) ;
        });

        if (!showFull)
        {
            // We only want to show the value when the user has fully typed it in IF there are more than one suggestion
            // with this prefix.
            if (slimedList.length === 1 && !that.startsWithNotEqualsIgnoreCaseNullMeansAll(escString, slimedList[0].displayName))
            {
                return {};
            }
        }
        return slimedList;
    };

    that.slimListForFunctionResults = function (stringVal, list, operator)
    {
        var fieldName = result.getLastFieldName();
        // Find the current field, if we know about it and get the supported types
        var supportedTypes;
        for (var i = 0; i < jql_field_names.length; i++)
        {
            if (that.equalsIgnoreCase(result.getUnquotedString(jql_field_names[i].value), fieldName) ||
                (jql_field_names[i].cfid && that.equalsIgnoreCase(jql_field_names[i].cfid, fieldName)))
            {
                supportedTypes = jql_field_names[i].types;
                break;
            }
        }

        var slimedList = jQuery.grep(list, function(arrValue){
            // For functions we only want to show the is list ones with list operators and vice versa
            if ((arrValue.isList && !that.isListSupportingOperator(operator)) ||
                (!arrValue.isList && that.isListSupportingOperator(operator)))
            {
                return false;
            }
            if (supportedTypes)
            {
                // Need to check for Object since this means we always fit
                var supportsFunction = jQuery.inArray("java.lang.Object", arrValue.types) > -1 || jQuery.inArray("java.lang.Object", supportedTypes) > -1;
                for(var i = 0; i < supportedTypes.length && !supportsFunction; i++)
                {
                    supportsFunction = jQuery.inArray(supportedTypes[i], arrValue.types) !== -1;
                }
                if (!supportsFunction)
                {
                    return false;
                }
            }
            else
            {
                // Can't find the field so we know that no functions will work with it
                return false;
            }
            return that.startsWithIgnoreCaseNullsMeanAll(stringVal, arrValue.value) || that.startsWithIgnoreCaseNullsMeanAll(stringVal, arrValue.displayName) ;
        });

        // We only want to show the value when the user has fully typed it in IF there are more than one suggestion
        // with this prefix.
        if (slimedList.length === 1 && !that.startsWithNotEqualsIgnoreCaseNullMeansAll(stringVal, slimedList[0].displayName))
        {
            return {};
        }
        return slimedList;
    };

    that.isListSupportingOperator = function (operator)
    {
        return operator === 'in' || operator === 'not in';
    };

    that.isEmptyOnlyOperator = function (operator)
    {
        return operator === 'is' || operator === 'is not';
    };

    that.startsWithIgnoreCaseNullsMeanAll = function(startStr, str)
    {
        // In this case we want all elements of the list included
        if (str === null || startStr === null)
        {
            return true;
        }
        if (str.length < startStr.length)
        {
            return false;
        }
        else
        {
            return startStr.toLowerCase() == str.substr(0, startStr.length).toLowerCase();
        }
    };

    that.startsWithNotEqualsIgnoreCaseNullMeansAll = function(startStr, str)
    {
        // In this case we want all elements of the list included
        if (str === null || startStr === null)
        {
            return true;
        }
        if (str.length < startStr.length)
        {
            return false;
        }
        else
        {
            var subStrEquals = startStr.toLowerCase() == str.substr(0, startStr.length).toLowerCase();
            if (subStrEquals)
            {
                // HACK!! This is a hack so that the custom field display values will not show up as a suggestion when they
                // are completely typed in.
                var equalsString = null;
                if (str.substr(startStr.length, str.length).match(/^\s-\scf\[\d\d\d\d\d\]/))
                {
                    equalsString = str.substr(0, startStr.length);
                }
                else
                {
                    equalsString = str;
                }
                return startStr.toLowerCase() != equalsString.toLowerCase();
            }
            return false;
        }
    };

    that.equalsIgnoreCase = function (str1, str2)
    {
        if (str1 === null && str2 === null)
        {
            return true;
        }
        else if (str1 === null || str1 === null)
        {
            return false;
        }
        else
        {
            return str1.toLowerCase() === str2.toLowerCase();
        }
    };

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

    that.startsWithIgnoreCase = function(startStr, str)
    {
        if (str === null || startStr === null || str.length < startStr.length)
        {
            return false;
        }
        else
        {
            return startStr.toLowerCase() == str.substr(0, startStr.length).toLowerCase();
        }
    };

    that.updateParseIndicator = function(token)
    {
        if (token.getParseError())
        {
            jQuery("#" + errorID).attr("title", token.getResult().getParseErrorMsg()).removeClass("jqlgood").addClass("jqlerror");
        }
        else
        {
            jQuery("#" + errorID).attr("title", "").removeClass("jqlerror").addClass("jqlgood");
        }
    };

    that.updateColumnLineCount = function()
    {
        var jQueryReference = jQuery(this.field);
        var selectionRange = jQueryReference.selectionRange();

        var totalCharCountToCursor = selectionRange.start;
        var rowCount = 1;
        var colCount = 1;

        var fieldValue = this.field.val();

        for (var i = 0; i < totalCharCountToCursor; i++)
        {
            if (fieldValue.charAt(i).match(/[\r\n]/))
            {
                rowCount++;
                colCount = 1;
            }
            else
            {
                colCount++;
            }
        }

        // Update our counts for where our cursor is at the moment
        jQuery("#jqlcolumnnum").html(colCount);
        jQuery("#jqlrownum").html(rowCount);        
    };

    that.init(options);

    return that;
};

jQuery.namespace("jira.jql.parser");

jira.jql.parser.MyParser = function(jqlReservedWords) {

    var jql_reserved_words = jqlReservedWords;
    return {

        /**
         * Initialises autocomplete by setting options, and assigning event handler to input field.
         * @method {public} init
         * @param {Object} options
         */
        parse: function(input) {
            var token = jira.jql.parser.Token();

            token.init(input);
            this.jql(token);
//            token.toString();
            return token;
        },

        orderByClause: function(token)
        {
            var remainingString = token.remainingString();
            // Lets consume the 'order' token
            var matchArray = remainingString.match(/^order\s+by/i);

            if (matchArray)
            {
                var orderByString = remainingString.substring(0, matchArray[0].length);
                token.consumeCharacters(orderByString.length);
                token.getResult().setLastOrderBy(orderByString, token);
                
                if (!token.isComplete())
                {
                    // We must have some space in order to parse an order by fields
                    remainingString = token.remainingString();
                    if (remainingString.match(/^\s/))
                    {
                        this.chewWhitespace(token);
                        // Look for order by fields
                        this.orderByFields(token);
                    }
                    else
                    {
                        token.getResult().resetLogicalOperators();
                        token.setParseError();
                    }
                }
                else
                {
                    token.getResult().resetLogicalOperators();
                    token.setParseError();
                }
            }
            else
            {
                // Consume the remaining string
                token.consumeCharacters(remainingString.length);
                token.getResult().setLastOrderBy(remainingString, token);
                token.setParseError();
            }
        },

        orderByFields: function(token)
        {
            // Look for fields followed by 'asc' or 'desc' or commas
            this.orderByField(token);
            this.chewWhitespace(token);
            if (token.isComplete())
            {
                // We always need to check to see if we need to put in a place-holder for the order by direction
                if (!token.getResult().getNeedsOrderByField())
                {
                    token.getResult().setLastOrderByDirection("", token);
                    // This is not a parse error, it is just a token place holder so we will complete correctly
                }
            }
            else
            {
                // Look for a comma
                var remainingString = token.remainingString();
                if (this.startsWithIgnoreCase(",", remainingString))
                {
                    token.consumeCharacter();
                    // Lets recurse back looking for more order by fields
                    this.orderByFields(token);
                    this.chewWhitespace(token);
                }
                else
                {
                    remainingString = token.remainingString();
                    if (remainingString !== null)
                    {
                        token.consumeCharacters(remainingString.length);
                    }
                    token.getResult().setNeedsOrderByDirection();
                    token.getResult().setLastOrderByDirection(remainingString, token);
                    token.setParseError();
                }
            }
        },

        orderByField: function(token)
        {
            this.chewWhitespace(token);
            var fieldName = this.fieldName(token);
            if (fieldName.length !== 0)
            {
                token.getResult().setLastOrderByFieldName(fieldName, token);

                // If we see a comma then we don't have an order by direction
                var remainingString = token.remainingString();

                if (!token.isComplete() && !remainingString.match(/^\s*,/))
                {
                    // Better look for a direction, but it is optional so no big deal if we do not find it
                    // We need a space between the order by field name and the direction
                    if (remainingString.match(/^\s+asc/i))
                    {
                        this.chewWhitespace(token);
                        // consume and move on
                        token.consumeCharacters(3);
                        token.getResult().setLastOrderByDirection("asc", token);
                        token.getResult().setNeedsOrderByComma();
                    }
                    else if (remainingString.match(/^\s+desc/i))
                    {
                        this.chewWhitespace(token);
                        // consume and move on
                        token.consumeCharacters(4);
                        token.getResult().setLastOrderByDirection("desc", token);
                        token.getResult().setNeedsOrderByComma();
                    }
                    else
                    {
                        token.getResult().setNeedsOrderByDirection();
                    }
                }
                else
                {
                    token.getResult().setNeedsOrderByField();
                    this.chewWhitespace(token);
                }
            }
            else
            {
                token.getResult().setLastOrderByFieldName("", token);                
                token.getResult().setNeedsOrderByField();
                token.setParseError();
            }
        },

        jql: function(token)
        {
            this.orClause(token);
            var remainingString = token.remainingString();
            if (this.startsWithIgnoreCase("ord", remainingString))
            {
                this.orderByClause(token);
            }
        },

        orClause: function(token)
        {
            var remainingString = token.remainingString();
            while(!token.isComplete() && !this.startsWithIgnoreCase(")", remainingString))
            {
                if (this.startsWithIgnoreCase("ord", remainingString))
                {
                    // lets give control back to the jql function so we can end up in the orderByClause
                    break;
                }
                token.getResult().resetLogicalOperators();
                this.chewWhitespace(token);
                this.andClause(token);
                if (!token.isComplete() && token.getResult().getLastLogicalOperator() === null)
                {
                    this.chewWhitespace(token);
                    // Look for an OR clause
                    remainingString = token.remainingString();
                    if (this.startsWithIgnoreCase("ord", remainingString))
                    {
                        // lets give control back to the jql function so we can end up in the orderByClause
                        break;
                    }
                    else if (remainingString !== null && (remainingString.match(/^OR\s/i) || this.startsWithIgnoreCase("|", remainingString) || this.startsWithIgnoreCase("||", remainingString)))
                    {
                        if (this.startsWithIgnoreCase("||", remainingString))
                        {
                            token.getResult().setLastLogicalOperator("||", token.getTokenStringIdx());
                            token.consumeCharacters(2);
                        }
                        else if (remainingString.match(/^OR\s/i))
                        {
                            token.getResult().setLastLogicalOperator("OR", token.getTokenStringIdx());
                            token.consumeCharacters(3);
                        }
                        else
                        {
                            token.getResult().setLastLogicalOperator("|", token.getTokenStringIdx());
                            token.consumeCharacters(1);
                        }

                        token.getResult().resetTerminalClause();
                        if (token.isComplete())
                        {
                            token.setParseError();
                        }
                        token.getResult().setNeedsField();
                    }
                    // This block of code is very confusing. The reason it is here is that when we are in a nested
                    // block of '('s it is the terminalClause that handles the parens and it calls off to this orClause.
                    // The orClause needs to ignore the close paren so that the terminalClause can handle it, BUT only
                    // when we are currently in a set of parens. So, ff the remaining character is a close paren and
                    // we are not in parens then we are NOT in error, otherwise we are
                    else if (!this.startsWithIgnoreCase(")", remainingString) || !token.getInParens())
                    {
                        var errorIdx = (remainingString === null) ? token.getMaxTokenStringIdx(): token.getMaxTokenStringIdx() - remainingString.length;
                        token.getResult().setLastLogicalOperator(remainingString, errorIdx);
                        token.getResult().setNeedsLogicalOperator(token);
                        token.setParseError();
                    }
                }
            }
        },

        andClause: function(token)
        {
            this.chewWhitespace(token);
            this.notClause(token);
            if (!token.isComplete() && token.getResult().getLastLogicalOperator() === null)
            {
                // Look for an AND clause
                this.chewWhitespace(token);

                var remainingString = token.remainingString();
                if (remainingString !== null && (remainingString.match(/^AND\s/i) || this.startsWithIgnoreCase("&", remainingString) || this.startsWithIgnoreCase("&&", remainingString)))
                {
                    if (this.startsWithIgnoreCase("&&", remainingString))
                    {
                        token.getResult().setLastLogicalOperator("&&", token.getTokenStringIdx());
                        token.consumeCharacters(2);
                    }
                    else if (this.startsWithIgnoreCase("&", remainingString))
                    {
                        token.getResult().setLastLogicalOperator("&", token.getTokenStringIdx());
                        token.consumeCharacters(1);
                    }
                    else
                    {
                        token.getResult().setLastLogicalOperator("AND", token.getTokenStringIdx());
                        token.consumeCharacters(4);
                    }
                    token.getResult().resetTerminalClause();
                    if (token.isComplete())
                    {
                        token.setParseError();
                    }

                    token.getResult().setNeedsField();
                }
                else
                {
                    token.getResult().setNeedsLogicalOperator(token);
                    // This is a special case for when we are about to place a logical operator into an existing string
                    // so that we will have a null place-holder token for the logical operator we expect.
                    if (token.isComplete())
                    {
                        token.getResult().setLastLogicalOperator(null, token.getMaxTokenStringIdx());
                    }
                }
            }
        },

        notClause: function(token)
        {
            this.chewWhitespace(token);
            if (!token.isComplete())
            {
                // Look for a NOT clause
                this.chewWhitespace(token);
                var remainingString = token.remainingString();
                if (remainingString !== null && (remainingString.match(/^NOT\s/i) || this.startsWithIgnoreCase("!", remainingString)))
                {
                    // This is a bit of a hack that makes it so that you do not get a suggestion for a field until
                    // after you have typed a space after the NOT
                    token.getResult().needsField = false;
                    if (this.startsWithIgnoreCase("!", remainingString))
                    {
                        token.getResult().setLastLogicalOperator("!", token.getTokenStringIdx());
                        token.consumeCharacters(1);
                    }
                    else
                    {
                        token.getResult().setLastLogicalOperator("NOT", token.getTokenStringIdx());
                        token.consumeCharacters(4);
                    }
                    token.getResult().resetTerminalClause();
                    if (token.isComplete())
                    {
                        token.setParseError();
                    }

                    token.getResult().setNeedsField();
                }
                else
                {
                    this.terminalClause(token);
                }
            }
            else
            {
                // Let the terminal clause set all the error conditions and needs
                this.terminalClause(token);
                token.setParseError();
            }
        },

        terminalClause: function(token)
        {
            // Lets always reset the last field variables
            token.getResult().resetTerminalClause();
            this.chewWhitespace(token);

            var remainingString = token.remainingString();
            // If we see a ( then we need to hand off to the or clause again
            if (this.startsWithIgnoreCase("(", remainingString))
            {
                token.getResult().addToken('(');
                token.setInParens();
                token.consumeCharacter();
                this.orClause(token);
                this.chewWhitespace(token);
                remainingString = token.remainingString();
                if (this.startsWithIgnoreCase(")", remainingString))
                {
                    token.getResult().addToken(')');
                    token.consumeCharacter();
                    token.setOutOfParens();
                    if (token.isComplete())
                    {
                        // We don't want to suggest a logical operator to the user if the query parses
                        token.getResult().resetLogicalOperators();
                    }
                }
                else
                {
                    token.setParseError();
                }
            }
            else
            {
                this.field(token);
                if (!token.isComplete())
                {
                    this.oper(token);
                    if (!token.isComplete())
                    {
                        this.operand(token);

                        // This will only happen when we have seen a list operand that is properly closed
                        if (token.getResult().getOperandComplete())
                        {
                            token.getResult().setNeedsNothing();
                        }
                        else if (token.isComplete() && !token.getResult().getNeedsListComma())
                        {
                            // This is not a parse error since we have found everything we were looking for
                            token.getResult().setNeedsOperand();
                        }
                    }
                    else
                    {
                        token.getResult().setNeedsOperator();
                        token.setParseError();
                    }
                }
                else
                {
                    token.getResult().setNeedsField();
                    token.setParseError();
                }
            }
        },

        field: function(token)
        {
            var fieldName = this.fieldName(token);
            if (fieldName.length !== 0 )
            {
                token.getResult().setLastFieldName(fieldName, token);
            }
            else if (token.getResult().getLastFieldName() === null)
            {
                remainingString = token.remainingString();
                token.getResult().setNeedsField();
                token.getResult().setLastFieldName(remainingString, token);
                token.setParseError();
            }
        },

        fieldName: function(token)
        {
            this.chewWhitespace(token);

            // Field is either a string or cf[12345]
            var remainingString = token.remainingString();
            if (this.startsWithIgnoreCase("cf", remainingString))
            {
                var origIdx = token.getTokenStringIdx();
                var origString = token.remainingString();
                token.consumeCharacters(2);
                this.chewWhitespace(token);
                remainingString = token.remainingString();
                // Now we must find a [ or the show is off
                if (this.startsWithIgnoreCase("[", remainingString))
                {
                    token.consumeCharacter();
                    // We must find a number in here until we encounter a ]
                    remainingString = token.remainingString();
                    var custFieldId = this.numberValue(token);
                    if (custFieldId.length !== 0)
                    {
                        // Lets find our closing ]
                        this.chewWhitespace(token);
                        remainingString = token.remainingString();
                        if (this.startsWithIgnoreCase("]", remainingString))
                        {
                            token.consumeCharacter();
                            return origString.substring(0, token.getTokenStringIdx() - origIdx);
                        }
                    }
                }
                token.setParseError();
                return origString;
            }
            else
            {
                return this.fieldOrFunctionName(token);
            }
        },

        oper: function(token)
        {
            this.chewWhitespace(token);
            var remainingString = token.remainingString();
            var operator = this.getLongestOperatorMatch(remainingString, jql_operators);
            if (operator !== null)
            {
                // We found an operator, record it and consume the right amount of characters
                token.getResult().setLastOperator(operator, token.getTokenStringIdx());
                token.consumeCharacters(operator.length);
                // If we are one of the word operators we need to enforce a space here
                if (operator == "in" || operator == "is" || operator == "is not" || operator == "not in")
                {
                    // We need a space or else
                    var currentChar = token.currentCharacter();
                    if(currentChar !== null && !currentChar.match(/[\s(]/))
                    {
                        token.setParseError();
                    }
                }

                token.getResult().setNeedsOperand();
            }
            else if (token.getResult().getLastOperator() === null)
            {
                var errorIdx = (remainingString === null) ? token.getMaxTokenStringIdx(): token.getMaxTokenStringIdx() - remainingString.length;
                token.getResult().setLastOperator(remainingString, errorIdx);
                token.getResult().setNeedsOperator();
                token.setParseError();
            }
        },

        operand: function(token)
        {
            this.chewWhitespace(token);

            // If we have and in or not in operator then we need either a function of an open paren
            if (token.getResult().getLastOperator() === 'in' || token.getResult().getLastOperator() === 'not in')
            {
                token.getResult().setNeedsOpenParen(true);
            }

            var operand = this.listOperand(token, true);
            if (operand.length === 0 )
            {
                operand = this.functionOperand(token);
                if (operand.length === 0)
                {
                    operand = this.singleValueOperand(token);
                }
                else
                {
                    // We were handled by a function so we no longer need the open paren
                    token.getResult().setNeedsOpenParen(false);
                }
            }
            else
            {
                // We were handled by a list so we no longer need the open paren
                token.getResult().setNeedsOpenParen(false);
            }

            if (operand === null || operand.length === 0)
            {
                var remainingString = token.remainingString();
                token.getResult().setLastOperand(remainingString, token);
                token.getResult().setNeedsOperand();
                token.setParseError();
            }
            if (operand.length !== 0)
            {
                return operand;
            }
            return "";
        },

        singleValueOperand: function(token)
        {
            var operand = this.stringValue(token);
            if (operand.length !== 0)
            {
                token.getResult().setLastOperand(operand, token);
                // Lets exclude empty and null, even though it is reserved
                if (operand.toLowerCase() != "empty" && operand.toLowerCase() != "null" && this.isReservedWord(operand.toLowerCase()))
                {
                    // These are reserved words
                    token.setParseError();
                }                
                return operand;
            }
            return "";
        },

        functionOperand: function(token)
        {
            var startIdx = token.getTokenStringIdx();
            var functionName = this.fieldOrFunctionName(token);
            // There can be whitespace between function name and arguments
            this.chewWhitespace(token);
            var listArguments = this.listOperand(token, false);
            if (functionName.length !== 0 && listArguments.length !== 0)
            {
                var operand = functionName + listArguments;
                // read in the whole value until we reach a close )
                token.getResult().setLastOperand(operand, token);
                return operand;
            }
            else
            {
                // back track
                token.backTrackToIdx(startIdx);
                return "";
            }
        },

        listOperand: function(token, treatAsOperands)
        {
            if (token.currentCharacter() == '(')
            {
                token.consumeCharacter();
                var listValue = this.collectListValues(token, treatAsOperands);
                var operandVal = "(" + listValue;

                this.chewWhitespace(token);
                if (token.currentCharacter() == ')')
                {
                    token.consumeCharacter();
                    operandVal += ")";
                    if (operandVal == "()" && treatAsOperands)
                    {
                        // Special case of an empty list which is still valid
                        token.getResult().setLastOperand(operandVal, token);
                    }
                    if(treatAsOperands)
                    {
                        token.getResult().setOperandComplete();
                    }
                }
                else
                {
                   token.setParseError();
                }
                return operandVal;
            }
            else
            {
                return "";
            }
        },

        collectListValues: function(token, treatAsOperands)
        {
            if (treatAsOperands)
            {
                token.getResult().setNeedsOperand();
            }
            this.chewWhitespace(token);

            // grab the contents of the list, they should be singleValueOperands separated by commas, we only
            // need to keep track of the last encountered operand.
            var currentOperand = (treatAsOperands) ? this.operand(token) : this.stringValue(token);

            if (currentOperand.length !== 0)
            {
                // If there is whitespace then lets remember we need a comma
                if (this.chewWhitespace(token) && treatAsOperands)
                {
                    token.getResult().setNeedsListComma();
                }
                if (token.currentCharacter() == ',')
                {
                    // Consume the comma and recurse so we can collect the other values
                    token.consumeCharacter();
                    var nextValue = this.collectListValues(token, treatAsOperands);
                    if (nextValue.length === 0)
                    {
                        token.setParseError();
                    }
                    return currentOperand + ", " + nextValue;
                }
                else
                {
                    return currentOperand;
                }
            }
            else
            {
                return "";
            }
        },

        startsWithIgnoreCase: function(startStr, str)
        {
            if (str === null || startStr === null || str.length < startStr.length)
            {
                return false;
            }
            else
            {
                return startStr.toLowerCase() == str.substr(0, startStr.length).toLowerCase();
            }
        },

        chewWhitespace: function(token)
        {
            var foundWhiteSpace = false;
            var currentChar = token.currentCharacter();
            while(currentChar !== null && currentChar.match(/\s/))
            {
                token.consumeCharacter();
                currentChar = token.currentCharacter();
                foundWhiteSpace = true;
            }
            return foundWhiteSpace;
        },

        getLongestOperatorMatch: function(value, listOfValues)
        {
            var longestMatch = null;
            // These first two cases are special since they might have more to them
            if (this.startsWithIgnoreCase("is", value))
            {
                // Look ahead for NOT, if we don't find it next then we must just be is
                var matchArray = value.substring(2).match(/^\s+not/i);

                if (matchArray)
                {
                    longestMatch = value.substring(0, matchArray[0].length + 2);
                }
                else
                {
                    longestMatch = "is";
                }
            }
            else if (this.startsWithIgnoreCase("not", value))
            {
                // Look ahead for IN, if we don't find it next then we are not an operator
                var matchArrayNot = value.substring(3).match(/^\s+in/i);

                if (matchArrayNot)
                {
                    longestMatch = value.substring(0, matchArrayNot[0].length + 3);
                }
            }
            else
            {
                for(var i = 0; i < listOfValues.length; i++)
                {
                    if(this.startsWithIgnoreCase(listOfValues[i].value, value))
                    {
                        // We found a match
                        if (longestMatch === null || jql_operators[i].value.length > longestMatch)
                        {
                            longestMatch = jql_operators[i].value;
                        }
                    }
                }
            }
            return longestMatch;
        },

        getValueMinusExtraWhitespace: function(value)
        {
            if (value === null)
            {
                return null;
            }
            var newValue = "";
            var firstWhitespace = true;
            var valueArr = value.split("");
            for (var i = 0; i < valueArr.length; i++)
            {
                var currentChar = valueArr[i];
                if (currentChar.match(/[\s]/))
                {
                    // We want to ignore extra whitespace, keeping only the first
                    if (firstWhitespace)
                    {
                        firstWhitespace = false;
                        newValue = newValue + currentChar;
                    }
                }
                else
                {
                    // If we encounter a non-whitespace then we want to reset our firstWhitespace test
                    firstWhitespace = true;
                    newValue = newValue + currentChar;
                }
            }
            return newValue;
        },

        fieldOrFunctionName: function(token)
        {
            var stringValue = this.stringValue(token);
            // Field or function names can not be the empty string
            if (stringValue === "\"\"" || stringValue === "''")
            {
                token.setParseError();
            }
            if (this.isReservedWord(stringValue.toLowerCase()))
            {
                // These are reserved words
                token.setParseError();
            }
            return stringValue;
        },

        isReservedWord: function(word)
        {
            return jQuery.inArray(word, jql_reserved_words) !== -1;
        },

        stringValue: function(token)
        {
            var stringValue = "";

            var inQuote = false;
            var inSingleQuote = false;
            var currentChar = token.currentCharacter();
            while(currentChar !== null && (inQuote || inSingleQuote|| currentChar.match(/[^=!~<>(),\s&|]/)))
            {
                // Read the escape character into the string
                stringValue = stringValue + currentChar;
                token.consumeCharacter();
                // Handle the escape character
                if (currentChar == '\\')
                {
                    // Just consume the next char as well
                    currentChar = token.currentCharacter();
                    if (currentChar === null)
                    {
                        token.setParseError();
                        break;                        
                    }
                    // These are the only valid characters to escape
                    else if (currentChar.match(/[^trn"'\\\s]/))
                    {
                        // Check for unicode escapes
                        var remainingString = token.remainingString();
                        if (!remainingString.match(/^u[a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]/))
                        {
                            token.setParseError();
                            break;
                        }
                    }

                    stringValue = stringValue + currentChar;
                    token.consumeCharacter();
                }
                // Check for illegal characters and kill the whole parse
                else if (currentChar.match(/[{}*\/%+$#@?.;\][]/) && !(inQuote || inSingleQuote))
                {
                    token.setParseError();
                    break;
                }                
                // We need to keep track if we are in a quote or not
                else if (currentChar == '"' && !inSingleQuote)
                {
                    inQuote = !inQuote;
                }
                else if (currentChar == "'" && !inQuote)
                {
                    inSingleQuote = !inSingleQuote;
                }
                currentChar = token.currentCharacter();
            }
            // We should never get left in a quote or single quote
            if (token.isComplete() && (inQuote || inSingleQuote))
            {
                token.setParseError();
            }
            return stringValue;
        },

        numberValue: function(token)
        {
            var numberVal = "";

            this.chewWhitespace(token);
            var currentChar = token.currentCharacter();
            while(currentChar !== null)
            {
                if (currentChar.match(/[\d]/))
                {
                    numberVal = numberVal + currentChar;
                    token.consumeCharacter();
                }
                else
                {
                    // found not a number time to return
                    break;
                }
                currentChar = token.currentCharacter();
            }
            return numberVal;
        }

    };
};

jira.jql.parser.ParseResult = function() {

    var tokens = [];
    var tokenIdx = 0;
    return {
        
        getTokens: function()
        {
            return tokens;  
        },

        addToken: function(token)
        {
            tokens[tokenIdx++] = token;
        },

        setLastFieldName: function(lastFieldName, token)
        {
            this.fieldNameStartIndex = (lastFieldName === null) ? token.getMaxTokenStringIdx() : (token.getTokenStringIdx() - lastFieldName.length);
            // Get rid of quotes if we need to
            this.lastFieldName = this.getUnquotedString(lastFieldName);
            tokens[tokenIdx++] = lastFieldName;
        },

        getLastFieldName: function()
        {
            return this.lastFieldName;
        },

        getLastFieldNameStartIndex: function()
        {
            return this.fieldNameStartIndex;
        },

        setLastOrderByFieldName: function(lastFieldName, token)
        {
            this.orderByFieldNameStartIndex = (lastFieldName === null) ? token.getMaxTokenStringIdx() : (token.getTokenStringIdx() - lastFieldName.length);
            // Get rid of quotes if we need to
            this.lastOrderByFieldName = this.getUnquotedString(lastFieldName);
            this.lastOrderByDirection = null;
            tokens[tokenIdx++] = lastFieldName;
        },

        getLastOrderByFieldName: function()
        {
            return this.lastOrderByFieldName;
        },

        getLastOrderByFieldNameStartIndex: function()
        {
            return this.orderByFieldNameStartIndex;
        },

        setLastOrderByDirection: function(lastDirection, token)
        {
            this.orderByDirectionStartIndex = (lastDirection === null) ? token.getMaxTokenStringIdx() : (token.getTokenStringIdx() - lastDirection.length);
            this.lastOrderByDirection = lastDirection;
            tokens[tokenIdx++] = lastDirection;
        },

        getLastOrderByDirection: function()
        {
            return this.lastOrderByDirection;
        },

        getLastOrderByDirectionStartIndex: function()
        {
            return this.orderByDirectionStartIndex;
        },

        setNeedsField: function()
        {
            this.needsOperator = false;
            this.needsOperand = false;
            this.needsLogicalOperator = false;
            this.needsOrderBy = false;
            this.needsField = true;
            this.needsOrderByField = false;
            this.needsOrderByDirection = false;
            this.needsListComma = false;
        },

        getNeedsField: function()
        {
            return this.needsField;
        },

        setNeedsOrderByField: function()
        {
            this.needsOperator = false;
            this.needsOperand = false;
            this.needsLogicalOperator = false;
            this.needsOrderBy = false;
            this.needsField = false;
            this.needsOrderByField = true;
            this.needsOrderByDirection = false;
            this.lastOrderByDirection = null;
            this.needsListComma = false;
        },

        getNeedsOrderByField: function()
        {
            return this.needsOrderByField;
        },

        setNeedsOrderByDirection: function()
        {
            this.needsOperator = false;
            this.needsOperand = false;
            this.needsLogicalOperator = false;
            this.needsOrderBy = false;
            this.needsField = false;
            this.needsOrderByField = false;
            this.needsOrderByDirection = true;
            this.needsListComma = false;
        },

        getNeedsOrderByDirection: function()
        {
            return this.needsOrderByDirection;
        },

        setNeedsOrderByComma: function()
        {
            this.needsOperator = false;
            this.needsOperand = false;
            this.needsLogicalOperator = false;
            this.needsOrderBy = false;
            this.needsField = false;
            this.needsOrderByField = false;
            this.needsOrderByDirection = false;
            this.needsListComma = false;
        },

        setNeedsListComma: function()
        {
            this.needsOperator = false;
            this.needsOperand = false;
            this.needsLogicalOperator = false;
            this.needsOrderBy = false;
            this.needsField = false;
            this.needsOrderByField = false;
            this.needsOrderByDirection = false;
            this.needsListComma = true;
        },

        getNeedsListComma: function()
        {
            return this.needsListComma;
        },

        setLastOperator: function(lastOperator, startIndex)
        {
            this.lastOperator = lastOperator;
            this.operatorStartIndex = startIndex;
            tokens[tokenIdx++] = lastOperator;
        },

        getLastOperator: function()
        {
            return this.lastOperator;
        },

        getLastOperatorStartIndex: function()
        {
            return this.operatorStartIndex;
        },

        setLastOperand: function(lastOperand, token)
        {
            this.operandStartIndex = (lastOperand === null) ? token.getMaxTokenStringIdx() : (token.getTokenStringIdx() - lastOperand.length);
            // Get rid of quotes if we need to
            this.lastOperand = this.getUnquotedString(lastOperand);
            tokens[tokenIdx++] = lastOperand;
        },

        getLastOperand: function()
        {
            return this.lastOperand;
        },

        setNeedsOperand: function()
        {
            this.needsField = false;
            this.needsOperator = false;
            this.needsLogicalOperator = false;
            this.needsOperand = true;
            this.needsOrderBy = false;
            this.needsOrderByField = false;
            this.needsOrderByDirection = false;
            this.needsListComma = false;
        },

        getNeedsOperand: function()
        {
            return this.needsOperand;
        },

        getLastOperandStartIndex: function()
        {
            return this.operandStartIndex;
        },

        setLastLogicalOperator: function(lastLogicalOperator, startIndex)
        {
            this.lastLogicalOperator = lastLogicalOperator;
            this.logicalOperatorStartIndex = startIndex;
            tokens[tokenIdx++] = lastLogicalOperator;
        },

        setNeedsOperator: function()
        {
            this.needsField = false;
            this.needsOperand = false;
            this.needsLogicalOperator = false;
            this.needsOrderBy = false;
            this.needsOperator = true;
            this.needsOrderByField = false;
            this.needsOrderByDirection = false;
            this.needsListComma = false;
        },

        getNeedsOperator: function()
        {
            return this.needsOperator;
        },

        getLastLogicalOperator: function()
        {
            return this.lastLogicalOperator;
        },

        getLastLogicalOperatorStartIndex: function()
        {
            return this.logicalOperatorStartIndex;
        },

        setNeedsLogicalOperator: function(token)
        {
            this.needsLogicalOperator = true;
            this.needsOperator = false;
            this.needsOperand = false;
            this.needsField = false;
            this.needsOrderByField = false;
            this.needsOrderByDirection = false;
            this.needsListComma = false;
            // Every time we need a logical operator we also could need an order by as long as we are not in parens
            this.needsOrderBy = !token.getInParens();
        },

        setNeedsOpenParen: function(value)
        {
            this.needsOpenParen = value;
        },

        getNeedsOpenParen: function()
        {
            return this.needsOpenParen;
        },

        getNeedsLogicalOperator: function()
        {
            return this.needsLogicalOperator;
        },

        getNeedsOrderBy: function()
        {
            return this.needsOrderBy;
        },

        setLastOrderBy: function(lastOrderBy, token)
        {
            this.orderByStartIndex = (lastOrderBy === null) ? token.getMaxTokenStringIdx() : (token.getTokenStringIdx() - lastOrderBy.length);
            this.lastOrderBy = lastOrderBy;
            tokens[tokenIdx++] = lastOrderBy;
        },

        getLastOrderBy: function()
        {
            return this.lastOrderBy;
        },

        getLastOrderByStartIndex: function()
        {
            return this.orderByStartIndex;
        },

        resetLogicalOperators: function()
        {
            this.lastLogicalOperator = null;
            this.logicalOperatorStartIndex = null;
            this.needsLogicalOperator = null;
        },

        getUnquotedString: function(value)
        {
            // We only remove the last quote if it is NOT preceeded by an escape character
            var secondToLastNotEsacape = value != null && value.length >= 3 && value.charAt(value.length - 2) != '\\';

            if (value != null && value.charAt(0) == '"')
            {
                value = value.substring(1, value.length);

                if (value.charAt(value.length - 1) == '"' && secondToLastNotEsacape)
                {
                    value = value.substring(0, value.length - 1);
                }
            }
            else if (value != null && value.charAt(0) == "'")
            {
                value = value.substring(1, value.length);

                if (value.charAt(value.length - 1) == "'" && secondToLastNotEsacape)
                {
                    value = value.substring(0, value.length - 1);
                }                
            }

            return value;
        },

        setParseError: function(message)
        {
            this.parseError = true;
            this.parseErrorMsg = message;
        },

        getParseError: function()
        {
            return this.parseError;
        },

        getParseErrorMsg: function()
        {
            return this.parseErrorMsg;
        },

        setNeedsNothing: function()
        {
            this.needsOperator = false;
            this.needsOperand = false;
            this.needsLogicalOperator = false;
            this.needsOrderBy = false;
            this.needsField = false;
            this.needsOrderByField = false;
            this.needsOrderByDirection = false;
            this.needsOpenParen = false;
            this.needsListComma = false;
        },

        setOperandComplete: function()
        {
            this.operandComplete = true;
        },

        getOperandComplete: function()
        {
            return this.operandComplete;
        },

        resetTerminalClause: function()
        {
            this.lastFieldName = null;
            this.fieldNameStartIndex = null;
            this.needsField = null;
            this.lastOperator = null;
            this.operatorStartIndex = null;
            this.needsOperator = null;
            this.lastOperand = null;
            this.operandStartIndex = null;
            this.needsOperand = null;
            this.operandComplete = null;
            this.needsOpenParen = null;
            this.needsListComma = false;
        },

        init: function()
        {
            this.lastFieldName = null;
            this.fieldNameStartIndex = null;
            this.needsField = null;
            this.lastOperator = null;
            this.operatorStartIndex = null;
            this.needsOperator = null;
            this.lastOperand = null;
            this.operandStartIndex = null;
            this.needsOperand = null;
            this.lastLogicalOperator = null;
            this.logicalOperatorStartIndex = null;
            this.lastOrderByFieldName = null;
            this.lastOrderByFieldNameStartIndex = null;
            this.lastOrderByDirection = null;
            this.lastOrderByDirectionStartIndex = null;
            this.orderByStartIndex = null;
            this.lastOrderBy = null;
            this.needsOrderBy = null;
            this.needsOrderByField = null;
            this.needsOrderByDirection = null;
            this.operandComplete = null;
            this.needsOpenParen = null;
            this.needsListComma = null;

        }
    };
};

jira.jql.parser.Token = function() {

    return {

        init: function(tokenString)
        {
            this.tokenStringIdx = 0;
            this.tokenString = tokenString;
            this.parseError = false;
            this.parseErrorMsg = null;
            this.result = jira.jql.parser.ParseResult();
            this.result.init();
            this.inParens = 0;
        },

        consumeCharacter: function()
        {
            this.tokenStringIdx ++;
        },

        consumeCharacters: function(numChars)
        {
            this.tokenStringIdx = this.tokenStringIdx + numChars;
        },

        backTrackToIdx: function(backTrackIdx)
        {
            this.tokenStringIdx = backTrackIdx;
            // Lets clear any parse errors that might have occurred as well
            this.parseError = false;
            this.parseErrorMsg = null;
            this.result.parseError = false;
            this.result.parseErrorMsg = null;
        },

        getTokenStringIdx: function()
        {
            return this.tokenStringIdx;
        },

        currentCharacter: function()
        {
            if (this.tokenStringIdx >= this.tokenString.length)
            {
                return null;
            }
            return this.tokenString.charAt(this.tokenStringIdx);
        },

        remainingString: function()
        {
            if (this.tokenStringIdx >= this.tokenString.length)
            {
                return null;
            }
            return this.tokenString.substr(this.tokenStringIdx, this.tokenString.length);
        },

        getMaxTokenStringIdx: function()
        {
            return this.tokenString.length;
        },

        isComplete: function()
        {
            if (this.parseError)
            {
                return true;
            }
            return this.tokenStringIdx >= this.tokenString.length;
        },

        setInParens: function()
        {
            this.inParens++;
        },

        setOutOfParens: function()
        {
            // Lets never go into negative here
            if (this.inParens !== 0)
            {
                this.inParens--;
            }
        },

        getInParens: function()
        {
            return this.inParens !== 0;
        },

        setParseError: function()
        {
            this.parseError = true;
            var preFixIdx = ((this.tokenStringIdx - 9) < 0) ? 0 : this.tokenStringIdx - 9;
            var errorPrefix = this.tokenString.substring(preFixIdx, this.tokenStringIdx - 1);
            this.result.setParseError("..." + errorPrefix + "^" + this.tokenString.substring(this.tokenStringIdx, this.tokenString.length));
        },

        getParseError: function()
        {
            return this.parseError;
        },

        getResult: function()
        {
            return this.result;
        }
//        ,
//
//        toString: function()
//        {
//            console.log("======= START ==========");
//            console.log("last field: " + this.result.getLastFieldName());
//            console.log("last field idx: " + this.result.getLastFieldNameStartIndex());
//            console.log("last operator: " + this.result.getLastOperator());
//            console.log("last operator idx: " + this.result.getLastOperatorStartIndex());
//            console.log("last operand: " + this.result.getLastOperand());
//            console.log("last operand idx: " + this.result.getLastOperandStartIndex());
//            console.log("last logical operator: " + this.result.getLastLogicalOperator());
//            console.log("last logical operator idx: " + this.result.getLastLogicalOperatorStartIndex());
//            console.log("needsField: " + this.result.getNeedsField());
//            console.log("needsOperator: " + this.result.getNeedsOperator());
//            console.log("needsOperand: " + this.result.getNeedsOperand());
//            console.log("needsLogicalOperator: " + this.result.getNeedsLogicalOperator());
//            console.log("needsOrderBy: " + this.result.getNeedsOrderBy());
//            console.log("needsOrderField: " + this.result.getNeedsOrderByField());
//            console.log("needsOrderDirection: " + this.result.getNeedsOrderByDirection());
//            console.log("operandComplete: " + this.result.getOperandComplete());
//            console.log("last order by field: " + this.result.getLastOrderByFieldName());
//            console.log("last order by direction: " + this.result.getLastOrderByDirection());
//            console.log("inParens: " + this.inParens);
//            console.log("parseError: " + this.parseError);
//            console.log("tokens: " + this.result.getTokens());
//            console.log("======= END ============");
//        }

    };

};

jQuery(function(){
    restore('jqlHistory');

    jQuery(".jql-autocomplete-params").each(function(){
        var params = {};
        jQuery(this).find("input").each(function(){
            var $this = jQuery(this);
            params[$this.attr("id")] = $this.val();
        });

        var jqlFieldNames = JSON.parse(jQuery("#jqlFieldz").text());
        var jqlFunctionNames = JSON.parse(jQuery("#jqlFunctionNamez").text());
        var jqlReservedWords = JSON.parse(jQuery("#jqlReservedWordz").text());
        var jqlAutoComplete = jira.widget.autocomplete.JQL({
            fieldID: 'jqltext',
            parser: jira.jql.parser.MyParser(jqlReservedWords),
            queryDelay: .65,
            jqlFieldNames: jqlFieldNames,
            jqlFunctionNames: jqlFunctionNames,
            minQueryLength: 0,
            allowArrowCarousel: true,
            autoSelectFirst: false,
            errorID: 'jqlerrormsg'
        });

        var jQueryRef = jQuery('#jqltext');
        jQueryRef.unbind("keypress", submitOnEnter).keypress(
                function (e) {
                    if (jqlAutoComplete.dropdownController === null || !jqlAutoComplete.dropdownController.displayed || jqlAutoComplete.selectedIndex < 0) {
                        if (e.keyCode == 13 && !e.ctrlKey && ! e.shiftKey)
                        {
                            jQuery('#jqlform').submit();
                            return false;
                        }
                        else
                        {
                            return true;
                        }
                    }
                });
        jqlAutoComplete.buildResponseContainer();
        jqlAutoComplete.parse(jQueryRef.text());
        jqlAutoComplete.updateColumnLineCount();

        jQueryRef.click(function(){
            jqlAutoComplete.dropdownController.hideDropdown();
        });
    });
});

})();



