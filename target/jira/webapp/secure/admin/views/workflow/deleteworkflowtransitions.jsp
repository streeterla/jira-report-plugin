<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.workflowtransitions.delete.title'"/></title>
</head>

<body>

    <p>
    <table width=100% cellpadding=10 cellspacing=0 border=0>
    <page:applyDecorator name="jiraform">
        <page:param name="action">DeleteWorkflowTransitions.jspa</page:param>
        <page:param name="submitId">delete_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
    	<page:param name="cancelURI"><webwork:property value="/cancelUrl" /></page:param>
        <page:param name="title"><webwork:text name="'admin.workflowtransitions.delete.title'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="description">
            <webwork:text name="'admin.workflowtransitions.delete.instructions'">
                <webwork:param name="'value0'"><b><webwork:property value="/step/name" /></b></webwork:param>
            </webwork:text>
        </page:param>

        <ui:component name="'workflowStep'" value="step/id" template="hidden.jsp" theme="'single'"  />
        <ui:component name="'workflowName'" value="workflow/name" template="hidden.jsp" theme="'single'"  />
        <ui:component name="'workflowMode'" value="workflow/mode" template="hidden.jsp" />

        <ui:select label="text('admin.workflowtransitions.transitions')" name="'transitionIds'" list="/transitions" listKey="'id'" listValue="'name'" template="selectmultiple.jsp">
            <ui:param name="'size'">5</ui:param>
        </ui:select>

        <ui:component name="'originatingUrl'" template="hidden.jsp" theme="'single'"  />

    </page:applyDecorator>
    </table>
    </p>

</body>
</html>
