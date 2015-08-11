<%@ taglib uri="jiratags" prefix="jira" %>
<div class="p-list">
    <table class="projects-list">
    <tr>
        <th width="25%"><webwork:text name="'common.concepts.project'" /></th>
        <th width="10%"><webwork:text name="'common.concepts.key'" /></th>
        <th width="25%"><webwork:text name="'common.concepts.projectlead'" /></th>
        <th width="40%"><webwork:text name="'common.concepts.url'" /></th>
    </tr>
    <webwork:iterator>
    <tr>
        <td>
            <webwork:if test="./long('avatar') != null">
               <img alt="" class="project-avatar-16" height="16" src="<%= request.getContextPath() %>/secure/projectavatar?size=small&pid=<webwork:property value="./long('id')"/>&avatarId=<webwork:property value="./long('avatar')"/>" width="16">
           </webwork:if>
           <webwork:else>
               <img alt="" class="project-avatar-16" height="16" src="<%= request.getContextPath() %>/images/icons/favicon.png" width="16">
            </webwork:else>
            <a href="<%= request.getContextPath() %>/browse/<webwork:property value="string('key')" />"><webwork:property value="string('name')" /></a>
        </td>
        <td>
            <webwork:property value="./string('key')" />
        </td>
        <td>
            <webwork:if test="string('lead')">
                <jira:formatuser user="./string('lead')" type="'profileLink'" id="'project_' + ./string('key') + '_table'"/>
            </webwork:if>
            <webwork:else>
                <webwork:text name="'browse.projects.no.lead'" />.
            </webwork:else>
        </td>
        <td>
            <webwork:if test="/stringSet(.,'url') == false">
                <webwork:text name="'browse.projects.no.url'" />
            </webwork:if>
            <webwork:else>
                <a href="<webwork:property value="./string('url')" />"><webwork:property value="./string('url')" /></a>
            </webwork:else>
        </td>
    </tr>
    </webwork:iterator>
    </table>
</div>