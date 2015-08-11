
// This is here so that we find bugs like JRA-19245 ASAP
jQuery.noConflict();

/**
 * A bunch of useful utilitiy javascript methods available to all jira pages
 */
(function($)
{
    /**
     * Reads data from a structured HTML, such as definition list and build a data object.
     * Even children represent names, odd children represent values.
     *
     * @param s jQuery selector
     */
    $.readData = function(s)
    {
        var r = {}, n = "";

        $(s).children().each(function(i)
        {
            if (i % 2)
            {
                r[n] = jQuery.trim($(this).text());
            }
            else
            {
                n = jQuery.trim($(this).text());
            }
        }).remove();
        $(s).remove();
        return r;
    };
})(jQuery);


// custom event when and iframe is appended. Useful for the dashboard where iframes are appended after the jQuery.ready
// event if fired.
jQuery.aop.after({target: jQuery, method: "append"}, function (elem) {
    var iframes;
    if (elem.attr("tagName") === "iframe") {
        if (!elem.data("iframeAppendedFired")) {
            elem.data("iframeAppendedFired", true);
            jQuery(document).trigger("iframeAppended", elem);
        }
    }
    iframes = jQuery("iframe", elem);
    if (iframes.length > 0) {
        jQuery.each(iframes, function (i) {
            var iframe = iframes.eq(i);
            if (!iframe.data("iframeAppendedFired")) {
                iframe.data("iframeAppendedFired", true);
                jQuery(document).trigger("iframeAppended", iframes.eq(i));
            }
        });
    }
    return elem;
});


AJS.isSelenium = function () {
    return window.name === "selenium_main_app_window";
};

/**
 * Appends additional params to url string
 * @function begetObject
 * @return {Object} cloned object
 */
begetObject = function (obj)
{
    var f = function()
    {};
    f.prototype = obj;
    return new f();
};

jQuery(function()
{
    jQuery("textarea").keypress(submitOnCtrlEnter);
});

/*
 * For the JQL text box - we want to submit on Enter instead of Ctrl+Enter.
 */
jQuery(function()
{
    var jQueryRef = jQuery("#jqltext");
    if (jQueryRef)
    {
        // IE8 makes the page jump awkwardly when given focus here - but gives focus itself natively
        if (!(AJS.$.browser.msie && (AJS.$.browser.version == "8.0")))
        {
            jQueryRef.focus();
        }
        jQueryRef.unbind("keypress", submitOnCtrlEnter).keypress(submitOnEnter);

        // IE8 makes the page jump awkwardly as above - so loses the awesomeness of the cursor going to the end of the text
        if (!(AJS.$.browser.msie && (AJS.$.browser.version == "8.0")))
        {
            // Move the cursor to the end of the input string
            if (jQueryRef.val())
            {
                var end = jQueryRef.val().length;
                jQueryRef.selectionRange(end, end);
            }
        }
    }

});

/*
 * Submits an element's form if the enter key is pressed
 */
function submitOnEnter(e)
{
    if (e.keyCode == 13 && e.target.form && !e.ctrlKey && ! e.shiftKey)
    {
        jQuery(e.target.form).submit();
        return false;
    }
    return true;
}

/*
 Submits an element's form if the enter key and the control key is pressed
 */
function submitOnCtrlEnter(e)
{
    if (e.ctrlKey && e.target.form && (e.keyCode == 13 || e.keyCode == 10))
    {
        jQuery(e.target.form).submit();
        return false;
    }
    return true;
}

/*
 Returns a space delimited value of a select list. There's strangely no in-built way of doing this for multi-selects
 */
function getMultiSelectValues(selectObject)
{
    var selectedValues = '';
    for (var i = 0; i < selectObject.length; i++)
    {
        if (selectObject.options[i].selected)
        {
            if (selectObject.options[i].value && selectObject.options[i].value.length > 0)
                selectedValues = selectedValues + ' ' + selectObject.options[i].value;
        }
    }

    return selectedValues;
}

