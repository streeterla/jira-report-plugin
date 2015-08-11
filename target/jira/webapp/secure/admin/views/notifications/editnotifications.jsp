<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.schemes.notifications.edit.notifications'"/></title>
</head>
<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.schemes.notifications.edit.notifications'"/> &mdash; <webwork:property value="scheme/string('name')"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">notification_schemes</page:param>
    <p>
    <webwork:text name="'admin.schemes.notifications.edit.notifications.description'">
        <webwork:param name="'value0'"><webwork:property value="scheme/string('name')"/></webwork:param>
    </webwork:text>
    </p>

    <ul class="square">
        <li><webwork:text name="'admin.schemes.notifications.add.notification'">
            <webwork:param name="'value0'"><a href="<webwork:url page="AddNotification!default.jspa"><webwork:param name="'schemeId'" value="scheme/string('id')"/></webwork:url>"><b></webwork:param>
            <webwork:param name="'value1'"></b></a></webwork:param>
        </webwork:text></li>
        <li><webwork:text name="'admin.schemes.notifications.view.all.notification.schemes'">
            <webwork:param name="'value0'"><a href="ViewNotificationSchemes.jspa"><b></webwork:param>
            <webwork:param name="'value1'"></b></a></webwork:param>
        </webwork:text></li>
    </ul>

    <webwork:if test="/schemeManager/hasMailServer == false">
        <p><span class="warning"><webwork:text name="'admin.common.words.warning'"/></span>:
            <webwork:if test="/systemAdministrator == true">
                <webwork:text name="'admin.mailqueue.no.default.mail.server'">
                    <webwork:param name="'value0'"><a href="<%=request.getContextPath()%>/secure/admin/ViewMailServers.jspa"></webwork:param>
                    <webwork:param name="'value1'"></a></webwork:param>
                </webwork:text>
            </webwork:if>
            <webwork:else>
                <webwork:text name="'admin.mailqueue.no.default.mail.server.admin'">
                    <webwork:param name="'value0'"><a href="<%=request.getContextPath()%>/secure/Administrators.jspa#sysadmins"></webwork:param>
                    <webwork:param name="'value1'"></a></webwork:param>
                </webwork:text>
            </webwork:else>
           </p>
    </webwork:if>

</page:applyDecorator>
<p>
    <table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="90%">
    <tr>
    <td>
    <table border="0" cellpadding="3" cellspacing="1" width="100%" id="notificationSchemeTable">
        <tr bgcolor="#f0f0f0">
            <td class="colHeaderLink"><b><webwork:text name="'admin.schemes.notifications.event'"/></b></td>
            <td class="colHeaderLink"><b><webwork:text name="'admin.schemes.notifications.notifications'"/></b></td>
            <td class="colHeaderLink" width="10%"><b><webwork:text name="'common.words.operations'"/></b></td>
        </tr>

        <webwork:iterator value="events/keySet" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
            <!-- Event Type Name -->
            <webwork:property value="events/(.)">
            <td valign="top"><b><webwork:property value="./translatedName(/remoteUser)"/></b>
                <webwork:if test="./systemEventType == true">
                    <span class="smallgrey">(<webwork:text name="'admin.schemes.notifications.system.event.type'" />)</span>
                </webwork:if>
            </td>
            </webwork:property>
            <!-- Notifications -->
            <td valign="top">
                <ul class="square_blue">
                    <webwork:iterator value="notifications(.)">
                        <li>
                            <span title="<webwork:text name="'admin.schemes.notifications.notification'" />">
                                <webwork:property value="../../type(string('type'))/displayName" />
                                <webwork:if test="string('parameter')">(<webwork:property value="../../type(string('type'))/argumentDisplay(string('parameter'))" />)</webwork:if>
                            </span>
                            <span class="small">(<a id="del_<webwork:property value="long('id')" />" title="<webwork:text name="'admin.schemes.notifications.delete.notification'" />" href="<webwork:url page="DeleteNotification!default.jspa"><webwork:param name="'id'" value="long('id')"/><webwork:param name="'schemeId'" value="schemeId"/></webwork:url>"><webwork:text name="'common.words.delete'"/></a>)</span>
                        </li>
                    </webwork:iterator>
                </ul>
            </td>
            <!-- Operations -->
            <td nowrap valign="top">
            	<img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" style="vertical-align: middle;" alt=""/>
                <a id="add_<webwork:property value="." />" href="<webwork:url page="AddNotification!default.jspa"><webwork:param name="'schemeId'" value="../schemeId"/><webwork:param name="'eventTypeIds'" value="."/></webwork:url>"><webwork:text name="'common.forms.add'"/></a>
            </td>
        </tr>
        </webwork:iterator>
    </table>
    </td>
    </tr>
    </table>
</p>
</body>
</html>
