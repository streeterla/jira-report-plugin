<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<%--
expects the project GV on top of the ValueStack
--%>
<webwork:if test="./long('avatar') != null">
    <img id="project-avatar" alt="" class="project-avatar-48" height="48" src="<%= request.getContextPath() %>/secure/projectavatar?size=large&pid=<webwork:property value="./long('id')"/>&avatarId=<webwork:property value="./long('avatar')"/>" width="48">
</webwork:if>
<webwork:if test="stringSet(., 'description') == true">
	<webwork:property value="string('description')" escape="false" /><br>
	<br>
</webwork:if>
<b><webwork:text name="'common.concepts.key'"/>:</b> <webwork:property value="string('key')" /><br>
<b><webwork:text name="'common.concepts.url'"/>:</b>
<webwork:if test="string('url') != null && string('url') != ''">
	<a href="<webwork:property value="string('url')" />"><webwork:property value="string('url')" /></a><br>
</webwork:if>
<webwork:else><webwork:text name="'browse.projects.no.url'"/><br></webwork:else>

<b><webwork:text name="'admin.projects.project.team'"/>:</b>
<br/>
<span style="padding-left:30px">
    <webwork:text name="'common.concepts.projectlead'"/>:
    <webwork:if test="/userExists(./string('lead')) == true">
        <jira:formatuser user="string('lead')" type="'profileLink'" id="'project_summary'"/>
    </webwork:if>
    <webwork:else>
        <span class="errLabel"><webwork:property value="string('lead')" /></span>
    </webwork:else>
</span>
<br/>
<span style="padding-left:30px">
    <webwork:text name="'admin.projects.default.assignee'"/>: <webwork:text name="/prettyAssigneeType(long('assigneetype'))" /> <webwork:if test="/defaultAssigneeAssignable == false">(<span class="warning"><webwork:text name="'admin.projects.warning.user.not.assignable'"/></span>)</webwork:if>
</span>
<br/>
<webwork:if test="/hasAssociateRolesPermission() == true">
    <span style="padding-left:30px">
        <webwork:text name="'admin.projects.project.roles'"/>:
        <a href="<%=request.getContextPath()%>/secure/project/ViewProjectRoleActors.jspa?projectId=<webwork:property value="project/long('id')"/>"><webwork:text name="'admin.projects.project.roles.view.members'"/></a>
    </span>
    <br/>
</webwork:if>
