<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.workflows.viewproperties'"/> - <webwork:property value="step/name" /></title>
</head>
<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.workflows.viewproperties'"/>: <webwork:property value="step/name" /></page:param>
    <page:param name="width">100%</page:param>
    <p>
        <webwork:text name="'admin.workflows.thispageshows'">
            <webwork:param name="'value0'"><b><a href="<webwork:url page="ViewWorkflowStep.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="/step/id" /></webwork:url>"><webwork:property value="/step/name" /></a></b></webwork:param>
        </webwork:text>
    </p>

    <p>
        <ul>
            <li><webwork:text name="'admin.workflows.a.property.consists.of'"/></li>
            <li><webwork:text name="'admin.workflows.arbitrary.properties'"/></li>
        </ul>
    </p>
    <ul class="square">
        <li><webwork:text name="'admin.workflows.viewallsteps'">
            <webwork:param name="'value0'"><a href="<webwork:url page="ViewWorkflowSteps.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="workflow/name" /></webwork:url>"><b></webwork:param>
            <webwork:param name="'value1'"></b></a></webwork:param>
            <webwork:param name="'value2'"><b><webwork:property value="/workflowDisplayName" /></b></webwork:param>
        </webwork:text></li>
    </ul>
</page:applyDecorator>

    <%@ include file="/includes/admin/workflow/metaattributes.jsp" %>

    <p>
    <webwork:if test="workflow/editable == true">
        <p>
        <page:applyDecorator name="jiraform">
            <page:param name="action">AddWorkflowStepMetaAttribute.jspa</page:param>
            <page:param name="submitId">add_submit</page:param>
            <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
            <page:param name="title"><webwork:text name="'admin.workflows.add.new.property'"/></page:param>
            <page:param name="width">100%</page:param>

            <ui:component name="'workflowName'" value="workflow/name"  template="hidden.jsp"/>
            <ui:component name="'workflowMode'" value="workflow/mode" template="hidden.jsp" />
            <ui:component name="'workflowStep'" value="step/id"  template="hidden.jsp"/>

            <ui:textfield label="text('admin.workflows.property.key')" name="'attributeKey'" size="'30'" />

            <ui:textfield label="text('admin.workflows.property.value')" name="'attributeValue'" size="'30'" />
        </page:applyDecorator>
    </webwork:if>
    </p>

</body>
</html>
