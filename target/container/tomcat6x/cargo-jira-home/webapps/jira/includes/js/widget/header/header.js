// Create the menu
AJS.$(function()
{


    var customSelectionHandler = function (e, selected)
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
    };

    // User menu
    var userDrop = AJS.$("#header-details-user").dropDown("Standard", {
        trigger: ".aui-dd-link",
        selectionHandler: customSelectionHandler
    });

    AJS.$(userDrop).each(function()
    {
        var height = AJS.$(this.$[0]).parent().find(".drop").outerHeight() + 8;


        var that = this;
        this.addCallback("show", function ()
        {
            that.$.css({
                top : height + 2 + "px"
            });
            var shadows = AJS.$(that.$[0]).siblings(".aui-shadow");
            shadows.css({
                top : height + 2 + "px"
            });

        });

    });

    // Non lazy headers
    var nonLazyDropdowns = AJS.$("#header-bottom .menu-bar li.aui-dd-parent.nonlazy").dropDown("Standard", {
        trigger: ".aui-dd-link",
        selectionHandler: customSelectionHandler
    });

    // Need to left align dropdowns
    AJS.$(nonLazyDropdowns).each(function()
    {
        var height = AJS.$(this.$[0]).parent().find(".drop").outerHeight() + 8;


        var that = this;
        this.addCallback("show", function ()
        {
            that.$.css({
                top : height + 2 + "px",
                right: "auto",
                left: "-1px"
            });
            var shadows = AJS.$(that.$[0]).siblings(".aui-shadow");
            shadows.css({
                top : height + 2 + "px",
                right: "auto",
                left: "-7px"
            });

        });
    });

    // Lazy loaded dropdowns
    var options = {
        selector: "#header-bottom .menu-bar li.aui-dd-parent.lazy",
        trigger: ".aui-dd-link",
        ajaxOptions: function()
        {
            var trigger = this.trigger;
            return {
                url: contextPath + "/rest/api/1.0/menus/" + trigger.attr("rel"),
                dataType: "json",
                error: function (XMLHttpRequest, textStatus, errorThrown)
                {
                    var mainLinkId = trigger.attr("rel");
                    if (mainLinkId)
                    {
                        var mainLink = AJS.$("#" + mainLinkId);
                        if (mainLink)
                        {
                            window.location = mainLink.attr("href");
                        }
                    }

                }
            };
        },
        selectionHandler: customSelectionHandler,
        formatResults: function (response)
        {
            var html = AJS.$("<div/>");
            var isFirst = true;
            var listNode;
            AJS.$(response.sections).each(function()
            {
                listNode = AJS.$("<ul/>");
                var listItemNode, linkNode;

                if (this.id)
                {
                    listNode.attr("id", this.id);
                }
                if (this.style)
                {
                    listNode.addClass(this.style);
                }
                if (this.items)
                {
                    if (isFirst)
                    {
                        listNode.addClass("first");
                        isFirst = false;
                    }
                    if (this.label)
                    {
                        html.append(AJS.$("<h5/>").text(this.label));
                    }
                    AJS.$(this.items).each(function()
                    {
                        listItemNode = AJS.$("<li/>").addClass("dropdown-item");
                        if (this.id)
                        {
                            listItemNode.attr("id", this.id);
                        }
                        if (this.style)
                        {
                            listItemNode.addClass(this.style);
                        }
                        linkNode = AJS.$("<a/>").attr("href", this.url);
                        if (this.id)
                        {
                            linkNode.attr("id", this.id + "_lnk");
                        }
                        if (this.title)
                        {
                            linkNode.attr("title", this.title);
                        }
                        if (this.iconUrl)
                        {
                            linkNode.addClass("dd-icon").css("background-image", "url('" + this.iconUrl + "')");
                        }
                        if (this.label)
                        {
                            linkNode.text(this.label);
                        }
                        listItemNode.append(linkNode);
                        listNode.append(listItemNode);

                    });
                    html.append(listNode);
                }
            });
            listNode.addClass("last");
            return html;
        }
    };


    var LazyDropdowns = AJS.dropDown.Ajax.call(this, options);

    AJS.$(LazyDropdowns).each(function()
    {
        var that = this;

        // add global reference to these dropdowns so we can invalidate their caches if needed.
        var dropdownKey = this.trigger.attr("rel");
        if (dropdownKey)
        {
            jira.widget.dropdown[dropdownKey] = this;
        }

        // need to left align dropdowns
        this.addCallback("show", function ()
        {
            var height = AJS.$(this.$[0]).parent().find(".drop").outerHeight() + 10;
            that.$.css({
                top : height + 0 + "px",
                right: "auto",
                left: "-1px"
            });
            var shadows = AJS.$(that.$[0]).siblings(".aui-shadow");
            shadows.css({
                top : height + 0 + "px",
                right: "auto",
                left: "-7px"
            });

        });
    });
});


