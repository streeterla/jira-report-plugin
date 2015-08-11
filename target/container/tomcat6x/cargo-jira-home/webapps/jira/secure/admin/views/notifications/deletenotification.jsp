
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.notifications.delete.notification.scheme'"/></title>
</head>

<body>

    <p>
    <table width=100% cellpadding=10 cellspacing=0 border=0>
    <page:applyDecorator name="jiraform">
        <page:param name="action">DeleteNotification.jspa</page:param>
        <page:param name="submitId">delete_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
    	<page:param name="cancelURI"><webwork:url page="EditNotifications!default.jspa"><webwork:param name="'schemeId'" value="schemeId"/></webwork:url></page:param>
        <page:param name="title"><webwork:text name="'admin.notifications.delete.notification'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="autoSelectFirst">false</page:param>
	    <page:param name="description">
        <input type="hidden" name="schemeId" value="<webwork:property value="schemeId" />">
        <input type="hidden" name="id" value="<webwork:property value="id" />">
        <input type="hidden" name="confirmed" value="true">
        <webwork:text name="'admin.notifications.delete.confirmation'">
            <webwork:param name="'value0'"><b><webwork:property value="notificationName" /></b></webwork:param>
            <webwork:param name="'value1'"><b><webwork:property value="eventName" /></b></webwork:param>
        </webwork:text><br>
        </page:param>
    </page:applyDecorator>
    </table>
    </p>

</body>
</html>
