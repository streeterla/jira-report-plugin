
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
	<page:param name="title"><webwork:text name="'setup3.title'"/></page:param>
	<page:param name="description"><webwork:text name="'setup3.desc'"/></page:param>
	<page:param name="action">Setup3.jspa</page:param>
	<page:param name="submitId">finish_submit</page:param>
	<page:param name="submitName"><webwork:property value="text('common.forms.finish')"/></page:param>

	<tr>
		<td bgcolor=#ffffff>&nbsp;</td>
		<td bgcolor=#ffffff>
			<input type="submit" name="noemail" value="<webwork:property value="text('setup3.disableemail')"/>">
		</td>
	</tr>

        <ui:textfield label="text('setup3.name.label')" name="'name'" size="'30'">
            <ui:param name="'description'"><webwork:text name="'setup3.name.desc'"/></ui:param>
        </ui:textfield>

        <ui:textfield label="text('setup3.fromaddress.label')" name="'from'">
		<ui:param name="'size'">30</ui:param>
            <ui:param name="'description'"><webwork:text name="'setup3.fromaddress.desc'"/></ui:param>
        </ui:textfield>
        <ui:textfield label="text('setup3.emailprefix.label')" name="'prefix'">
		<ui:param name="'size'">30</ui:param>
            <ui:param name="'description'"><webwork:text name="'setup3.emailprefix.desc'"/>
        </ui:param>
        </ui:textfield>

        <tr>
            <td colspan=2 bgcolor=#ffffff>&nbsp;</td>
        </tr>

        <tr>
            <td colspan=2 bgcolor=#f0f0f0><b><webwork:text name="'setup3.smtpserver'"/></b><br>
            <webwork:text name="'setup3.smtpserver.desc'"/></td>
        </tr>

        <tr>
            <td colspan=2 bgcolor=#f0f0f0><b><webwork:text name="'setup3.smtphost'"/></b></td>
        </tr>

        <ui:textfield label="text('setup3.hostname.label')" name="'server'">
		<ui:param name="'size'">30</ui:param>
            <ui:param name="'description'"><webwork:text name="'setup3.hostname.desc'"/></ui:param>
        </ui:textfield>

        <ui:textfield label="text('setup3.smtpport.label')" name="'smtpPort'">
		<ui:param name="'size'">30</ui:param>
            <ui:param name="'description'"><webwork:text name="'setup3.smtpport.desc'"/></ui:param>
        </ui:textfield>

        <ui:textfield label="text('common.words.username')" name="'smtpUsername'">
		<ui:param name="'size'">30</ui:param>
            <ui:param name="'description'"><webwork:text name="'setup3.username.desc'"/></ui:param>
        </ui:textfield>

        <ui:password label="text('common.words.password')" name="'smtpPassword'">
		    <ui:param name="'size'">30</ui:param>
            <ui:param name="'description'"><webwork:text name="'setup3.password.desc'"/></ui:param>
        </ui:password>

        <tr>
            <td bgcolor=#ffffff><b><webwork:text name="'common.words.or'"/></b></td>
            <td bgcolor=#ffffff align=center>&nbsp;</td>
        </tr>

        <tr>
            <td colspan=2 bgcolor=#f0f0f0><b><webwork:text name="'setup3.jndilocation'"/></b></td>
        </tr>

        <ui:textfield label="text('setup3.jndilocation')" name="'session'">
		    <ui:param name="'size'">30</ui:param>
            <ui:param name="'description'"><webwork:text name="'setup3.jndilocation.desc'"/></ui:param>
        </ui:textfield>
	</tr>
</page:applyDecorator>

</body>
</html>
<% } %>
