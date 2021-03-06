jQuery(document).ready(function(){
    var opts ={
        customInit : function(){
            var favouriteHandler = function(){
                jira.widget.favourite.Picker.init(AJS.$(".active-area"));
            };

            var searchHandler = function(){
                var ajaxRequest = function(url){
                    AJS.$.ajax({
                        method: "get",
                        dataType: "html",
                        url: url + "&decorator=none&contentOnly=true&Search=Search",
                        success: function(result){
                            AJS.$(".active-area").html(result);
                            favouriteHandler();
                            searchHandler();
                            AJS.$("#pp_browse tr:first a, .filterPaging a").click(function(e){
                                ajaxRequest(AJS.$(this).attr("href"));
                                e.preventDefault();
                                e.stopPropagation();
                            });
                        }
                    });
                };
                jira.widget.autocomplete.Users.init(AJS.$("form#pageSearchForm"));
                AJS.$("form#pageSearchForm").submit(function(){
                    ajaxRequest(contextPath + "/secure/ConfigurePortalPages!default.jspa?" + AJS.$(this).serialize());
                    return false;
                });
            };

            jira.app.manageShared.navigationTabs.addLoadEvent("my-dash-tab", favouriteHandler);
            jira.app.manageShared.navigationTabs.addLoadEvent("favourite-dash-tab", favouriteHandler);
            jira.app.manageShared.navigationTabs.addLoadEvent("popular-dash-tab", favouriteHandler);
            jira.app.manageShared.navigationTabs.addLoadEvent("search-dash-tab", favouriteHandler);
            jira.app.manageShared.navigationTabs.addLoadEvent("search-dash-tab", searchHandler);
            searchHandler();

            var confirm = AJS.InlineForm({height:150});
            AJS.$(".active-area a.delete_dash").live("click", function(e){
                e.preventDefault();
                var $this = AJS.$(this);

                confirm.init({
                    url: contextPath + "/secure/DeletePortalPage!default.jspa?pageId=" + $this.attr("rel") + "&decorator=none",
                    callback: function($this){
                        return function(){
                            AJS.$("#pp_" + $this.attr("rel")).remove();
                            if (AJS.$("table.filter_list:first tr.pp_row").length === 0){
                                AJS.$("table.filter_list:first").hide();
                                AJS.$("table.filter_list:last").show();
                            } else {
                                AJS.$("table.filter_list:first  tr.pp_row:last").addClass("last-row");
                                AJS.$("table.filter_list:first  tr.pp_row:first").addClass("first-row");
                                AJS.$("table.filter_list:first  tr.pp_row:even").removeClass("rowAlternate").addClass("rowNormal");
                                AJS.$("table.filter_list:first  tr.pp_row:odd").removeClass("rowNormal").addClass("rowAlternate");
                            }
                            if (jira.widget && jira.widget.dropdown && jira.widget.dropdown['home_link']){
                                jira.widget.dropdown['home_link'].resetCache();
                            }
                        };
                    }($this)
                });
            });
            AJS.$(".active-area .dash-reorder a").live("click", function(e){
                e.preventDefault();
                var $this = AJS.$(this);
                
                AJS.$.ajax({
                    method: "get",
                    dataType: "html",
                    url: $this.attr("href") + "&decorator=none&contentOnly=true",
                    success: function(result){
                        AJS.$(".active-area").html(result);
                        favouriteHandler();
                    }
                });

            });
        },
        getTabRegEx: /view=.*/,
        checkQualifiedUrlRegEx: /\?(?=view=)/
    };
    jira.app.manageShared.navigationTabs.init(opts);
}); // I need to be first


