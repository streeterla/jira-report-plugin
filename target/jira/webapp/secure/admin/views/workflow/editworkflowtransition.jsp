<%@ page import="com.atlassian.jira.workflow.JiraWorkflow"%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.workflowtransitions.update.title'"/></title>
</head>

<body>

    <p>
    <table width=100% cellpadding=10 cellspacing=0 border=0>
    <page:applyDecorator name="jiraform">
        <page:param name="action">EditWorkflowTransition.jspa</page:param>
        <page:param name="submitId">update_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
    	<page:param name="cancelURI"><webwork:property value="/cancelUrl" /></page:param>
        <page:param name="title"><webwork:text name="'admin.workflowtransitions.update.title'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="instructions">
            <p><webwork:text name="'admin.workflowtransitions.update.page.description'">
                <webwork:param name="'value0'"><strong><webwork:property value="/transition/name" /></strong></webwork:param>
            </webwork:text></p>
            <webwork:if test="/nameI8n">
                <div class="infoBox">
                    <webwork:text name="'admin.workflowtransitions.update.information'">
                        <webwork:param name="'value0'"><code><%=JiraWorkflow.JIRA_META_ATTRIBUTE_I18N%></code></webwork:param>
                        <webwork:param name="'value1'"><code><webwork:property value="nameI8n" /></code></webwork:param>
                        <webwork:param name="'value2'"><a href="<webwork:url page="ViewWorkflowTransitionMetaAttributes.jspa"><webwork:param name="'workflowMode'" value="workflow/mode" /><webwork:param name="'workflowName'" value="workflow/name" /><webwork:param name="'workflowStep'" value="/step/id" /><webwork:param name="'workflowTransition'" value="transition/id" /></webwork:url>"></webwork:param>
                        <webwork:param name="'value3'"></a></webwork:param>
                    </webwork:text>
                </div>
            </webwork:if>
        </page:param>

        <ui:component name="'workflowStep'" value="step/id" template="hidden.jsp" />
        <ui:component name="'workflowName'" value="workflow/name" template="hidden.jsp" />
        <ui:component name="'workflowMode'" value="workflow/mode" template="hidden.jsp" />
        <ui:component name="'workflowTransition'" value="transition/id" template="hidden.jsp" />

        <ui:textfield label="text('admin.workflowtransitions.transition.name')" name="'transitionName'" size="'30'" />
        <ui:textfield label="text('common.words.description')" name="'description'" >
            <ui:param name="'class'">textfield</ui:param>
        </ui:textfield>
        <ui:select label="text('admin.workflowtransition.destinationstep')" name="'destinationStep'" list="/transitionSteps" listKey="'id'" listValue="'name'" />

        <webwork:if test="/setView == true">
            <ui:select label="text('admin.workflowtransition.transitionview')" name="'view'" list="/fieldScreens" listKey="'id'" listValue="'name'">
                <ui:param name="'headerrow'"><webwork:text name="'admin.workflowtransitions.no.view.for.transition'"/></ui:param>
                <ui:param name="'headervalue'" value="''" />
                <ui:param name="'description'"><webwork:text name="'admin.workflowtransitions.the.screen.that.appears.for.this.transition'"/></ui:param>
            </ui:select>
        </webwork:if>

        <ui:component name="'originatingUrl'" template="hidden.jsp" />

    </page:applyDecorator>
    </table>
    </p>

</body>
</html>
