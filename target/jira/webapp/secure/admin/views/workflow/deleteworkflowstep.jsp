<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.workflowstep.delete'"/>: <webwork:property value="step/name" /></title>
</head>

<body>

<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'admin.workflowstep.delete'"/>: <webwork:property value="step/name" /></page:param>
	<page:param name="description">
		<p><webwork:text name="'admin.workflowstep.delete.confirmation'"/></p>
	</page:param>
	<page:param name="width">100%</page:param>
	<page:param name="action">DeleteWorkflowStep.jspa</page:param>
	<page:param name="submitId">delete_submit</page:param>
	<page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
	<page:param name="cancelURI"><webwork:property value="/cancelUrl" /></page:param>

	<ui:component name="'workflowStep'" value="step/id" template="hidden.jsp" theme="'single'"  />
	<ui:component name="'workflowName'" value="workflow/name" template="hidden.jsp" theme="'single'"  />
    <ui:component name="'workflowMode'" value="workflow/mode" template="hidden.jsp" />

    <ui:component name="'originatingUrl'" template="hidden.jsp" theme="'single'"  />
</page:applyDecorator>

</body>
</html>
