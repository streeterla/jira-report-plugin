
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="webwork" prefix="iterator" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:if test="subTask == true"><webwork:text name="'movesubtask.title'"/></webwork:if><webwork:else><webwork:text name="'moveissue.title'"/></webwork:else>: <webwork:property value="issue/string('summary')" /></title>
</head>

<body>

<table cellpadding=0 cellspacing=0 border=0 width=100%>
<tr>
<td width=200 bgcolor="#f0f0f0" valign=top>
    <webwork:if test="subTask == true">
        <jsp:include page="/secure/views/issue/movetaskpane.jsp" flush="false" />
    </webwork:if>
    <webwork:else>
        <jsp:include page="/secure/views/issue/moveissuepane.jsp" flush="false" />
    </webwork:else>
</td>
<td bgcolor=#ffffff valign=top>
<table width=100% cellpadding=10 cellspacing=0 border=0><tr><td>

<webwork:if test="targetWorkflow != null">
	<page:applyDecorator name="jiraform">
		<page:param name="title">
            <webwork:if test="subTask == true">
                <webwork:text name="'movesubtask.title'"/>: <webwork:text name="'moveissue.select.status'"/>
            </webwork:if>
            <webwork:else>
                <webwork:text name="'moveissue.title'"/>: <webwork:text name="'moveissue.select.status'"/>
            </webwork:else>
        </page:param>
        <page:param name="description">
            <%-- Set status of issue only - no subtasks or valid subtask statuses --%>
            <webwork:if test="issueStatusValid == false && hasSubTasks == false || taskStatusChangeRequired == false">
                <webwork:text name="'moveissue.updateworkflow.desc.ent.issueonly'"/>
            </webwork:if>
            <%-- Set status of subtasks only - valid issue status--%>
            <webwork:elseIf test="issueStatusValid == true && hasSubTasks == true && taskStatusChangeRequired == true">
                <webwork:text name="'moveissue.updateworkflow.desc.ent.subtaskonly'"/>
            </webwork:elseIf>
            <%-- Set status of issue and status of subtasks --%>
            <webwork:elseIf test="issueStatusValid == false && hasSubTasks == true && taskStatusChangeRequired == true">
                <webwork:text name="'moveissue.updateworkflow.desc.ent.both'"/>
            </webwork:elseIf>
            <p>
            <span class="red-highlight"><b><webwork:text name="'common.words.note'"/></b></span>:&nbsp;<webwork:text name="'moveissue.status.invalid'"/>.
            </p>
        </page:param>
        <page:param name="columns">1</page:param>
        <page:param name="width">100%</page:param>
		<page:param name="action">MoveIssueUpdateWorkflow.jspa</page:param>
		<page:param name="autoSelectFirst">false</page:param>
        <page:param name="cancelURI"><webwork:property value="issuePath" /></page:param>
		<page:param name="submitId">next_submit</page:param>
		<page:param name="submitName"><webwork:property value="text('common.forms.next')"/> &gt;&gt;</page:param>

        <tr><td colspan="2" bgcolor="#ffffff">
        <webwork:if test="issueStatusValid == false">
        <table width="70%" class="update-wflow"><tr><td>
            <div class="borderedbox">
            <table width="100%">
                <tr bgcolor="#f0f0f0">
                    <td bgcolor="#f0f0f0" colspan="5" align="left"><b><webwork:text name="'moveissue.currentissue'"/></b>
                    <%-- Current Issue Workflow --%>
                    <span class=smallgrey>(<b><webwork:text name="'moveissue.workflow'"/></b>:&nbsp;<webwork:property value="currentWorkflow/name"/>&nbsp;<img src="<%= request.getContextPath() %>/images/icons/arrow_right_small_fade.gif" height=16 width=16 border=0 align=absmiddle>&nbsp;
                    <webwork:property value="targetWorkflow/name"/>)</span>
                    </td>
                </tr>
                <tr>
                    <%-- Current Issue Status --%>
                    <td align="absmiddle" width="20%" nowrap><b><webwork:text name="'moveissue.currentstatus'"/></b>:</td>
                    <td align="absmiddle" nowrap>
                        <webwork:component name="'status'" template="constanticon.jsp">
                            <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                            <webwork:param name="'iconurl'" value="currentStatusGV/string('iconurl')" />
                            <webwork:param name="'alt'"><webwork:property value="/nameTranslation(currentStatusGV)" /></webwork:param>
                            <webwork:param name="'title'"><webwork:property value="/nameTranslation(currentStatusGV)" /> - <webwork:property value="/descTranslation(currentStatusGV)" /></webwork:param>
                        </webwork:component>
                        <webwork:property value="/nameTranslation(currentStatusGV)"/>
                    </td>
                    <td align="absmiddle" nowrap><img src="<%= request.getContextPath() %>/images/icons/arrow_right_small.gif" height=16 width=16 border=0 align=absmiddle></td>
                    <%-- Target Status --%>
                    <td align="absmiddle" width="20%" nowrap><b><webwork:text name="'moveissue.newstatus'"/></b>:</td>
                    <td>
                        <select name="beanTargetStatusId">
                            <webwork:iterator value="targetWorkflowStatuses(/moveIssueBean/targetIssueType)">
                                <option value="<webwork:property value="./string('id')" />" <webwork:if test="beanTargetStatusId == ./string('id')">selected</webwork:if> >
                                    <webwork:property value="/nameTranslation(.)" />
                                </option>
                            </webwork:iterator>
                        </select>
                    </td>
                </tr>
            </table>
            </div>
            <br>
        </td></tr></table>
        </webwork:if>
        <webwork:else>
            <ui:component name="'beanTargetStatusId'" value="currentStatusGV/string('id')" template="hidden.jsp" />
        </webwork:else>


        <%-- SubTasks with invalid statuses --%>
        <webwork:if test="hasSubTasks == true && taskStatusChangeRequired == true">
        <table width="70%" class="update-wflow"><tr><td>
        <div class="borderedbox">
        <table width="100%">
            <tr>
                <tr><td bgcolor="#f0f0f0" align="left" colspan=5><b><webwork:text name="'moveissue.subtasks'"/></b></td></tr>
            </tr>
            <webwork:iterator value="taskInvalidTypes">
                <tr bgcolor="#f0f0f0">
                    <td align="left" colspan="5"><b>Type: <webwork:property value="/nameTranslation(.)"/></b>
                    <%-- Current Task Workflow --%>
                    <span class=smallgrey>(<b><webwork:text name="'moveissue.workflow'"/></b>:&nbsp;<webwork:property value="taskCurrentWorkflow(.)/name"/>&nbsp;<img src="<%= request.getContextPath() %>/images/icons/arrow_right_small_fade.gif" height=16 width=16 border=0 align=absmiddle>&nbsp;
                    <webwork:property value="subtaskTargetWorkflow(./string('id'))/name"/>)</span>
                    </td>
                </tr>
                <tr>
                <webwork:iterator value="../taskInvalidStatuses(./string('id'))">
                    <td align="absmiddle" width="20%" nowrap><webwork:property value="tasksByStatusWorkflowType(./string('id'), taskCurrentWorkflow(..), ../string('id'))/size">
                            <webwork:property value="."/><webwork:if test=". == 1"> <webwork:text name="'moveissue.taskwithstatus'"/>:</webwork:if>
                            <webwork:else><webwork:text name="'moveissue.taskswithstatus'"/>:</webwork:else>
                        </webwork:property>
                    </td>
                    <td align="absmiddle" nowrap>
                    <webwork:component name="'status'" template="constanticon.jsp">
                        <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                        <webwork:param name="'iconurl'" value="./string('iconurl')" />
                        <webwork:param name="'alt'"><webwork:property value="/nameTranslation(.)" /></webwork:param>
                        <webwork:param name="'title'"><webwork:property value="/nameTranslation(.)" /> - <webwork:property value="/descTranslation(.)" /></webwork:param>
                        </webwork:component>
                    <webwork:property value="/nameTranslation(.)"/>
                    </td>
                    <td align="absmiddle" nowrap><img src="<%= request.getContextPath() %>/images/icons/arrow_right_small.gif" height=16 width=16 border=0 align=absmiddle></td>
                    <td align="absmiddle" width="20%" nowrap><b><webwork:text name="'moveissue.newstatus'"/></b>:</td>
                    <td>
                        <%-- Selection is given name with task type id and status id in order to retrieve it from params later --%>
                        <select name="<webwork:property value=".././prefixTaskStatusId(../string('id'), ./string('id'))"/>" >
                            <webwork:iterator value="targetWorkflowStatuses(../subtaskTargetIssueType(../string('id')))">
                                <option value="<webwork:property value="./string('id')" />"> <webwork:property value="/nameTranslation(.)" />
                                </option>
                            </webwork:iterator>
                        </select>
                    </td>
                </webwork:iterator>
                </tr>
            </webwork:iterator>
            </table>
        </div>
        </td></tr></table>
        </webwork:if>


        </td></tr>

        <%-- Do not put these in the MoveIssueBean --%>
        <ui:component name="'id'" template="hidden.jsp" />
<%--        <ui:component name="'assignee'" template="hidden.jsp" />--%>

	</page:applyDecorator>


</webwork:if>
<webwork:else>
	<page:applyDecorator name="jiraform">
        <page:param name="title"><webwork:text name="'moveissue.title'"/></page:param>
		<page:param name="description"><webwork:text name="'moveissue.updateworkflow.desc.ent.error'"/></page:param>
	</page:applyDecorator>
</webwork:else>

</td></tr></table>
</td></tr></table>

</body>
</html>
