<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.issuefields.fieldconfigurations.copy.field.configuration'"/></title>
</head>
<body>
    <p>
    <page:applyDecorator name="jiraform">
        <page:param name="action">CopyFieldLayout.jspa</page:param>
        <page:param name="cancelURI"><webwork:url page="ViewFieldLayouts.jspa" /></page:param>
        <page:param name="submitId">copy_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.words.copy'"/></page:param>
        <page:param name="title"><webwork:text name="'admin.issuefields.fieldconfigurations.copy.field.configuration'"/>: <webwork:property value="/fieldLayout/name" /></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="description">
        <p>
            <webwork:text name="'admin.issuefields.fieldconfigurations.copy.field.instructions'"/>
        </p>
        </page:param>

        <ui:textfield label="text('common.words.name')" name="'fieldLayoutName'" size="'30'">
            <ui:param name="'mandatory'">true</ui:param>
        </ui:textfield>

        <ui:textfield label="text('common.words.description')" name="'fieldLayoutDescription'" size="'60'" />

        <ui:component name="'id'" template="hidden.jsp" theme="'single'" />

    </page:applyDecorator>
    </p>
</body>
</html>