// Create Issue Dialog
AJS.$(function()
{
    AJS.$("#create_link_params").each(function()
    {
        var $this = AJS.$(this);
        var params = {};
        AJS.$(this).find("input").each(function()
        {
            var $this = AJS.$(this);
            params[$this.attr("id")] = $this.val();
        });

        var repositionArrow = function(contents)
        {

            // resize everything
            // Shadow
            var shadow = AJS.$("#inline-dialog-create_issue_popup #inline-dialog-shadow");
            shadow.css({
                width: contents.outerWidth() + 32 + "px",
                height: contents.outerHeight() + 25 + "px"
            });
            shadow.find(".b").css("width", contents.outerWidth() - 26 + "px");
            shadow.find(".l, .r").css("height", contents.outerHeight() - 21 + "px");

            // arrow
            var arrow = AJS.$("#inline-dialog-create_issue_popup .arrow");
            var leftPos = arrow.position().left;
            arrow.css("left", leftPos + (contents.outerWidth() - 260));

        };

        // this is set during the inti callback
        var hideFunction = function()
        {};

        var createDialog = AJS.InlineDialog(AJS.$("#" + $this.attr("rel")), "create_issue_popup", function(contents, trigger, doShowPopup)
        {


            var displayContent = function(args)
            {

                contents.css({
                    width: "auto",
                    minWidth: "150px"
                }).parent().addClass("active");

                var projects;
                var recentProjects;
                var project;
                var types;
                var type;

                var getProject = function(pid)
                {
                    var proj;
                    AJS.$(projects).each(function()
                    {
                        if (this.id === parseInt(pid))
                        {
                            proj = this;
                            return false;
                        }
                    });
                    return proj;
                };

                var initializeProject = function()
                {
                    projects = args.projects;
                    recentProjects = args.recentProjects;
                    var projectId;

                    if (recentProjects)
                    {
                        project = recentProjects[0];
                    }
                    else if (projects)
                    {
                        project = projects[0];
                    }
                }();

                var getType = function(typeId)
                {
                    var type;
                    AJS.$(types).each(function()
                    {
                        if (this.id === typeId)
                        {
                            type = this;
                            return false;
                        }
                    });

                    return type;
                };

                var initializeIssueTypes = function()
                {
                    types = args.types;
                    var issueTypeId = args.defaultType;
                    if (!issueTypeId || issueTypeId === "-1")
                    {
                        issueTypeId = types[0].id;
                    }
                    type = getType(issueTypeId);
                    if (!type)
                    {
                        type = types[0];
                    }

                    AJS.$(types).each(function()
                    {
                        if (!/^http/.test(this.url))
                        {
                            this.url = contextPath + this.url;
                        }
                    });
                }();

                var getScheme = function(schemeId)
                {
                    var scheme;
                    AJS.$(args.schemes).each(function()
                    {
                        if (this.id === schemeId)
                        {
                            scheme = this;
                            return false;
                        }
                    });
                    return scheme;
                };

                var setTypesForProject = function(project, defaultType)
                {
                    var scheme = getScheme(project.scheme);
                    AJS.$("#quick-issuetype").empty();
                    var isValidType = false;
                    var createTypeUnknownOption = AJS.$("<option />");

                    createTypeUnknownOption
                        .val("-1")
                        .text(params.createItem_issuetype_select)
                        .appendTo("#quick-issuetype");

                    type = getType("-1");


                    AJS.$(scheme.types).each(function()
                    {
                        var newType = getType(this + "");
                        if (newType)
                        {
                            var option = AJS.$("<option/>").val(newType.id).text(newType.name).css("background-image", "url(" + newType.url + ")");
                            if ((!defaultType && newType.id === scheme.defaultId) || (newType.id === defaultType))
                            {
                                type = newType;
                                option.attr("selected", "selected");
                                isValidType = true;
                            }
                            AJS.$("#quick-issuetype").append(option);
                        }
                    });
                    if (isValidType) {
                        createTypeUnknownOption.remove();
                    }
                };
                contents.empty().append(
                        AJS.$("<form/>").addClass("aui").addClass("top-label").attr("action", contextPath + "/secure/CreateIssue.jspa").append(
                                AJS.$("<fieldset>").append(
                                        AJS.$("<div/>").append(
                                                AJS.$("<label/>").attr("for", "quick-pid").text(params.createItem_project + ":")
                                                ).append(
                                                AJS.$("<select/>").addClass("imagebacked").addClass("select").attr({
                                                    id: "quick-pid",
                                                    name: "pid",
                                                    title: params.createItem_select_project
                                                }).change(function()
                                                {
                                                    AJS.$("#invalid-type").hide();
                                                    var pid = AJS.$("#quick-pid").val();
                                                    project = getProject(pid);
                                                    setTypesForProject(project);
                                                })
                                                )
                                        ).append(
                                        AJS.$("<div/>").append(
                                                AJS.$("<label/>").attr("for", "quick-issuetype").text(params.createItem_issuetype + ":").append(
                                                        AJS.$("<span/>").attr("id", "invalid-type").addClass("hidden error").text(params.createItem_issuetype_invalid)
                                                        )
                                                ).append(
                                                AJS.$("<select/>").addClass("imagebacked").addClass("select").attr({
                                                    id: "quick-issuetype",
                                                    name: "issuetype",
                                                    title: params.createItem_select_type
                                                }).change(function()
                                                {
                                                    var typeId = AJS.$("#quick-issuetype").val();
                                                    type = getType(typeId);
                                                    AJS.$("#invalid-type").hide();
                                                })
                                                )
                                        )
                                ).append(
                                AJS.$("<div/>").addClass("button-panel").append(
                                        AJS.$("<input type='submit' />").addClass("button").addClass("save").attr({
                                            title: params.createItem_create_desc,
                                            id: "quick-create-button"
                                        }).val(params.createItem_create)
                                        ).append(
                                        AJS.$("<a/>").attr("href", "#").text(params.createItem_cancel).click(function(e)
                                        {
                                            hideFunction();
                                            e.preventDefault();
                                        })
                                        )
                                ).submit(function(e)
                                {
                                    if (!type)
                                    {
                                        AJS.$("#invalid-type").show();
                                        return false;
                                    }
                                })
                        );
                AJS.$("#quick-create-button").focus();
                var parent = AJS.$("#quick-pid");
                var first = true;
                if (recentProjects)
                {
                    var group = AJS.$("<optgroup/>").attr("label", params.createItem_project_recent);
                    AJS.$(recentProjects).each(function()
                    {
                        var option = AJS.$("<option/>").val(this.id).text(this.name).css("background-image", "url(" + contextPath + "/secure/projectavatar?size=small&pid=" + this.id + "&avatarId=" + this.img + ")");
                        if (first)
                        {
                            option.attr("selected", "selected");
                            first = false;
                            setTypesForProject(project, args.defaultType);
                        }
                        group.append(option);
                    });
                    parent.append(group);
                    group = AJS.$("<optgroup/>").attr("label", params.createItem_project_all);
                    parent.append(group);
                    parent = group;
                }

                AJS.$(projects).each(function()
                {
                    var option = AJS.$("<option/>").val(this.id).text(this.name).css("background-image", "url(" + contextPath + "/secure/projectavatar?size=small&pid=" + this.id + "&avatarId=" + this.img + ")");
                    if (first)
                    {
                        option.attr("selected", "selected");
                        first = false;
                        setTypesForProject(project, args.defaultType);
                    }
                    parent.append(option);

                });

            };

            var successHandler = function(args)
            {
                if (!args.isEmpty)
                {
                    displayContent(args);
                }
                else
                {
                    if (args.currentUser)
                    {
                        //no permission
                        contents.html(
                                AJS.$("<div/>").addClass("message").append(
                                        AJS.$("<p/>").text(params.createItem_no_permission)
                                        )
                                );
                    }
                    else
                    {
                        //log in
                        contents.html(
                                AJS.$("<div/>").addClass("message").append(
                                        AJS.$("<p/>").text(params.createItem_log_in_desc)
                                        ).append(
                                        AJS.$("<p/>").append(
                                                AJS.$("<a/>").attr("href", contextPath + "/login.jsp?os_destination=%2Fsecure%2FCreateIssue%21default.jspa").text(params.createItem_log_in)
                                                )
                                        )
                                );
                    }

                    contents.append(
                            AJS.$("<div/>").addClass("button-panel").append(
                                    AJS.$("<a/>").attr("href", "#").text(params.createItem_cancel).click(function(e)
                                    {
                                        hideFunction();
                                        e.preventDefault();
                                    })
                                    )
                            );
                }
                repositionArrow(contents);

            };


            var displayLoading = function()
            {
                contents.empty();
                contents.append(
                        AJS.$("<div/>").addClass("loading-small").css("height", 50)
                        );

                doShowPopup();

                AJS.$.ajax({
                    type: "GET",
                    url: contextPath + "/rest/api/1.0/admin/issuetypeschemes",
                    data: {
                        includeRecent: true
                    },
                    dataType: "json",
                    success: successHandler,
                    error: function (XMLHttpRequest, textStatus, errorThrown)
                    {
                        window.location = contextPath + "/secure/CreateIssue!default.jspa";
                    }
                });
            }();

        },
        {
            width:250,
            cacheContent: false,
            initCallback: function()
            {
                hideFunction = this.hide;
            },
            hideCallback: function () {
                this.popup.removeClass("active");
                // JIRADEV-328: safari needs this otherwise keyboard commands will not work as a field is still in focus.
                if (AJS.$.browser.safari) {
                    jQuery(":input").blur();
                }
            }
        });

        AJS.$(document).keydown(function(e)
        {
            if (createDialog.is(":visible") && e.which == 27 && !AJS.$(e.target).is(":input"))
            {
                //esc
                hideFunction();
            }
        });

    });
});

