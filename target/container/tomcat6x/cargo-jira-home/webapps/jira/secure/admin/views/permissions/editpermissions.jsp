<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.projects.editpermissions.title'"/></title>
</head>

<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.projects.editpermissions.title'"/> &mdash; <webwork:property value="scheme/string('name')"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">permissionsHelp</page:param>
    <page:param name="helpURLFragment">#adding_to_permission</page:param>
    <p>
        <webwork:text name="'admin.projects.editpermissionschemes.description.of.page'">
            <webwork:param name="'value0'">"<webwork:property value="scheme/string('name')"/>"</webwork:param>
        </webwork:text>
    </p>
    <ul class="square">
        <li><webwork:text name="'admin.projects.editpermissions.grant.permission'">
            <webwork:param name="'value0'"><a href="<webwork:url page="AddPermission!default.jspa"><webwork:param name="'schemeId'" value="scheme/string('id')"/></webwork:url>"><b></webwork:param>
            <webwork:param name="'value1'"></b></a></webwork:param>
        </webwork:text></li>
        <li><webwork:text name="'admin.projects.editpermissions.view.all.permission.schemes'">
            <webwork:param name="'value0'"><a href="ViewPermissionSchemes.jspa"><b></webwork:param>
            <webwork:param name="'value1'"></b></a></webwork:param>
        </webwork:text></li>
    </ul>
</page:applyDecorator>

