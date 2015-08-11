<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title>
        <webwork:text name="'admin.workflows.edit'"/>
    </title>
</head>
<body>
    <page:applyDecorator name="jiraform">
        <page:param name="action">EditWorkflow.jspa</page:param>
        <page:param name="submitId">edit_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.words.edit'"/></page:param>
        <page:param name="cancelURI">ListWorkflows.jspa</page:param>
        <page:param name="title">
            <webwork:text name="'admin.workflows.edit'"/>
        </page:param>
        <page:param name="width">100%</page:param>

        <webwork:if test="/workflow/draftWorkflow == false">
            <ui:textfield label="text('common.words.name')" name="'newWorkflowName'" size="'30'">
                <ui:param name="'mandatory'">true</ui:param>
            </ui:textfield>
        </webwork:if>
        <ui:textfield label="text('common.words.description')" name="'description'" size="'60'" />

        <ui:component name="'workflowName'" value="/workflow/name" template="hidden.jsp" />
        <ui:component name="'workflowMode'" value="/workflow/mode" template="hidden.jsp" />
    </page:applyDecorator>
</body>
</html>
