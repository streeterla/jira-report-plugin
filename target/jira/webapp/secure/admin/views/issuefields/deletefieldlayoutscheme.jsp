<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.issuefields.fieldconfigschemes.delete.field.configuration.scheme'"/></title>
</head>
<body>
    <p>
    <table width=100% cellpadding=10 cellspacing=0 border=0>
    <page:applyDecorator name="jiraform">
        <page:param name="action">DeleteFieldLayoutScheme.jspa</page:param>
        <page:param name="submitId">delete_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
    	<page:param name="cancelURI">ViewFieldLayoutSchemes.jspa</page:param>
        <page:param name="title"><webwork:text name="'admin.issuefields.fieldconfigschemes.delete.field.configuration.scheme'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="helpURL">view_field_layout_schemes</page:param>
        <page:param name="description">
            <webwork:text name="'admin.issuefields.fieldconfigschemes.delete.confirmation'">
                <webwork:param name="'value0'"><b><webwork:property value="/fieldLayoutScheme/name"/></b></webwork:param>
            </webwork:text>

            <webwork:component name="'id'" template="hidden.jsp"/>

            <ui:component name="'confirm'" value="'true'" template="hidden.jsp" theme="'single'" />
        </page:param>
    </page:applyDecorator>
    </table>
    </p>
</body>
</html>
