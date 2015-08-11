<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<webwork:if test="/view == 'search'">
    <h2><webwork:text name="'configureportalpages.search.desc'"/></h2>
    <div id="primary" class="column full">
        <div class="content">
            <webwork:component template="help.jsp" name="'portlets.dashboard_pages'" >
                <webwork:param name="'helpURLFragment'">#managing_dashboards</webwork:param>
            </webwork:component>
            <p><webwork:text name="'configureportalpages.search.long.desc'"/></p>
            <form action="ConfigurePortalPages!default.jspa" method="get" style="margin:0px;" id="pageSearchForm" name="pageSearchForm">
                <input type="hidden" name="view" value="<webwork:property value="/view"/>"/>
                <table class="filterSearchInput" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="filterSearchInputRightAligned fieldLabelArea"><webwork:text name="'common.concepts.search'"/>:</td>
                        <ui:textfield label="text('common.concepts.search')" name="'searchName'" theme="'single'">
                            <ui:param name="'formname'" value="'pageSearchForm'"/>
                            <ui:param name="'mandatory'" value="false"/>
                            <ui:param name="'size'" value="50"/>
                            <ui:param name="'maxlength'" value="50"/>
                            <ui:param name="'description'" value="text('portalpage.search.text.desc')"/>
                        </ui:textfield>

                        <td class="fieldLabelArea" width="10%"><webwork:text name="'common.concepts.author'"/>:</td>
                        <%--Already has a TD--%>
                        <ui:component label="text('admin.common.words.owner')" name="'searchOwnerUserName'" template="userselect.jsp" theme="'single'">
                            <ui:param name="'formname'" value="'pageSearchForm'"/>
                            <ui:param name="'mandatory'" value="false"/>
                        </ui:component>
                        <td width="100%">&nbsp;</td>
                        <td>
                            <webwork:component template="help.jsp" name="'portlets.dashboard_pages'" >
                                <webwork:param name="'helpURLFragment'">#finding_dashboards</webwork:param>
                            </webwork:component>
                        </td>
                    </tr>

                    <%-- component includes its own row --%>
                    <webwork:component name="'shares'" label="text('common.concepts.shared.with')" template="select-share-types.jsp" >
                        <webwork:param name="'class'" value="'filterSearchInputRightAligned fieldLabelArea'"/>
                        <webwork:param name="'valueColSpan'" value="5"/>
                        <webwork:param name="'noJavaScriptMessage'">
                            <webwork:text name="'common.sharing.no.share.javascript'"/>
                        </webwork:param>
                        <webwork:param name="'shareTypeList'" value="/portalPageViewHelper/shareTypeRendererBeans"/>
                        <webwork:param name="'dataString'" value="/portalPageViewHelper/searchShareTypeJSON"/>
                        <webwork:param name="'anyDescription'"><webwork:text name="'common.sharing.search.template.any.desc.PortalPage'"/></webwork:param>
                    </webwork:component>
                    <webwork:else>
                    <ui:component template="multihidden.jsp" >
                        <ui:param name="'fields'">searchShareType,groupShare,projectShare,roleShare</ui:param> <%-- TODO: why not use the back end ShareType* shit to get these? --%>
                    </ui:component>
                    </webwork:else>
                    <tr>
                        <td colspan="6" align="center">
                            <input name="Search" type="submit" value="<webwork:text name="'common.concepts.search'"/>"/>
                        </td>
                    </tr>
                </table>
            </form>
            <webwork:if test="/searchRequested == true && /pages/size > 0">
                <webwork:component name="text('common.concepts.search')" template="portalpage-list.jsp">
                    <webwork:param name="'id'" value="'pp_browse'"/>
                    <webwork:param name="'portalPageList'" value="/pages"/>
                    <webwork:param name="'operations'">false</webwork:param>
                    <webwork:param name="'ordering'">false</webwork:param>

                    <webwork:param name="'sort'" value="true"/>
                    <webwork:param name="'sortColumn'" value="/sortColumn"/>
                    <webwork:param name="'viewHelper'" value="/portalPageViewHelper"/>
                    <webwork:param name="'linkRenderer'" value="/portalPageLinkRenderer"/>

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
        </div>
    </div>
