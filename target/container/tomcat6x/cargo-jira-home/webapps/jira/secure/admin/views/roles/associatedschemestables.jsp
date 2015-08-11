<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>

<webwork:if test="/associatedNotificationSchemes/size() != 0">
    <p>
        <div class="defaultWidth centered">
            <webwork:text name="'admin.projectroles.usage.notificationschemes'">
                <webwork:param value="/role/name"/>
                <webwork:param value="/associatedNotificationSchemes/size()"/>
            </webwork:text>:
        </div>
        <table id="relatednotificationschemes" class="grid defaultWidth centered">
            <tr>
                <th><webwork:text name="'admin.projects.notification.scheme'"/></th>
                <th><webwork:text name="'admin.projectroles.usage.associated.projects'"/></th>
                <th><webwork:text name="'admin.projectroles.usage.role.members.per.project'"/></th>
            </tr>
            <webwork:iterator value="/associatedNotificationSchemes" status="'outside'">
                <webwork:if test="/associatedProjectsForNotificationScheme(.)/size() != 0">
                    <webwork:iterator value="/associatedProjectsForNotificationScheme(.)" status="'status'">
                        <tr bgcolor="#<webwork:if test="@outside/odd == true">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
                            <webwork:if test="@status/first == true">
                                <td rowspan="<webwork:property value="/associatedProjectsForNotificationScheme(..)/size()"/>"><a href="<%=request.getContextPath()%>/secure/admin/EditNotifications!default.jspa?schemeId=<webwork:property value="../long('id')"/>"><webwork:property value="../string('name')"/> </a></td>
                            </webwork:if>
                            <td>
                                <a href="<%=request.getContextPath()%>/secure/project/ViewProject.jspa?pid=<webwork:property value="./id"/>"><webwork:property value="./name"/></a>
                            </td>
                            <td>
                                <webwork:property value="/memberCountForProject(.)"/> (<a id="view_project_role_actors_<webwork:property value="./id"/>" href="<%=request.getContextPath()%>/secure/project/ViewProjectRoleActors.jspa?projectId=<webwork:property value="./id"/>"><webwork:text name="'common.words.view'"/></a>)
                            </td>
                        </tr>
                    </webwork:iterator>
                </webwork:if>
                <webwork:else>
                    <tr bgcolor="#<webwork:if test="@outside/odd == true">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
                        <td><a href="<%=request.getContextPath()%>/secure/admin/EditNotifications!default.jspa?schemeId=<webwork:property value="./long('id')"/>"><webwork:property value="./string('name')"/> </a></td>
                        <td><webwork:text name="'common.words.none'"/></td>
                        <td><webwork:text name="'common.words.none'"/></td>
                    </tr>
                </webwork:else>
            </webwork:iterator>
        </table>
    </p>
</webwork:if>

<p/>

<webwork:if test="/associatedPermissionSchemes/size() != 0">
    <p>
        <div class="defaultWidth centered">
            <webwork:text name="'admin.projectroles.usage.permissionschemes'">
                <webwork:param value="/role/name"/>
                <webwork:param value="/associatedPermissionSchemes/size()"/>
            </webwork:text>:
        </div>
        <table id="relatedpermissionschemes" class="grid defaultWidth centered">
            <tr>
                <th><webwork:text name="'admin.projects.permission.scheme'"/></th>
                <th><webwork:text name="'admin.projectroles.usage.associated.projects'"/></th>
                <th><webwork:text name="'admin.projectroles.usage.role.members.per.project'"/></th>
            </tr>
            <webwork:iterator value="/associatedPermissionSchemes" status="'outside'">
                <webwork:if test="/associatedProjectsForPermissionScheme(.)/size() != 0">
                    <webwork:iterator value="/associatedProjectsForPermissionScheme(.)" status="'status'">
                        <tr bgcolor="#<webwork:if test="@outside/odd == true">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
                            <webwork:if test="@status/first == true">
                                <td rowspan="<webwork:property value="/associatedProjectsForPermissionScheme(..)/size()"/>"><a href="<%=request.getContextPath()%>/secure/admin/EditPermissions!default.jspa?schemeId=<webwork:property value="../long('id')"/>"><webwork:property value="../string('name')"/> </a></td>
                            </webwork:if>
                            <td>
                                <a href="<%=request.getContextPath()%>/secure/project/ViewProject.jspa?pid=<webwork:property value="./id"/>"><webwork:property value="./name"/></a>
                            </td>
                            <td>
                                <webwork:property value="/memberCountForProject(.)"/> (<a href="<%=request.getContextPath()%>/secure/project/ViewProjectRoleActors.jspa?projectId=<webwork:property value="./id"/>"><webwork:text name="'common.words.view'"/></a>)
                            </td>
                        </tr>
                    </webwork:iterator>
                </webwork:if>
                <webwork:else>
                    <tr bgcolor="#<webwork:if test="@outside/odd == true">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
                        <td><a href="<%=request.getContextPath()%>/secure/admin/EditPermissions!default.jspa?schemeId=<webwork:property value="./long('id')"/>"><webwork:property value="./string('name')"/> </a></td>
                        <td><webwork:text name="'common.words.none'"/></td>
                        <td><webwork:text name="'common.words.none'"/></td>
                    </tr>
                </webwork:else>
            </webwork:iterator>
        </table>
    </p>

