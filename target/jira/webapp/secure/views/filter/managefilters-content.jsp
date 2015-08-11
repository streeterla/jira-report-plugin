<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>

<%--  // --%>
<%--  // SEARCH RESULTS SECTION HERE--%>
<%-- // --%>
<webwork:if test="filterView == 'search' && tabShowing('search') == true">
    <webwork:if test="searchContentOnly == false">
        <h2><webwork:text name="'managefilters.search.desc'"/></h2>
        <div id="primary" class="column full">
            <div class="content">
                <webwork:component template="help.jsp" name="'issue_filters'" >
                    <webwork:param name="'helpURLFragment'">#managing_filters</webwork:param>
                </webwork:component>
                <p><webwork:text name="'managefilters.search.long.desc'"/></p>
                <form id="filterSearchForm" action="ManageFilters.jspa" method="get" style="margin:0px;" name="filterSearchForm">
                    <input type="hidden" name="filterView" value="<webwork:property value="/filterView"/>"/>
                    <table class="filterSearchInput" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="filterSearchInputRightAligned fieldLabelArea"><webwork:text name="'common.concepts.search'"/>:</td>
                            <ui:textfield label="text('common.concepts.search')" name="'searchName'" theme="'single'">
                                <ui:param name="'formname'" value="'filterSearchForm'"/>
                                <ui:param name="'mandatory'" value="false"/>
                                <ui:param name="'size'" value="50"/>
                                <ui:param name="'maxlength'" value="50"/>
                                <ui:param name="'description'" value="text('filters.search.text.desc')"/>
                            </ui:textfield>
                            <td class="fieldLabelArea" width="10%"><webwork:text name="'common.concepts.author'"/>:</td>
                            <%--Already has a TD--%>
                            <ui:component label="text('admin.common.words.owner')" name="'searchOwnerUserName'" template="userselect.jsp" theme="'single'">
                                <ui:param name="'formname'" value="'filterSearchForm'"/>
                                <ui:param name="'mandatory'" value="false"/>
                            </ui:component>
                            <td width="100%">&nbsp;</td>
                            <td>
                                <webwork:component template="help.jsp" name="'issue_filters'" >
                                    <webwork:param name="'helpURLFragment'">#finding_filters</webwork:param>
                                </webwork:component>
                            </td>
                        </tr>
                        <%-- component includes its own row --%>
                        <webwork:if test="/userLoggedIn == true">
                            <webwork:component name="'shares'" label="text('common.concepts.shared.with')" template="select-share-types.jsp" >
                                <webwork:param name="'class'" value="'filterSearchInputRightAligned fieldLabelArea'"/>
                                <webwork:param name="'valueColSpan'" value="5"/>
                                <webwork:param name="'noJavaScriptMessage'">
                                    <webwork:text name="'common.sharing.no.share.javascript'"/>
                                </webwork:param>
                                <webwork:param name="'shareTypeList'" value="/filtersViewHelper/shareTypeRendererBeans"/>
                                <webwork:param name="'dataString'" value="/filtersViewHelper/searchShareTypeJSON"/>
                                <webwork:param name="'anyDescription'"><webwork:text name="'common.sharing.search.template.any.desc.SearchRequest'"/></webwork:param>
                            </webwork:component>
                        </webwork:if>
                        <webwork:else>
                        <ui:component template="multihidden.jsp" >
                            <ui:param name="'fields'">searchShareType,groupShare,projectShare,roleShare</ui:param> <%-- TODO: why not use the back end ShareType* shit to get these? --%>
                        </ui:component>
                        </webwork:else>
                        <tr>
                            <td colspan="6" align="center" style="padding-top:0px;">
                                <input name="Search" type="submit" value="<webwork:text name="'common.concepts.search'"/>"/>
                            </td>
                        </tr>
                    </table>
                </form>
                <div id="filter_search_results">
            </webwork:if>
                <webwork:if test="/searchRequested == true && /filters/size > 0">
                    <webwork:component name="text('common.concepts.search')" template="filter-list.jsp">
                        <webwork:param name="'id'" value="'mf_browse'"/>
                        <webwork:param name="'filterList'" value="/filters"/>
                        <webwork:param name="'operations'">false</webwork:param>
                        <webwork:param name="'shares'" value="/canShowShares"/>
                        <webwork:param name="'favourite'" value="/canShowFavourite"/>

                        <webwork:param name="'sort'" value="true"/>
                        <webwork:param name="'sortColumn'" value="/sortColumn"/>
                        <webwork:param name="'viewHelper'" value="/filtersViewHelper"/>
                        <webwork:param name="'linkRenderer'" value="/filterLinkRenderer"/>

                        <webwork:param name="'paging'" value="true"/>
                        <webwork:param name="'pagingMessage'">
                            <webwork:text name="'common.sharing.searching.results.message'">
                                <webwork:param name="'value0'"><webwork:property value="/startPosition"/></webwork:param>
                                <webwork:param name="'value1'"><webwork:property value="/endPosition"/></webwork:param>
                                <webwork:param name="'value2'"><webwork:property value="/totalResultCount"/></webwork:param>
                            </webwork:text>
                        </webwork:param>
                        <webwork:param name="'pagingPrevUrl'" value="/previousUrl"/>
                        <webwork:param name="'pagingNextUrl'" value="/nextUrl"/>
                        <webwork:param name="'emptyMessage'"><webwork:text name="/searchEmptyMessageKey"/></webwork:param>
                    </webwork:component>
                </webwork:if>
                <webwork:else>
                    <p>
                    <webwork:if test="/searchRequested == true">
                        <webwork:text name="/searchEmptyMessageKey"/>
                    </webwork:if>
                    <webwork:else>
                        <webwork:text name="'common.sharing.searching.no.search.performed'"/>
                    </webwork:else>
                    </p>
                </webwork:else>
            <webwork:if test="searchContentOnly == false">
                </div>
            </webwork:if>
        </div>
    </div>