function getMultiSelectValuesAsArray(selectObject)
{
    var selectedValues = new Array();
    for (var i = 0; i < selectObject.length; i++)
    {
        if (selectObject.options[i].selected)
        {
            if (selectObject.options[i].value && selectObject.options[i].value.length > 0)
                selectedValues[selectedValues.length] = selectObject.options[i].value;
        }
    }
    return selectedValues;
}

/*
 Returns true if the value is the array
 */
function arrayContains(array, value)
{
    for (var i = 0; i < array.length; i++)
    {
        if (array[i] == value)
        {
            return true;
        }
    }

    return false;
}

/*
 Adds a class name to the given element
 */
function addClassName(elementId, classNameToAdd)
{
    var elem = document.getElementById(elementId);
    if (elem)
    {
        elem.className = elem.className + ' ' + classNameToAdd;
    }
}

/*
 Removes all class names to from the given element
 */
function removeClassName(elementId, classNameToRemove)
{
    var elem = document.getElementById(elementId);
    if (elem)
    {
        elem.className = (' ' + elem.className + ' ').replace(' ' + classNameToRemove + ' ', ' ');
    }
}

/*
 Returns the field as an encoded string (assuming that the id == the field name
 */
function getEscapedFieldValue(id)
{

    var e = document.getElementById(id);

    if (e.value)
    {
        return id + '=' + encodeURIComponent(e.value);
    }
    else
    {
        return '';
    }
}

/*
 Returns a concatenated version of getEscapedFieldValue
 */
function getEscapedFieldValues(ids)
{
    var s = '';
    for (i = 0; i < ids.length; i++)
    {
        s = s + '&' + getEscapedFieldValue(ids[i]);
    }
    return s;
}

/* Manages Gui Preferences and stores them in the user's cookie. */
var GuiPrefs = {
    toggleVisibility: function(elementId)
    {
        var elem = document.getElementById(elementId);
        if (elem)
        {
            if (readFromConglomerateCookie("jira.conglomerate.cookie", elementId, '1') == '1')
            {
                elem.style.display = "none";
                removeClassName(elementId + 'header', 'headerOpened');
                addClassName(elementId + 'header', 'headerClosed');
                saveToConglomerateCookie("jira.conglomerate.cookie", elementId, '0');
            }
            else
            {
                elem.style.display = "";
                removeClassName(elementId + 'header', 'headerClosed');
                addClassName(elementId + 'header', 'headerOpened');
                eraseFromConglomerateCookie("jira.conglomerate.cookie", elementId);
            }
        }
    }
};

/*
 Toggles hide / unhide an element. Also attemots to change the "elementId + header" element to have the headerOpened / headerClosed class.
 Also saves the state in a cookie
 DEPRECATED: use GuiPrefs.toggleVisibility
 */
function toggle(elementId)
{
    GuiPrefs.toggleVisibility(elementId);
}

function toggleDivsWithCookie(elementShowId, elementHideId)
{
    var elementShow = document.getElementById(elementShowId);
    var elementHide = document.getElementById(elementHideId);
    if (elementShow.style.display == 'none')
    {
        elementHide.style.display = 'none';
        elementShow.style.display = 'block';
        saveToConglomerateCookie("jira.viewissue.cong.cookie", elementShowId, '1');
        saveToConglomerateCookie("jira.viewissue.cong.cookie", elementHideId, '0');
    }
    else
    {
        elementShow.style.display = 'none';
        elementHide.style.display = 'block';
        saveToConglomerateCookie("jira.viewissue.cong.cookie", elementHideId, '1');
        saveToConglomerateCookie("jira.viewissue.cong.cookie", elementShowId, '0');
    }
}

/*
 Similar to toggle. Run this on page load.
 */
