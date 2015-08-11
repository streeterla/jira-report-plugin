
AJS.$(function(){
    var quickLinks = function () {
        AJS.dropDown.Standard({selector:"#quicklinks .aui-dd-parent", trigger: ".aui-dd-link"});
        return arguments.callee;
    }();

    var applyExpandos = function(){
        if (jira.util && jira.util.expandoSupport){
            jira.util.expandoSupport();
        }
    };

    var initProjPickerForRoadMap = function(){
        AJS.$("#project-selector").change(function(e){
            jQuery(jQuery.ajax({
                url: contextPath + "/secure/ViewProfile.jspa?selectedTab=jira.user.profile.panels:up-roadmap-panel&decorator=none&contentOnly=true&pid=" + AJS.$(this).attr("value"),
                dataType: "html",
                success: function (response) {
                    AJS.$("div.active-area").html(response);
                    applyExpandos();
                    initProjPickerForRoadMap();
                }
            })).throbber({target: jQuery("#up_up-roadmap-panel_li")});

        });
    };  
    
    var opts ={

        customInit : function(){
            jira.app.manageShared.navigationTabs.addLoadEvent("up_user-profile-summary-panel_a", function(){
                AJS.dropDown.Standard({selector:"#quicklinks .aui-dd-parent", trigger: ".aui-dd-link"});                
            });

            jira.app.manageShared.navigationTabs.addLoadEvent("up_up-roadmap-panel_a", function(){
                applyExpandos();
                initProjPickerForRoadMap();
            });

        },
        getTabRegEx: /selectedTab=.*/,
        checkQualifiedUrlRegEx: /[\?&](?=selectedTab=)/,
        idGeneratorRegEx: /.*(?=selectedTab=)/
    };

    jira.app.manageShared.navigationTabs.init(opts);
    applyExpandos();
    initProjPickerForRoadMap();

    var confirm = AJS.InlineForm({
        id: "userprofile",
        width: 500,
        height: 300
    });

    AJS.$("#edit_profile_lnk").live("click", function(e){
        // here because firefox triggers a click on a right click when using live events
        if (e.button != 0){
            return true;
        }
        e.preventDefault();
        var $this = AJS.$(this);
        $this.parent().addClass("loading");

        confirm.init({
            url: $this.attr("href"),
            callback: function($this){
                return function(){
                    var oldName = AJS.$("#up-d-fullname").text();
                    var name = AJS.$("#fullname").val();
                    var email = AJS.$("#email").val();

                    AJS.$("#up-d-fullname").text(name);
                    AJS.$("#up-user-title-name").text(name);                    
                    AJS.$("#up-d-email a").attr("href", "mailto:" + email).text(email);
                    AJS.$("a[href*='ViewProfile.jspa']:contains('" + oldName + "')").text(name);
                    if (window.frames['gadget-stream'] && window.frames['gadget-stream'].AJS){
                        window.frames['gadget-stream'].AJS.$("a[href*='ViewProfile.jspa']:contains('" + oldName + "')").text(name);

                    }

                    AJS.$("#userdetails-notify").show();
                };
            }($this),
            formLoad: function(){
                AJS.$(".active-area .notify").hide();
                $this.parent().removeClass("loading");
            }
        });
    });
    AJS.$("#view_change_password").live("click", function(e){
        // here because firefox triggers a click on a right click when using live events
        if (e.button != 0){
            return true;
        }
        e.preventDefault();
        var $this = AJS.$(this);
        $this.parent().addClass("loading");
        confirm.init({
            url: $this.attr("href"),
            formLoad: function(){
                $this.parent().removeClass("loading");
            },
            callback: function(){
                AJS.$("#userdetails-notify").show();
            }
        });
    });
    AJS.$("#edit_prefs_lnk").live("click", function(e){
        // here because firefox triggers a click on a right click when using live events
        if (e.button != 0){
            return true;
        }
        e.preventDefault();
        var $this = AJS.$(this);
        $this.parent().addClass("loading");

        confirm.init({
            url: $this.attr("href"),
            formLoad: function(){
                $this.parent().removeClass("loading");
                AJS.$(".active-area .notify").hide();
            },
            callback: function(){
                var pageSize = AJS.$("#pagesize").val();
                var email = AJS.$("#maletype option:selected").text();
                var locale = AJS.$.trim(AJS.$("#locale option:selected").text());
                var ownNotifications = AJS.$("#ownnotifications option:selected").val();
                var sharing = AJS.$("#sharing option:selected").val();

                var oldLocale = AJS.$.trim(AJS.$("#up-p-locale").text());

                if (oldLocale !== locale){
                    window.location.reload();
                    return;
                }
                if (ownNotifications !== "false"){
                    AJS.$("#up-p-notifications_on").show();
                    AJS.$("#up-p-notifications_off").hide();
                } else {
                    AJS.$("#up-p-notifications_on").hide();
                    AJS.$("#up-p-notifications_off").show();
                }

                AJS.$("#up-p-pagesize").text(pageSize);
                AJS.$("#up-p-mimetype").text(email);

                if (sharing !== "false"){
                    AJS.$("#up-p-share-private").show();
                    AJS.$("#up-p-share-public").hide();
                } else {
                    AJS.$("#up-p-share-private").hide();
                    AJS.$("#up-p-share-public").show();
                }
                AJS.$("#userprofile-notify").show();

            }
        });
    });
});