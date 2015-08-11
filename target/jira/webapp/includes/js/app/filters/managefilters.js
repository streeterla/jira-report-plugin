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
                            AJS.$("#mf_browse tr:first a, .filterPaging a").click(function(e){
                                ajaxRequest(AJS.$(this).attr("href"));
                                e.preventDefault();
                                e.stopPropagation();
                            });
                        }
                    });
                };
                jira.widget.autocomplete.Users.init(AJS.$("form#filterSearchForm"));
                AJS.$("form#filterSearchForm").submit(function(){
                    ajaxRequest(contextPath + "/secure/ManageFilters.jspa?" + AJS.$(this).serialize());
                    return false;
                });
            };

            jira.app.manageShared.navigationTabs.addLoadEvent("my-filters-tab", favouriteHandler);
            jira.app.manageShared.navigationTabs.addLoadEvent("fav-filters-tab", favouriteHandler);
            jira.app.manageShared.navigationTabs.addLoadEvent("popular-filters-tab", favouriteHandler);
            jira.app.manageShared.navigationTabs.addLoadEvent("search-filters-tab", favouriteHandler);
            jira.app.manageShared.navigationTabs.addLoadEvent("search-filters-tab", searchHandler);
            searchHandler();

            var confirm = AJS.InlineForm();
            AJS.$(".active-area a.delete-filter").live("click", function(e){
                e.preventDefault();
                var $this = AJS.$(this);

                confirm.init({
                    url: contextPath + "/secure/DeleteFilter!default.jspa?filterId=" + $this.attr("rel") + "&decorator=none",
                    callback: function($this){
                        return function(){
                            AJS.$("#mf_" + $this.attr("rel")).remove();
                            if (AJS.$("table.filter_list:first tr.mf_row").length === 0){
                                AJS.$("table.filter_list:first").hide();
                                AJS.$("table.filter_list:last").show();
                            } else {
                                AJS.$("table.filter_list:first  tr.mf_row:last").addClass("last-row");
                                AJS.$("table.filter_list:first  tr.mf_row:first").addClass("first-row");
                                AJS.$("table.filter_list:first  tr.mf_row:even").removeClass("rowAlternate").addClass("rowNormal");
                                AJS.$("table.filter_list:first  tr.mf_row:odd").removeClass("rowNormal").addClass("rowAlternate");
                            }
                            if (jira.widget && jira.widget.dropdown && jira.widget.dropdown['find_link']){
                                jira.widget.dropdown['find_link'].resetCache();
                            }
                        };
                    }($this)
                });
            });
        }
    };
    jira.app.manageShared.navigationTabs.init(opts);
}); // I need to be first


