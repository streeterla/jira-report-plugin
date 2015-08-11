<%@ page import="com.atlassian.jira.ComponentManager" %>
<%@ page import="com.atlassian.plugin.webresource.WebResourceManager" %>
<%@ taglib uri="webwork" prefix="webwork" %>

<%
    WebResourceManager webResourceManager = ComponentManager.getInstance().getWebResourceManager();
    webResourceManager.requireResource("jira.webresources:share-types");
%>

<!-- PAGING SUPPORT-->
<jsp:include page="/template/standard/filter-list-paging.jsp" />

<table id="<webwork:property value="parameters['id']"/>" cellspacing="0" cellpadding="0" class="filter_list" align="center">
    <jsp:include page="/template/standard/filter-list-header.jsp" />

    <webwork:property value="parameters['filterList']">
        <webwork:if test=". != null && ./size > 0">
            <webwork:iterator value="." status="'myStatus'">
                <tr id="mf_<webwork:property value="./id" />" class="mf_row <webwork:if test="@myStatus/modulus(2) == 1">rowNormal</webwork:if><webwork:else>rowAlternate</webwork:else><webwork:if test="@myStatus/first == true"> first-row</webwork:if><webwork:if test="@myStatus/last == true"> last-row</webwork:if> ">
                <jsp:include page="/template/standard/filter-list-name.jsp" />
                <webwork:if test="parameters['issuecount'] != 'false'">
                    <td class="fullyCentered">
                        <webwork:if test="./issueCount == -1">
                            <webwork:text name="'managefilters.error.too.complex'"/>
                        </webwork:if>
                        <webwork:elseIf test="./issueCount == 0 || parameters['linkissuecount'] == 'false'">
                            <webwork:property value="./issueCount" />
                        </webwork:elseIf>
                        <webwork:else>
                            <a href="<webwork:url value="'IssueNavigator.jspa?mode=hide'"><webwork:param name="'requestId'" value="./id" /></webwork:url>"><webwork:property value="./issueCount" /></a>
                        </webwork:else>
                    </td>
                </webwork:if>
                <webwork:if test="parameters['owner'] != 'false'">
                    <td>
                        <webwork:property value="./ownerFullName" escape="false"/> (<webwork:property value="./ownerUserName"/>)
                    </td>
                </webwork:if>
                <webwork:if test="parameters['shares'] != 'false'">
                    <td>
                        <webwork:component template="shares-list.jsp">
                            <webwork:param name="'sharesview'" value="."/>
                            <webwork:param name="'privatemessage'"><webwork:text name="'common.filters.private'"/></webwork:param>
                            <webwork:param name="'sharedmessage'"><webwork:text name="'common.filters.shared'"/></webwork:param>
                        </webwork:component>
                    </td>
                </webwork:if>
                <webwork:if test="parameters['subscriptions'] != 'false'">
                    <td>
                        <webwork:if test="./subscriptionCount == 0">
                            <webwork:text name="'common.words.none'"/> - <a id="subscribe_<webwork:property value="./name"/>" href="<webwork:url value="'FilterSubscription!default.jspa'"><webwork:param name="'filterId'" value="./id" /></webwork:url>"><webwork:text name="'managefilters.subscribe'"/></a>
                        </webwork:if>
                        <webwork:elseIf test="./subscriptionCount == 1">
                            <a href="<webwork:url value="'ViewSubscriptions.jspa'"><webwork:param name="'filterId'" value="./id" /></webwork:url>"><webwork:property value="./subscriptionCount"/> <webwork:text name="'managefilters.subscription'"/></a>
                        </webwork:elseIf>
                        <webwork:else>
                            <a href="<webwork:url value="'ViewSubscriptions.jspa'"><webwork:param name="'filterId'" value="./id" /></webwork:url>"><webwork:property value="./subscriptionCount"/> <webwork:text name="'managefilters.subscriptions'"/></a>
                        </webwork:else>
                    </td>
                </webwork:if>
                <webwork:if test="parameters['operations'] != 'false'">
                    <td nowrap>
                        <webwork:if test="./currentOwner == true">
                            <a id="edit_filter_<webwork:property value="./id"/>" href="<webwork:url value="'EditFilter!default.jspa'"><webwork:param name="'filterId'" value="./id" /><webwork:param name="'returnUrl'" value="parameters['returnUrl']" /></webwork:url>"><webwork:text name="'managefilters.edit.filter'"/></a>
                            | <a id="delete_<webwork:property value = "./name"/>" class="delete-filter" rel="<webwork:property value="./id"/>" href="<webwork:url value="'DeleteFilter!default.jspa'"><webwork:param name="'filterId'" value="./id" /></webwork:url>"><webwork:text name="'managefilters.delete'"/></a>
                            <webwork:if test="./canEditColumns == true">
                                | <a id="colOrder_<webwork:property value = "./name"/>" href="<webwork:url value="'ViewSearchRequestIssueColumns!default.jspa'"><webwork:param name="'filterId'" value="./id" /></webwork:url>"><webwork:text name="'managefilters.columns'"/></a>
                            </webwork:if>
                        </webwork:if>
                    </td>
                </webwork:if>
                <webwork:if test="parameters['favcount'] != 'false'">
                    <webwork:if test="./favourite == 'true'">
                        <td class="fullyCentered">
                            <div id="fav_count_enabled_<webwork:property value="parameters['id']"/>_SearchRequest_<webwork:property value="./id"/>">
                                <webwork:property value="./favouriteCount"/>
                            </div>
                            <div id="fav_count_disabled_<webwork:property value="parameters['id']"/>_SearchRequest_<webwork:property value="./id"/>" style="display:none">
                                <webwork:property value="./alternateFavouriteCount"/>
                            </div>
                        </td>
                    </webwork:if>
                    <webwork:else>
                        <td class="fullyCentered">
                            <div id="fav_count_disabled_<webwork:property value="parameters['id']"/>_SearchRequest_<webwork:property value="./id"/>">
                                <webwork:property value="./favouriteCount"/>
                            </div>
                            <div id="fav_count_enabled_<webwork:property value="parameters['id']"/>_SearchRequest_<webwork:property value="./id"/>" style="display:none">
                                <webwork:property value="./alternateFavouriteCount"/>
                            </div>
                        </td>
                    </webwork:else>
                </webwork:if>
                </tr>
            </webwork:iterator>
        </webwork:if>
        <webwork:else>
            <tr class="rowNormal">
                <td><webwork:property value="parameters['emptyMessage']"/></td>
            </tr>
        </webwork:else>
    </webwork:property>
</table>
<!-- PAGING SUPPORT-->
<jsp:include page="/template/standard/filter-list-paging.jsp" />

<table id="<webwork:property value="parameters['id']"/>_empty" class="filter_list" cellspacing="0" cellpadding="0" align="center" style="display:none">
    <tr class="filter_list"><webwork:if test="parameters['name'] != false"><td class="colHeaderLink bolded" ><webwork:text name="'common.words.name'"/></td></webwork:if></tr>
     <tr>
        <td class="rowNormal"><webwork:property value="parameters['emptyMessage']"/></td>
    </tr>
</table>
