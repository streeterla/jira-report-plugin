
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.schemes.notifications.notification.schemes'"/></title>
</head>

<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.schemes.notifications.notification.schemes'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">notification_schemes</page:param>
    <p>
    <webwork:text name="'admin.schemes.notifications.table.below.shows'"/>
    </p>

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

    <table align=center bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width=90%><tr><td>
    <table id="notification_schemes" border="0" cellpadding="3" cellspacing="1" width=100%>
        <tr bgcolor=#f0f0f0>
            <td class="colHeaderLink">
                <b><webwork:text name="'common.words.name'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'common.concepts.projects'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'common.words.operations'"/></b>
            </td>
        </tr>

        <webwork:iterator value="schemes" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
            <td valign=top>
                <b><a href="<webwork:url page="EditNotifications!default.jspa"><webwork:param name="'schemeId'" value="long('id')"/></webwork:url>"><webwork:property value="string('name')"/></a></b><br>
                <webwork:property value="string('description')"/></td>
            <td valign=top nowrap>
            <webwork:iterator value="projects(.)">
            	<img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height=8 width=8 border=0 align=absmiddle>
                <a href="<%= request.getContextPath() %>/secure/project/ViewProject.jspa?pid=<webwork:property value="long('id')" />"><webwork:property value="string('name')" /></a><br>
            </webwork:iterator>
            </td>
            <td valign=top align=left nowrap>
                <a id="<webwork:property value="long('id')"/>_edit" href="<webwork:url page="EditNotifications!default.jspa"><webwork:param name="'schemeId'" value="long('id')"/></webwork:url>"><webwork:text name="'admin.schemes.notifications.notifications'"/></a>
                |
                <a href="<webwork:url page="CopyNotificationScheme.jspa"><webwork:param name="'schemeId'" value="long('id')"/></webwork:url>" title="Create a copy of this scheme"><webwork:text name="'common.words.copy'"/></a>
                |
                <a href="<webwork:url page="EditNotificationScheme!default.jspa"><webwork:param name="'schemeId'" value="long('id')"/></webwork:url>"><webwork:text name="'common.words.edit'"/></a>
                |
                <a href="<webwork:url page="DeleteNotificationScheme!default.jspa"><webwork:param name="'schemeId'" value="long('id')"/></webwork:url>"><webwork:text name="'common.words.delete'"/></a>
            </td>
        </tr>
        </webwork:iterator>
        <webwork:if test="schemes/size == 0">
        <tr bgcolor=#ffffff>
            <td colspan=3><webwork:text name="'admin.schemes.notifications.no.notification.schemes.configured'"/></td>
        </tr>
        </webwork:if>
    </table>
    </td></tr></table>

    <p>
    <table align=center border="0" cellpadding="0" cellspacing="0" width=90%>
    <tr>
    <td align="center">
    <table border="0" cellpadding="3" cellspacing="1">
    <tr>
        <td><a href="<webwork:url page="AddNotificationScheme!default.jspa"/>"><webwork:text name="'admin.schemes.notifications.add.notification.scheme'"/></a></td>
    </tr>
    </table>
    </td>
    </tr>
    </table>
    </p>

</body>
</html>
