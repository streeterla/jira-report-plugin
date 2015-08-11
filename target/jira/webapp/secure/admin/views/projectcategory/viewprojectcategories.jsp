
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.project.categories.view.project.categories'"/></title>
</head>

<body>

<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.project.categories.view.project.categories'"/></page:param>
    <page:param name="width">100%</page:param>

    <p>
    <webwork:text name="'admin.project.categories.description.of.table'"/>
    </p>
</page:applyDecorator>

<p>

    <table align=center bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width=90%><tr><td>
    <table border="0" cellpadding="3" cellspacing="1" width=100%>
        <tr bgcolor=#f0f0f0>
            <th>
                <b><webwork:text name="'common.words.name'"/></b>
            </th>
            <th>
                <b><webwork:text name="'common.words.description'"/></b>
            </th>
            <th>
                <b><webwork:text name="'common.concepts.projects'"/></b>
            </th>
            <th>
                <b><webwork:text name="'common.words.operations'"/></b>
            </th>
        </tr>

        <webwork:iterator value="/projectManager/projectCategories" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/odd == true">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
            <td valign=top><b><webwork:property value="string('name')"/></b></td>
            <td valign=top><webwork:property value="string('description')"/></td>
            <td valign=top>
            <webwork:iterator value="/projectManager/projectsFromProjectCategory(.)">
                <a href="<%= request.getContextPath() %>/secure/project/ViewProject.jspa?pid=<webwork:property value="string('id')" />"><webwork:property value="string('name')" /></a><br>
            </webwork:iterator>

            </td>
            <td valign=top nowrap>
                <a href="EditProjectCategory!default.jspa?id=<webwork:property value="string('id')"/>"><webwork:text name="'common.words.edit'"/></a>
                |
                <a id="del_<webwork:property value="string('name')"/>" href="DeleteProjectCategory!default.jspa?id=<webwork:property value="string('id')"/>"><webwork:text name="'common.words.delete'"/></a>
            </td>
        </tr>
        </webwork:iterator>
    </table>
    </td></tr></table>

    <p>
    <page:applyDecorator name="jiraform">
        <page:param name="action">AddProjectCategory.jspa</page:param>
        <page:param name="width">100%</page:param>
        <page:param name="submitId">add_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
        <page:param name="title"><webwork:text name="'admin.project.categories.add.new.project.category'"/></page:param>

        <ui:textfield label="text('common.words.name')" name="'name'" size="'30'" />

        <ui:textfield label="text('common.words.description')" name="'description'" size="'60'" />
    </page:applyDecorator>
    </p>

</body>
</html>