function restoreDivFromCookie(elementId, cookieName, defaultValue)
{
    if (defaultValue == null)
        defaultValue = '1';

    var elem = document.getElementById(elementId);
    if (elem)
    {
        if (readFromConglomerateCookie(cookieName, elementId, defaultValue) != '1')
        {
            elem.style.display = "none";
            removeClassName(elementId + 'header', 'headerOpened');
            addClassName(elementId + 'header', 'headerClosed');
        }
        else
        {
            elem.style.display = "";
            removeClassName(elementId + 'header', 'headerClosed');
            addClassName(elementId + 'header', 'headerOpened');
        }
    }
}

/*
 Similar to toggle. Run this on page load.
 */
function restore(elementId)
{
    restoreDivFromCookie(elementId, "jira.conglomerate.cookie", '1');
}

// Cookie handling functions

function saveToConglomerateCookie(cookieName, name, value)
{
    var cookieValue = getCookieValue(cookieName);
    cookieValue = addOrAppendToValue(name, value, cookieValue);

    saveCookie(cookieName, cookieValue, 365);
}

function readFromConglomerateCookie(cookieName, name, defaultValue)
{
    var cookieValue = getCookieValue(cookieName);
    var value = getValueFromCongolmerate(name, cookieValue);
    if (value != null)
    {
        return value;
    }

    return defaultValue;
}

function eraseFromConglomerateCookie(cookieName, name)
{
    saveToConglomerateCookie(cookieName, name, "");
}

function getValueFromCongolmerate(name, cookieValue)
{
    // a null cookieValue is just the first time through so create it
    if (cookieValue == null)
    {
        cookieValue = "";
    }
    var eq = name + "=";
    var cookieParts = cookieValue.split('|');
    for (var i = 0; i < cookieParts.length; i++)
    {
        var cp = cookieParts[i];
        while (cp.charAt(0) == ' ')
        {
            cp = cp.substring(1, cp.length);
        }
        // rebuild the value string exluding the named portion passed in
        if (cp.indexOf(name) == 0)
        {
            return cp.substring(eq.length, cp.length);
        }
    }
    return null;
}

//either append or replace the value in the cookie string
function addOrAppendToValue(name, value, cookieValue)
{
    var newCookieValue = "";
    // a null cookieValue is just the first time through so create it
    if (cookieValue == null)
    {
        cookieValue = "";
    }

    var cookieParts = cookieValue.split('|');
    for (var i = 0; i < cookieParts.length; i++)
    {
        var cp = cookieParts[i];

        // ignore any empty tokens
        if (cp != "")
        {
            while (cp.charAt(0) == ' ')
            {
                cp = cp.substring(1, cp.length);
            }
            // rebuild the value string exluding the named portion passed in
            if (cp.indexOf(name) != 0)
            {
                newCookieValue += cp + "|";
            }
        }
    }

    // always append the value passed in if it is not null or empty
    if (value != null && value != '')
    {
        var pair = name + "=" + value;
        if ((newCookieValue.length + pair.length) < 4020)
        {
            newCookieValue += pair;
        }
    }
    return newCookieValue;
}

function getCookieValue(name)
{
    var eq = name + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++)
    {
        var c = ca[i];
        while (c.charAt(0) == ' ')
        {
            c = c.substring(1, c.length);
        }
        if (c.indexOf(eq) == 0)
        {
            return c.substring(eq.length, c.length);
        }
    }

    return null;
}

function saveCookie(name, value, days)
{
    var ex;
    if (days)
    {
        var d = new Date();
        d.setTime(d.getTime() + (days * 24 * 60 * 60 * 1000));
        ex = "; expires=" + d.toGMTString();
    }
    else
    {
        ex = "";
    }
    document.cookie = name + "=" + value + ex + ( (contextPath) ? ";path=" + contextPath : ";path=/");
}

/*
 Reads a cookie. If none exists, then it returns and
 */
