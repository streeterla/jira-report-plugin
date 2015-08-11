<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.roles.view.roles'"/></title>
</head>

<body>

<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.roles.view.roles'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">project_roles</page:param>
    <p>
        <webwork:text name="'admin.roles.the.table.below'">
           <webwork:param name="'value0'"><p/></webwork:param>
        </webwork:text>
    </p>
</page:applyDecorator>

<p>

    <webwork:if test="/roles/size() > 0">

    <table class="grid defaultWidth centered">

        <tr>
            <th>
                <webwork:text name="'admin.projectroles.view.project.role.name'"/>
            </th>
            <th>
                <webwork:text name="'common.words.description'"/>
            </th>
            <th>
                <b><webwork:text name="'common.words.operations'"/></b>
            </th>
        </tr>

        <webwork:iterator value="/roles" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/odd == true">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
            <td valign=top width="20%">
                <b><webwork:property value="name"/></b></td>
            <td>
                <webwork:property value="description"/>
            </td>
            <td valign=top nowrap>
                <a href="ViewProjectRoleUsage.jspa?id=<webwork:property value="id"/>" id="view_<webwork:property value="name"/>"><webwork:text name="'admin.roles.view.usages'"/></a>
                |
                <a href="ViewDefaultProjectRoleActors.jspa?id=<webwork:property value="id"/>" id="manage_<webwork:property value="name"/>"><webwork:text name="'admin.roles.manage.default.members'"/></a>
                |
                <a href="EditProjectRole!default.jspa?id=<webwork:property value="id"/>" id="edit_<webwork:property value="name"/>"><webwork:text name="'common.words.edit'"/></a>
                |
                <a href="DeleteProjectRole!default.jspa?id=<webwork:property value="id"/>" id="delete_<webwork:property value="name"/>"><webwork:text name="'common.words.delete'"/></a>
            </td>
        </tr>
        </webwork:iterator>
    </table>
    </webwork:if>


    <p>
    <page:applyDecorator name="jiraform">
        <page:param name="action">AddProjectRole.jspa</page:param>
        <page:param name="width">100%</page:param>
        <page:param name="submitId">role_submit</page:param>
        <page:param name="submitName"><webwork:text name="'admin.roles.add.new.role'"/></page:param>
        <page:param name="title"><webwork:text name="'admin.roles.add.new.role'"/></page:param>

        <ui:textfield label="text('common.words.name')" name="'name'" size="'30'" />

        <ui:textfield label="text('common.words.description')" name="'description'" size="'60'" />
    </page:applyDecorator>
    </p>
</p>

</body>
</html>
