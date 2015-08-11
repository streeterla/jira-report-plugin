
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.workflows.edit.scheme.title'"/></title>
</head>

<body>

    <p>
    <table width=100% cellpadding=10 cellspacing=0 border=0>
    <page:applyDecorator name="jiraform">
        <page:param name="action">EditWorkflowScheme.jspa</page:param>
        <page:param name="submitId">update_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
    	<page:param name="cancelURI">ViewWorkflowSchemes.jspa</page:param>
        <page:param name="title"><webwork:text name="'admin.workflows.edit.scheme'">
            <webwork:param name="'value0'"><webwork:property value="scheme/string('name')" /></webwork:param>
        </webwork:text></page:param>
        <page:param name="width">100%</page:param>

        <ui:textfield label="text('common.words.name')" name="'name'" size="'30'" />
        <ui:textarea label="text('common.words.description')" name="'description'" cols="'30'" rows="'3'" />

        <ui:component name="'schemeId'" template="hidden.jsp" />
    </page:applyDecorator>
    </table>
    </p>

</body>
</html>
