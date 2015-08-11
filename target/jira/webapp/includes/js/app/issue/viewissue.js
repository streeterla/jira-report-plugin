
jQuery("#stalker.stalker").stalker();

jQuery(function (){

    var openInNewWindow = function(e)
    {
        e.preventDefault();
        e.stopPropagation();
        var $this = jQuery(this);

        // close the link
        jQuery(document).click();

        window.open($this.attr("href"), "screenshot", "width=800,height=700,scrollbars=yes,status=yes");
    };

    jQuery(document).keydown(function (e) {
        if (e.keyCode === 27) {
            jQuery("#comment-issue.active").click();
        }
    });

    AJS.$("#comment-issue").click(function (e) {
        e.preventDefault();
        var elem = jQuery(this);
        if (elem.hasClass("active")) {
            elem.removeClass("active");
            jQuery("#stalker").removeClass("action");
            jQuery("#add_comment").appendTo("#addcomment .mod-content");

        } else {
            if (AJS.$("#addcomment").hasClass("active")) {
                AJS.$("#footer-comment-button").click();
            }
            elem.addClass("active");
            jQuery("#stalker").addClass("action");
            jQuery("#add_comment").appendTo(".ops-cont");
            AJS.$("#comment").focus().trigger("refreshInputHeight");
        }
        jQuery("#stalker").trigger("stalkerHeightUpdated");
    });


    AJS.$("#footer-comment-button").click(function (e) {
        e.preventDefault();
        var elem = jQuery("#addcomment");

        if (elem.hasClass("active")) {
            elem.removeClass("active");
        } else {
            if (AJS.$("#comment-issue").hasClass("active")) {
                AJS.$("#comment-issue").click();
            }
            elem.addClass("active");
            jQuery("#add_comment").appendTo("#addcomment .mod-content");
            AJS.$("#comment").focus().trigger("refreshInputHeight");
        }
    });


    jQuery(".module #issuetable tr").hover(function () {
        jQuery(this).addClass("hover");
    }, function () {
        if (!AJS.dropDown.current) {
            jQuery(this).removeClass("hover");
        }
    });

    jQuery(document).bind("hideLayer", function (e, type, obj) {
        if (type === "dropdown" && obj.$.parent().hasClass("action-dropdown")) {
            obj.$.closest("tr").removeClass("hover");
        }
    });

    jQuery(document).bind("showWikiInput", function (e, previewElem) {
        jQuery("#stalker").trigger("stalkerHeightUpdated");
        // events are unbound when toggling to preview, need to rebind them when toggling back
        jQuery("#comment").expandOnInput();
        return arguments.callee;
    }());

    jQuery(document).bind("showWikiPreview", function () {
        jQuery("#stalker").trigger("stalkerHeightUpdated");
    });

    jQuery("#add_comment_cancel").click(function (e) {
        e.preventDefault();
        var stalkerCommentButton = AJS.$("#comment-issue"),
            footerCommentModule =  AJS.$("#addcomment ");

        if (AJS.$('#comment-edit').hasClass('previewClass')) {
            AJS.$('#comment-preview_link').click();
        }
        if (stalkerCommentButton.hasClass("active")) {
            stalkerCommentButton.click();
        } else if (footerCommentModule.hasClass("active")) {
            AJS.$("#footer-comment-button").click();
        }
        AJS.$("#comment").val("");
    });

    AJS.$("#commentDiv input[type='submit']").click(function(e){
        if (AJS.$("#comment").val() === ""){
            e.preventDefault();
            AJS.$("#emptyCommentErrMsg").show();
        }
    });
    AJS.$("#attach-screenshot").click(openInNewWindow);
    AJS.$("#tt_include_subtasks input").click(function(e){
        if (AJS.$(this).is(":checked")){
            AJS.$("#tt_info_single").hide();
            AJS.$("#tt_info_aggregate").show();
        } else {
            AJS.$("#tt_info_aggregate").hide();
            AJS.$("#tt_info_single").show();
        }

    });

    if (jQuery.browser.mozilla && /^1\.9\.1/.test(jQuery.browser.version) && !jQuery.os.mac) {
        var stalker = jQuery("#stalker");
        var setStalkerWidth = function () {
            var contentWidth = jQuery("#main-content").outerWidth();

            if (contentWidth < 1000) {
                stalker.width(contentWidth);
            } else {
                stalker.css("width", "");
            }
        };
        jQuery(window).resize(setStalkerWidth);
        setStalkerWidth();
        stalker.trigger("stalkerHeightUpdated");
    }

    var toggleVotingAndWatching = function(trigger, className, resultContainer, issueOpTrigger, i18n) {
        var classNameOn = className + "-on";
        var classNameOff = className + "-off";
        var method = "POST";
        if(trigger.hasClass(classNameOn)) {
            method = "DELETE";
        }
        var restPath = "/voters";
        if(className.indexOf("watch") !== -1) {
            restPath = "/watchers";
        }
        trigger.removeClass(classNameOn).removeClass(classNameOff);
        AJS.$(AJS.$.ajax({
            url:contextPath + "/rest/api/1.0/issues/" + trigger.attr("rel") + restPath,
            type: method,
            dataType: "json",
            contentType: "application/json",
            data: {empty: true},
            success: function (response) {
                if(method === "POST") {
                    trigger.addClass(classNameOn).attr("title", i18n.titleOn);
                    issueOpTrigger.attr("title", i18n.titleOn).text(i18n.textOn);
                } else {
                    trigger.addClass(classNameOff).attr("title", i18n.titleOff);
                    issueOpTrigger.attr("title", i18n.titleOff).text(i18n.textOff);
                }
                resultContainer.text(response.count);
            },
            error: function(XMLHttpRequest, textStatus, errorThrown){
                alert(i18n.errorText);
                if(method === "POST") {
                    trigger.addClass(classNameOff).attr("title", i18n.titleOff);
                    issueOpTrigger.attr("title", i18n.titleOff).text(i18n.textOff);
                } else {
                    trigger.addClass(classNameOn).attr("title", i18n.titleOn);
                    issueOpTrigger.attr("title", i18n.titleOn).text(i18n.textOn);
                }
            }
        })).throbber({target: trigger});
    };

    AJS.$("#toggle-vote-issue").click(function(e) {
        e.preventDefault();
        AJS.$("#toggle_voting_label").click();
    });

    AJS.$("#toggle-watch-issue").click(function(e) {
        e.preventDefault();
        AJS.$("#toggle_watching_label").click();
    });

    AJS.$("#toggle_voting_label").click(function(e) {
        e.preventDefault();
        var i18n = {titleOn:AJS.params.issueOpTitleUnvote, titleOff:AJS.params.issueOpTitleVote,
            textOn:AJS.params.issueOpUnvote, textOff:AJS.params.issueOpVote, errorText:AJS.params.errorVoting};
        toggleVotingAndWatching(AJS.$(this), "icon-vote", AJS.$("#votes-data"), AJS.$("#toggle-vote-issue"), i18n);
    });
    AJS.$("#toggle_watching_label").click(function(e) {
        e.preventDefault();
        var i18n = {titleOn:AJS.params.issueOpTitleUnwatch, titleOff:AJS.params.issueOpTitleWatch,
            textOn:AJS.params.issueOpUnwatch, textOff:AJS.params.issueOpWatch, errorText:AJS.params.errorWatching};
        toggleVotingAndWatching(AJS.$(this), "icon-watch",AJS.$("#watchers-data"), AJS.$("#toggle-watch-issue"), i18n);
    });

    AJS.$(".shorten").shorten();


    AJS.moveInProgress = false;
    AJS.$(document).bind("moveToStarted", function() {
        AJS.moveInProgress = true;
    }).bind("moveToFinished", function() {
        AJS.moveInProgress = false;
    });

    AJS.$(".issue-data-block").mouseover(function() {
        if(!AJS.moveInProgress) {
            AJS.$(".issue-data-block.focused").removeClass("focused");
            AJS.$(this).addClass("focused");
        }
    });
    AJS.$(".issuePanelContainer").mouseout(function() {
        if(!AJS.moveInProgress) {
            AJS.$(".issue-data-block.focused").removeClass("focused");
        }
    });

    if (jQuery.browser.msie && parseInt(jQuery.browser.version, 10) === 7) {
        jQuery("a.twixi").bind("focus", function (e) {
            e.preventDefault();
        });
    } else {
        jQuery(document).bind("moveToFinished", function (event, target) {
            jQuery("a.twixi:visible", target).focus();
        });
    }
});

