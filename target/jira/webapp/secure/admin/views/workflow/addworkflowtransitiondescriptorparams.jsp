<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.schemes.add.workflow.transition.name'">
	    <webwork:param name="'value0'"><webwork:property value="/workflowDescriptorName"/></webwork:param>
	</webwork:text></title>
</head>

<body>

    <page:applyDecorator name="jiraform">
        <page:param name="action"><webwork:property value="/actionName"/>.jspa</page:param>
        <page:param name="submitId">add_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
    	<page:param name="cancelURI"><webwork:url page="ViewWorkflowTransition.jspa"><webwork:param name="'workflowMode'" value="workflow/mode" /><webwork:param name="'workflowName'" value="workflow/name" /><webwork:param name="'workflowStep'" value="/step/id" /><webwork:param name="'workflowTransition'" value="transition/id" /></webwork:url></page:param>
        <page:param name="title"><webwork:text name="'admin.schemes.add.parameters'">
            <webwork:param name="'value0'"><webwork:property value="/workflowDescriptorName"/></webwork:param>
        </webwork:text></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="description">
            <webwork:text name="'admin.schemes.add.required.parameters'">
                <webwork:param name="'value0'"><webwork:property value="/workflowDescriptorName"/></webwork:param>
            </webwork:text>
        </page:param>

        <ui:component name="'workflowStep'" value="step/id" template="hidden.jsp" />
        <ui:component name="'workflowName'" value="workflow/name" template="hidden.jsp" />
        <ui:component name="'workflowMode'" value="workflow/mode" template="hidden.jsp" />
        <ui:component name="'workflowTransition'" value="transition/id" template="hidden.jsp" />
        <ui:component name="'pluginModuleKey'" template="hidden.jsp" />
        <ui:component name="'count'" template="hidden.jsp" />
        <ui:component name="'nested'" template="hidden.jsp" />

        <webwork:property value="/descriptorHtml" escape="'false'" />
    </page:applyDecorator>

</body>
</html>
