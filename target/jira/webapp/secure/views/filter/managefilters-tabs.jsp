<%@ taglib uri="webwork" prefix="webwork" %>
<ul id="filter_type_table" class="vertical tabs">
    <webwork:if test="tabShowing('favourites') == true">
        <li id="mf_fav_li" class="<webwork:if test="filterView == 'favourites'">active</webwork:if><webwork:if test="firstTab('favourites') == true"> first</webwork:if>"><a id="fav-filters-tab" title="<webwork:text name="'managefilters.favourite.desc'"/>" href="<%= request.getContextPath() %>/secure/ManageFilters.jspa?filterView=favourites"><strong><webwork:text name="'common.favourites.favourite'"/></strong></a></li>
    </webwork:if>
    <webwork:if test="tabShowing('my') == true">
        <li id="mf_my_li" class="<webwork:if test="filterView == 'my'">active</webwork:if><webwork:if test="firstTab('my') == true"> first</webwork:if>"><a id="my-filters-tab" title="<webwork:text name="'managefilters.my.desc'"/>" href="<%= request.getContextPath() %>/secure/ManageFilters.jspa?filterView=my"><strong><webwork:text name="'managefilters.my'"/></strong></a></li>
    </webwork:if>
    <webwork:if test="tabShowing('popular') == true">
        <li id="mf_pop_li" class="<webwork:if test="filterView == 'popular'">active</webwork:if><webwork:if test="firstTab('popular') == true"> first</webwork:if>"><a id="popular-filters-tab" title="<webwork:text name="'managefilters.popular.desc'"/>" href="<%= request.getContextPath() %>/secure/ManageFilters.jspa?filterView=popular"><strong><webwork:text name="'common.concepts.popular'"/></strong></a></li>
    </webwork:if>
    <webwork:if test="tabShowing('search') == true">
        <li id="mf_search_li" class="<webwork:if test="filterView == 'search'">active</webwork:if><webwork:if test="firstTab('search') == true"> first</webwork:if>"><a id="search-filters-tab" title="<webwork:text name="'managefilters.search.desc'"/>" href="<%= request.getContextPath() %>/secure/ManageFilters.jspa?filterView=search"><strong><webwork:text name="'common.concepts.search'"/></strong></a></li>
    </webwork:if>
</ul>
