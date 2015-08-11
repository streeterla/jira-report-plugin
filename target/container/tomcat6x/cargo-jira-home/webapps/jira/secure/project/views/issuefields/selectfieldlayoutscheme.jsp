<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.projects.fieldconfigscheme.select.field.config.scheme'"/></title>
</head>

<body>

<webwork:if test="/fieldLayoutSchemes == null || /fieldLayoutSchemes/empty == true">
    <page:applyDecorator name="jirapanel">
        <page:param name="title"><webwork:text name="'admin.projects.fieldconfigscheme.field.layout.config.association'"/></page:param>
        <page:param name="width">100%</page:param>
        <p>
        <webwork:text name="'admin.projects.fieldconfigscheme.none.set.up'"/>
        </p>
        <p>
        <a href="<%= request.getContextPath() %>/secure/admin/AddFieldLayoutScheme!default.jspa">Add</a> a new field layout scheme.
        </p>
    </page:applyDecorator>
</webwork:if>
<webwork:else>
	<page:applyDecorator name="jiraform">
		<page:param name="title"><webwork:text name="'admin.projects.fieldconfigscheme.field.layout.config.association'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="cancelURI"><webwork:url page="ViewProject.jspa"><webwork:param name="'pid'" value="/projectId"/></webwork:url></page:param>
        <page:param name="action">SelectFieldLayoutScheme.jspa</page:param>
        <page:param name="submitId">associate_submit</page:param>
        <page:param name="submitName"><webwork:text name="'admin.projects.schemes.associate'"/></page:param>
        <page:param name="description">
            <webwork:text name="'admin.projects.fieldconfigscheme.page.description'">
                <webwork:param name="'value0'"><a href="ViewProject.jspa?pid=<webwork:property value="projectId" />"><b><webwork:property value="/project/string('name')"/></b></a></webwork:param>
            </webwork:text>
        </page:param>

        <ui:select label="text('admin.common.words.scheme')" name="'schemeId'" list="/fieldLayoutSchemes" listKey="'./id'" listValue="'./name'">
            <ui:param name="'headerrow'" value="'None'" />
            <ui:param name="'headervalue'" value="''" />
        </ui:select>

        <ui:component name="'projectId'" template="hidden.jsp"/>
	</page:applyDecorator>
</webwork:else>

</body>
</html>
