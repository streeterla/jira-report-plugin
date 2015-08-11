<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<style>
    .grid img
    {
        vertical-align: middle;
    }
</style>

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

function selectCellRadioBox(cell)
{
    document.forms['jiraform'].elements[cell].checked = true;
}
</script>

    <webwork:iterator value="/bulkEditBean/workflowsInUse" status="'workflowstatus'">
        <table id="workflow_<webwork:property value="@workflowstatus/index"/>" class="grid bordered centered defaultWidth" >
        <tr>
            <th colspan="5"><webwork:text name="'bulkworkflowtransition.issue.workflow'"/>: <webwork:property value="." /></th>
        </tr>
        <tr>
            <th nowrap width="25%">
                <webwork:text name="'bulkworkflowtransition.available.actions'"/>
            </th>
            <th nowrap width="25%" colspan="3">
                <webwork:text name="'bulkworkflowtransition.status.transition'" />
            </th>
            <th nowrap>
                <webwork:text name="'bulkworkflowtransition.affected.issues'"/>
            </th>
        </tr>
            <webwork:iterator value="/bulkEditBean/transitionIdsForWorkflow(.)" status="'mapstatus'">
                <tr <webwork:if test="@mapstatus/odd == true">class="rowNormal"</webwork:if><webwork:else>class="rowAlternate"</webwork:else>>

                    <!--Workflow Transition/Action-->
                    <td onclick="selectCellRadioBox('id_<webwork:property value="/encodeWorkflowTransitionKey(.)" />')">
                        <input type=radio name="wftransition" id="id_<webwork:property value="/encodeWorkflowTransitionKey(.)" />" value="<webwork:property value="/encodeWorkflowTransitionKey(.)" />" <webwork:if test="/bulkEditBean/transitionChecked(.) == true">checked</webwork:if>/>
                        <webwork:property value="/bulkEditBean/transitionName(.., ./actionDescriptorId)" /><br>
                    </td>


                    <!--Status Transition-->
                    <td nowrap>
                    <webwork:property value="/originStatus(.)">
                        <webwork:component name="'status'" template="constanticon.jsp">
                            <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                            <webwork:param name="'iconurl'" value="./string('iconurl')" />
                            <webwork:param name="'alt'"><webwork:property value="/nameTranslation(.)" /></webwork:param>
                        </webwork:component>
                        <webwork:property value="/nameTranslation(.)" />
                    </webwork:property>
                    </td>
                    <td >
                    <img src="<%= request.getContextPath() %>/images/icons/arrow_right_small.gif" height=16 width=16 border=0 align="middle" alt="Arrow Image">
                    </td>
                    <td nowrap>
                    <webwork:property value="/destinationStatus(.)" >
                        <webwork:component name="'status'" template="constanticon.jsp">
                            <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                            <webwork:param name="'iconurl'" value="./string('iconurl')" />
                            <webwork:param name="'alt'"><webwork:property value="/nameTranslation(.)" /></webwork:param>
                        </webwork:component>
                        <webwork:property value="/nameTranslation(.)" />
                    </webwork:property>
                    </td>


                    <!--Affected Issues-->
                    <td width="50%" >
                        <div id="short_<webwork:property value="/encodeWorkflowTransitionKey(.)"/>" onclick="toggle('expand', '<webwork:property value="/encodeWorkflowTransitionKey(.)"/>');">
                            <webwork:property value="/bulkEditBean/transitionIssueKeys(.)">
                                <webwork:iterator value="/shortListTransitionIssueKeys(.)" status="'status'">
                                    <webwork:property value="." /><webwork:if test="@status/last == false">,&nbsp;</webwork:if>
                                    <webwork:if test="../size > 5 && @status/last == true"></webwork:if>
                                </webwork:iterator>
                                <webwork:if test="./size > 5"><span style="cursor:pointer;" class="smallgrey" title="<webwork:text name="'bulkworkflowtransition.click.fulllist'" />">...&nbsp(<webwork:text name="'bulkworkflowtransition.affected.issues.size'"><webwork:param  name="'value0'"><webwork:property value="./size" /></webwork:param></webwork:text>)</span></webwork:if>
                            </webwork:property>
                        </div>
                        <webwork:if test="/bulkEditBean/transitionIssueKeys(.)/size > 5">
                        <div style="display:none; cursor:pointer;" id="long_<webwork:property value="/encodeWorkflowTransitionKey(.)"/>" onclick="toggle('hide', '<webwork:property value="/encodeWorkflowTransitionKey(.)"/>');">
                            <webwork:property value="/bulkEditBean/transitionIssueKeys(.)">
                                <webwork:iterator value="." status="'status'">
                                    <webwork:property value="." /><webwork:if test="@status/last == false">,&nbsp;</webwork:if>
                                </webwork:iterator>
                            </webwork:property>
                            <span class="smallgrey">[<webwork:text name="'bulkworkflowtransition.hide.list'" />]</span>
                        </div>
                        </webwork:if>
                    </td>
                </tr>
            </webwork:iterator>
        </tr>
        </table>
    </webwork:iterator>