// contain dropdowns so they do not overflow active area. Was causing JRADEV-647.
jQuery(function () {
    if (AJS.dropDown.actionDropdowns.length > 0) {
        jQuery.each(AJS.dropDown.actionDropdowns, function() {
            this.addCallback("refreshSuccess", function () {
                AJS.containDropdown(this, ".active-area");
            });
            this.addCallback("show", function () {
                AJS.containDropdown(this, ".active-area");
            });
        });
    }
});

// adds fancy box support to viewissue
jQuery(function()
{
    if (jQuery.browser.msie && jQuery.browser.version < 7) {
        return;
    }


    var initFancyBoxForClass = function(aClassName)
    {
        var closeFancyBox = function()
        {
            jQuery(aClassName).fancybox.close();
        };

        var isFireFoxLinux = function()
        {
            return jQuery.os.linux && jQuery.browser.mozilla;
        };

        var useOverlay = true;
        // FF on Linux looks like a car accident when the overlay is applied.  Its all over the place
        // like a mad womans breakfast.  So lets opt out for that combination.  FF in Windows/M<ac is not affected
        if (isFireFoxLinux())
        {
            useOverlay = false;
        }

        var fancyBoxOptions = {
            'zoomSpeedIn': 300,
            'zoomSpeedOut': 300,
            'imageScale' : true,
            'centerOnScroll' : false,
            'overlayShow': useOverlay,
            callbackOnStart : function ()
            {
                jQuery("#header").css("zIndex", "-1");
                if (useOverlay) {
                    jQuery("body").addClass("fancybox-show");
                }
            },
            'callbackOnShow' : function()
            {
                jQuery(document).click(function()
                {
                    closeFancyBox();
                });
            },
            'callbackOnClose' : function()
            {
                jQuery("#header").css("zIndex", "");
                if (useOverlay) {
                    jQuery("body").removeClass("fancybox-show");
                }
                jQuery(document).unbind('click', closeFancyBox);
                if (jQuery.browser.safari) {
                    var top = AJS.$(window).scrollTop();
                    AJS.$(window).scrollTop(10 + 5 * (top == 10)).scrollTop(top);
                }
            }
        };
        jQuery(aClassName).fancybox(fancyBoxOptions);
    };

    // the class mentioned here is declared in view_attachments.jsp
    initFancyBoxForClass("a.gallery");
});
