<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.addfieldlayoutscheme.title'"/></title>
</head>
<body>
    <p>
    <table width=100% cellpadding=10 cellspacing=0 border=0>
    <page:applyDecorator name="jiraform">
        <page:param name="action">AddFieldLayoutScheme.jspa</page:param>
        <page:param name="submitId">add_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
    	<page:param name="cancelURI">ViewFieldLayoutSchemes.jspa</page:param>
        <page:param name="title"><webwork:text name="'admin.addfieldlayoutscheme.title'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="helpURL">view_field_layout_schemes</page:param>

        <ui:textfield label="text('common.words.name')" name="'name'" size="'30'">
            <ui:param name="'mandatory'" value="true"/>
        </ui:textfield>
        <ui:textarea label="text('common.words.description')" name="'description'" cols="'30'" rows="'3'" />
    </page:applyDecorator>
    </table>
    </p>
</body>
</html>
