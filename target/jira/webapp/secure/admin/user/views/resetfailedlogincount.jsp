<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.resetfailedlogin.title'"/></title>
</head>
<body>
    <page:applyDecorator name="jiraform">
        <page:param name="title"><webwork:text name="'admin.resetfailedlogin.title'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="action">ResetFailedLoginCount.jspa</page:param>
        <page:param name="submitId">reset_submit</page:param>
        <page:param name="submitName"><webwork:text name="'admin.common.words.reset'"/></page:param>
        <page:param name="cancelURI">UserBrowser.jspa</page:param>

        <ui:textfield label="text('common.words.username')" name="'name'" size="40"/>
    </page:applyDecorator>
</body>
</html>
