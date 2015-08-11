
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>


<html>
<head>
	<title><webwork:text name="'admin.issuesettings.priorities.delete.priority'"/>: <webwork:property value="constant/string('name')" /></title>
</head>
<body>

<page:applyDecorator name="jiraform">
	<page:param name="title"><webwork:text name="'admin.issuesettings.priorities.delete.priority'"/>: <webwork:property value="constant/string('name')" /></page:param>
	<page:param name="autoSelectFirst">false</page:param>
	<page:param name="description">
        <p><webwork:text name="'admin.issuesettings.priorities.delete.confirm'"/></p>
		<p><webwork:text name="'admin.issuesettings.priorities.delete.currently.issues.attached'">
		    <webwork:param name="'value0'"><b><webwork:property value="matchingIssues/size" /></b></webwork:param>
		</webwork:text></p>
	</page:param>

	<page:param name="action">DeletePriority.jspa</page:param>
    <page:param name="width">100%</page:param>
	<page:param name="submitId">delete_submit</page:param>
	<page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
	<page:param name="cancelURI">ViewPriorities.jspa</page:param>

    <ui:select name="'newId'" label="text('admin.issuesettings.priorities.delete.new.priorities.for.matching.issues')" list="newConstants"
        listKey="'string('id')'" listValue="'string('name')'" />
	<ui:component name="'id'" template="hidden.jsp" />
	<input type="hidden" name="confirm" value="true">
</page:applyDecorator>

</body>
</html>
