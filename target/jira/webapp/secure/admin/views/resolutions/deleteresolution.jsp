
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>


<html>
<head>
	<title><webwork:text name="'admin.issuesettings.resolutions.delete.resolution'"/>: <webwork:property value="constant/string('name')" /></title>
</head>
<body>

<page:applyDecorator name="jiraform">
	<page:param name="title"><webwork:text name="'admin.issuesettings.resolutions.delete.resolution'"/>: <webwork:property value="constant/string('name')" /></page:param>
	<page:param name="description">
        <p><webwork:text name="'admin.issuesettings.resolutions.delete.confirm'"/></p>
		<p><webwork:text name="'admin.issuesettings.resolutions.delete.current.matching.issues'">
		    <webwork:param name="'value0'"><b><webwork:property value="matchingIssues/size" /></b></webwork:param>
		</webwork:text></p>
	</page:param>

	<page:param name="autoSelectFirst">false</page:param>
    <page:param name="width">100%</page:param>
	<page:param name="action">DeleteResolution.jspa</page:param>
	<page:param name="submitId">delete_submit</page:param>
	<page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
	<page:param name="cancelURI">ViewResolutions.jspa</page:param>

    <ui:select name="'newId'" label="text('admin.issuesettings.resolutions.delete.new.resolution.for.matching.issues')" list="newConstants"
        listKey="'string('id')'" listValue="'string('name')'" />
	<ui:component name="'id'" template="hidden.jsp" theme="'single'"  />
        <ui:component name="'confirm'" value="'true'" template="hidden.jsp" theme="'single'"  />

</page:applyDecorator>

</body>
</html>
