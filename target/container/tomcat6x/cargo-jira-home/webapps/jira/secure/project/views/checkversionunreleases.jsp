<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.projectversions.unrelease.title'"><webwork:param name="'value0'"><webwork:property value="versionToUnrelease/name" /></webwork:param></webwork:text></title>
</head>

<body>

<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'admin.projectversions.unrelease.title'"><webwork:param name="'value0'"><webwork:property value="versionToUnrelease/name" /></webwork:param></webwork:text></page:param>
	<page:param name="description">
    <p><webwork:text name="'admin.projectversions.unrelease.description'"/></p>
	</page:param>
	<page:param name="action"><webwork:url page="EditVersionReleases!unrelease.jspa"><webwork:param name="'versionId'" value="versionToRelease/id" /></webwork:url></page:param>
	<page:param name="submitId">unrelease_submit</page:param>
	<page:param name="submitName"><webwork:text name="'admin.manageversions.unrelease'"/></page:param>
	<page:param name="autoSelectFirst">false</page:param>
	<page:param name="cancelURI"><webwork:url page="ManageVersions.jspa"><webwork:param name="'pid'" value="project/long('id')" /></webwork:url></page:param>

    <ui:component label="text('version.releasedate')" name="'releaseDate'" value="existingReleaseDateFormatted" template="datepicker2.jsp">
        <ui:param name="'formname'" value="'jiraform'" />
        <ui:param name="'style'">width: 20%;</ui:param>
    </ui:component>

	<ui:component name="'pid'" template="hidden.jsp" />
</page:applyDecorator>

</body>
</html>
