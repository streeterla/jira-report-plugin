<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.projects.create.a.new.component'"/></title>
</head>
<body>
<page:applyDecorator name="jiraform">
	<page:param name="title"><webwork:text name="'admin.projects.add.a.component'"/></page:param>
	<page:param name="width">100%</page:param>
	<page:param name="description"><webwork:text name="'admin.projects.component.page.description'">
	    <webwork:param name="'value0'"><a href="ViewProject.jspa?pid=<webwork:property value="pid" />"><webwork:property value="project/string('name')" /></a></webwork:param>
	</webwork:text></page:param>
	<page:param name="action">AddComponent.jspa</page:param>
	<page:param name="submitId">add_submit</page:param>
	<page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
	<page:param name="cancelURI"><webwork:url page="ViewProject.jspa"><webwork:param name="'pid'" value="pid" /></webwork:url></page:param>

	<ui:component label="text('common.concepts.project')" name="'project/string('name')'" template="textlabel.jsp" />
	<ui:textfield label="text('common.words.name')" name="'name'">
        <ui:param name="'mandatory'" value="'true'" />
    </ui:textfield>
	<ui:textarea label="text('common.words.description')" name="'description'" rows="5" />
    <webwork:if test="enterprise == true">
        <ui:component label="text('admin.projects.component.lead')" name="'componentLead'" template="userselect.jsp">
            <ui:param name="'formname'" value="'jiraform'" />
            <ui:param name="'size'">20</ui:param>
            <ui:param name="'description'"><webwork:text name="'admin.projects.component.lead.description'"/></ui:param>
        </ui:component>
    </webwork:if>
	<ui:component name="'pid'" template="hidden.jsp" />
</page:applyDecorator>
</body>
</html>
