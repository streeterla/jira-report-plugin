<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.userdefaults.user.default.email.pref'"/></title>
</head>
<body>
<page:applyDecorator name="jiraform">
	<page:param name="action">SetGlobalEmailPreference.jspa</page:param>
	<page:param name="submitId">set_email</page:param>
	<page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
	<page:param name="cancelURI">ViewUserDefaultSettings.jspa</page:param>
	<page:param name="title"><webwork:text name="'admin.userdefaults.user.default.email.pref'"/></page:param>
	<page:param name="width">100%</page:param>
    <page:param name="description">
        <p><div class="warningBox">
            <webwork:text name="'admin.userdefaults.email.change.confirmation'">
                <webwork:param name="'value0'">'<webwork:property value="/otherMimeType"/>'</webwork:param>
                <webwork:param name="'value1'">'<webwork:property value="applicationProperties/defaultBackedString('user.notifications.mimetype')"/>'</webwork:param>
                <webwork:param name="'value2'"><webwork:property value="/effectedUsers"/></webwork:param>
            </webwork:text>
        </div></p>
    </page:param>
</page:applyDecorator>
</body>
</html>