<p>

    <table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="90%"><tr><td>
    <table border="0" cellpadding="3" cellspacing="1" width="100%" id="edit_project_permissions">
        <tr bgcolor="#f0f0f0">
            <td class="colHeaderLink">
                <b><webwork:text name="'admin.permission.group.project.permissions'"/></b>
            </td>
            <td class="colHeaderLink" width="25%">
                <webwork:property value="/i18nUsersGroupsRolesHeader" />
            </td>
            <td class="colHeaderLink" width="10%">
                <b><webwork:text name="'common.words.operations'"/></b>
            </td>
        </tr>
        <webwork:iterator value="projectPermissions/keySet" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
            <td valign="top"><b><webwork:text name="schemePermissions/(.)/nameKey"/></b> <br>
            <font size="1"><webwork:property value="schemePermissions/(.)/description"/></font>
            </td>
            <td valign="top">
            <webwork:iterator value="permissions(.)">
            	<img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height="8" width="8" border="0" align="absmiddle" alt="">
                <webwork:property value="../../type(string('type'))/displayName" />
                <webwork:if test="string('parameter')!= null">
                    (<webwork:property value="../../type(string('type'))/argumentDisplay(string('parameter'))" />)
                </webwork:if>
                <webwork:elseIf test="string('type') == 'reportercreate' || string('type') == 'reporter' || string('type') == 'lead' || string('type') == 'assignee'">
                </webwork:elseIf>
                <webwork:else>
                    (<webwork:text name="'admin.common.words.anyone'"/>)
                </webwork:else>
                <font size="1">
                    (<a id="del_perm_<webwork:property value="./long('permission')"/>_<webwork:property value="./string('parameter')"/>" href="<webwork:url page="DeletePermission!default.jspa"><webwork:param name="'id'" value="long('id')"/><webwork:param name="'schemeId'" value="schemeId"/></webwork:url>"><webwork:text name="'common.words.delete'"/></a>)
                </font>
                <br>
            </webwork:iterator>
            </td>
            <td nowrap valign="top">
            	<img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle" alt="">
                <a id="add_perm_<webwork:property value="."/>" href="<webwork:url page="AddPermission!default.jspa"><webwork:param name="'schemeId'" value="../schemeId"/><webwork:param name="'permissions'" value="."/></webwork:url>"><webwork:text name="'common.forms.add'"/></a>
            </td>
        </tr>
        </webwork:iterator>
    </table></td></tr>
    <tr bgcolor="#ffffff"><td><br/></td></tr>
    <tr><td>
    <table border="0" cellpadding="3" cellspacing="1" width="100%" id="edit_issue_permissions">
        <tr bgcolor="#f0f0f0">
            <td class="colHeaderLink">
                <b><webwork:text name="'admin.permission.group.issue.permissions'"/></b>
            </td>
            <td class="colHeaderLink" width="25%">
                <webwork:property value="/i18nUsersGroupsRolesHeader" />
            </td>
            <td class="colHeaderLink" width="10%">
                <b><webwork:text name="'common.words.operations'"/></b>
            </td>
        </tr>
        <webwork:iterator value="issuePermissions/keySet" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
            <td valign="top"><b><webwork:text name="schemePermissions/(.)/nameKey"/></b> <br>
            <font size="1"><webwork:property value="schemePermissions/(.)/description"/></font>
            </td>
            <td valign="top">
            <webwork:iterator value="permissions(.)">
            	<img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height="8" width="8" border="0" align="absmiddle" alt="">
                <webwork:property value="../../type(string('type'))/displayName" />
                <webwork:if test="string('parameter')!= null">
                    (<webwork:property value="../../type(string('type'))/argumentDisplay(string('parameter'))" />)
                </webwork:if>
                <webwork:elseIf test="string('type') == 'reportercreate' || string('type') == 'reporter' || string('type') == 'lead' || string('type') == 'assignee'">
                </webwork:elseIf>
                <webwork:else>
                    (<webwork:text name="'admin.common.words.anyone'"/>)
                </webwork:else>
                <font size="1">
                    (<a id="del_perm_<webwork:property value="./long('permission')"/>_<webwork:property value="./string('parameter')"/>" href="<webwork:url page="DeletePermission!default.jspa"><webwork:param name="'id'" value="long('id')"/><webwork:param name="'schemeId'" value="schemeId"/></webwork:url>"><webwork:text name="'common.words.delete'"/></a>)
                </font>
                <br>
            </webwork:iterator>
            </td>
            <td nowrap valign="top">
            	<img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle" alt="">
                <a id="add_perm_<webwork:property value="."/>" href="<webwork:url page="AddPermission!default.jspa"><webwork:param name="'schemeId'" value="../schemeId"/><webwork:param name="'permissions'" value="."/></webwork:url>"><webwork:text name="'common.forms.add'"/></a>
            </td>
        </tr>
        </webwork:iterator>
        </table></td></tr>
        <tr bgcolor="#ffffff"><td><br/></td></tr>
        <tr><td>
        <table border="0" cellpadding="3" cellspacing="1" width="100%" id="edit_votersandwatchers_permissions">
            <tr bgcolor="#f0f0f0">
                <td class="colHeaderLink">
                    <b><webwork:text name="'admin.permission.group.voters.and.watchers.permissions'"/></b>
                </td>
                <td class="colHeaderLink" width="25%">
                    <webwork:property value="/i18nUsersGroupsRolesHeader" />
                </td>
                <td class="colHeaderLink" width="10%">
                    <b><webwork:text name="'common.words.operations'"/></b>
                </td>
            </tr>
        <webwork:iterator value="votersAndWatchersPermissions/keySet" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
            <td valign="top"><b><webwork:text name="schemePermissions/(.)/nameKey"/></b> <br>
            <font size="1"><webwork:property value="schemePermissions/(.)/description"/></font>
            </td>
            <td valign="top">
            <webwork:iterator value="permissions(.)">
            	<img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height="8" width="8" border="0" align="absmiddle" alt="">
                <webwork:property value="../../type(string('type'))/displayName" />
                <webwork:if test="string('parameter')!= null">
                    (<webwork:property value="../../type(string('type'))/argumentDisplay(string('parameter'))" />)
                </webwork:if>
                <webwork:elseIf test="string('type') == 'reportercreate' || string('type') == 'reporter' || string('type') == 'lead' || string('type') == 'assignee'">
                </webwork:elseIf>
                <webwork:else>
                    (<webwork:text name="'admin.common.words.anyone'"/>)
                </webwork:else>
                <font size="1">
                    (<a id="del_perm_<webwork:property value="./long('permission')"/>_<webwork:property value="./string('parameter')"/>" href="<webwork:url page="DeletePermission!default.jspa"><webwork:param name="'id'" value="long('id')"/><webwork:param name="'schemeId'" value="schemeId"/></webwork:url>"><webwork:text name="'common.words.delete'"/></a>)
                </font>
                <br>
            </webwork:iterator>
            </td>
            <td nowrap valign="top">
            	<img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle" alt="">
                <a id="add_perm_<webwork:property value="."/>" href="<webwork:url page="AddPermission!default.jspa"><webwork:param name="'schemeId'" value="../schemeId"/><webwork:param name="'permissions'" value="."/></webwork:url>"><webwork:text name="'common.forms.add'"/></a>
            </td>
        </tr>
        </webwork:iterator>
        </table></td></tr>
        <tr bgcolor="#ffffff"><td><br/></td></tr>
        <tr><td>
        <table border="0" cellpadding="3" cellspacing="1" width="100%" id="edit_comments_permissions">
            <tr bgcolor="#f0f0f0">
                <td class="colHeaderLink">
                    <b><webwork:text name="'admin.permission.group.comments.permissions'"/></b>
                </td>
                <td class="colHeaderLink" width="25%">
                    <webwork:property value="/i18nUsersGroupsRolesHeader" />
                </td>
                <td class="colHeaderLink" width="10%">
                    <b><webwork:text name="'common.words.operations'"/></b>
                </td>
            </tr>
        <webwork:iterator value="commentsPermissions/keySet" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
            <td valign="top"><b><webwork:text name="schemePermissions/(.)/nameKey"/></b> <br>
            <font size="1"><webwork:property value="schemePermissions/(.)/description"/></font>
            </td>
            <td valign="top">
            <webwork:iterator value="permissions(.)">
            	<img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height="8" width="8" border="0" align="absmiddle" alt="">
                <webwork:property value="../../type(string('type'))/displayName" />
                <webwork:if test="string('parameter')!= null">
                    (<webwork:property value="../../type(string('type'))/argumentDisplay(string('parameter'))" />)
                </webwork:if>
                <webwork:elseIf test="string('type') == 'reportercreate' || string('type') == 'reporter' || string('type') == 'lead' || string('type') == 'assignee'">
                </webwork:elseIf>
                <webwork:else>
                    (<webwork:text name="'admin.common.words.anyone'"/>)
                </webwork:else>
                <font size="1">
                    (<a id="del_perm_<webwork:property value="./long('permission')"/>_<webwork:property value="./string('parameter')"/>" href="<webwork:url page="DeletePermission!default.jspa"><webwork:param name="'id'" value="long('id')"/><webwork:param name="'schemeId'" value="schemeId"/></webwork:url>"><webwork:text name="'common.words.delete'"/></a>)
                </font>
                <br>
            </webwork:iterator>
            </td>
            <td nowrap valign="top">
            	<img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle" alt="">
                <a id="add_perm_<webwork:property value="."/>" href="<webwork:url page="AddPermission!default.jspa"><webwork:param name="'schemeId'" value="../schemeId"/><webwork:param name="'permissions'" value="."/></webwork:url>"><webwork:text name="'common.forms.add'"/></a>
            </td>
        </tr>
        </webwork:iterator>
        </table></td></tr>
        <tr bgcolor="#ffffff"><td><br/></td></tr>
        <tr><td>
        <table border="0" cellpadding="3" cellspacing="1" width="100%" id="edit_attachments_permissions">
            <tr bgcolor="#f0f0f0">
                <td class="colHeaderLink">
                    <b><webwork:text name="'admin.permission.group.attachments.permissions'"/></b>
                </td>
                <td class="colHeaderLink" width="25%">
                    <webwork:property value="/i18nUsersGroupsRolesHeader" />
                </td>
                <td class="colHeaderLink" width="10%">
                    <b><webwork:text name="'common.words.operations'"/></b>
                </td>
            </tr>
        <webwork:iterator value="attachmentsPermissions/keySet" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
            <td valign="top"><b><webwork:text name="schemePermissions/(.)/nameKey"/></b> <br>
            <font size="1"><webwork:property value="schemePermissions/(.)/description"/></font>
            </td>
            <td valign="top">
            <webwork:iterator value="permissions(.)">
            	<img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height="8" width="8" border="0" align="absmiddle" alt="">
                <webwork:property value="../../type(string('type'))/displayName" />
                <webwork:if test="string('parameter')!= null">
                    (<webwork:property value="../../type(string('type'))/argumentDisplay(string('parameter'))" />)
                </webwork:if>
                <webwork:elseIf test="string('type') == 'reportercreate' || string('type') == 'reporter' || string('type') == 'lead' || string('type') == 'assignee'">
                </webwork:elseIf>
                <webwork:else>
                    (<webwork:text name="'admin.common.words.anyone'"/>)
                </webwork:else>
                <font size="1">
                    (<a id="del_perm_<webwork:property value="./long('permission')"/>_<webwork:property value="./string('parameter')"/>" href="<webwork:url page="DeletePermission!default.jspa"><webwork:param name="'id'" value="long('id')"/><webwork:param name="'schemeId'" value="schemeId"/></webwork:url>"><webwork:text name="'common.words.delete'"/></a>)
                </font>
                <br>
            </webwork:iterator>
            </td>
            <td nowrap valign="top">
            	<img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle" alt="">
                <a id="add_perm_<webwork:property value="."/>" href="<webwork:url page="AddPermission!default.jspa"><webwork:param name="'schemeId'" value="../schemeId"/><webwork:param name="'permissions'" value="."/></webwork:url>"><webwork:text name="'common.forms.add'"/></a>
            </td>
        </tr>
        </webwork:iterator>
        </table></td></tr>
        <tr bgcolor="#ffffff"><td><br/></td></tr>
        <tr><td>
        <table border="0" cellpadding="3" cellspacing="1" width="100%" id="edit_timetracking_permissions">
            <tr bgcolor="#f0f0f0">
                <td class="colHeaderLink">
                    <b><webwork:text name="'admin.permission.group.time.tracking.permissions'"/></b>
                </td>
                <td class="colHeaderLink" width="25%">
                    <webwork:property value="/i18nUsersGroupsRolesHeader" />
                </td>
                <td class="colHeaderLink" width="10%">
                    <b><webwork:text name="'common.words.operations'"/></b>
                </td>
            </tr>
        <webwork:iterator value="timeTrackingPermissions/keySet" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
            <td valign="top"><b><webwork:text name="schemePermissions/(.)/nameKey"/></b> <br>
            <font size="1"><webwork:property value="schemePermissions/(.)/description"/></font>
            </td>
            <td valign="top">
            <webwork:iterator value="permissions(.)">
            	<img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height="8" width="8" border="0" align="absmiddle" alt="">
                <webwork:property value="../../type(string('type'))/displayName" />
                <webwork:if test="string('parameter')!= null">
                    (<webwork:property value="../../type(string('type'))/argumentDisplay(string('parameter'))" />)
                </webwork:if>
                <webwork:elseIf test="string('type') == 'reportercreate' || string('type') == 'reporter' || string('type') == 'lead' || string('type') == 'assignee'">
                </webwork:elseIf>
                <webwork:else>
                    (<webwork:text name="'admin.common.words.anyone'"/>)
                </webwork:else>
                <font size="1">
                    (<a id="del_perm_<webwork:property value="./long('permission')"/>_<webwork:property value="./string('parameter')"/>" href="<webwork:url page="DeletePermission!default.jspa"><webwork:param name="'id'" value="long('id')"/><webwork:param name="'schemeId'" value="schemeId"/></webwork:url>"><webwork:text name="'common.words.delete'"/></a>)
                </font>
                <br>
            </webwork:iterator>
            </td>
            <td nowrap valign="top">
            	<img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle" alt="">
                <a id="add_perm_<webwork:property value="."/>" href="<webwork:url page="AddPermission!default.jspa"><webwork:param name="'schemeId'" value="../schemeId"/><webwork:param name="'permissions'" value="."/></webwork:url>"><webwork:text name="'common.forms.add'"/></a>
            </td>
        </tr>
        </webwork:iterator>
        </table>
    </td></tr></table>
    </body>
</html>
