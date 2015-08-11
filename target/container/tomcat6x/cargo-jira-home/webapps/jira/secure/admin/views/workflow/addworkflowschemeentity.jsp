<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.schemes.workflows.add.workflow.to.scheme'"/></title>
</head>

<body>
<page:applyDecorator name="jiraform">
    <page:param name="action">AddWorkflowSchemeEntity.jspa</page:param>
    <page:param name="submitId">add_submit</page:param>
    <page:param name="submitName"> <webwork:text name="'common.forms.add'"/> </page:param>
    <page:param name="cancelURI"><webwork:url page="EditWorkflowSchemeEntities!default.jspa"><webwork:param name="'schemeId'" value="schemeId"/></webwork:url></page:param>
    <page:param name="title"><webwork:text name="'admin.schemes.workflows.add.workflow.to.scheme'"/></page:param>
    <page:param name="helpURL">workflow_schemes</page:param>
    <page:param name="width">100%</page:param>
    <page:param name="description">
    <p>
    <webwork:text name="'admin.schemes.workflows.please.select.the.issue.type'"/>: <webwork:property value="scheme/string('name')"/>.
    </p>
    </page:param>

    <ui:select label="text('common.concepts.issuetype')" name="'type'" list="issueTypes" listKey="'key'" listValue="'value'">
        <ui:param name="'description'">
            <webwork:text name="'admin.schemes.workflows.issue.type.description'"/>
        </ui:param>
    </ui:select>

    <ui:select label="text('issue.field.workflow')" name="'workflow'" list="/workflows" listKey="'name'" listValue="'name'">
        <ui:param name="'description'">
            <webwork:text name="'admin.schemes.workflows.workflow.description'"/>
        </ui:param>
    </ui:select>

    <ui:component name="'schemeId'" template="hidden.jsp"/>
    <ui:component name="'event'" template="hidden.jsp"/>
</page:applyDecorator>


</body>
</html>
