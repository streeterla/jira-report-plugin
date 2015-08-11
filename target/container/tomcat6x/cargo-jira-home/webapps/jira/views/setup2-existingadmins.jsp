
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%
// don't show ANYTHING to the user if they come here looking for trouble
if (com.atlassian.jira.util.JiraUtils.isSetup()) {
%>
<%--
Leave this as a raw HTML. Do not use response.getWriter() or response.getOutputStream() here as this will fail
on Orion. Let the application server figure out how it want to output this text.
--%>
JIRA has already been set up.
<%
} else {
%>
<html>
<head>
	<title>JIRA Setup</title>
</head>

<body>

<page:applyDecorator name="jiraform">
	<page:param name="title"><webwork:text name="'setup2.adminexists'"/></page:param>
	<page:param name="description"><webwork:text name="'setup2.adminexists.desc'"/></page:param>
	<page:param name="action">SetupExisting.jspa</page:param>
	<page:param name="submitId">next_submit</page:param>
	<page:param name="submitName"><webwork:property value="text('common.forms.next')"/>&gt;&gt;</page:param>

	<ui:textfield label="text('common.words.username')" name="'username'">
		<ui:param name="'size'">12</ui:param>
	</ui:textfield>

	<ui:password label="text('common.words.password')" name="'password'">
		<webwork:if test="/applicationProperties/option('jira.option.user.externalpasswordmanagement') == false">
            <webwork:if test="/applicationProperties/option('jira.option.user.externalmanagement') == false">
                <ui:param name="'description'"><webwork:text name="'setup2.forgotpassword.desc'"/>&nbsp;<a href="ForgotLoginDetails!default.jspa"><webwork:text name="'common.words.here'"/></a>.)</ui:param>
            </webwork:if>
        </webwork:if>
	</ui:password>

</page:applyDecorator>

</body>
</html>
<% } %>
