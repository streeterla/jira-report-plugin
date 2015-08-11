
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.manageversions.edit.version.details'"/>: <webwork:property value="existingVersion/name" /></title>
</head>

<body>
<!-- JRA-4345 - need to statically include the javascript to address IE6 refresh issue -->
<%@ include file="/includes/js/date_picker.jsp" %>
<page:applyDecorator name="jiraform">
	<page:param name="title"><webwork:text name="'admin.manageversions.edit.version.details'"/>: <webwork:property value="existingVersion/name" /></page:param>
	<page:param name="width">100%</page:param>
	<page:param name="description"><webwork:text name="'admin.manageversions.edit.description'"/></page:param>
	<page:param name="action">EditVersionDetails.jspa</page:param>
	<page:param name="submitId">update_submit</page:param>
	<page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
	<page:param name="cancelURI"><webwork:url page="ManageVersions.jspa"><webwork:param name="'pid'" value="pid" /></webwork:url></page:param>


    <ui:textfield label="text('common.words.name')" name="'name'" size="40" value="editedVersion/name" />
    <ui:textfield label="text('common.words.description')" name="'description'" size="60" value="editedVersion/description" />

    <ui:component label="text('version.releasedate')" name="'releaseDate'" value="editedReleaseDate" template="datepicker2.jsp">
        <ui:param name="'formname'" value="'jiraform'" />
        <ui:param name="'style'">width: 20%;</ui:param>
    </ui:component>

    <webwork:if test="/otherVersions != null && /otherVersions/empty == false">
        <ui:select name="'scheduleAfterVersion'" list="/otherVersions" label="text('admin.manageversions.schedule.before')" listKey="'id'" listValue="'name'">
            <ui:param name="'style'">width: 20%;</ui:param>
            <ui:param name="'headerrow'" value="'-- Before First Version --'" />
            <ui:param name="'headervalue'" value="-1" />
            <ui:param name="'description'"><webwork:text name="'admin.manageversions.edit.schedule.before.description'">
                <webwork:param name="'value0'"><strong></webwork:param>
                <webwork:param name="'value1'"></strong></webwork:param>
                <webwork:param name="'value2'"><br /></webwork:param>
                <webwork:param name="'value3'"><br /></webwork:param>
            </webwork:text></ui:param>
        </ui:select>
    </webwork:if>
    <ui:component name="'versionId'" template="hidden.jsp" />
    <ui:component name="'pid'" template="hidden.jsp" />
</page:applyDecorator>

</body>
</html>