jQuery.namespace('jira.keyboard');

/**
 * This display the keyboard short cut help.  This code is references directly in system-keyboard-shortcuts-plugin.xml
 * to provide this exact behaviour on ? key
 */
jira.keyboard.displayKeyboardShortcutHelp = function() {
    //only open the shortcuts dialog if there's currently no dialog shown
    if(!AJS.popup.current) {
        AJS.$.get(contextPath + "/secure/ViewKeyboardShortcuts.jspa?decorator=none", function(data) {
            var dialog = new AJS.Dialog(800, 500, "shortcut-dialog");
            dialog.addPanel("shortcuts", "shortcuts");
            dialog.getCurrentPanel().html(data);
            dialog.addHeader(AJS.$("#shortcutsTitle").attr("value") + "<button class='close'>&nbsp;</button>");
            dialog.show();
            AJS.$("#shortcut-dialog button.close").click(function(e) {
                dialog.hide();
                e.preventDefault();
            });
        });
    }
}

/**
 * Override the Keyboard Short Cut help function so that it shows keyboard help directly
 */
jQuery(function()
{
    jQuery('#keyshortscuthelp').bind('click', function (e) {
        e.preventDefault();
        jira.keyboard.displayKeyboardShortcutHelp();
        console.log('keyshortscuthelp');
    });
});