function readCookie(name, defaultValue)
{
    var cookieVal = getCookieValue(name);
    if (cookieVal != null)
    {
        return cookieVal;
    }

    // No cookie found, then save a new one as on!
    if (defaultValue)
    {
        saveCookie(name, defaultValue, 365);
        return defaultValue;
    }
    else
    {
        return null;
    }
}

function eraseCookie(name)
{
    saveCookie(name, "", -1);
}

function recolourSimpleTableRows(tableId)
{
    recolourTableRows(tableId, "rowNormal", "rowAlternate", tableId + "_empty");
}

function recolourTableRows(tableId, rowNormal, rowAlternate, emptyTableId)
{
    var tbl = document.getElementById(tableId);
    var emptyTable = document.getElementById(emptyTableId);

    var alternate = false;
    var rowsFound = 0;
    var rows = tbl.rows;
    var firstVisibleRow = null;
    var lastVisibleRow = null;

    for (var i = 1; i < rows.length; i++)
    {
        var row = rows[i];
        if (row.style.display != "none")
        {
            if (!alternate)
            {
                row.className = rowNormal;
            }
            else
            {
                row.className = rowAlternate;
            }
            rowsFound++;
            alternate = !alternate;
        }

        if (row.style.display != "none")
        {
            if (firstVisibleRow == null)
            {
                firstVisibleRow = row;
            }
            lastVisibleRow = row;
        }
    }
    if (firstVisibleRow != null)
    {
        firstVisibleRow.className = firstVisibleRow.className + " first-row";
    }
    if (lastVisibleRow != null)
    {
        lastVisibleRow.className = lastVisibleRow.className + " last-row";
    }

    if (emptyTable)
    {
        if (rowsFound == 0)
        {

            tbl.style.display = "none";
            emptyTable.style.display = "";
        }
        else
        {
            tbl.style.display = "";
            emptyTable.style.display = "none";
        }
    }
}

function htmlEscape(str)
{
    var divE = document.createElement('div');
    divE.appendChild(document.createTextNode(str));
    return divE.innerHTML;
}

/**
 * Returns the meta tag that contains the XSRF atlassian token
 * or undefined if not on page
 */
function atl_token() {
    return jQuery("meta#atlassian-token").attr('content');
}

jQuery.namespace("jira.app.ready");
jira.app.ready = function(func)
{
    jQuery(document).ready(func);
};


// Initialise all Hints
jQuery(function()
{
    AJS.$(".dismissable-hint").each(function()
    {
        var $this = AJS.$(this);
        var state = readFromConglomerateCookie("jira.hintstate.cookie", $this.attr("id"), '0');
        if (state === '0')
        {
            $this.show();
            $this.find(".hide").click(function(e)
            {
                saveToConglomerateCookie("jira.hintstate.cookie", $this.attr("id"), '1');
                $this.hide();
                e.preventDefault();
            });
        }
    });
});

// Preparing all over labels
jQuery(function ()
{
    AJS.$("label.overlabel").each(function ()
    {
        var label = AJS.$(this)
                .removeClass("overlabel")
                .addClass("overlabel-apply show")
                .click(function()
        {
            AJS.$("#" + AJS.$(this).attr("for")).focus();
        });
        var field = AJS.$("#" + label.attr("for")).focus(function()
        {
            label.removeClass("show").hide();
        }).blur(function()
        {
            if (AJS.$(this).val() === "")
            {
                label.addClass("show").show();
            }
        });
        if (field.val() !== "")
        {
            label.removeClass("show").hide();
        }
    });
});


