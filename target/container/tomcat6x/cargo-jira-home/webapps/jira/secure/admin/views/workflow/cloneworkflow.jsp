<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.schemes.workflows.copy.workflow'"/>  - <webwork:property value="workflow/name" /></title>
</head>
<body>
<page:applyDecorator name="jiraform">
    <page:param name="action">CloneWorkflow.jspa</page:param>
    <page:param name="title"><webwork:text name="'admin.schemes.workflows.copy.workflow'"/>: <webwork:property value="workflow/name" /></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="submitId">copy_submit</page:param>
    <page:param name="submitName"><webwork:text name="'common.words.copy'"/></page:param>
    <page:param name="cancelURI">ListWorkflows.jspa</page:param>
    <page:param name="description">
    <p>
        <webwork:text name="'admin.schemes.workflows.please.enter.a.name.and.description'"/>
    </p>
    </page:param>

    <ui:textfield label="text('admin.schemes.workflows.workflow.name')" name="'newWorkflowName'" size="'30'">
        <ui:param name="'description'"><webwork:text name="'admin.common.phrases.use.only.ascii'"/></ui:param>
    </ui:textfield>

    <ui:textfield label="text('common.words.description')" name="'description'" size="'60'">
        <ui:param name="'description'"></ui:param>
    </ui:textfield>

    <ui:component name="'workflowName'" value="/workflow/name" template="hidden.jsp" theme="'single'"  />
    <ui:component name="'workflowMode'" value="/workflow/mode" template="hidden.jsp" />
</page:applyDecorator>
</body>
</html>
