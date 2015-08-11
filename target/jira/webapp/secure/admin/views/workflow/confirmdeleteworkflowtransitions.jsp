<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.workflowtransitions.delete.workflow.transitions'"/></title>
</head>

<body>

    <p>
    <table width=100% cellpadding=10 cellspacing=0 border=0>
    <page:applyDecorator name="jiraform">
        <page:param name="action">DeleteWorkflowTransitions.jspa</page:param>
        <page:param name="submitId">delete_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
    	<page:param name="cancelURI"><webwork:url page="ViewWorkflowTransition.jspa"><webwork:param name="'workflowMode'" value="workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="/step/id" /><webwork:param name="'workflowTransition'" value="/selectedTransitions/iterator/next/id" /></webwork:url></page:param>
        <page:param name="title"><webwork:text name="'admin.workflowtransitions.delete.workflow.transitions'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="description">
            <p>
                <webwork:text name="'admin.workflowtransitions.delete.confirm.deletion'">
                    <webwork:param name="'value0'"><webwork:iterator value="/selectedTransitions" status="'status'">
                    <webwork:if test="@status/first == false">, </webwork:if><b><webwork:property value="name" /></b>
                </webwork:iterator></webwork:param>
                </webwork:text>
            </p>
        </page:param>

        <ui:component name="'workflowStep'" value="step/id" template="hidden.jsp" />
        <ui:component name="'workflowName'" value="workflow/name" template="hidden.jsp" />
        <ui:component name="'workflowMode'" value="workflow/mode" template="hidden.jsp" />

        <webwork:iterator value="/selectedTransitions">
            <ui:component name="'transitionIds'" value="./id" template="hidden.jsp" />
        </webwork:iterator>
    </page:applyDecorator>
    </table>
    </p>

</body>
</html>
