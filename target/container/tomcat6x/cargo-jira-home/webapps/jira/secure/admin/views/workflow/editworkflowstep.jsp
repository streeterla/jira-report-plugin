<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.workflowstep.update.workflow.step'"/></title>
</head>

<body>

    <p>
    <table width=100% cellpadding=10 cellspacing=0 border=0>
    <page:applyDecorator name="jiraform">
        <page:param name="action">EditWorkflowStep.jspa</page:param>
        <page:param name="submitId">update_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
    	<page:param name="cancelURI"><webwork:property value="/cancelUrl" /></page:param>
        <page:param name="title"><webwork:text name="'admin.workflowstep.update.workflow.step'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="description">
            <webwork:text name="'admin.workflowstep.update.page.description'">
                <webwork:param name="'value0'"><b><webwork:property value="step/name" /></b></webwork:param>
            </webwork:text>
        </page:param>

        <ui:component name="'workflowStep'" value="step/id" template="hidden.jsp" theme="'single'"  />
        <ui:component name="'workflowName'" value="workflow/name" template="hidden.jsp" theme="'single'"  />
        <ui:component name="'workflowMode'" value="workflow/mode" template="hidden.jsp" />

        <ui:textfield label="text('admin.workflowstep.step.name')" name="'stepName'" size="'30'" />

        <webwork:if test="/oldStepOnDraft(step) == true">
            <ui:select label="text('admin.workflowstep.linked.status')" name="'stepStatus'" list="/statuses" listKey="'string('id')'" listValue="'string('name')'" disabled="'true'">
                <ui:param name="'description'">
                    <webwork:text name="'admin.workflowstep.cannot.change'"/>
                </ui:param>
            </ui:select>
        </webwork:if>
        <webwork:else>
            <ui:select label="text('admin.workflowstep.linked.status')" name="'stepStatus'" list="/statuses" listKey="'string('id')'" listValue="'string('name')'" />
        </webwork:else>

        <ui:component name="'originatingUrl'" template="hidden.jsp" theme="'single'"  />

    </page:applyDecorator>
    </table>
    </p>

</body>
</html>
