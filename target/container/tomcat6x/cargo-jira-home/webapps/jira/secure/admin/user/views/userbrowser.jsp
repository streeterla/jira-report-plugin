<%@ page import="com.atlassian.jira.ManagerFactory,
                 com.atlassian.jira.config.properties.APKeys"%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.menu.usersandgroups.user.browser'"/></title>
</head>
<body>
<% boolean isExternalUserManagementDisabled = !ManagerFactory.getApplicationProperties().getOption(APKeys.JIRA_OPTION_USER_EXTERNALMGT); %>
<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'admin.menu.usersandgroups.user.browser'"/></page:param>
    <page:param name="instructions">

        <p>
        <webwork:text name="'admin.userbrowser.description'"/>
        </p>

        <webwork:if test="/hasReachedUserLimit == true">
            <div class="noteBox">
                <webwork:text name="'admin.userbrowser.user.limit.warning'">
                    <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/admin/ViewLicense!default.jspa"></webwork:param>
                    <webwork:param name="'value1'"></a></webwork:param>
                </webwork:text>
            </div>
            <br>
        </webwork:if>
        <div class="infoBox">
        <webwork:text name="'admin.userbrowser.how.many.users'">
            <webwork:param name="'value0'"><webwork:property value="/userUtil/totalUserCount"/></webwork:param>
            <webwork:param name="'value1'"><webwork:property value="/userUtil/activeUserCount"/></webwork:param>
        </webwork:text>
        </div>
        <br>

        <% if (isExternalUserManagementDisabled) { %>
        <p>
            <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height=8 width=8 border=0 align=absmiddle>
            <strong><a id="add_user" href="<%= request.getContextPath() %>/secure/admin/user/AddUser!default.jspa"><webwork:text name="'admin.userbrowser.add.user'"/></a></strong>
        </p>
        <% } %>

        <p>
        <webwork:text name="'admin.userbrowser.displaying.users'">
            <webwork:param name="'value0'"><strong><webwork:property value="niceStart" /></strong></webwork:param>
            <webwork:param name="'value1'"><strong><webwork:property value="niceEnd" /></strong></webwork:param>
            <webwork:param name="'value2'"><strong><webwork:property value="users/size" /></strong></webwork:param>
        </webwork:text>

        <font size=1>
        (<a href="UserBrowser.jspa?emailFilter=&group=&max=<webwork:property value="filter/max"/>"><webwork:text name="'admin.userbrowser.reset.filter'"/></a>)
        </font>
    </page:param>
    <page:param name="width">100%</page:param>
    <page:param name="action">UserBrowser.jspa</page:param>
    <page:param name="columns">13</page:param>
    <page:param name="autoSelectFirst">false</page:param>

    <webwork:property value="filter">
    <tr bgcolor="#ffffff">
        <td bgcolor="#fffff0" align="right"><strong><webwork:text name="'admin.userbrowser.users.per.page'"/>:</strong></td>
        <ui:select label="text('admin.userbrowser.users.per.page')" name="'max'" theme="'single'"
            list="/maxValues" listKey="'.'" listValue="'.'" >
            <ui:param name="'headerrow'" value="text('common.words.all')" />
            <ui:param name="'headervalue'" value="'1000000'" />
        </ui:select>

        <td bgcolor="#fffff0" align="right"><strong><webwork:text name="'admin.userbrowser.username.contains'"/>:</strong></td>
        <ui:textfield label="text('admin.userbrowser.username.contains')" name="'userNameFilter'" size="15" theme="'single'" />

        <td bgcolor="#fffff0" align="right"><strong><webwork:text name="'admin.userbrowser.userfullname.contains'"/>:</strong></td>
        <ui:textfield label="text('admin.userbrowser.userfullname.contains')" name="'fullNameFilter'" size="15" theme="'single'" />

        <td bgcolor="#fffff0" align="right"><strong><webwork:text name="'admin.userbrowser.email.contains'"/>:</strong></td>
        <ui:textfield label="text('admin.userbrowser.email.contains')" name="'emailFilter'" size="15" theme="'single'" />

        <td bgcolor="#fffff0" align="right"><strong><webwork:text name="'admin.userbrowser.in.group'"/>:</strong></td>
        <ui:select label="text('admin.userbrowser.in.group')" name="'group'" theme="'single'"
            list="/groups" listKey="'name'" listValue="'name'">
            <ui:param name="'headerrow'" value="text('common.filters.any')" />
            <ui:param name="'headervalue'" value="''" />
        </ui:select>

        <td>
            <input type="submit" value="<webwork:text name="'navigator.tabs.filter'"/>">
        </td>
    </tr>
    </webwork:property>
</page:applyDecorator>
<br>

