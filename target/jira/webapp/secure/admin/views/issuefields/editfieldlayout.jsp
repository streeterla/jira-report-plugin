<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.issuefields.fieldconfigurations.edit.field.configuration'"/></title>
</head>
<body>
    <p>
    <page:applyDecorator name="jiraform">
        <page:param name="action">EditFieldLayout.jspa</page:param>
        <page:param name="cancelURI"><webwork:url page="ViewFieldLayouts.jspa" /></page:param>
        <page:param name="submitId">update_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
        <page:param name="title"><webwork:text name="'admin.issuefields.fieldconfigurations.edit.field.configuration'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="description">
        <p>
            <webwork:text name="'admin.issuefields.fieldconfigurations.edit.page.description'">
                <webwork:param name="'value0'"><webwork:property value="/fieldLayout/name" /></webwork:param>
            </webwork:text>
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