// Creating all dropdowns
jQuery(function ()
{

    AJS.dropDown.Ajax.ActionOptions = {
        selector: ".action-dropdown",
        trigger: ".aui-dd-link",
        ajaxOptions: function()
        {
            return {
                url: this.trigger.attr("href"),
                dataType: "json"
            };
        },
        selectionHandler: function (e, selected)
        {
            if (selected)
            {
                if (e.type === "keydown")
                {
                    if (selected.get(0).nodeName.toLowerCase() !== "a")
                    {
                        window.location = selected.find("a").attr("href");
                    }
                    else
                    {
                        window.location = selected.attr("href");
                    }
                }
            }
        },
        formatResults: function (response)
        {

            var html = AJS.$("<div/>");
            var listNode;
            var listItemNode, linkNode;

            // View issue
            listNode = AJS.$("<ul/>").addClass("operations").addClass("first");
            listItemNode = AJS.$("<li/>").addClass("dropdown-item");
            linkNode = AJS.$("<a/>").attr("href", contextPath + "/browse/" + response.key).text(response.viewIssue);
            listItemNode.append(linkNode);
            listNode.append(listItemNode);
            html.append(listNode);

            var addSelected = function(issueId)
            {
                if (self != top ){
                    return encodeURIComponent(window.top.location.href);
                }

                var url = window.location.href;

                var newUrl = url;
                if (/selectedIssueId=[0-9]*/.test(url))
                {
                    newUrl = newUrl.replace(/selectedIssueId=[0-9]*/g, "selectedIssueId=" + issueId);
                }
                else
                {
                    if (/\?/.test(url))
                    {
                        newUrl = newUrl + "&";
                    }
                    else
                    {
                        newUrl = newUrl + "?";
                    }
                    newUrl = newUrl + "selectedIssueId=" + issueId;
                }
                return encodeURIComponent(newUrl);
            };

            if (response.actions)
            {
                listNode = AJS.$("<ul/>").addClass("operations");
                AJS.$(response.actions).each(function()
                {
                    listItemNode = AJS.$("<li/>").addClass("dropdown-item");
                    var url = contextPath + "/secure/WorkflowUIDispatcher.jspa?id=" + response.id + "&action=" + this.action + "&atl_token=" + response.atlToken;
                    url = url + "&returnUrl=" + addSelected(response.id);
                    linkNode = AJS.$("<a/>").attr("href", url).text(this.name);
                    listItemNode.append(linkNode);
                    listNode.append(listItemNode);
                });
                html.append(listNode);
            }
            if (response.operations)
            {
                listNode = AJS.$("<ul/>").addClass("operations");
                AJS.$(response.operations).each(function()
                {
                    listItemNode = AJS.$("<li/>").addClass("dropdown-item");
                    var url = this.url;
                    url = url + "&returnUrl=" + addSelected(response.id);
                    url = url + "&atl_token=" + response.atlToken;
                    linkNode = AJS.$("<a/>").attr("href", url).text(this.name);
                    listItemNode.append(linkNode);
                    listNode.append(listItemNode);
                });
                html.append(listNode);
            }
            if (listNode)
            {
                listNode.addClass("last");
            }
            return html;
        }
    };

    AJS.dropDown.actionDropdowns = AJS.dropDown.Ajax.call(this, AJS.dropDown.Ajax.ActionOptions);

    AJS.$("#navigator-options .aui-dd-parent").dropDown("Standard", {
        trigger: ".aui-dd-link"
    });

    AJS.$(".command-bar .aui-dd-parent").dropDown("Standard", {
        trigger: "a.drop"
    });

    AJS.$(".dashboard .menu .aui-dd-parent").dropDown("Standard", {
        trigger: ".aui-dd-link"
    });

    AJS.$("#main-nav .aui-dd-link").linkedMenu({
        reflectFocus: "#main-nav .lnk",
        onFocusRemoveClass: "#main-nav .selected"
    });

    AJS.$("#navigator-options .aui-dd-link").linkedMenu();

});

// For switching tabs on field screens (edit, transition, create)
AJS.$(function(){
    AJS.$(".fieldTabs li").click(function(e){
        e.preventDefault();
        e.stopPropagation();
        var $this = AJS.$(this);
        if (!$this.hasClass("active")){
            AJS.$(".fieldTabs li.active").removeClass("active");
            $this.addClass("active");
            AJS.$(".fieldTabArea.active").removeClass("active");
            AJS.$("#" + $this.attr("rel")).addClass("active");
        }
    });
});