</webwork:if>

<webwork:if test="/associatedIssueSecuritySchemes/size() != 0">
    <p>
        <div class="defaultWidth centered">
            <webwork:text name="'admin.projectroles.usage.issuesecurityschemes'">
                <webwork:param value="/role/name"/>
                <webwork:param value="/associatedIssueSecuritySchemes/size()"/>
            </webwork:text>:
        </div>
        <table id="issuesecurityschemes" class="grid defaultWidth centered">
            <tr>
                <th><webwork:text name="'admin.projects.issue.security.scheme'"/></th>
                <th><webwork:text name="'admin.projectroles.usage.associated.projects'"/></th>
                <th><webwork:text name="'admin.projectroles.usage.role.members.per.project'"/></th>
            </tr>
            <webwork:iterator value="/associatedIssueSecuritySchemes" status="'outside'">
                <webwork:if test="/associatedProjectsForIssueSecurityScheme(.)/size() != 0">
                    <webwork:iterator value="/associatedProjectsForIssueSecurityScheme(.)" status="'status'">
                        <tr bgcolor="#<webwork:if test="@outside/odd == true">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
                            <webwork:if test="@status/first == true">
                                <td rowspan="<webwork:property value="/associatedProjectsForIssueSecurityScheme(..)/size()"/>"><a href="<%=request.getContextPath()%>/secure/admin/EditIssueSecurities!default.jspa?schemeId=<webwork:property value="../long('id')"/>"><webwork:property value="../string('name')"/> </a></td>
                            </webwork:if>
                            <td>
                                <a href="<%=request.getContextPath()%>/secure/project/ViewProject.jspa?pid=<webwork:property value="./id"/>"><webwork:property value="./name"/></a>
                            </td>
                            <td>
                                <webwork:property value="/memberCountForProject(.)"/> (<a href="<%=request.getContextPath()%>/secure/project/ViewProjectRoleActors.jspa?projectId=<webwork:property value="./id"/>"><webwork:text name="'common.words.view'"/></a>)
                            </td>
                        </tr>
                    </webwork:iterator>
                </webwork:if>
                <webwork:else>
                    <tr bgcolor="#<webwork:if test="@outside/odd == true">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
                        <td><a href="<%=request.getContextPath()%>/secure/admin/EditIssueSecurities!default.jspa?schemeId=<webwork:property value="./long('id')"/>"><webwork:property value="./string('name')"/> </a></td>
                        <td><webwork:text name="'common.words.none'"/></td>
                        <td><webwork:text name="'common.words.none'"/></td>
                    </tr>
                </webwork:else>
            </webwork:iterator>
        </table>
    </p>

</webwork:if>

<webwork:if test="/associatedWorkflows/size() != 0">
    <p>
        <div class="defaultWidth centered">
            <webwork:text name="'admin.projectroles.usage.workflows'">
                <webwork:param value="/associatedWorkflows/size()"/>
                <webwork:param value="/role/name"/>
            </webwork:text>
        </div>
        <table class="grid defaultWidth centered">
            <tr>
                <th><webwork:text name="'issue.field.workflow'"/></th>
                <th><webwork:text name="'issue.field.workflow.action'"/></th>
            </tr>
            <webwork:iterator value="/associatedWorkflows" status="'workflowstatus'">
                <webwork:iterator value="./value" status="'actionstatus'">
                    <tr bgcolor="#<webwork:if test="@workflowstatus/odd == true">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
                        <webwork:if test="@actionstatus/first == true">
                            <td rowspan="<webwork:property value="../value/size()"/>">
                                <a href="<webwork:url value="'ViewWorkflowSteps.jspa'">
                                      <webwork:param name="'workflowMode'" value="../key/mode" />
                                      <webwork:param name="'workflowName'" value="../key/name"/>
                                    </webwork:url>"><webwork:property value="../key/name" /></a>

                            </td>
                        </webwork:if>
                        <td><a href="<webwork:url value="'ViewWorkflowTransition.jspa'">
                                  <webwork:param name="'workflowStep'" value="/stepId(./id, ../key/name)"/>
                                  <webwork:param name="'workflowTransition'" value="./id"/>
                                  <webwork:param name="'workflowMode'" value="../key/mode" />
                                  <webwork:param name="'workflowName'" value="../key/name"/>
                                  <webwork:param name="'descriptorTab'" value="conditions"/>
                                </webwork:url>"><webwork:property value="./name"/></a></td>
                    </tr>
                </webwork:iterator>
            </webwork:iterator>
        </table>
    </p>
</webwork:if>

<webwork:if test="/associatedNotificationSchemes/size() == 0 && /associatedPermissionSchemes/size() == 0 && /associatedWorkflows/size() == 0 && /associatedIssueSecuritySchemes/size() == 0">
    <webwork:if test="/enterprise == true">
        <webwork:text name="'admin.projectroles.usage.no.associations.ent'"/>
    </webwork:if>
    <webwork:else>
        <webwork:text name="'admin.projectroles.usage.no.associations.other'"/>
    </webwork:else>
</webwork:if>
