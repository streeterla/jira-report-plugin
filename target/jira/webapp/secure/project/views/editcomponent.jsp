<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.projects.component.edit.component'"/>: <webwork:property value="existingEntity/string('name')" /></title>
</head>
<body>
<page:applyDecorator name="jiraform">
	<page:param name="title"><webwork:text name="'admin.projects.component.edit.component'"/>: <webwork:property value="existingEntity/string('name')" /></page:param>
	<page:param name="width">100%</page:param>
	<page:param name="action">EditComponent.jspa</page:param>
	<page:param name="submitId">update_submit</page:param>
	<page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
	<page:param name="cancelURI"><webwork:url page="ViewProject.jspa"><webwork:param name="'pid'" value="pid" /></webwork:url></page:param>

	<ui:textfield label="text('common.words.name')" name="'name'" size="40" value="editedEntity/string('name')" />
    <ui:textarea label="text('common.words.description')" name="'description'" rows="5" value="editedEntity/string('description')"/>
    <webwork:if test="enterprise == true">
        <ui:component label="text('admin.projects.component.lead')" name="'componentLead'" template="userselect.jsp">
            <ui:param name="'formname'" value="'jiraform'" />
            <ui:param name="'size'">20</ui:param>
            <ui:param name="'description'" value="'(Enter the username of the component lead.)'"/>
        </ui:component>
    </webwork:if>
	<ui:component name="'id'" template="hidden.jsp" />
    <ui:component name="'pid'" template="hidden.jsp" />
</page:applyDecorator>
</body>
</html>
