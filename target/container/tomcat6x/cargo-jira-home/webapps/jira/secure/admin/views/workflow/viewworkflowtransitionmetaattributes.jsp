<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.workflowtransition.view.workflow.transition.properties'"/> - <webwork:property value="transition/name" /></title>
</head>
<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.workflowtransition.view.workflow.transition.properties'"/>: <webwork:property value="transition/name" /></page:param>
    <page:param name="width">100%</page:param>
    <p>
        <webwork:text name="'admin.workflowtransition.page.description'">
            <webwork:param name="'value0'"><b><webwork:property value="transition/name" /></b></webwork:param>
        </webwork:text>
    </p>

    <p>
        <ul>
            <li><webwork:text name="'admin.workflowtransition.propertyconsistsof'"/></li>
            <li><webwork:text name="'admin.workflowtransition.arbitraryproperties'"/></li>
        </ul>
    </p>

    <ul class="square">
        <li><webwork:text name="'admin.workflowtransition.view.workflow.transition.specific'">
            <webwork:param name="'value0'"><a href="<webwork:url page="ViewWorkflowTransition.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="workflow/name" /><webwork:param name="'workflowStep'" value="/step/id" /><webwork:param name="'workflowTransition'" value="transition/id" /></webwork:url>"><b></webwork:param>
            <webwork:param name="'value1'"></b></a></webwork:param>
            <webwork:param name="'value2'"><b><webwork:property value="transition/name"/></b></webwork:param>
        </webwork:text></li>
    </ul>
</page:applyDecorator>

    <%@ include file="/includes/admin/workflow/metaattributes.jsp" %>

    <webwork:if test="workflow/editable == true">
        <p>
        <page:applyDecorator name="jiraform">
            <page:param name="action">AddWorkflowTransitionMetaAttribute.jspa</page:param>
            <page:param name="submitId">add_submit</page:param>
            <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
            <page:param name="title"><webwork:text name="'admin.workflowtransition.addnewproperty'"/></page:param>
            <page:param name="width">100%</page:param>

            <ui:component name="'workflowName'" value="workflow/name"  template="hidden.jsp"/>
            <ui:component name="'workflowMode'" value="workflow/mode" template="hidden.jsp" />
            <ui:component name="'workflowStep'" value="step/id"  template="hidden.jsp"/>
            <ui:component name="'workflowTransition'" value="transition/id"  template="hidden.jsp"/>

            <ui:textfield label="text('admin.workflowtransition.propertykey')" name="'attributeKey'" size="'30'" />

            <ui:textfield label="text('admin.workflowtransition.propertyvalue')" name="'attributeValue'" size="'30'" />
        </page:applyDecorator>
        </p>
    </webwork:if>
</body>
</html>
