<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.schemes.permissions.add.permission.schemes'"/></title>
</head>
<body>
    <p>
    <page:applyDecorator name="jiraform">
        <page:param name="action">AddPermissionScheme.jspa</page:param>
        <page:param name="submitId">add_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
    	<page:param name="cancelURI">ViewPermissionSchemes.jspa</page:param>
        <page:param name="title"><webwork:text name="'admin.schemes.permissions.add.permission.schemes'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="helpURL">permissionsHelp</page:param>

        <ui:textfield label="text('common.words.name')" name="'name'" size="'30'" />
        <ui:textarea label="text('common.words.description')" name="'description'" cols="'30'" rows="'3'" />
    </page:applyDecorator>
    </p>
</body>
</html>
