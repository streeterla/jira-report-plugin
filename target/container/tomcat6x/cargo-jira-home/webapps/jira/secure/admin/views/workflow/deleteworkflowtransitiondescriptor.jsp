<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.workflowtransition.delete.workflow.transition'"/> <webwork:property value="/workflowDescriptorName"/></title>
</head>

<body>

<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'admin.workflowtransition.delete.workflow.transition'"/> <webwork:property value="/workflowDescriptorName"/></page:param>
	<page:param name="width">100%</page:param>
	<page:param name="action">ViewWorkflowTransition.jspa</page:param>
	<page:param name="submitId">ok_submit</page:param>
	<page:param name="submitName"> <webwork:text name="'admin.common.words.ok'"/> </page:param>

    <ui:component name="'workflowStep'" value="step/id" template="hidden.jsp" />
    <ui:component name="'workflowName'" value="workflow/name" template="hidden.jsp" />
    <ui:component name="'workflowMode'" value="workflow/mode" template="hidden.jsp" />
    <ui:component name="'workflowTransition'" value="transition/id" template="hidden.jsp" />

</page:applyDecorator>

</body>
</html>