AJS.$(function(){
    // Apply to comment fields except one in stalker bar
    AJS.$("#commentFieldArea #comment").expandOnInput();
    AJS.$("#environmentFieldArea #environment").expandOnInput();
    AJS.$("#descriptionFieldArea #description").expandOnInput();

    jQuery(document).bind("showWikiInput", function () {
        AJS.$("#commentFieldArea #comment").expandOnInput();
        AJS.$("#environmentFieldArea #environment").expandOnInput();
        AJS.$("#descriptionFieldArea #description").expandOnInput();
    });


});

/*
 Sets the width of the issue navigator results wrapper.
 Keeps the right hand page elements within the browser view when the results table is wider than the browser view.
 Also fixes rendering issue with IE8 (JRA-18224)
 */
jQuery(function()
{

    var
            issueNavWrap = jQuery(".issue-nav-wrap"),
            issueNavWrapWidth = issueNavWrap.width(),
            resultsResize = function ()
            {
                issueNavWrap.css("width",
                        97 / issueNavWrapWidth * (
                                issueNavWrapWidth -
                                (parseInt(jQuery(document.documentElement).attr("scrollWidth")) - jQuery(window).width())) + "%");
            };

    jQuery(window).resize(resultsResize);
    resultsResize();

});

// Todo: Fix JRADEV-900
//jQuery(function(){
//    AJS.$(".admin-item-link").click(function(e)
//    {
//        e.preventDefault();
//        var $this = AJS.$(this);
//
//        jQuery.ajax({
//            url : contextPath + "/rest/api/1.0/adminHistory/store",
//            data: JSON.stringify({
//                id : $this.attr("id"),
//                // we still want to add history if you click the menu items
//                url : $this.attr("href") ? $this.attr("href") : $this.find("a:first").attr('href')
//            }),
//            contentType: "application/json",
//            type:  "POST"
//        });
//        window.location.href = $this.attr("href");
//    });
//});


// twixi blocks
(function () {

    var actionTwixi,
        moduleTwixi;

    /* Twixi Blocks use the following markup:
        <div id="must-be-unique" class="twixi-block expanded">
            <div class="twixi-wrap verbose">
                <a href="#" class="twixi"><span class="icon twixi-opened"><span>$i18n.getText("admin.common.words.hide")</span></span></a>
                <div class="action-details">...</div>
                <div class="action-body flooded">...</div>
            </div>
            <div class="twixi-wrap concise">
                <a href="#" class="twixi"><span class="icon twixi-closed"><span>$i18n.getText("admin.common.words.show")</span></span></a>
                <div class="action-details flooded">...</div>
            </div>
        </div>
     */
    actionTwixi = jQuery(".twixi-block").toggleBlock({
            cookieName: "twixi"
        })
        .addCallback("toggle", function () {
            jQuery("#stalker").trigger("stalkerHeightUpdated");
        })
        .addTrigger(".action-details", "dblclick");

//    moduleTwixi = jQuery(".module").toggleBlock({
//            eventType: "dblclick",
//            triggerSelector: ".mod-header",
//            expandedClass: "mod-expanded",
//            collapsedClass: "mod-collapsed",
//            cookieName: "modules"
//        })
//        .addCallback("_collapseTwixiBlocksFromCookie", function () {
//            jQuery(this.options.blockSelector + "." + this.options.collapsedClass).attr("title", AJS.params.dblClickToExpand);
//        })
//        .addCallback("contract", function () {
//            jQuery(this.options.blockSelector + "." + this.options.collapsedClass).attr("title", AJS.params.dblClickToExpand);
//        })
//        .addCallback("expand", function () {
//            jQuery(this.options.blockSelector + "." + this.options.expandedClass).removeAttr("title");
//        })
//        .addCallback("toggle", function () {
//            jQuery("#stalker").trigger("stalkerHeightUpdated");
//        });
})();