</webwork:if>
<%--//--%>
<%--// POPULAR RESULTS SECTION HERE--%>
<%--//--%>
<webwork:elseIf test="filterView == 'popular' && tabShowing('popular') == true">
    <h2><webwork:text name="'managefilters.popular.desc'"/></h2>
    <div id="primary" class="column full">
        <div class="content">
            <webwork:component template="help.jsp" name="'issue_filters'" >
                <webwork:param name="'helpURLFragment'">#managing_filters</webwork:param>
            </webwork:component>
            <p><webwork:text name="'managefilters.popular.long.desc'"/></p>
            <webwork:component name="text('common.concepts.popular')" template="filter-list.jsp">
                <webwork:param name="'id'" value="'mf_popular'"/>
                <webwork:param name="'filterList'" value="/filters"/>
                <webwork:param name="'operations'">false</webwork:param>
                <webwork:param name="'shares'" value="/canShowShares"/>
                <webwork:param name="'favourite'" value="/canShowFavourite"/>

                <webwork:param name="'sort'" value="false"/>
                <webwork:param name="'sortColumn'" value="/sortColumn"/>
                <webwork:param name="'viewHelper'" value="/filtersViewHelper"/>
                <webwork:param name="'linkRenderer'" value="/filterLinkRenderer"/>

                <webwork:param name="'paging'" value="false"/>
                <webwork:param name="'emptyMessage'"><webwork:text name="'filters.no.popular'"/></webwork:param>
                <webwork:param name="'viewHelper'" value="/filtersViewHelper"/>
            </webwork:component>
        </div>
    </div>
</webwork:elseIf>
<%--//--%>
<%--// MY RESULTS SECTION HERE--%>
<%--//--%>
<webwork:elseIf test="filterView == 'my' && tabShowing('my') == true">
    <h2><webwork:text name="'managefilters.my.desc'"/></h2>
    <div id="primary" class="column full">
        <div class="content">
            <webwork:component template="help.jsp" name="'issue_filters'" >
                <webwork:param name="'helpURLFragment'">#managing_filters</webwork:param>
            </webwork:component>
            <p><webwork:text name="'managefilters.my.long.desc'"/></p>
            <webwork:component name="text('managefilters.my')" template="filter-list.jsp">
                <webwork:param name="'id'" value="'mf_owned'"/>
                <webwork:param name="'filterList'" value="/filters"/>
                <webwork:param name="'owner'">false</webwork:param>
                <webwork:param name="'favcount'">false</webwork:param>
                <webwork:param name="'favourite'" value="/canShowFavourite"/>
                <webwork:param name="'shares'" value="/canShowShares"/>
                <webwork:param name="'emptyMessage'"><webwork:text name="'filters.no.owned.filters'"/></webwork:param>
                <webwork:param name="'returnUrl'" value="/returnUrl"/>
                <webwork:param name="'viewHelper'" value="/filtersViewHelper"/>
                <webwork:param name="'linkRenderer'" value="/filterLinkRenderer"/>
            </webwork:component>
        </div>
    </div>
</webwork:elseIf>
<%--// --%>
<%--// FAVOURITE RESULTS SECTION HERE--%>
<%--//--%>
<webwork:elseIf test="filterView == 'favourites' && tabShowing('favourites') == true">
    <h2><webwork:text name="'managefilters.favourite.desc'"/></h2>
    <div id="primary" class="column full">
        <div class="content">
            <webwork:component template="help.jsp" name="'issue_filters'" >
                <webwork:param name="'helpURLFragment'">#managing_filters</webwork:param>
            </webwork:component>
            <p><webwork:text name="'managefilters.favourite.long.desc'"/></p>
            <div id="undo_div" class="infoBox favfilter-undo"></div>
            <webwork:component name="text('common.favourites.favourite')" template="filter-list.jsp">
                <webwork:param name="'id'" value="'mf_favourites'"/>
                <webwork:param name="'filterList'" value="/filters"/>
                <webwork:param name="'favcount'">false</webwork:param>
                <webwork:param name="'remove'">true</webwork:param>
                <webwork:param name="'shares'" value="/canShowShares"/>
                <webwork:param name="'favourite'" value="/canShowFavourite"/>
                <webwork:param name="'emptyMessage'"><webwork:text name="'filters.no.favourite'"/></webwork:param>
                <webwork:param name="'returnUrl'" value="/returnUrl"/>
                <webwork:param name="'viewHelper'" value="/filtersViewHelper"/>
                <webwork:param name="'linkRenderer'" value="/filterLinkRenderer"/>
            </webwork:component>
        </div>
    </div>
</webwork:elseIf>
<webwork:else>
    <div class="noteBox"><webwork:text name="'filters.no.tab.permssion'"/></div>
</webwork:else>