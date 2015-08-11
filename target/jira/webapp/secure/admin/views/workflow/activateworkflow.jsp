<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.translations.activate.workflow'">
	    <webwork:param name="'value0'"><webwork:property value="workflowName"/></webwork:param>
	</webwork:text></title>
</head>
<body>
    <page:applyDecorator name="jiraform">
        <page:param name="columns">1</page:param>
        <page:param name="title"><webwork:text name="'admin.translations.activate.workflow'">
	    <webwork:param name="'value0'"><webwork:property value="workflowName"/></webwork:param></webwork:text>
        </page:param>
        <page:param name="description">
            <webwork:if test="/statusesNeedingMigration/empty == false">
                <p><webwork:text name="'admin.translations.activate.migrate.statuses.from.old'"/></p>
            </webwork:if>
            <webwork:else>
                <p><webwork:text name="'admin.translations.activate.confirm.activation'">
                    <webwork:param name="'value0'"><b><webwork:property value="workflowName"/></b></webwork:param>
                </webwork:text></p>
            </webwork:else>
             <p><webwork:text name="'admin.translations.activate.notice'"/></p>
             <webwork:if test="/systemAdministrator == true">
                 <webwork:text name="'admin.translations.activate.note.1'">
                     <webwork:param name="'value0'"><span class=warning></webwork:param>
                     <webwork:param name="'value1'"></span></webwork:param>
                     <webwork:param name="'value2'"><a href="<%= request.getContextPath() %>/secure/admin/XmlBackup!default.jspa"></webwork:param>
                     <webwork:param name="'value3'"></a></webwork:param>
                 </webwork:text>
             </webwork:if>
            <webwork:else>
                <webwork:text name="'admin.translations.activate.note.1.admin'">
                    <webwork:param name="'value0'"><span class="note"></webwork:param>
                    <webwork:param name="'value1'"></span></webwork:param>
                    <webwork:param name="'value2'"><a href="<%=request.getContextPath()%>/secure/Administrators.jspa#sysadmins"></webwork:param>
                    <webwork:param name="'value3'"></a></webwork:param>
                </webwork:text>
            </webwork:else>
             <p><webwork:text name="'admin.translations.activate.note.2'" >
                 </webwork:text></p>
        </page:param>
        <%-- TODO - until we have an All Tasks Page this is disabled --%>
        <%--<page:param name="instructions">--%>
            <%--<webwork:if test="anyLiveTasks == true">--%>
                <%--<ui:component template="taskwarning.jsp"/>    --%>
            <%--</webwork:if>--%>
         <%--</page:param>--%>

       <tr bgcolor="#ffffff"><td>
         <webwork:if test="currentTask">
             <webwork:text name="'admin.translations.activate.blocked.by.user'">
                 <webwork:param name="'value0'"><a href="<webwork:property value="currentTask/userURL"/>"><webwork:property value="currentTask/user"/></a></webwork:param>
             </webwork:text>

             <webwork:text name="'admin.translations.activate.goto.progressbar'">
                 <webwork:param name="'value0'"><a href="<webwork:property value="currentTask/progressURL"/>"></webwork:param>
                 <webwork:param name="'value1'"><webwork:text name="'common.words.here'"/></webwork:param>
                 <webwork:param name="'value2'"></a></webwork:param>
             </webwork:text>
        </webwork:if>
        <webwork:else>
            <page:param name="action">ActivateWorkflow.jspa</page:param>
            <page:param name="submitId">activate_submit</page:param>
            <page:param name="submitName"><webwork:text name="'admin.common.words.activate'"/></page:param>
            <page:param name="autoSelectFirst">false</page:param>

            <webwork:if test="/statusesNeedingMigration/empty == false">
                <table width="50%" align="center">
                <tr><td>
                    <div class="borderedBox">
                        <table bgcolor="#ffffff" width="100%">
                            <tr>
                                <td width="1%" nowrap><b><webwork:text name="'admin.translations.activate.old.status'"/></b></td>
                                <td width="1%"></td>
                                <td width="1%" nowrap><b><webwork:text name="'admin.translations.activate.new.status'"/></b></td>
                            </tr>
                            <webwork:iterator value="/statusesNeedingMigration">
                            <tr bgcolor="#ffffff">
                                <td nowrap>
                                <webwork:component name="'status'" template="constanticon.jsp">
                                    <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                                    <webwork:param name="'iconurl'" value="./string('iconurl')" />
                                    <webwork:param name="'alt'"><webwork:property value="./string('name')" /></webwork:param>
                                    <webwork:param name="'title'"><webwork:property value="./string('name')" /> - <webwork:property value="./string('description')" /></webwork:param>
                                </webwork:component>
                                <webwork:property value="./string('name')" />
                                </td>

                                <td align="absmiddle" nowrap><img src="<%= request.getContextPath() %>/images/icons/arrow_right_small.gif" height=16 width=16 border=0 align=absmiddle></td>

                                <%-- the name of the select list will be mapping_statusId (generated by action as I can't concat here) --%>
                                <ui:select label="text('issue.field.status')" name="/selectListName(.)" list="/targetStatuses" listKey="'string('id')'" listValue="'string('name')'" theme="'single'">
                                    <ui:param name="'mandatory'" value="true"/>
                                </ui:select>
                            </tr>
                            </webwork:iterator>
                        </table>
                    </div>
                </td></tr>
                </table>
            </webwork:if>
        </webwork:else>
        <page:param name="cancelURI"><webwork:url page="ListWorkflows.jspa"></webwork:url></page:param>
        </td></tr>

        <ui:component name="'workflowName'" template="hidden.jsp"/>
        <ui:component name="'workflowMode'" value="'live'"  template="hidden.jsp"/>
    </page:applyDecorator>
</body>
</html>
