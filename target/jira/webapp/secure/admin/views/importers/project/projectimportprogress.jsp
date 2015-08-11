<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<webwork:bean name="'com.atlassian.jira.util.JiraDateUtils'" id="dateUtils" />
<html>
<head>
	<title><webwork:text name="'admin.project.import.progress.title'"/></title>
    <webwork:if test="hasErrorMessages == 'false'">
        <meta http-equiv="refresh" content="5">
    </webwork:if>
</head>
<body>
    <page:applyDecorator name="jiraform">
        <page:param name="columns">1</page:param>
        <page:param name="action"><webwork:property value="/submitUrl"/></page:param>
        <page:param name="method">get</page:param>
        <webwork:if test="hasErrorMessages == 'false'">
            <page:param name="submitId">refresh_submit</page:param>
            <page:param name="submitName"><webwork:text name="'admin.common.words.refresh'"/></page:param>
        </webwork:if>
        <webwork:else>
            <page:param name="cancelURI">ProjectImportSelectBackup!default.jspa</page:param>
        </webwork:else>
        <page:param name="width">100%</page:param>
        <page:param name="title"><webwork:text name="'admin.project.import.progress.title'"/></page:param>
        <tr bgcolor="#ffffff"><td>
            <ui:component template="taskdescriptor.jsp" name="'/ourTask'"/>
        </td></tr>
        <ui:component name="'redirectOnComplete'" template="hidden.jsp"/>
    </page:applyDecorator>
</body>
</html>