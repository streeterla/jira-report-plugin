<%@ page import="com.atlassian.jira.util.JiraUtils" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<html>
<head>
    <title><webwork:text name="'createissue.cant.browse.created.issue.title'"/></title>
    <meta name="decorator" content="notitle">
</head>
<body>
    <page:applyDecorator name="jirapanel">
        <page:param name="title"><webwork:text name="'createissue.cant.browse.created.issue.title'"/></page:param>

        <webwork:text name="'createissue.cant.browse.created.issue.description'">
            <webwork:param name="'value0'"><webwork:property value="/issueKey"/></webwork:param>
        </webwork:text>

        <webwork:if test="remoteUser == null">
            <p>
                <webwork:text name="'login.required.desc2'">
                    <webwork:param name="'value0'"><jira:loginlink><webwork:text name="'common.words.login'"/></jira:loginlink></webwork:param>
                </webwork:text>
                <webwork:if test="/applicationProperties/option('jira.option.user.externalpasswordmanagement') == false">
                <webwork:if test="extUserManagement != true">
                    <% if (JiraUtils.isPublicMode()) { %>
                    <webwork:text name="'login.required.desc3'">
                        <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/Signup!default.jspa"></webwork:param>
                        <webwork:param name="'value1'"></a></webwork:param>
                    </webwork:text>
                    <% } %>
                </webwork:if></webwork:if>.
            </p>
        </webwork:if>

        <p>
            <webwork:text name="'contact.admin.for.perm'">
                <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/Administrators.jspa"></webwork:param>
                <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>
        </p>
    </page:applyDecorator>
</body>
</html>
