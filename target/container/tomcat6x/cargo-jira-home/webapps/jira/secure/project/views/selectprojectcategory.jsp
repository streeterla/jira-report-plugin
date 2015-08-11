
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.projects.select.project.category'"/></title>
</head>

<body>

<webwork:if test="projectCategories == null || projectCategories/size == 0">
    <page:applyDecorator name="jirapanel">
        <page:param name="title"><webwork:text name="'admin.projects.no.project.category'"/></page:param>
        <page:param name="width">100%</page:param>

        <p>
        <webwork:text name="'admin.projects.no.categories.created'"/>
        </p>
        <p>
        <webwork:text name="'admin.projects.add.new.project.category'">
            <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/admin/projectcategories/ViewProjectCategories!default.jspa"></webwork:param>
            <webwork:param name="'value1'"></a></webwork:param>
        </webwork:text>
        </p>
    </page:applyDecorator>
</webwork:if>
<webwork:else>
	<page:applyDecorator name="jiraform">
		<page:param name="title"><webwork:text name="'admin.projects.select.project.category'"/></page:param>
        <page:param name="description">
            <webwork:text name="'admin.projects.select.category.description'"/>
        </page:param>
        <page:param name="width">100%</page:param>
        <page:param name="cancelURI"><webwork:url page="ViewProject.jspa"><webwork:param name="'pid'" value="pid"/></webwork:url></page:param>
        <page:param name="action">SelectProjectCategory.jspa</page:param>
        <page:param name="submitId">select_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.words.select'"/></page:param>

        <ui:select label="text('portlet.projects.field.project.category.name')" name="'pcid'" list="projectCategories" listKey="'string('id')'" listValue="'string('name')'" template="selectmap.jsp">
            <ui:param name="'headerrow'" value="'None'" />
            <ui:param name="'headervalue'" value="-1" />
        </ui:select>
        <ui:component name="'pid'" template="hidden.jsp"/>
	</page:applyDecorator>
</webwork:else>

</body>
</html>
