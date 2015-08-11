<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>

<script type="text/javascript">
function toggle(mode, elementId)
{
    var hideElement;
    var showElement;

    if (mode == "hide")
    {
        hideElement = document.getElementById('long_' + elementId);
        showElement = document.getElementById('short_' + elementId);
    }
    else
    {
        hideElement = document.getElementById('short_' + elementId);
        showElement = document.getElementById('long_' + elementId);
    }

    if (hideElement && showElement)
    {
        hideElement.style.display = 'none';
        showElement.style.display = '';
    }
}
</script>

<ui:component label="text('admin.deleteuser.filters.created')" template="textlabel.jsp">
    <webwork:param name="'texthtml'"><span id="numberOfFilters"><webwork:property value="numberOfFilters"/></span></webwork:param>
</ui:component>
<ui:component label="text('admin.deleteuser.filters.favourited')" template="textlabel.jsp">
    <webwork:param name="'texthtml'"><span id="numberOfOtherFavouritedFilters"><webwork:property value="numberOfOtherFavouritedFilters"/></span></webwork:param>
    <webwork:param name="'description'">
        (<webwork:text name="'admin.deleteuser.filters.favourited.desc'"/>)
    </webwork:param>
</ui:component>
<ui:component label="text('admin.deleteuser.portalpages.created')" template="textlabel.jsp">
    <webwork:param name="'texthtml'"><span id="numberOfNonPrivatePortalPages"><webwork:property value="numberOfNonPrivatePortalPages"/></span></webwork:param>
</ui:component>
<ui:component label="text('admin.deleteuser.portalpages.favourited')" template="textlabel.jsp">
    <webwork:param name="'texthtml'"><span id="numberOfOtherFavouritedPortalPages"><webwork:property value="numberOfOtherFavouritedPortalPages"/></span></webwork:param>
    <webwork:param name="'description'">
        (<webwork:text name="'admin.deleteuser.portalpages.favourited.desc'"/>)
    </webwork:param>
</ui:component>
<ui:component label="text('admin.deleteuser.assigned.issues')" template="textlabel.jsp">
    <webwork:if test="numberOfAssignedIssues > 0">
        <webwork:param name="'texthtml'"><a href="<webwork:url page="/secure/IssueNavigator.jspa"><webwork:param name="'reset'" value="'true'"/><webwork:param name="'mode'" value="'hide'"/><webwork:param name="'sorter/order'" value="'ASC'"/><webwork:param name="'sorter/field'" value="'priority'"/><webwork:param name="'pid'" value=".././long('id')"/><webwork:param name="'assigneeSelect'" value="'specificuser'"/><webwork:param name="'assignee'" value="name" /></webwork:url>"><webwork:property value="numberOfAssignedIssues"/></a></webwork:param>
    </webwork:if>
    <webwork:else>
        <webwork:param name="'texthtml'"><webwork:property value="numberOfAssignedIssues"/></webwork:param>
    </webwork:else>
</ui:component>
<ui:component label="text('admin.deleteuser.reported.issues')" template="textlabel.jsp">
    <webwork:if test="numberOfReportedIssues > 0">
        <webwork:param name="'texthtml'"><a href="<webwork:url page="/secure/IssueNavigator.jspa"><webwork:param name="'reset'" value="'true'"/><webwork:param name="'mode'" value="'hide'"/><webwork:param name="'sorter/order'" value="'ASC'"/><webwork:param name="'sorter/field'" value="'priority'"/><webwork:param name="'pid'" value=".././long('id')"/><webwork:param name="'reporterSelect'" value="'specificuser'"/><webwork:param name="'reporter'" value="name" /></webwork:url>"><webwork:property value="numberOfReportedIssues"/></a></webwork:param>
    </webwork:if>
    <webwork:else>
        <webwork:param name="'texthtml'"><webwork:property value="numberOfReportedIssues"/></webwork:param>
    </webwork:else>
</ui:component>

<webwork:if test="numberOfProjectsUserLeads > 0">
<ui:component label="text('admin.deleteuser.project.lead')" template="textlabel.jsp">
    <webwork:param name="'texthtml'">
        <div id="short_projects" onclick="toggle('expand', 'projects');">
            <webwork:property value="projectsUserLeads(5)">
                <webwork:iterator value="." status="'status'">
                    <a href="<webwork:url page="/secure/project/ViewProject.jspa"><webwork:param name="'pid'" value="./long('id')"/></webwork:url>"><webwork:property value="./string('name')"/></a>
                    <webwork:if test="@status/last == false">,&nbsp;</webwork:if>
                </webwork:iterator>
                <webwork:if test="/numberOfProjectsUserLeads > 5"><span style="cursor:pointer;" class="smallgrey" >...&nbsp(<webwork:text name="'admin.deleteuser.projects.lead'"><webwork:param  name="'value0'"><webwork:property value="numberOfProjectsUserLeads" /></webwork:param></webwork:text>)</span></webwork:if>
            </webwork:property>
        </div>
        <webwork:if test="numberOfProjectsUserLeads > 5">
            <div style="display:none; cursor:pointer;" id="long_projects" onclick="toggle('hide', 'projects');">
                <webwork:property value="projectsUserLeads()">
                    <webwork:iterator value="." status="'status'">
                        <a href="<webwork:url page="/secure/project/ViewProject.jspa"><webwork:param name="'pid'" value="./long('id')"/></webwork:url>"><webwork:property value="./string('name')"/></a>
                        <webwork:if test="@status/last == false">,&nbsp;</webwork:if>
                    </webwork:iterator>
                </webwork:property>
                <span class="smallgrey">[<webwork:text name="'admin.deleteuser.hide'" />]</span>
            </div>
        </webwork:if>
    </webwork:param>
</ui:component>
</webwork:if>
<webwork:if test="numberOfComponentsUserLeads > 0">
<ui:component label="text('admin.deleteuser.component.lead')" template="textlabel.jsp">
    <webwork:param name="'texthtml'">
        <div id="short_comps" onclick="toggle('expand', 'comps');">
            <webwork:property value="/componentsUserLeads(5)">
                <webwork:iterator value="." status="'status'">
                    <a href="<webwork:url page="/secure/project/ViewProject.jspa"><webwork:param name="'pid'" value="./projectId"/></webwork:url>"><webwork:property value="./name"/></a><webwork:if test="@status/last == false">,&nbsp;</webwork:if>
                </webwork:iterator>
                <webwork:if test="/numberOfComponentsUserLeads > 5"><span style="cursor:pointer;" class="smallgrey" >...&nbsp(<webwork:text name="'admin.deleteuser.components.lead'"><webwork:param  name="'value0'"><webwork:property value="numberOfComponentsUserLeads" /></webwork:param></webwork:text>)</span></webwork:if>
            </webwork:property>
        </div>
        <webwork:if test="numberOfComponentsUserLeads > 5">
        <div style="display:none; cursor:pointer;" id="long_comps" onclick="toggle('hide', 'comps');">
            <webwork:property value="/componentsUserLeads()">
                <webwork:iterator value="." status="'status'">
                    <a href="<webwork:url page="/secure/project/ViewProject.jspa"><webwork:param name="'pid'" value="./projectId"/></webwork:url>"><webwork:property value="./name"/></a><webwork:if test="@status/last == false">,&nbsp;</webwork:if>
                </webwork:iterator>
            </webwork:property>
            <span class="smallgrey">[<webwork:text name="'admin.deleteuser.hide'" />]</span>
        </div>
        </webwork:if>
    </webwork:param>
</ui:component>
</webwork:if>

