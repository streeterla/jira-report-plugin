<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title>Select Screen Scheme</title>
</head>

<body>

<page:applyDecorator name="jiraform">
    <page:param name="title">Screen Scheme Association</page:param>
    <page:param name="width">100%</page:param>
    <page:param name="cancelURI"><webwork:url page="ViewProject.jspa"><webwork:param name="'pid'" value="/projectId"/></webwork:url></page:param>
    <page:param name="action">SelectScreenScheme.jspa</page:param>
    <page:param name="submitId">associate_submit</page:param>
    <page:param name="submitName">Associate</page:param>
    <page:param name="description">
        This page allows you to associate a screen scheme with the project
        <a href="ViewProject.jspa?pid=<webwork:property value="projectId" />"><b><webwork:property value="/project/string('name')"/></b></a>.
    </page:param>

    <ui:select label="'Scheme'" name="'schemeId'" list="/screenSchemes" listKey="'./id'" listValue="'./name'" />

    <ui:component name="'projectId'" template="hidden.jsp"/>
</page:applyDecorator>

</body>
</html>
