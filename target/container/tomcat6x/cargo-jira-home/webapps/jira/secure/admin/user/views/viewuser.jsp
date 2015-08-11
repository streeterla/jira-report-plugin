<%@ page import="com.atlassian.jira.ManagerFactory,
                 com.atlassian.jira.config.properties.APKeys"%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<webwork:if test="user != null">
<webwork:property value="user">
<html>
<head>
	<title><webwork:text name="'common.words.user'"/>: <webwork:property value="fullName" /></title>
</head>

<body>
<%@ include file="/includes/errormessages.jsp" %>
</webwork:property>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'common.words.user'"/>: <webwork:property value="user/fullName" /></page:param>
    <page:param name="width">100%</page:param>
    <webwork:property value="user">

    <div class="vcard"><%-- hCard microformat --%>
    <strong><webwork:text name="'common.words.username'"/>:</strong> <span id="username"><webwork:property value="name" /></span><br />
    <strong><webwork:text name="'common.words.fullname'"/>:</strong> <span class="fn"><webwork:property value="fullName" /></span><br />
    <strong><webwork:text name="'common.words.email'"/>:</strong> <a class="email" href="mailto:<webwork:property value="email" />"><webwork:property value="email" /></a><br />

    &nbsp;<br>
    <strong><webwork:text name="'login.count'"/>:</strong> <span id="loginCount"><webwork:property value="/loginCount(.)" /></span><br />
    <strong><webwork:text name="'login.last.login'"/>:</strong> <span id="lastLogin"><webwork:property value="/lastLogin(.)" /></span><br />
    <strong><webwork:text name="'login.prev.login'"/>:</strong> <span id="previousLogin"><webwork:property value="/previousLogin(.)" /></span><br />

    &nbsp;<br>
    <webwork:if test="/elevatedSecurityCheckRequired(.) == true">
        <strong><i><webwork:text name="'login.elevated.security.check.required'"/></i></strong><br />
    </webwork:if>
    <strong><webwork:text name="'login.last.failed.login'"/>:</strong> <span id="lastFailedLogin"><webwork:property value="/lastFailedLogin(.)" /></span><br />
    <strong><webwork:text name="'login.current.failed.login.count'"/>:</strong> <span id="currentFailedLoginCount"><webwork:property value="/currentFailedLoginCount(.)" /></span><br />

    <strong><webwork:text name="'login.total.failed.login.count'"/>:</strong> <span id="totalFailedLoginCount"><webwork:property value="/totalFailedLoginCount(.)" /></span><br />

        &nbsp;<br>
    <strong><webwork:text name="'common.words.groups'"/>:</strong><br>
        <webwork:iterator value="user/groups">
        &nbsp; <img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height="8" width="8" border="0" align="absmiddle" alt="">
        <webwork:property value="." /><br>
        </webwork:iterator>
    <br />

    <webwork:if test="/userProperties != null && /userProperties/empty == false">
    <strong><webwork:text name="'common.words.properties'"/>:</strong><br />
        <webwork:iterator value="/userProperties">
            &nbsp; <img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height="8" width="8" border="0" align="absmiddle" alt="">
            <webwork:property value="key" /> : <webwork:property value="value" /><br />
        </webwork:iterator>
     </webwork:if>
    </div>
    </webwork:property>
    <webwork:if test="/remoteUserPermittedToEditSelectedUser == false">
        <p><webwork:text name="'admin.viewuser.user.is.sysadmin.and.you.are.admin'">
                <webwork:param name="'value0'"><span class="note"></webwork:param>
                <webwork:param name="'value1'"></span></webwork:param>
            </webwork:text>
        </p>
    </webwork:if>
</page:applyDecorator>

<webwork:property value="user">
<p align="center">
	<strong>
    <a href="<webwork:url page="/secure/ViewProfile.jspa"><webwork:param name="'name'" value="name"/></webwork:url>"><webwork:text name="'admin.viewuser.view.public.profile'"/></a>
    | <a href="<webwork:url page="EditUserProperties.jspa"><webwork:param name="'name'" value="name" /></webwork:url>"><webwork:text name="'admin.viewuser.edit.properties'"/></a>
    <% if (!ManagerFactory.getApplicationProperties().getOption(APKeys.JIRA_OPTION_USER_EXTERNALMGT)) { %>
    | <a id="editgroups_link" href="<webwork:url page="EditUserGroups!default.jspa"><webwork:param name="'name'" value="name" /></webwork:url>"><webwork:text name="'admin.viewuser.edit.groups'"/></a>
    | <a id="viewprojectroles_link" href="<webwork:url page="ViewUserProjectRoles!default.jspa"><webwork:param name="'name'" value="name" /><webwork:param name="'returnUrl'" value="'ViewUser.jspa'"/></webwork:url>"><webwork:text name="'admin.viewuser.view.project.roles'"/></a>

    <webwork:if test="/remoteUserPermittedToEditSelectedUser == true">
        | <a href="<webwork:url page="EditUser!default.jspa"><webwork:param name="'editName'" value="name" /></webwork:url>"><webwork:text name="'admin.viewuser.edit.details'"/></a>
        <webwork:if test="applicationProperties/option('jira.option.user.externalpasswordmanagement') == false">
            | <a href="<webwork:url page="SetPassword!default.jspa"><webwork:param name="'name'" value="name" /></webwork:url>"><webwork:text name="'admin.viewuser.set.password'"/></a>
        </webwork:if>
        | <a id="deleteuser_link" href="<webwork:url page="DeleteUser!default.jspa"><webwork:param name="'name'" value="name" /></webwork:url>"><webwork:text name="'admin.viewuser.delete.user'"/></a>
    </webwork:if>
    <%  }   %>
    <webwork:if test="/elevatedSecurityCheckRequired(.) == true">
        | <a href="<webwork:url page="ResetFailedLoginCount.jspa"><webwork:param name="'name'" value="name" /><webwork:param name="'returnUrl'" value="'secure/admin/user/ViewUser.jspa'"/></webwork:url>"><webwork:text name="'admin.resetfailedlogin.title'"/></a>
    </webwork:if>

    </strong>
</p>

</body>
</html>

</webwork:property>
</webwork:if>
<webwork:else>
<html>
<head>
	<title><webwork:text name="'common.words.user'"/>: <webwork:text name="'common.words.none'"/></title>
</head>

<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.viewuser.user.does.not.exist.title'" /></page:param>
    <page:param name="width">100%</page:param>
    <p>
    <webwork:text name="'admin.viewuser.user.does.not.exist'">
        <webwork:param name="'value0'"><strong><webwork:property value="name" /></strong></webwork:param>
    </webwork:text>
    </p>
</page:applyDecorator>
</body>
</html>
</webwork:else>