</webwork:if>
<webwork:elseIf test="/view == 'my'">
    <h2><webwork:text name="'configureportalpages.my.desc'"/></h2>
    <div id="primary" class="column full">
        <div class="content">
            <webwork:component template="help.jsp" name="'portlets.dashboard_pages'" >
                <webwork:param name="'helpURLFragment'">#managing_dashboards</webwork:param>
            </webwork:component>
            <p><webwork:text name="'configureportalpages.my.long.desc'"/></p>
            <%-- MY VIEW --%>
            <webwork:component name="text('common.concepts.my')" template="portalpage-list.jsp">
                <webwork:param name="'id'" value="'pp_owned'"/>
                <webwork:param name="'portalPageList'" value="/pages"/>
                <webwork:param name="'owner'">false</webwork:param>
                <webwork:param name="'favcount'">false</webwork:param>
                <webwork:param name="'ordering'">false</webwork:param>
                <webwork:param name="'favourite'" value="/canShowFavourite"/>
                <webwork:param name="'shares'" value="/canShowShares"/>
                <webwork:param name="'emptyMessage'"><webwork:text name="'portal.no.owned.pages'"/></webwork:param>
                <webwork:param name="'returnUrl'" value="/returnUrl"/>
                <webwork:param name="'viewHelper'" value="/portalPageViewHelper"/>
                <webwork:param name="'linkRenderer'" value="/portalPageLinkRenderer"/>
            </webwork:component>
        </div>
    </div>
</webwork:elseIf>
<webwork:elseIf test="/view == 'popular'">
    <h2><webwork:text name="'configureportalpages.popular.desc'"/></h2>
    <div id="primary" class="column full">
        <div class="content">
            <webwork:component template="help.jsp" name="'portlets.dashboard_pages'" >
                <webwork:param name="'helpURLFragment'">#managing_dashboards</webwork:param>
            </webwork:component>
            <p><webwork:text name="'configureportalpages.popular.long.desc'"/></p>
            <%-- Popular View --%>
            <webwork:component name="text('common.concepts.popular')" template="portalpage-list.jsp">
                <webwork:param name="'id'" value="'pp_popular'"/>
                <webwork:param name="'operations'">false</webwork:param>
                <webwork:param name="'ordering'">false</webwork:param>
                <webwork:param name="'portalPageList'" value="/pages"/>
                <webwork:param name="'favourite'" value="/canShowFavourite"/>
                <webwork:param name="'shares'" value="/canShowShares"/>
                <webwork:param name="'emptyMessage'"><webwork:text name="'portal.no.popular.pages'"/></webwork:param>
                <webwork:param name="'returnUrl'" value="/returnUrl"/>
                <webwork:param name="'viewHelper'" value="/portalPageViewHelper"/>
                <webwork:param name="'linkRenderer'" value="/portalPageLinkRenderer"/>
            </webwork:component>
        </div>
    </div>
</webwork:elseIf>
<webwork:else>
    <h2><webwork:text name="'configureportalpages.favourite.desc'"/></h2>
    <div id="primary" class="column full">
        <div class="content">
            <webwork:component template="help.jsp" name="'portlets.dashboard_pages'" >
                <webwork:param name="'helpURLFragment'">#managing_dashboards</webwork:param>
            </webwork:component>
            <p><webwork:text name="'configureportalpages.favourite.long.desc'"/></p>
            <div id="undo_div" class="infoBox favfilter-undo"></div>
            <%-- FAVOURITE VIEW --%>
            <webwork:component name="text('common.favourites.favourite')" template="portalpage-list.jsp">
                <webwork:param name="'id'" value="'pp_favourite'"/>
                <webwork:param name="'portalPageList'" value="/pages"/>
                <webwork:param name="'favcount'">false</webwork:param>
                <webwork:param name="'favourite'" value="/canShowFavourite"/>
                <webwork:param name="'shares'" value="/canShowShares"/>
                <webwork:param name="'emptyMessage'"><webwork:text name="'portal.no.favourite.pages'"/></webwork:param>
                <webwork:param name="'returnUrl'" value="/returnUrl"/>
                <webwork:param name="'viewHelper'" value="/portalPageViewHelper"/>
                <webwork:param name="'linkRenderer'" value="/portalPageLinkRenderer"/>
                <webwork:param name="'remove'" >true</webwork:param>
            </webwork:component>
        </div>
    </div>
</webwork:else>