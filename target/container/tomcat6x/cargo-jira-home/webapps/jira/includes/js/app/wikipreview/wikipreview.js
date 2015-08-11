AJS.$.namespace("jira.app.wikipreview");


/**
 * @class wikiPreview
 * @namespace jira.app
 * @param prefs
 */
jira.app.wikiPreview = function (prefs)
{

    var field, editField, trigger, origHtml, origText,

    /**
     * Gets and sets fields as jQuery objects
     *
     * @method setFields
     * @private
     */
    setFields = function (prefs)
    {
        field = AJS.$("#" + prefs.fieldId),
        editField = AJS.$("#" + prefs.fieldId + "-edit"),
        trigger = AJS.$("#" + prefs.trigger);
    },

    /**
     *  Prevents scroll flicker from happending when at the bottom of the page
     *
     * @method  scrollSaver
     * @private
     * @return {Object}
     * @... {Function} show - reveals scrollSaver
     * @... {Function} hide - hides scrollSaver
     */
    scrollSaver = function ()
    {
        var elem;
        return {
            show: function ()
            {
                if (!elem)
                {
                    elem = AJS.$("<div>").html("&nbsp;").css({height: "300px"}).insertBefore(editField);
                }
                elem.css({display: "block"});
            },
            hide: function ()
            {
                elem.css({display: "none"});
            }
        };
    }(),

    /**
     *
     * If preview not present, uses REST to get preview of rendered wiki markup. Otherwise restores original state.
     * @method toggleRenderPreview
     * @private
     *
     */
    toggleRenderPreview = function ()
    {
        if (origHtml == null)
        {
            editField.find(".content-inner").css({
                maxHeight: field.css("maxHeight")
            });
            this.showPreview();
        }
        else
        {
            editField.find(".content-inner").css({
                maxHeight: ""
            });
            this.showInput();
        }
    },

    /**
     * This function replaces the input with the renderered content.
     *
     * @method renderPreviewCallback
     * @param {String} data from the AJAX call
     */
    renderData =  function(data)
    {
        editField.originalHeight = editField.height();
        scrollSaver.show();
        origHtml = editField.addClass("previewClass").find(".content-inner").html();
        origText = field.val();
        trigger.removeClass("loading").addClass("selected");
        editField.find(".content-inner").html(data);
        scrollSaver.hide();
        editField.trigger("showWikiPreview", [editField]);
    },

    handeError = function(previewer){
        return function(XMLHttpRequest, textStatus, errorThrown)
        {
            trigger.removeClass("loading");
            origHtml = editField.find(".content-inner").html();
            origText = field.val();
            if (textStatus){
                alert(textStatus);
            }
            if (errorThrown){
                alert(errorThrown);
            }
            previewer.showInput();

        };
    };


    return {

        /**
         * Make a request using the textarea/input value and displays the response (rendered wiki content)
         * @method showPreview
         */
        showPreview: function () {
            var that = this;

            var pid = AJS.$("#pid").val(), issueType = AJS.$("#issuetype").val();
            AJS.$("#" + prefs.trigger).addClass("loading");
            AJS.$.ajax({
                url: contextPath + "/rest/api/1.0/render",
                contentType: "application/json",
                type:'POST',
                data: JSON.stringify({
                    rendererType: prefs.rendererType,
                    unrenderedMarkup: field.val(),
                    issueKey: prefs.issueKey,
                    projectId: pid,
                    issueType: issueType
                }),
                dataType: "html",
                success: renderData,
                error: handeError(that)
            });
        },

        /**
         * This restores the input field to allow the user to enter wiki text.
         * @method showInput
         */
        showInput: function (e) {
            if (editField) {
                if (!e) {
                    scrollSaver.show();
                    // clear the height before we reset
                    editField.css({height: ""});
                    editField.removeClass("previewClass").find(".content-inner").html(origHtml);
                    field = AJS.$("#" + prefs.fieldId);
                    field.val(origText);
                    origHtml = null;
                    trigger.removeClass("selected");
                    scrollSaver.hide();
                } else {
                    editField.find(".content-inner").append(origHtml);
                }
                field = AJS.$("#" + prefs.fieldId);
                field.val(origText);
                editField.trigger("showWikiInput", [editField]);
            }
        },

        /**
         * Applies click handler to trigger and associated behaviour. 
         * @method init
         */
        init: function ()
        {
            var that = this;
            prefs = AJS.$.readData(prefs);
            AJS.$("#" + prefs.trigger).click(function(e)
            {
                setFields(prefs);
                toggleRenderPreview.call(that);
                e.preventDefault();
            });
            AJS.$(document.getElementById(prefs.fieldId).form).submit(function (e) {
                if (editField && editField.hasClass("previewClass")) {
                    that.showInput(e);
                }
            });

        }
    };

};

AJS.$(function(){
    var wikiRenders = AJS.$(".wiki-js-prefs");
    wikiRenders.each(function() {
        var render = jira.app.wikiPreview(this);
        render.init();
    });
});


