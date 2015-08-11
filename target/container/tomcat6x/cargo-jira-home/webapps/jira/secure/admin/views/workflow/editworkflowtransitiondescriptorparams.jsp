<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.workflowtransition.update.workflow.transition'"/> <webwork:property value="/workflowDescriptorName"/></title>
</head>

<body>

    <page:applyDecorator name="jiraform">
        <page:param name="action"><webwork:property value="/actionName"/>.jspa</page:param>
        <page:param name="submitId">update_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
    	<page:param name="cancelURI"><webwork:url page="ViewWorkflowTransition.jspa"><webwork:param name="'workflowMode'" value="workflow/mode" /><webwork:param name="'workflowName'" value="workflow/name" /><webwork:param name="'workflowStep'" value="/step/id" /><webwork:param name="'workflowTransition'" value="transition/id" /></webwork:url></page:param>
        <page:param name="title"><webwork:text name="'admin.workflowtransition.update.parameters.of'">
                <webwork:param name="'value0'"><webwork:property value="/workflowDescriptorName"/></webwork:param>
            </webwork:text></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="description">
            <webwork:text name="'admin.workflowtransition.update.parameters.of'">
                <webwork:param name="'value0'"><webwork:property value="/workflowDescriptorName"/></webwork:param>
            </webwork:text>
        </page:param>

        <ui:component name="'workflowStep'" value="step/id" template="hidden.jsp" />
        <ui:component name="'workflowName'" value="workflow/name" template="hidden.jsp" />
        <ui:component name="'workflowMode'" value="workflow/mode" template="hidden.jsp" />
        <ui:component name="'workflowTransition'" value="transition/id" template="hidden.jsp" />
        <ui:component name="'count'" value="count" template="hidden.jsp" />

        <webwork:property value="/descriptorHtml" escape="'false'" />
    </page:applyDecorator>

</body>
</html>
