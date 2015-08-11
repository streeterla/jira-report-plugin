<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<ui:component name="'subTaskPhase'" template="hidden.jsp"  />

<webwork:if test="/bulkEditBean/invalidStatuses != null && /bulkEditBean/invalidStatuses/empty == false">

    <style>
        .grid td
        {
            white-space: nowrap;
        }

        .grid img
        {
            vertical-align: middle;
        }
    </style>
    <table class="grid bordered centered defaultWidth" >
        <tr>
            <th><webwork:text name="'bulk.move.issue.status'"/></th>
            <th colspan="3">
                <span class=smallgrey>
                    <webwork:text name="'bulk.move.affects.issues'">
                        <webwork:param name="'value0'"><b><webwork:property value="/bulkEditBean/selectedIssues/size"/></b></webwork:param>
                    </webwork:text>
                </span>
            </th>
            <th>
            <%-- Target Workflow --%>
            <span class=smallgrey><webwork:text name="'bulk.move.targetworkflow'"/>&nbsp;:&nbsp;
            <webwork:property value="/bulkEditBean/targetWorkflow/name"/></span>
            </th>
        </tr>
        <webwork:iterator value="/bulkEditBean/invalidStatuses">
        <tr>
            <%-- Invalid Issue Status --%>
            <td width="20%"><strong><webwork:text name="'bulk.move.currentstatus'"/></strong>:</td>
            <td>
                <webwork:component name="'status'" template="constanticon.jsp">
                    <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                    <webwork:param name="'iconurl'" value="string('iconurl')" />
                    <webwork:param name="'alt'"><webwork:property value="/nameTranslation(.)" /></webwork:param>
                    <webwork:param name="'title'"><webwork:property value="/nameTranslation(.)" /> - <webwork:property value="/descTranslation(.)" /></webwork:param>
                </webwork:component>
                <webwork:property value="/nameTranslation(.)"/>
            </td>
            <td><img src="<%= request.getContextPath() %>/images/icons/arrow_right_small.gif" height=16 width=16 border=0 align=absmiddle></td>
            <%-- Target Status --%>
            <td><strong><webwork:text name="'bulk.move.targetstatus'"/></strong>:</td>
            <td>
                <%-- Selection is given name with status id in order to retrieve it from params later --%>
                <select class="imagebacked" name="<webwork:property value="./string('id')"/>" >
                    <webwork:iterator value="targetWorkflowStatuses(/bulkEditBean/targetIssueTypeId)">
                        <option value="<webwork:property value="./string('id')" />" style="background-image: url('<webwork:url value="./string('iconurl')" />');">
                            <webwork:property value="/nameTranslation(.)" />
                        </option>
                    </webwork:iterator>
                </select>
            </td>
        </tr>
        </webwork:iterator>
    </table>
</webwork:if>
