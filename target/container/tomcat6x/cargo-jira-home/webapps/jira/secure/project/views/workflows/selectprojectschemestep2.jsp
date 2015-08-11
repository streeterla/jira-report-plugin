<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><webwork:text name="'admin.selectworkflowscheme.select.workflow.scheme'"/></title>
</head>
<body>
    <page:applyDecorator name="jiraform">
        <page:param name="title"><webwork:text name="'admin.selectworkflowscheme.associate.scheme.to.project'"/>: <webwork:property value="project/string('name')" /></page:param>
        <page:param name="description">
            <p><webwork:text name="'admin.selectworkflowscheme.step2'">
                <webwork:param name="'value0'"><b></webwork:param>
                <webwork:param name="'value1'"></b></webwork:param>
            </webwork:text></p>

            <webwork:if test="/haveIssuesToMigrate == true">
                <p>
                    <webwork:text name="'admin.selectworkflowscheme.step2.reallybackupnote.line1'">
                        <webwork:param name="'value0'"><span class="warning"></webwork:param>
                        <webwork:param name="'value1'"></span></webwork:param>
                        <webwork:param name="'value2'"><webwork:property value="project/string('name')" /></webwork:param>
                    </webwork:text>
                    <br />
                    <webwork:if test="/systemAdministrator == true">
                        <webwork:text name="'admin.selectworkflowscheme.step2.reallybackupnote.line2'">
                            <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/admin/XmlBackup!default.jspa"></webwork:param>
                            <webwork:param name="'value1'"></a></webwork:param>
                        </webwork:text>
                    </webwork:if>
                    <webwork:else>
                        <webwork:text name="'admin.selectworkflowscheme.step2.reallybackupnote.line2.admin'">
                            <webwork:param name="'value0'"><a href="<%=request.getContextPath()%>/secure/Administrators.jspa#sysadmins"></webwork:param>
                            <webwork:param name="'value1'"></a></webwork:param>
                        </webwork:text>
                    </webwork:else>
                    <webwork:if test="/scheme != null">
                        <webwork:text name="'admin.selectworkflowscheme.step2.reallybackupnote.associate.scheme'">
                            <webwork:param name="'value0'"><webwork:property value="/scheme/string('name')" /></webwork:param>
                            <webwork:param name="'value1'"><webwork:property value="/project/string('name')" /></webwork:param>
                        </webwork:text>
                    </webwork:if>
                    <webwork:else>
                        <webwork:text name="'admin.selectworkflowscheme.step2.reallybackupnote.associate.default'">
                            <webwork:param name="'value0'"><webwork:property value="/project/string('name')" /></webwork:param>
                        </webwork:text>
                    </webwork:else>
                    <webwork:if test="/systemAdministrator == true">
                        <webwork:text name="'admin.selectworkflowscheme.step2.reallybackupnote.restore'" />
                    </webwork:if>
                    <webwork:else>
                        <webwork:text name="'admin.selectworkflowscheme.step2.reallybackupnote.restore.admin'">
                            <webwork:param name="'value0'"><a href="<%=request.getContextPath()%>/secure/Administrators.jspa#sysadmins"></webwork:param>
                            <webwork:param name="'value1'"></a></webwork:param>
                        </webwork:text>
                    </webwork:else>
                </p>
            </webwork:if>
        </page:param>
        <%-- TODO - until we have an All Tasks Page this is disabled --%>
        <%--<page:param name="instructions">--%>
             <%--<webwork:if test="anyLiveTasks == true">--%>
                 <%--<ui:component template="taskwarning.jsp"/>--%>
             <%--</webwork:if>--%>
          <%--</page:param>--%>
        <webwork:if test="currentTask">
             <tr bgcolor="#ffffff"><td colspan="2">
             <webwork:text name="'admin.selectworkflowscheme.blocked.by.user'">
                 <webwork:param name="'value0'"><a href="<webwork:property value="currentTask/userURL"/>"><webwork:property value="currentTask/user"/></a></webwork:param>
             </webwork:text>

             <webwork:text name="'admin.selectworkflowscheme.goto.progressbar'">
                 <webwork:param name="'value0'"><a href="<webwork:property value="currentTask/progressURL"/>"></webwork:param>
                 <webwork:param name="'value1'"><webwork:text name="'common.words.here'"/></webwork:param>
                 <webwork:param name="'value2'"></a></webwork:param>
             </webwork:text>
             </td></tr>
        </webwork:if>
        <webwork:else>
            <page:param name="action">SelectProjectWorkflowSchemeStep2.jspa</page:param>
            <page:param name="submitId">associate_submit</page:param>
            <page:param name="submitName"><webwork:text name="'admin.projects.schemes.associate'"/></page:param>
            <page:param name="autoSelectFirst">false</page:param>

            <webwork:if test="/haveIssuesToMigrate == true">
            <webwork:iterator value="/migrationHelper/typesNeedingMigration">
                <tr bgcolor="#ffffff">
                    <td>
                        <webwork:component name="'status'" template="constanticon.jsp">
                            <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                            <webwork:param name="'iconurl'" value="./string('iconurl')" />
                            <webwork:param name="'alt'"><webwork:property value="./string('name')" /></webwork:param>
                            <webwork:param name="'title'"><webwork:property value="./string('name')" /> - <webwork:property value="./string('description')" /></webwork:param>
                        </webwork:component>
                        <webwork:property value="./string('name')" />
                        <br>
                        (<font size=1><webwork:text name="'admin.selectworkflowscheme.num.affected.issues'">
                            <webwork:param name="'value0'"><webwork:property value ="/numAffectedIssues(.)"/></webwork:param>
                            <webwork:param name="'value1'"><webwork:property value ="/totalAffectedIssues(.)"/></webwork:param>
                        </webwork:text></font>)
                    </td>
                    <td>
                        <table id="statusmapping_<webwork:property value="./string('id')" />">
                        <tr>
                            <td bgcolor=#f0f0f0>
                            <webwork:property value="/existingWorkflow(.)/name" />
                            </td>
                            <td>&raquo;</td>
                            <td bgcolor=#f0f0f0>
                            <webwork:property value="/targetWorkflow(.)/name" />
                            </td>
                        </tr>
                        <%-- Call the getStatusesNeedingMigration(issueType) method on the WebWork action so that the statuses are
                         sorted correctly --%>
                        <webwork:iterator value="/statusesNeedingMigration(.)">
                        <tr>
                            <td>
                            <webwork:component name="'status'" template="constanticon.jsp">
                                <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                                <webwork:param name="'iconurl'" value="./string('iconurl')" />
                                <webwork:param name="'alt'"><webwork:property value="./string('name')" /></webwork:param>
                                <webwork:param name="'title'"><webwork:property value="./string('name')" /> - <webwork:property value="./string('description')" /></webwork:param>
                            </webwork:component>
                            <webwork:property value="./string('name')" />
                            </td>

                            <td>&raquo;</td>

                            <%-- the name of the select list will be mapping_issueTypeId_statusId (generated by action as I can't concat here) --%>
                            <ui:select label="text('issue.field.status')" name="/selectListName(.., .)" list="/targetStatuses(..)" listKey="'string('id')'" listValue="'string('name')'" theme="'single'">
                                <ui:param name="'mandatory'" value="true"/>
                            </ui:select>
                        </tr>
                        </webwork:iterator>
                        </table>
                    </td>
                 </tr>
            </webwork:iterator>
            <webwork:if test="/migrationHelper/typesNeedingMigration/size == 0">
                <tr bgcolor="#fffff0">
                    <td colspan="2"><webwork:text name="'admin.selectworkflowscheme.all.issues.automatic'"/></td>
                </tr>
            </webwork:if>
            </webwork:if>
            <webwork:else>
                <tr bgcolor="#fffff0">
                    <td colspan="2"><webwork:text name="'admin.selectworkflows.no.issues.to.migrate'"/></td>
                </tr>
            </webwork:else>
        </webwork:else>
        <page:param name="cancelURI"><webwork:url page="ViewProject.jspa"><webwork:param name="'pid'" value="projectId"/></webwork:url></page:param>

        <ui:component name="'projectId'" template="hidden.jsp"/>
        <ui:component name="'schemeId'" template="hidden.jsp"/>
        <webwork:if test="origSchemeId != null">
            <ui:component name="'origSchemeId'" template="hidden.jsp"/>
        </webwork:if>
    </page:applyDecorator>
</body>
</html>
