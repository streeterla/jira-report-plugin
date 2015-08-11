<%@ page import="com.atlassian.jira.util.JiraUtils"%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<tr>
<td bgcolor=#ffffff colspan=2>
<webwork:if test="remoteUser == null">
    <p>
     <webwork:text name="'createissue.notloggedin'"/>
    </p>

    <p>
    <webwork:text name="'createissue.mustfirstlogin'">
        <webwork:param name="'value0'"><jira:loginlink><webwork:text name="'common.words.login'"/></jira:loginlink></webwork:param>
        <webwork:param name="'value1'"></webwork:param>
    </webwork:text>
    <webwork:if test="extUserManagement != true">
        <% if (JiraUtils.isPublicMode()) { %>
            <webwork:text name="'noprojects.signup'">
                <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/Signup!default.jspa"></webwork:param>
                <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>
        <% } %>
    </webwork:if>
    </p>
</webwork:if>
<webwork:elseIf test="project != null">
    <p><webwork:text name="'createissue.projectnopermission'"/></p>
</webwork:elseIf>
<webwork:else>
    <p><webwork:text name="'createissue.invalid.pid'"/></p>
</webwork:else>
</td>
</tr>
