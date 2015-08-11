<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.workflows.delete'"/></title>
</head>

<body>

    <p>
    <table width=100% cellpadding=10 cellspacing=0 border=0>
    <page:applyDecorator name="jiraform">
        <page:param name="action">DeleteWorkflow.jspa</page:param>
        <page:param name="submitId">delete_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
    	<page:param name="cancelURI">ListWorkflows.jspa</page:param>
        <webwork:if test="$workflowMode == 'draft'">
            <page:param name="title"><webwork:text name="'admin.workflows.delete.draft'"/></page:param>
        </webwork:if>
        <webwork:else>
            <page:param name="title"><webwork:text name="'admin.workflows.delete'"/></page:param>
        </webwork:else>
        <page:param name="width">100%</page:param>
        <page:param name="description">
            <p>
                <webwork:if test="$workflowMode == 'draft'">
                    <webwork:text name="'admin.workflows.delete.draft.confirmation'">
                        <webwork:param name="'value0'"><strong></webwork:param>
                        <webwork:param name="'value1'"><webwork:property value="/workflowName"/></webwork:param>
                        <webwork:param name="'value2'"></strong></webwork:param>
                    </webwork:text>
                </webwork:if>
                <webwork:else>
                    <webwork:text name="'admin.workflows.delete.confirmation'">
                        <webwork:param name="'value0'"><strong></webwork:param>
                        <webwork:param name="'value1'"><webwork:property value="/workflowName"/></webwork:param>
                        <webwork:param name="'value2'"></strong></webwork:param>
                    </webwork:text>
                </webwork:else>
            </p>
            <p>
                <span class="warning"><webwork:text name="'admin.common.words.warning'"/></span>:
                <webwork:if test="/systemAdministrator == true">
                    <webwork:text name="'admin.workflows.delete.warning'">
                        <webwork:param name="'value0'"><a href="<%=request.getContextPath()%>/secure/admin/XmlBackup!default.jspa"></webwork:param>
                        <webwork:param name="'value1'"></a></webwork:param>
                        <webwork:param name="'value2'"><a href="<webwork:url page="ViewWorkflowXml.jspa"><webwork:param name="'workflowMode'" value="$workflowMode" /><webwork:param name="'workflowName'" value="/workflowName" /></webwork:url>"></webwork:param>
                        <webwork:param name="'value3'"></a></webwork:param>
                    </webwork:text>
                </webwork:if>
                <webwork:else>
                    <webwork:text name="'admin.workflows.delete.warning.admin'">
                        <webwork:param name="'value0'"><a href="<%=request.getContextPath()%>/secure/Administrators.jspa#sysadmins"></webwork:param>
                        <webwork:param name="'value1'"></a></webwork:param>
                        <webwork:param name="'value2'"><a href="<webwork:url page="ViewWorkflowXml.jspa"><webwork:param name="'workflowMode'" value="$workflowMode" /><webwork:param name="'workflowName'" value="/workflowName" /></webwork:url>"></webwork:param>
                        <webwork:param name="'value3'"></a></webwork:param>
                    </webwork:text>
                </webwork:else>
            </p>
        </page:param>

        <ui:component name="'workflowName'" template="hidden.jsp" theme="'single'"  />
        <ui:component name="'workflowMode'" value="$workflowMode" template="hidden.jsp" />
        <ui:component name="'confirmedDelete'" value="'true'" template="hidden.jsp" theme="'single'"  />

    </page:applyDecorator>
    </table>
    </p>

</body>
</html>
