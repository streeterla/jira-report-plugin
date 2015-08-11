
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.roles.edit.role'"/></title>
</head>

<body>
    <p>
    <page:applyDecorator name="jiraform">
        <page:param name="action">EditProjectRole.jspa</page:param>
        <page:param name="submitId">update_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="cancelURI">ViewProjectRoles.jspa</page:param>
        <page:param name="title"><webwork:text name="'admin.roles.edit.role'"/>: <webwork:property value="name" /></page:param>
        <page:param name="helpURL">project_roles</page:param>
        <page:param name="helpURLFragment">#Editing+a+project+role</page:param>

        <ui:textfield label="text('common.words.name')" name="'name'" size="'30'" />

        <ui:textfield label="text('common.words.description')" name="'description'" size="'60'" />

    	<ui:component name="'id'" template="hidden.jsp" theme="'single'"  />
    </page:applyDecorator>
    </p>

</body>
</html>
