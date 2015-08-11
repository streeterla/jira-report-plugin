<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.issuefields.screens.copy.screen'"/></title>
</head>
<body>
    <p>
    <page:applyDecorator name="jiraform">
        <page:param name="action">CopyFieldScreen.jspa</page:param>
        <page:param name="submitId">copy_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.words.copy'"/></page:param>
    	<page:param name="cancelURI"><webwork:url page="ViewFieldScreens.jspa" /></page:param>
        <page:param name="title"><webwork:text name="'admin.issuefields.screens.copy.screen'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="description">
            <p>
                <webwork:text name="'admin.issuefields.screens.copy.instructions'">
                    <webwork:param name="'value0'"><b><webwork:property value="/fieldScreen/name" /></b></webwork:param>
                </webwork:text>
            </p>
        </page:param>

        <ui:textfield label="text('common.words.name')" name="'fieldScreenName'" size="'30'">
            <ui:param name="'mandatory'">true</ui:param>
        </ui:textfield>

        <ui:textfield label="text('common.words.description')" name="'fieldScreenDescription'" size="'60'" />

        <ui:component name="'id'" template="hidden.jsp" theme="'single'" />

        <ui:component name="'edited'" value="'true'" template="hidden.jsp" theme="'single'" />
    </page:applyDecorator>
    </p>
</body>
</html>
