<%@ page import="com.atlassian.jira.util.JiraUtils"%>
<%@ page import="com.opensymphony.util.TextUtils" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<tr>
<td bgcolor="#ffffff" colspan="2">
<webwork:if test="remoteUser == null">
	<p>
	 <webwork:text name="'addcomment.notloggedin'"/>
	</p>

    <p>
    <webwork:text name="'addcomment.mustfirstlogin'">
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
<webwork:else>
	<p><webwork:text name="'comment.add.error.permission'"/></p>
</webwork:else>

<% if (TextUtils.stringSet(request.getParameter("comment"))) { %>
    <div class="noteBox centered" style="width: 80%;">
    <strong><webwork:text name="'comment.add.error.recover.comment'"/></strong>
    <p><jira:text2html><%= request.getParameter("comment") %></jira:text2html></p>
    </div>
<% } %>

</td>
</tr>
