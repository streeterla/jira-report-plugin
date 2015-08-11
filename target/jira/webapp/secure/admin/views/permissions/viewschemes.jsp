
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.schemes.permissions.permission.schemes'"/></title>
</head>

<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.schemes.permissions.permission.schemes'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">permissionsHelp</page:param>

    <p>
    <webwork:text name="'admin.schemes.permissions.description'"/>
    <p>
    <webwork:text name="'admin.schemes.permissions.description2'"/>
    </p>
    <webwork:text name="'admin.schemes.permissions.table.below'">
        <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/admin/jira/GlobalPermissions!default.jspa"></webwork:param>
        <webwork:param name="'value1'"></a></webwork:param>
    </webwork:text>
    <p>
</page:applyDecorator>

    <p>

    <table align=center bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width=90%><tr><td>
    <table border="0" cellpadding="3" cellspacing="1" width="100%" id="permission_schemes_table">
        <tr bgcolor=#f0f0f0>
            <td class="colHeaderLink">
                <b><webwork:text name="'common.words.name'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'common.concepts.projects'"/></b>
            </td>
            <td class="colHeaderLink">
                 <b><webwork:text name="'common.words.operations'"/></b>
            </td>
        </tr>

        <webwork:iterator value="schemes" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
            <td valign=top>
                <b><a href="EditPermissions!default.jspa?schemeId=<webwork:property value="long('id')"/>"><webwork:property value="string('name')"/></a></b><br>
                <webwork:property value="string('description')"/></td>
            <td valign=top nowrap>
            <webwork:iterator value="projects(.)">
            	<img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height=8 width=8 border=0 align=absmiddle>
                <a href="<%= request.getContextPath() %>/secure/project/ViewProject.jspa?pid=<webwork:property value="long('id')" />"><webwork:property value="string('name')" /></a><br>
            </webwork:iterator>
            </td>
            <td valign=top align=left nowrap>
                <a id="<webwork:property value="long('id')"/>_edit" href="EditPermissions!default.jspa?schemeId=<webwork:property value="long('id')"/>" title="<webwork:text name="'admin.schemes.permissions.change.permissions.for.scheme'"/>"><webwork:text name="'admin.common.words.permissions'"/></a>
                |
                <a id="<webwork:property value="long('id')"/>_copy" href="<webwork:url page="CopyPermissionScheme.jspa"><webwork:param name="'schemeId'" value="long('id')"/></webwork:url>" title="<webwork:text name="'admin.schemes.permissions.make.a.copy.of.scheme'"/>"><webwork:text name="'common.words.copy'"/></a>
                |
                <a id="<webwork:property value="long('id')"/>_edit_details" href="EditPermissionScheme!default.jspa?schemeId=<webwork:property value="long('id')"/>" title="<webwork:text name="'admin.schemes.permissions.edit.name.and.description.of.scheme'"/>"><webwork:text name="'common.words.edit'"/></a>
                <%-- You cannot delete the default permission scheme (0) --%>
                <webwork:if test="long('id') != 0">
                    |
                    <a id="del_<webwork:property value="string('name')"/>" href="DeletePermissionScheme!default.jspa?schemeId=<webwork:property value="long('id')"/>" title="<webwork:text name="'admin.schemes.permissions.delete.this.scheme'"/>"><webwork:text name="'common.words.delete'"/></a>
                </webwork:if>
            </td>
        </tr>
        </webwork:iterator>
        <webwork:if test="schemes/size == 0">
        <tr bgcolor=#ffffff>
            <td colspan=3><webwork:text name="'admin.schemes.permissions.no.schemes.configured'"/></td>
        </tr>
        </webwork:if>
    </table>
    </td></tr></table>

    <p>
    <table align=center border="0" cellpadding="0" cellspacing="0" width=90%>
    <tr>
    <td align="center">
    <table border="0" cellpadding="3" cellspacing="1">
    <tr>
        <td><a href="AddPermissionScheme!default.jspa"><webwork:text name="'admin.schemes.permissions.add.permission.schemes'"/></a></td>
    </tr>
    </table>
    </td>
    </tr>
    </table>
    </p>

</body>
</html>
