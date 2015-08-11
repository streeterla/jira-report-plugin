
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.project.categories.delete.title'">
	    <webwork:param name="'value0'"><webwork:property value="projectManager/projectCategory(id)/string('name')" /></webwork:param>
	</webwork:text></title>
</head>

<body>

<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'admin.project.categories.delete.title'">
	    <webwork:param name="'value0'"><webwork:property value="projectManager/projectCategory(id)/string('name')" /></webwork:param>
	</webwork:text></page:param>
	<page:param name="description">
		<p><webwork:text name="'admin.project.categories.delete.confirmation'"/></p>
	</page:param>

	<page:param name="width">100%</page:param>
	<page:param name="action">DeleteProjectCategory.jspa</page:param>
	<page:param name="submitId">delete_submit</page:param>
	<page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
	<page:param name="cancelURI">ViewProjectCategories!default.jspa</page:param>
	<page:param name="autoSelectFirst">false</page:param>

	<ui:component name="'id'" template="hidden.jsp" theme="'single'"  />
	<ui:component name="'confirm'" value="'true'" template="hidden.jsp" theme="'single'"  />

</page:applyDecorator>

</body>
</html>
