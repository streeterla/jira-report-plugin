
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
	<title><webwork:text name="'setup.title'" /></title>
</head>

<body>

<page:applyDecorator name="jiraform">
	<page:param name="title"><webwork:text name="'setup2.title'"/></page:param>
	<page:param name="description"><webwork:text name="'setup2.desc'"/></page:param>
	<page:param name="action">Setup2.jspa</page:param>
    <page:param name="submitId">next_submit</page:param>
	<page:param name="submitName"><webwork:property value="text('common.forms.next')"/>&gt;&gt;</page:param>

	<ui:textfield label="text('common.words.username')" name="'username'">
        <ui:param name="'mandatory'" value="true" />
	</ui:textfield>

	<ui:password label="text('common.words.password')" name="'password'" >
        <ui:param name="'mandatory'" value="true" />
    </ui:password>

	<ui:password label="text('setup2.confirm.label')" name="'confirm'" >
        <ui:param name="'mandatory'" value="true" />
    </ui:password>

	<ui:textfield label="text('setup2.fullname.label')" name="'fullname'">
		<ui:param name="'size'">40</ui:param>
		<ui:param name="'description'">
			<webwork:text name="'setup2.fullname.desc'"/>
		</ui:param>
        <ui:param name="'mandatory'" value="true" />
	</ui:textfield>

	<ui:textfield label="text('setup2.email.label')" name="'email'">
		<ui:param name="'size'">40</ui:param>
		<ui:param name="'description'">
			<webwork:text name="'setup2.email.desc'"/>
		</ui:param>
        <ui:param name="'mandatory'" value="true" />
	</ui:textfield>

</page:applyDecorator>

</body>
</html>
<% } %>
