<%@ page import="com.atlassian.jira.web.bean.BulkEditBean"%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<webwork:if test="/bulkEditBean/invalidSubTaskTypes != null && /bulkEditBean/invalidSubTaskTypes/empty == false">
<table width="100%" align="absmiddle"><tr><td>
    <div class="borderedbox">
    <table width="100%">
        <tr bgcolor="#f0f0f0">
            <td bgcolor="#f0f0f0" align="left"><b>Sub-Tasks</b>
            <td bgcolor="#f0f0f0"  align="left" colspan="4">
                <span class=smallgrey>
                    <webwork:text name="'bulk.move.affects.subtasks'">
                        <webwork:param name="'value0'"><b><webwork:property value="/bulkEditBean/invalidSubTaskCount"/></b></webwork:param>
                    </webwork:text>
                </span>
            </td>
        </tr>
        <webwork:iterator value="/bulkEditBean/invalidSubTaskTypes">
        <tr>
                        <%-- Invalid Issue Status --%>
            <td bgcolor="#f0f0f0" align="left"><b><webwork:text name="'bulk.move.subtask.type'" />:</b></td><td bgcolor="#f0f0f0" colspan="3" align="left"><webwork:property value="/constantsManager/issueType(.)/string('name')" /></b>
            </td>
            <td bgcolor="#f0f0f0">
                        <%-- Target Workflow --%>
            <span class=smallgrey><b><webwork:text name="'bulk.move.targetworkflow'"/></b>&nbsp;:&nbsp;
            <webwork:property value="/bulkEditBean/targetWorkflowByType(./string('id'))/name"/></span>
            </td>
        </tr>
            <webwork:iterator value="/bulkEditBean/invalidSubTaskStatusesByType(.)">
            <tr>
                <td align="left" width="20%" nowrap><b><webwork:text name="'bulk.move.currentstatus'"/></b>:</td>
                <td align="left" nowrap>

                    <webwork:component name="'status'" template="constanticon.jsp">
                        <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                        <webwork:param name="'iconurl'" value="constantsManager/status(.)/string('iconurl')" />
                        <webwork:param name="'alt'"><webwork:property value="/nameTranslation(/constantsManager/status(.))" /></webwork:param>
                        <webwork:param name="'title'"><webwork:property value="nameTranslation(/constantsManager/status(.))" /> - <webwork:property value="/descTranslation(/constantsManager/status(.))" /></webwork:param>
                    </webwork:component>
                    <webwork:property value="/nameTranslation(/constantsManager/status(.))"/>
                </td>
                <td align="absmiddle" nowrap><img src="<%= request.getContextPath() %>/images/icons/arrow_right_small.gif" height=16 width=16 border=0 align=absmiddle></td>
                            <%-- Target Status --%>
                <td align="absmiddle" width="20%" nowrap><b><webwork:text name="'bulk.move.targetstatus'"/></b>:</td>
                <td>
                                <%-- Selection is given name with BulkEditBean.SUBTASK_STATUS_INFO and subtask type and status id in order to retrieve it from params later --%>
                    <select name="<%=BulkEditBean.SUBTASK_STATUS_INFO%><webwork:property value=".." />_<webwork:property value="."/>" >
                        <webwork:iterator value="targetWorkflowStatuses(../string('id'))">
                            <option value="<webwork:property value="./string('id')" />"> <webwork:property value="/nameTranslation(.)" />
                            </option>
                        </webwork:iterator>
                    </select>
                </td>
            <tr>
            </webwork:iterator>
        </tr>
        </webwork:iterator>
    </table>
    </div>
    <br>
</td></tr></table>
</webwork:if>
