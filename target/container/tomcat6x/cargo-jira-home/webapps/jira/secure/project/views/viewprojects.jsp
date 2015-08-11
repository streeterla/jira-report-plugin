<%@ page import="com.atlassian.jira.util.JiraUtils" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<html>
<head>
    <title><webwork:text name="'common.concepts.projects'"/></title>
</head>
<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'common.concepts.projects'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">project_management</page:param>

    <p>
        <webwork:text name="'admin.projects.caption'">
                <webwork:param name="'value0'"><webwork:if test="projects/empty == false"><webwork:property value="projects/size" /></webwork:if> <%-- note that extra space here is needed for 0 value--%></webwork:param>
        </webwork:text>
    </p>
    <webwork:if test="admin == true">
    <p>
        <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height=8 width=8 border=0 align=absmiddle alt=""/>
	    <b><a id="add_project" href="<%= request.getContextPath() %>/secure/admin/AddProject!default.jspa"><webwork:text name="'admin.projects.add.project'"/></a></b>
    </p>
    </webwork:if>
</page:applyDecorator>
<p>
<table class="grid maxWidth">
<tr>
    <th><webwork:text name="'common.words.name'"/></th>
    <th><webwork:text name="'issue.field.key'"/></th>
    <th><webwork:text name="'common.concepts.url'"/></th>
    <th><webwork:text name="'common.concepts.projectlead'"/></th>
    <th><webwork:text name="'admin.projects.default.assignee'"/></th>
    <th class="minWidth"><webwork:text name="'common.words.operations'"/></th>
</tr>
<webwork:iterator value="projects">
    <tr>
    <td>
        <webwork:if test="./long('avatar') != null">
            <img alt="" class="project-avatar-16" height="16" src="<%= request.getContextPath() %>/secure/projectavatar?size=small&pid=<webwork:property value="./long('id')"/>&avatarId=<webwork:property value="./long('avatar')"/>" width="16">
       </webwork:if>
        <a href="<%= request.getContextPath() %>/secure/project/ViewProject.jspa?pid=<webwork:property value="long('id')" />"><webwork:property value="string('name')" /></a>
    </td>
    <td>
        <webwork:property value="string('key')" />
    </td>
    <td>
        <webwork:if test="/stringSet(.,'url') == false">
            <webwork:text name="'browse.projects.no.url'"/>
        </webwork:if>
        <webwork:else>
            <a href="<webwork:property value="./string('url')" />"><webwork:property value="./string('url')" /></a>
        </webwork:else>
    </td>
    <td nowrap>
        <webwork:if test="string('lead')">
            <jira:formatuser user="./string('lead')" type="'profileLink'" id="'view_' + ./string('key') + '_projects'"/>
        </webwork:if>
        <webwork:else>
           <webwork:text name="'browse.projects.no.lead'"/>
        </webwork:else>
    </td>
    <td nowrap>
        <webwork:if test="/defaultAssigneeAssignable(.) == false"><span class="warning" title="WARNING: User not Assignable."></webwork:if>
        <webwork:text name="/prettyAssigneeType(long('assigneetype'))"/>
        <webwork:if test="/defaultAssigneeAssignable(.) == false"></span></webwork:if>
    </td>
    <td nowrap valign=middle align=middle>
        <a id="view-project-<webwork:property value="long('id')" />" href="<%= request.getContextPath() %>/secure/project/ViewProject.jspa?pid=<webwork:property value="long('id')" />"><webwork:text name="'common.words.view'"/></a>
        <webwork:if test="/projectAdmin(.) == true || /admin == true">
            |
            <a href="<%= request.getContextPath() %>/secure/project/EditProject!default.jspa?pid=<webwork:property value="long('id')" />&returnUrl=ViewProjects.jspa"><webwork:text name="'common.words.edit'"/></a>
        </webwork:if>
        <webwork:if test = "/admin == true">
            |
            <a href="<%=request.getContextPath() %>/secure/project/DeleteProject!default.jspa?pid=<webwork:property value="long('id')"/>&returnUrl=ViewProjects.jspa" id="delete_project_<webwork:property value="long('id')"/>" ><webwork:text name="'common.words.delete'"/></a>
        </webwork:if>
    </td>
    </tr>
</webwork:iterator>
<webwork:if test="projects/size == 0">
    <tr>
        <td colspan="6">
            <p>
            <webwork:text name="'admin.projects.nopermission'"/>
            </p>

            <webwork:if test="remoteUser == null">
                <p>
                <webwork:if test="/applicationProperties/option('jira.option.user.externalpasswordmanagement') == false">
                    <webwork:if test="extUserManagement != true">
                        <% if (JiraUtils.isPublicMode()) { %>
                        <webwork:text name="'admin.projects.login.or.signup'">
                            <webwork:param name="'value0'"><jira:loginlink><webwork:text name="'admin.common.words.log.in'"/></jira:loginlink></webwork:param>
                            <webwork:param name="'value1'"><a href="<%= request.getContextPath() %>/secure/Signup!default.jspa"></webwork:param>
                            <webwork:param name="'value2'"></a></webwork:param>
                        </webwork:text>
                        <% } %>
                    </webwork:if>
                </webwork:if>
                <webwork:else>
                    <webwork:text name="'admin.projects.login'">
                        <webwork:param name="'value0'"><jira:loginlink><webwork:text name="'admin.common.words.log.in'"/></jira:loginlink></webwork:param>
                    </webwork:text>
                </webwork:else>
                </p>
            </webwork:if>
        </td>
    </tr>
</webwork:if>
</table>
</p>
</body>
</html>
