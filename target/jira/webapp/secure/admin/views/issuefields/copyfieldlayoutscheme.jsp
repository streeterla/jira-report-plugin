<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.issuefields.fieldconfigschemes.copy.field.layout.configuration'"/></title>
</head>
<body>
    <p>
    <table width=100% cellpadding=10 cellspacing=0 border=0>
    <page:applyDecorator name="jiraform">
        <page:param name="action">CopyFieldLayoutScheme.jspa</page:param>
        <page:param name="submitId">copy_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.words.copy'"/></page:param>
    	<page:param name="cancelURI">ViewFieldLayoutSchemes.jspa</page:param>
        <page:param name="title"><webwork:text name="'admin.issuefields.fieldconfigschemes.copy.field.layout.configuration'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="helpURL">view_field_layout_schemes</page:param>
        <page:param name="description">
            <webwork:text name="'admin.issuefields.fieldconfigschemes.please.specify.name.and.description'">
                <webwork:param name="'value0'"><b><webwork:property value="/fieldLayoutScheme/name"/></b></webwork:param>
            </webwork:text>
        </page:param>

        <ui:textfield label="text('common.words.name')" name="'fieldLayoutSchemeName'" size="'30'">
            <ui:param name="'mandatory'">true</ui:param>
        </ui:textfield>

        <ui:textfield label="text('common.words.description')" name="'fieldLayoutSchemeDescription'" size="'60'" />

        <ui:component name="'id'" template="hidden.jsp" theme="'single'" />
    </page:applyDecorator>
    </table>
    </p>
</body>
</html>
