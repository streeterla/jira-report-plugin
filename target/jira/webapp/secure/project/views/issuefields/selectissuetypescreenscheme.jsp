<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.itss.select.issue.type.screen.scheme'"/></title>
</head>

<body>

<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'admin.itss.issue.type.screen.scheme.association'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="cancelURI"><webwork:url page="ViewProject.jspa"><webwork:param name="'pid'" value="/projectId"/></webwork:url></page:param>
    <page:param name="action">SelectIssueTypeScreenScheme.jspa</page:param>
    <page:param name="submitId">associate_submit</page:param>
    <page:param name="submitName"><webwork:text name="'admin.projects.schemes.associate'"/></page:param>
    <page:param name="description">
        <webwork:text name="'admin.itss.page.purpose'">
            <webwork:param name="'value0'"><a href="ViewProject.jspa?pid=<webwork:property value="projectId" />"><b><webwork:property value="/project/string('name')"/></b></a></webwork:param>
        </webwork:text>
    </page:param>

    <ui:select label="'Scheme'" name="'schemeId'" list="/issueTypeScreenSchemes" listKey="'./id'" listValue="'./name'" />

    <ui:component name="'projectId'" template="hidden.jsp"/>
</page:applyDecorator>

</body>
</html>
