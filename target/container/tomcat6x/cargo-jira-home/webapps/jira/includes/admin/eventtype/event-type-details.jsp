<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>


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

<table id="eventTypeTable" class="grid centered maxWidth">
    <tr bgcolor=#f0f0f0>
        <td class="colHeaderLink">
            <b><webwork:text name="'common.words.name'"/></b>
        </td>
        <td class="colHeaderLink">
            <b><webwork:text name="'common.words.description'"/></b>
        </td>
        <td class="colHeaderLink">
            <b><webwork:text name="'admin.event.types.status'"/></b>
        </td>
        <td class="colHeaderLink" >
            <b><webwork:text name="'admin.event.types.template'"/></b>
        </td>
        <td class="colHeaderLink" >
            <b><webwork:text name="'admin.event.types.assocaited.notification.schemes'"/></b>
        </td>
        <td class="colHeaderLink" >
            <b><webwork:text name="'admin.event.types.assocaited.workflows'"/></b>
        </td>
        <td class="colHeaderLink">
            <b><webwork:text name="'admin.event.types.operations'"/></b>
        </td>
    </tr>
    <% int evtCount = 0; %>
    <webwork:iterator value="." status="'status'">
    <tr class="<webwork:if test="@status/odd == true">rowNormal</webwork:if><webwork:else>rowAlternate</webwork:else>">
        <!-- Name -->
        <td><webwork:if test="./systemEventType == true">
            <b><webwork:property value="./translatedName(/remoteUser)" /></b>
                <span class="smallgrey">(<webwork:text name="'admin.event.types.system'" />)</span>
            </webwork:if>
            <!-- Custom event types are not fully i18n'ized yet. -->
            <webwork:else>
                <webwork:property value="./name" />
            </webwork:else>
        </td>
        <!-- Description -->
        <td>
            <webwork:if test="./systemEventType == true">
                <webwork:property value="./translatedDesc(/remoteUser)" />
            </webwork:if>
            <webwork:else>
                <webwork:property value="./description" />                
            </webwork:else>
        </td>
        <!-- Event Type Status -->
        <td>
            <webwork:if test="/eventTypeManager/active(.) == true">
                <span class="green-highlight"><webwork:text name="'admin.event.types.active'" /></span>
            </webwork:if>
            <webwork:else>
                <span class="red-highlight"><webwork:text name="'admin.event.types.inactive'" /></span>
            </webwork:else>
        </td>
        <!-- Template -->
        <td >
            <webwork:property value="/templateManager/defaultTemplate(.)/name" />
        </td>
        <!-- Associated Notification Schemes -->
        <td >
            <webwork:property value="/eventTypeManager/associatedNotificationSchemes(.)" >
            <webwork:if test="./empty == false">
                <ul class="square_blue">
                    <webwork:iterator value="./keySet">
                        <li><a href="<webwork:url page="/secure/admin/EditNotifications!default.jspa">
                            <webwork:param name="'schemeId'"><webwork:property value="." /></webwork:param>
                        </webwork:url>"><webwork:property value="../(.)" /></a>
                        </li>
                    </webwork:iterator>
                </ul>
            </webwork:if>
            </webwork:property>
        </td>

        <!-- Associated Workflows and Transitions -->
        <% int wfCount = 0; %>
        <td >
            <webwork:property value="/eventTypeManager/associatedWorkflows(., 'false')" >
            <webwork:if test="./keySet/empty == false">
            <ul class="square_blue">
                <webwork:iterator value="./keySet">
                    <li>
                         <div id="short_<%=evtCount%>_<%=wfCount%>" onclick="toggle('expand', '<%=evtCount%>_<%=wfCount%>');">
                            <!-- Workflow Link -->
                            <a title="<webwork:text name="'admin.event.type.workflowlink'" />" href="<webwork:url page="/secure/admin/workflows/ViewWorkflowSteps.jspa">
                            <webwork:param name="'workflowName'"><webwork:property value="." /></webwork:param>
                            <webwork:param name="'workflowMode'" value="'live'"/>
                            </webwork:url>"><webwork:property value="." /></a>&nbsp
                            <!-- Transition Link -->
                                <span class="small">[
                                <webwork:iterator value="/shortList(../(.))" status="'status'">
                                    <a title="<webwork:text name="'admin.event.type.transitionlink'" />" href="<webwork:url page="/secure/admin/workflows/ViewWorkflowTransition.jspa">
                                        <webwork:param name="'descriptorTab'" value="'postfunctions'" />
                                        <webwork:property value="/stepId(.., ./id)">
                                        <webwork:if test=". != null">
                                            <webwork:param name="'workflowStep'"><webwork:property value="." /></webwork:param>
                                        </webwork:if>
                                        </webwork:property>
                                        <webwork:param name="'workflowTransition'"><webwork:property value="./id" /></webwork:param>
                                        <webwork:param name="'workflowName'"><webwork:property value=".." /></webwork:param>
                                        <webwork:param name="'workflowMode'" value="'live'"/>
                                    </webwork:url>"> <webwork:property value="./name"/>
                                    (<webwork:property value="./id" />)</a>
                                    <webwork:if test="@status/last == false">,</webwork:if>
                                </webwork:iterator>
                                <webwork:if test="../(.)/size > 3"><span style="cursor:pointer;" class="smallgrey" title="<webwork:text name="'admin.event.type.list.fulllist'" />">...</span></webwork:if>&nbsp;]</span>
                        </div>
                        <webwork:if test="../(.)/size > 3">
                        <div style="display:none; cursor:pointer;" id="long_<%=evtCount%>_<%=wfCount%>" onclick="toggle('hide', '<%=evtCount%>_<%=wfCount%>');">
                            <!-- Workflow Link -->
                            <a title="<webwork:text name="'admin.event.type.workflowlink'" />" href="<webwork:url page="/secure/admin/workflows/ViewWorkflowSteps.jspa">
                            <webwork:param name="'workflowName'"><webwork:property value="." /></webwork:param>
                            <webwork:param name="'workflowMode'" value="'live'"/>
                            </webwork:url>"><webwork:property value="." /></a>&nbsp
                            <!-- Transition Link -->
                                <span class="small">[
                                    <webwork:iterator value="../(.)" status="'status'">
                                        <a title="<webwork:text name="'admin.event.type.transitionlink'" />" href="<webwork:url page="/secure/admin/workflows/ViewWorkflowTransition.jspa">
                                            <webwork:param name="'descriptorTab'" value="'postfunctions'" />
                                            <webwork:property value="/stepId(.., ./id)">
                                            <webwork:if test=". != null">
                                                <webwork:param name="'workflowStep'"><webwork:property value="." /></webwork:param>
                                            </webwork:if>
                                            </webwork:property>
                                            <webwork:param name="'workflowTransition'"><webwork:property value="./id" /></webwork:param>
                                            <webwork:param name="'workflowName'"><webwork:property value=".." /></webwork:param>
                                            <webwork:param name="'workflowMode'" value="'live'"/>
                                        </webwork:url>"> <webwork:property value="./name"/>
                                        (<webwork:property value="./id" />)</a>
                                        <webwork:if test="@status/last == false">,</webwork:if>
                                </webwork:iterator>
                            <span class="smallgrey">(<webwork:text name="'admin.event.type.list.hide'" />)</span>&nbsp;]</span>
                        </div>
                        </webwork:if>
                    </li>
                    <% wfCount++; %>
                </webwork:iterator>
            </ul>
            </webwork:if>
            </webwork:property>
        </td>
        <!-- Event Type Operations -->
        <td nowrap>
            <webwork:if test="./systemEventType == false">
                <a id="edit_<webwork:property value="./name"/>" href="<webwork:url page="EditEventType.jspa"><webwork:param name="'eventTypeId'" value="./id" /></webwork:url>"><webwork:text name="'common.words.edit'"/></a>
                <webwork:if test="/eventTypeManager/active(.) == false">
                    |
                    <a id="del_<webwork:property value="./name"/>" href="<webwork:url page="DeleteEventType.jspa"><webwork:param name="'eventTypeId'" value="./id" /></webwork:url>"><webwork:text name="'common.words.delete'"/></a>
                </webwork:if>
            </webwork:if>
        </td>
    </tr>
    <% evtCount++; %>
    </webwork:iterator>
</table>