<table  class="grid" width="100%" id="user_browser_table">
    <tr>
        <th>
            <webwork:text name="'common.words.username'"/>
        </th>
        <th>
            <webwork:text name="'common.words.email'"/>
        </th>
        <th>
            <webwork:text name="'common.words.fullname'"/>
        </th>
        <th>
            <webwork:text name="'login.details'"/>
        </th>
        <th>
            <webwork:text name="'common.words.groups'"/>
        </th>
        <th class="minNoWrap">
            <webwork:text name="'common.words.operations'"/>
        </th>
    </tr>

    <webwork:iterator value="currentPage" status="'status'">
    <tr class="vcard" <webwork:if test="@status/modulus(2) == 0">bgcolor="#fffff0"</webwork:if>
            <webwork:else>bgcolor="#ffffff"</webwork:else>>
        <td><a id="<webwork:property value="name"/>" href="<webwork:url page="ViewUser.jspa"><webwork:param name="'name'" value="name"/></webwork:url>"><span class="username"><webwork:property value="name"/></span></a></td>
        <td><a href="<webwork:url page="ViewUser.jspa"><webwork:param name="'name'" value="name"/></webwork:url>"><span class="email"><webwork:property value="email"/></span></a></td>
        <td><span class="fn"><webwork:property value="fullName"/></span></td>
        <td class="minNoWrap">
            <webwork:if test="/everLoggedIn(.) == true">
                <strong><webwork:text name="'common.concepts.count'"/>:</strong> <webwork:property value="/loginCount(.)" /><br />
                <strong><webwork:text name="'common.concepts.last'"/>:</strong> <webwork:property value="/lastLogin(.)" /><br />
                <br />
            </webwork:if>
            <webwork:else>
                <webwork:text name="'login.not.recorded'"/>
            </webwork:else>
            <webwork:if test="/elevatedSecurityCheckRequired(.) == true">
                <strong><i><webwork:text name="'login.elevated.security.check.required'"/></i></strong><br />
                <strong><webwork:text name="'login.last.failed.login'"/>:</strong> <span id="lastFailedLogin"><webwork:property value="/lastFailedLogin(.)" /></span><br />
                <strong><webwork:text name="'login.current.failed.login.count'"/>:</strong> <span id="currentFailedLoginCount"><webwork:property value="/currentFailedLoginCount(.)" /></span><br />
                <strong><webwork:text name="'login.total.failed.login.count'"/>:</strong> <span id="totalFailedLoginCount"><webwork:property value="/totalFailedLoginCount(.)" /></span><br />
            </webwork:if>
        </td>
        <td  nowrap>
            <webwork:iterator value="groups">
                <a href="<webwork:url page="ViewGroup.jspa"><webwork:param name="'name'" value="."/></webwork:url>"><webwork:property value="."/></a><br>
            </webwork:iterator>
        </td>
        <td class="minNoWrap">
            <% if (isExternalUserManagementDisabled) { %>
            <a class="editgroups_link" id="editgroups_<webwork:property value="name"/>" href="<webwork:url page="EditUserGroups!default.jspa"><webwork:param name="'name'" value="name" /><webwork:param name="'returnUrl'" value="'UserBrowser.jspa'" /></webwork:url>"><webwork:text name="'common.words.groups'"/></a>
            | <%  }%>
            <a id="projectroles_link_<webwork:property value="name"/>" href="<webwork:url page="ViewUserProjectRoles!default.jspa"><webwork:param name="'name'" value="name" /><webwork:param name="'returnUrl'" value="'UserBrowser.jspa'" /></webwork:url>"><webwork:text name="'common.words.project.roles'"/></a>
            <% if (isExternalUserManagementDisabled) { %>
                <webwork:if test="/remoteUserPermittedToEditSelectedUser(.) == true">
                    | <a id="edituser_link_<webwork:property value="name"/>" href="<webwork:url page="EditUser!default.jspa"><webwork:param name="'editName'" value="name" /><webwork:param name="'returnUrl'" value="'UserBrowser.jspa'" /></webwork:url>"><webwork:text name="'common.words.edit'"/></a>
                    | <a id="deleteuser_link_<webwork:property value="name"/>" href="<webwork:url page="DeleteUser!default.jspa"><webwork:param name="'name'" value="name" /><webwork:param name="'returnUrl'" value="'UserBrowser.jspa'" /></webwork:url>"><webwork:text name="'common.words.delete'"/></a>
                </webwork:if>
            <%  }%>
            <webwork:if test="/elevatedSecurityCheckRequired(.) == true">
                | <br /><br />
                <a href="<webwork:url page="ResetFailedLoginCount.jspa"><webwork:param name="'name'" value="name" /><webwork:param name="'returnUrl'" value="'secure/admin/user/UserBrowser.jspa'"/></webwork:url>"><webwork:text name="'admin.resetfailedlogin.title'"/></a>
            </webwork:if>
        </td>
    </tr>
    </webwork:iterator>
</table>

<p align="center">
    <webwork:if test="filter/start > 0">
		<a href="<webwork:url page="UserBrowser.jspa"><webwork:param name="'start'" value="filter/previousStart" /></webwork:url>">&lt;&lt; <webwork:text name="'common.forms.previous'"/></a>
	</webwork:if>

    <webwork:property value = "pager/pages(/browsableItems)">
        <webwork:if test="size > 1">
            <webwork:iterator value="." status="'pagerStatus'">
                <webwork:if test="currentPage == true"><strong><webwork:property value="pageNumber" /></strong></webwork:if>
                <webwork:else>
                    <a href="<webwork:url page="UserBrowser.jspa"><webwork:param name="'start'" value="start" /></webwork:url>"><webwork:property value="pageNumber" /></a>
                </webwork:else>
                <webwork:if test="@pagerStatus/last == false"> | </webwork:if>
            </webwork:iterator>
        </webwork:if>
    </webwork:property>

	<webwork:if test="filter/end < users/size">
		<a href="<webwork:url page="UserBrowser.jspa"><webwork:param name="'start'" value="filter/nextStart" /></webwork:url>"><webwork:text name="'common.forms.next'"/> &gt;&gt;</a>
	</webwork:if>
</p>


</body>
</html>
