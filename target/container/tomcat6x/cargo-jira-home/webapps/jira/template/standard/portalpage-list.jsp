<%@ page import="com.atlassian.jira.ComponentManager" %>
<%@ page import="com.atlassian.plugin.webresource.WebResourceManager" %>
<%@ taglib uri="webwork" prefix="webwork" %>

<%
    WebResourceManager webResourceManager = ComponentManager.getInstance().getWebResourceManager();
    webResourceManager.requireResource("jira.webresources:share-types");
%>

<!-- PAGING SUPPORT-->

<jsp:include page="/template/standard/portalpage-list-paging.jsp" />

<table id="<webwork:property value="parameters['id']"/>" cellspacing="0" cellpadding="0" class="filter_list" align="center">
    <jsp:include page="/template/standard/portalpage-list-header.jsp" />

    <webwork:property value="parameters['portalPageList']">
        <webwork:if test=". != null && ./size > 0">
            <webwork:iterator value="." status="'status'">
            <tr id="pp_<webwork:property value="./id" />" class="pp_row <webwork:if test="@status/modulus(2) == 1">rowNormal</webwork:if><webwork:else>rowAlternate</webwork:else><webwork:if test="@status/first == true"> first-row</webwork:if><webwork:if test="@status/last == true"> last-row</webwork:if> ">
            <jsp:include page="/template/standard/portalpage-list-name.jsp" />
                <webwork:if test="parameters['owner'] != 'false'"><td>
                    <webwork:if test="./systemDashboard == true">
                        <webwork:text name="'portalpage.owner.system'"/>
                    </webwork:if>
                    <webwork:else>
                        <webwork:property value="./ownerFullName" escape="false"/> (<webwork:property value="./ownerUserName"/>)
                    </webwork:else>
                </td></webwork:if>
                <webwork:if test="parameters['shares'] != 'false'">
                    <td>
                        <webwork:component template="shares-list.jsp">
                            <webwork:param name="'sharesview'" value="."/>
                            <webwork:param name="'privatemessage'"><webwork:text name="'portalpage.private.page'"/></webwork:param>
                            <webwork:param name="'sharedmessage'"><webwork:text name="'portalpage.shared.page'"/></webwork:param>
                        </webwork:component>
                    </td>
                </webwork:if>
                <webwork:if test="parameters['ordering'] != 'false'">
                    <td width="1%" nowrap class="dash-reorder">
                        <a class="portal_pos_first" id="pos_first_<webwork:property value="@status/index" />" href="<webwork:url page="ConfigurePortalPages!moveToStart.jspa"><webwork:param name="'pageId'" value="./id"/></webwork:url>"><img src="<%= request.getContextPath() %>/images/icons/arrow_first.gif"  class="sortArrow16x16" title="<webwork:text name="'configureportalpages.movepage.first'"/>" alt="<webwork:text name="'configureportalpages.movepage.first'"/>"></a>
                        <a class="portal_pos_up" id="pos_up_<webwork:property value="@status/index" />" href="<webwork:url page="ConfigurePortalPages!moveUp.jspa"><webwork:param name="'pageId'" value="./id"/></webwork:url>"><img src="<%= request.getContextPath() %>/images/icons/arrow_up_blue.gif" class="sortArrow16x16" title="<webwork:text name="'configureportalpages.movepage.up'"/>" alt="<webwork:text name="'configureportalpages.movepage.up'"/>"></a>
                        <a class="portal_pos_down" id="pos_down_<webwork:property value="@status/index" />" href="<webwork:url page="ConfigurePortalPages!moveDown.jspa"><webwork:param name="'pageId'" value="./id"/></webwork:url>"><img src="<%= request.getContextPath() %>/images/icons/arrow_down_blue.gif" class="sortArrow16x16" title="<webwork:text name="'configureportalpages.movepage.down'"/>" alt="<webwork:text name="'configureportalpages.movepage.down'"/>"></a>
                        <a class="portal_pos_last" id="pos_last_<webwork:property value="@status/index" />" href="<webwork:url page="ConfigurePortalPages!moveToEnd.jspa"><webwork:param name="'pageId'" value="./id"/></webwork:url>"><img src="<%= request.getContextPath() %>/images/icons/arrow_last.gif" class="sortArrow16x16" title="<webwork:text name="'configureportalpages.movepage.last'"/>" alt="<webwork:text name="'configureportalpages.movepage.last'"/>"></a>
                    </td>
                </webwork:if>
                <webwork:if test="parameters['operations'] != 'false'">
                    <td nowrap>
                        <webwork:if test="./currentOwner == true">
                            <a id="edit_<webwork:property value="@status/index" />" href="<webwork:url value="'EditPortalPage!default.jspa'"><webwork:param name="'pageId'" value="./id" /><webwork:param name="'returnUrl'" value="parameters['returnUrl']" /></webwork:url>"><webwork:text name="'common.words.edit'"/></a>
                            | <a class="delete_dash" rel="<webwork:property value="./id" />" id="delete_<webwork:property value="@status/index" />" href="<webwork:url value="'DeletePortalPage!default.jspa'"><webwork:param name="'pageId'" value="./id" /></webwork:url>"><webwork:text name="'common.words.delete'"/></a>
                            |
                        </webwork:if>
                        <a id="clone_<webwork:property value="@status/index" />" href="<webwork:url value="'AddPortalPage!default.jspa'"><webwork:param name="'clonePageId'" value="./id" /></webwork:url>"><webwork:text name="'common.words.copy'"/></a>
                    </td>
                </webwork:if>
                <webwork:if test="parameters['favcount'] != 'false'">
                    <webwork:if test="./favourite == 'true'">
                        <td class="fullyCentered">
                            <div id="fav_count_enabled_<webwork:property value="parameters['id']"/>_PortalPage_<webwork:property value="./id"/>">
                                <webwork:property value="./favouriteCount"/>
                            </div>
                            <div id="fav_count_disabled_<webwork:property value="parameters['id']"/>_PortalPage_<webwork:property value="./id"/>" style="display:none">
                                <webwork:property value="./alternateFavouriteCount"/>
                            </div>
                        </td>
                    </webwork:if>
                    <webwork:else>
                        <td class="fullyCentered">
                            <div id="fav_count_disabled_<webwork:property value="parameters['id']"/>_PortalPage_<webwork:property value="./id"/>">
                                <webwork:property value="./favouriteCount"/>
                            </div>
                            <div id="fav_count_enabled_<webwork:property value="parameters['id']"/>_PortalPage_<webwork:property value="./id"/>" style="display:none">
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
<jsp:include page="/template/standard/portalpage-list-paging.jsp" />

<table id="<webwork:property value="parameters['id']"/>_empty" class="filter_list" cellspacing="0" cellpadding="0" align="center" style="display:none">
    <tr class="filter_list"><webwork:if test="parameters['name'] != false"><td class="colHeaderLink bolded" ><webwork:text name="'common.words.name'"/></td></webwork:if></tr>
     <tr>
        <td class="rowNormal"><webwork:property value="parameters['emptyMessage']"/></td>
    </tr>
</table>
