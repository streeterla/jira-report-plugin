<%@ page import="com.atlassian.jira.util.JiraUtils" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'navigator.filter.title'"/></page:param>
    <tr>
    <td bgcolor="#ffffff" colspan="2">
        <webwork:if test="requestPrivate == 'true'">
            <webwork:text name="'navigator.filter.error.private'"/>
        </webwork:if>
        <webwork:else>
            <webwork:text name="'navigator.filter.error.filter.dont.exist'">
                <webwork:param name="'value0'"><webwork:property value="requestId"/></webwork:param>
            </webwork:text>
        </webwork:else>

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
    </td>
    </tr>
</page:applyDecorator>
