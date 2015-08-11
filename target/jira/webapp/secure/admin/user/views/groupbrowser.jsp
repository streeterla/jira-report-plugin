<%@ page import="java.util.*,
                 com.atlassian.jira.config.properties.APKeys,
                 com.atlassian.jira.ManagerFactory"%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.menu.usersandgroups.group.browser'"/></title>
</head>

<body>

<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.menu.usersandgroups.group.browser'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">groups</page:param>    

    <p>
	<webwork:text name="'admin.usersandgroups.group.browser.description.1'"/> <webwork:if test="/externalUserManagementEnabled == false"><webwork:text name="'admin.usersandgroups.group.browser.description.2'"/> <p><webwork:text name="'admin.usersandgroups.group.browser.description.3'"/></p></webwork:if>
	</p>

    <webwork:if test="/externalUserManagementEnabled == false">
        <ul class="square">
            <li><b><a id="bulk_edit_groups" href="BulkEditUserGroups!default.jspa"><webwork:text name="'admin.bulkeditgroups.title'"/></a></b></li>
        </ul>
    </webwork:if>
</page:applyDecorator>

<p>

	<table cellspacing="0" cellpadding="0" border="0" width="100%"><tr><td valign="top">

	<p>
    <webwork:text name="'admin.usersandgroups.displaying.x.to.y.of.z'">
	    <webwork:param name="'value0'"><b><webwork:property value="niceStart" /></b></webwork:param>
	    <webwork:param name="'value1'"><b><webwork:property value="niceEnd" /></b></webwork:param>
        <webwork:param name="'value2'"><b><webwork:property value="browsableItems/size" /></b></webwork:param>
    </webwork:text>
    </p>

<table id="group_browser_table" class="grid" border="0" width="100%">
	<tr bgcolor="#f0f0f0">
		<th width="40%">
			<webwork:text name="'admin.usersandgroups.group.name'"/>
		</th>
		<th width="20%">
			<webwork:text name="'admin.common.words.users'"/>
		</th>
        <th width="30%">
			<webwork:text name="'admin.menu.schemes.permission.schemes'"/>
		</th>
        <webwork:if test="/externalUserManagementEnabled == false">
            <th width="10%" nowrap>
                <webwork:text name="'common.words.operations'"/>
            </th>
        </webwork:if>
    </tr>

	<webwork:iterator value="currentPage" status="'status'">
	<tr <webwork:if test="@status/modulus(2) == 0">bgcolor="#fffff0"</webwork:if>
            <webwork:else>bgcolor="#ffffff"</webwork:else>>
		<td valign="top"><a href="<webwork:url page="ViewGroup.jspa"><webwork:param name="'name'" value="name"/></webwork:url>"><webwork:property value="name"/></a></td>
		<td valign="top"><webwork:property value="users/size"/>
		<font size="1">(<a href="<webwork:url value="'UserBrowser.jspa'" ><webwork:param name="'group'" value="name" /><webwork:param name="'emailFilter'" value="''" /></webwork:url>"><webwork:text name="'common.words.view'"/></a>)</font></td>
        <td>
            <webwork:iterator value="/permissionSchemes(./name)">
                <img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height="8" width="8" border="0" align="absmiddle">
                <a href="<%= request.getContextPath() %>/secure/admin/EditPermissions!default.jspa?schemeId=<webwork:property value="./long('id')"/>"><webwork:property value="./string('name')" /></a><br>
            </webwork:iterator>
        </td>
        <webwork:if test="/externalUserManagementEnabled == false && /userAbleToDeleteGroup(name) == true">
            <td valign="top" nowrap>
                <a id="del_<webwork:property value="name"/>" href="<webwork:url value="'DeleteGroup!default.jspa'" ><webwork:param name="'name'" value="name" /></webwork:url>"><webwork:text name="'common.words.delete'"/></a> |
                <a id="edit_members_of_<webwork:property value="name"/>" href="<webwork:url value="'BulkEditUserGroups!default.jspa'" ><webwork:param name="'selectedGroupsStr'" value="name" /></webwork:url>"><webwork:text name="'admin.usersandgroups.edit.members'"/></a>
            </td>
        </webwork:if>
    </tr>
	</webwork:iterator>
</table>

<p align="center">
    <webwork:if test="filter/start > 0">
		<a href="<webwork:url page="GroupBrowser.jspa"><webwork:param name="'start'" value="filter/previousStart" /><webwork:param name="'nameFilter'" value="filter/nameFilter"/></webwork:url>">&lt&lt; <webwork:text name="'common.forms.previous'"/></a>
	</webwork:if>

	<webwork:if test="filter/end < browsableItems/size">
		<a href="<webwork:url page="GroupBrowser.jspa"><webwork:param name="'start'" value="filter/nextStart" /><webwork:param name="'nameFilter'" value="filter/nameFilter"/></webwork:url>"><webwork:text name="'common.forms.next'"/> &gt;&gt;</a>
	</webwork:if>
</p>

</td>

<td>&nbsp;&nbsp;&nbsp;</td>

<td width="250" valign="top" bgcolor="#ffffff">
    <webwork:if test="/externalUserManagementEnabled == false">
        <form action="GroupBrowser!add.jspa" method="post">
            <webwork:component name="'atl_token'" value="/xsrfToken" template="hidden.jsp"/>

            <table class="grid" id="add_group" border="0" width="100%" bgcolor="#666666">
                <tr>
                    <td bgcolor="#f0f0f0">
                        <h3 class="formtitle"><webwork:text name="'admin.usersandgroups.add.group'"/></h3>
                    </td>
                </tr>

                <ui:textfield label="text('common.words.name')" labelposition="'top'" name="'addName'" size="20" />

                <tr>
                    <td bgcolor="#f0f0f0" align="center">
                        <input type="submit" name="add_group" value="<webwork:text name="'admin.usersandgroups.add.group'"/>">
                    </td>
                </tr>
            </table>
        </form>
    </webwork:if>

    <form action="GroupBrowser.jspa" method="post">
	<table class="grid" border="0" width="100%" bgcolor="#666666">
	<tr>
		<td bgcolor="#f0f0f0">
			<h3 class="formtitle"><webwork:text name="'admin.usersandgroups.filter.group'"/></h3>

			<font size="1">
				(<a href="GroupBrowser.jspa?nameFilter="><webwork:text name="'admin.usersandgroups.clear.filter'"/></a>)
			</font>
		</td>
	</tr>

	<webwork:property value="filter">
		<ui:select label="text('admin.usersandgroups.groups.per.page')" labelposition="'top'" name="'max'"
			list="/maxValues" listKey="'.'" listValue="'.'" >
			<ui:param name="'headerrow'" value="''" />
		</ui:select>

		<ui:textfield label="text('admin.usersandgroups.name.contains')" labelposition="'top'" name="'nameFilter'" size="20" />
	</webwork:property>

	<tr>
	<td bgcolor="#f0f0f0" align="center">
		<input type="submit" value="<webwork:text name="'admin.usersandgroups.filter'"/>">
	</td>
	</tr>
	</table>
	</form>


</td>

</tr>
</table>

</body>
</html>
