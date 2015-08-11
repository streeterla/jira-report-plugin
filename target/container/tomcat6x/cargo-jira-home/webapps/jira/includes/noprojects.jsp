<%@ page import="com.atlassian.jira.util.JiraUtils"%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<tr>
<webwork:if test="applicationProperties/string('jira.setup') == 'true'">
<webwork:if test="remoteUser == null && projectManager/projects/size > 0">
<td bgcolor=#ffffff colspan=2>
	<p class="notify warn">
	<webwork:text name="'noprojects.notloggedin'"/>
	</p>

    <p>
    <webwork:text name="'noprojects.mustfirstlogin'">
        <webwork:param name="'value0'"><jira:loginlink><webwork:text name="'common.words.login'"/></jira:loginlink></webwork:param>
        <webwork:param name="'value1'"></a></webwork:param>
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
</td>
</webwork:if>
<webwork:else>
<td class="formErrors" colspan="2">

	<webwork:if test="projectManager/projects/size > 0">
	<p>
	<webwork:text name="'noprojects.nopermissions'"/>
	</p>

	<p>
		<webwork:if test="hasPermission('admin') == true">
			<a href="<%= request.getContextPath() %>/secure/admin/default.jsp"><webwork:text name="'noprojects.viewallprojects.link'"/></a> <webwork:text name="'noprojects.viewallprojects.end'"/>.
		</webwork:if>
        <webwork:else>
			<webwork:text name="'noprojects.contactadmin.permissions'">
                <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/Administrators.jspa"></webwork:param>
                <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>
		</webwork:else>
	</p>

	</webwork:if>
	<webwork:else>
	<p>
	<webwork:text name="'noprojects'"/>
	</p>
		<webwork:if test="hasPermission('admin') == true">
			<a href="<%= request.getContextPath() %>/secure/admin/AddProject!default.jspa"><webwork:text name="'noprojects.createprojectnow.link'"/></a>.
		</webwork:if>
		<webwork:else>
            <webwork:text name="'noprojects.contactadmin.createproject'">
                <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/Administrators.jspa"></webwork:param>
                <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>
		</webwork:else>
	</webwork:else>
</td>
</webwork:else>
</webwork:if>
<%-- otherwise JIRA is not setup yet - show links --%>
<webwork:else>
<td class="formErrors">
 <table cellpadding=4 cellspacing=0 border=0 width=100%>
	<tr><td class="formErrors">
		<font color="#cc0000" size=4><b>SETUP JIRA</b></font>
	</td></tr>
	<tr><td class="formErrors">
		<p>
		<webwork:text name="'noprojects.mustsetupfirst'"/>.
		</p>
		<p>
		<webwork:text name="'noprojects.createadmintocreateotheradmins'"/>
		</p>
		<p align=center>
		<b><a href="<%= request.getContextPath() %>/secure/Setup!default.jspa"><font size="3"><webwork:text name="'noprojects.setupjira.link'"/></font></a></b>
		</p>
	</td></tr>
	</table>
</td>
</webwork:else>
</tr>
