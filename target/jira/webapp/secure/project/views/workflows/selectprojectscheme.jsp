

<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.selectworkflowscheme.select.workflow.scheme'"/></title>
</head>

<body>

<webwork:if test="schemes == null || schemes/size == 0">
    <page:applyDecorator name="jirapanel">
        <page:param name="title"><webwork:text name="'admin.selectworkflowscheme.associate.scheme.to.project'"/>: <webwork:property value="project/string('name')" /></page:param>
        <page:param name="width">100%</page:param>

        <p>
        <webwork:text name="'admin.selectworkflowscheme.currently.no.workflows'"/>
        </p>
        <p>
        <a href="<%= request.getContextPath() %>/secure/admin/ViewWorkflowSchemes.jspa">Add</a> a new workflow scheme.
        </p>
    </page:applyDecorator>
</webwork:if>
<webwork:else>
	<page:applyDecorator name="jiraform">
		<page:param name="title"><webwork:text name="'admin.selectworkflowscheme.associate.scheme.to.project'"/></page:param>
        <page:param name="description">
            <p><webwork:text name="'admin.selectworkflowscheme.step1'">
                <webwork:param name="'value0'"><b></webwork:param>
                <webwork:param name="'value1'"></b></webwork:param>
            </webwork:text></p>
            <p>
                <webwork:if test="/systemAdministrator == true">
                    <webwork:text name="'admin.selectworkflowscheme.backupnote'">
                        <webwork:param name="'value0'"><span class="note"></webwork:param>
                        <webwork:param name="'value1'"></span></webwork:param>
                        <webwork:param name="'value2'"><a href="<%= request.getContextPath() %>/secure/admin/XmlBackup!default.jspa"></webwork:param>
                        <webwork:param name="'value3'"></a></webwork:param>
                    </webwork:text>
                </webwork:if>
                <webwork:else>
                    <webwork:text name="'admin.selectworkflowscheme.backupnote.admin'">
                        <webwork:param name="'value0'"><span class="note"></webwork:param>
                        <webwork:param name="'value1'"></span></webwork:param>
                        <webwork:param name="'value2'"><a href="<%=request.getContextPath()%>/secure/Administrators.jspa#sysadmins"></webwork:param>
                        <webwork:param name="'value3'"></a></webwork:param>
                    </webwork:text>
                </webwork:else>
            </p>
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
            <page:param name="width">100%</page:param>
            <page:param name="action">SelectProjectWorkflowSchemeStep2!default.jspa</page:param>
            <page:param name="submitId">associate_submit</page:param>
            <page:param name="submitName"><webwork:text name="'admin.projects.schemes.associate'"/></page:param>

            <ui:select label="text('admin.common.words.scheme')" name="'schemeId'" value="schemeIds[0]" list="schemes" listKey="'string('id')'" listValue="'string('name')'" template="selectmap.jsp">
                <ui:param name="'headerrow'" value="'Default'" />
                <ui:param name="'headervalue'" value="''" />
            </ui:select>
            <ui:component name="'projectId'" template="hidden.jsp"/>
        </webwork:else>
        <page:param name="cancelURI"><webwork:url page="ViewProject.jspa"><webwork:param name="'pid'" value="projectId"/></webwork:url></page:param>
    </page:applyDecorator>
</webwork:else>

</body>
</html>
