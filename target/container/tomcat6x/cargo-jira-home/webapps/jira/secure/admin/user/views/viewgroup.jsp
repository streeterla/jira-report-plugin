<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.viewgroup.title'"/></title>
</head>
<body>
<webwork:if test="group != null">
    <page:applyDecorator name="jirapanel">
        <page:param name="title"><webwork:text name="'admin.common.words.group'"/>: <webwork:property value="group/name" /></page:param>
        <page:param name="width">100%</page:param>
        <webwork:property value="group">
        <p>
            <b><webwork:text name="'admin.usersandgroups.group.name'"/></b> <webwork:property value="./name" /><br>
            <b><webwork:text name="'admin.common.words.users'"/>: </b> <webwork:property value="./users/size"/>
            <font size=1>( <a id="view_group_members" href="<webwork:url value="'UserBrowser.jspa'" ><webwork:param name="'emailFilter'" value="''" /><webwork:param name="'group'" value="name" /></webwork:url>"><webwork:text name="'common.words.view'"/></a>
                <webwork:if test="/userAbleToDeleteGroup(./name) == true">
                    | <a id="edit_members_of_<webwork:property value="name"/>" href="<webwork:url value="'BulkEditUserGroups!default.jspa'" ><webwork:param name="'selectedGroupsStr'" value="name" /></webwork:url>"><webwork:text name="'admin.usersandgroups.edit.members'"/></a>
                </webwork:if>
                )</font><br>
            <br>
            <b><webwork:text name="'admin.schemes.permissions.permission.schemes'"/>:</b><br>
            <webwork:property value="/permissionSchemes(./name)">
                <webwork:if test="./empty == true">
                    &nbsp; <img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height="8" width="8" border="0" align="absmiddle">
                    <webwork:text name="'admin.viewgroup.not.associated.with.group'">
                        <webwork:param name="'value0'"><b><webwork:text name="'admin.schemes.permissions.permission.schemes'"/></b></webwork:param>
                    </webwork:text><br>
                </webwork:if>
                <webwork:else>
                    <webwork:iterator value=".">
                        &nbsp; <img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height="8" width="8" border="0" align="absmiddle">
                        <a href="<%= request.getContextPath() %>/secure/admin/EditPermissions!default.jspa?schemeId=<webwork:property value="./long('id')"/>"><webwork:property value="./string('name')" /></a><br>
                    </webwork:iterator>
                </webwork:else>
            </webwork:property>
            <br>
            <b><webwork:text name="'admin.menu.schemes.notification.schemes'"/></b><br>
            <webwork:property value="/notificationSchemes(./name)">
                <webwork:if test="./empty == true">
                    &nbsp; <img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height="8" width="8" border="0" align="absmiddle">
                    <webwork:text name="'admin.viewgroup.not.associated.with.group'">
                        <webwork:param name="'value0'"><b><webwork:text name="'admin.schemes.notifications.notification.schemes'"/></b></webwork:param>
                    </webwork:text><br>
                </webwork:if>
                <webwork:else>
                    <webwork:iterator value=".">
                        &nbsp; <img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height="8" width="8" border="0" align="absmiddle">
                        <a href="<%= request.getContextPath() %>/secure/admin/EditNotifications!default.jspa?schemeId=<webwork:property value="./long('id')"/>"><webwork:property value="./string('name')" /></a><br>
                    </webwork:iterator>
                </webwork:else>
            </webwork:property>
            <webwork:if test="/enterprise == true">
            <br>
            <b><webwork:text name="'admin.schemes.issuesecurity.issue.security.schemes'"/>:</b><br>
            <webwork:property value="/issueSecuritySchemes(./name)">
                <webwork:if test="./empty == true">
                    &nbsp; <img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height="8" width="8" border="0" align="absmiddle">
                    <webwork:text name="'admin.viewgroup.not.associated.with.group'">
                        <webwork:param name="'value0'"><b><webwork:text name="'admin.schemes.issuesecurity.issue.security.schemes'"/></b></webwork:param>
                    </webwork:text><br>
                </webwork:if>
                <webwork:else>
                    <webwork:iterator value=".">
                        &nbsp; <img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height="8" width="8" border="0" align="absmiddle">
                        <a href="<%= request.getContextPath() %>/secure/admin/EditIssueSecurities!default.jspa?schemeId=<webwork:property value="./long('id')"/>"><webwork:property value="./string('name')" /></a><br>
                    </webwork:iterator>
                </webwork:else>
            </webwork:property>
            </webwork:if>
            <br>
            <b><webwork:text name="'admin.viewgroup.savedfilters.title'"/></b><br>
            <webwork:property value="/savedFilters(.)">
                <webwork:if test="./empty == true">
                    &nbsp; <img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height="8" width="8" border="0" align="absmiddle">
                    <webwork:text name="'admin.viewgroup.not.associated.with.group'">
                        <webwork:param name="'value0'"><b><webwork:text name="'admin.viewgroup.savedfilters.title'"/></b></webwork:param>
                    </webwork:text><br>
                </webwork:if>
                <webwork:else>
                    <webwork:iterator value=".">
                        &nbsp; <img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height="8" width="8" border="0" align="absmiddle">
                        <a href="<%= request.getContextPath() %>/secure/IssueNavigator.jspa?mode=hide&requestId=<webwork:property value="./id"/>"><webwork:property value="./name" /></a> (<webwork:text name="'admin.common.words.owner'"/>: <a href="<%= request.getContextPath() %>/secure/admin/user/ViewUser.jspa?name=<webwork:property value="./ownerUserName"/>"><webwork:property value="/fullUserName(./ownerUserName)"/></a>)<br>
                    </webwork:iterator>
                </webwork:else>
            </webwork:property>
        </p>
        </webwork:property>
    </page:applyDecorator>
</webwork:if>
<webwork:else>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.viewgroup.group.does.not.exist.title'"/></page:param>
    <page:param name="width">100%</page:param>
    <p>
        <webwork:text name="'admin.viewgroup.group.does.not.exist'"/>
    </p>
</page:applyDecorator>
</webwork:else>
</body>
</html>
