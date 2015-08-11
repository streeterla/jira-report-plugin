<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.issuefields.screenschemes.edit.screen.scheme'"/></title>
</head>
<body>
    <p>
    <page:applyDecorator name="jiraform">
        <page:param name="action">EditFieldScreenScheme.jspa</page:param>
        <page:param name="submitId">update_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.words.update'"/></page:param>
    	<page:param name="cancelURI"><webwork:url page="ViewFieldScreenSchemes.jspa" /></page:param>
        <page:param name="title"><webwork:text name="'admin.issuefields.screenschemes.edit.screen.scheme'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="description">
            <p>
                <webwork:text name="'admin.issuefields.screenschemes.use.the.form.below'">
                    <webwork:param name="'value0'"><b><webwork:property value="/fieldScreenScheme/name" /></b></webwork:param>
                </webwork:text>
            </p>
        </page:param>

        <ui:textfield label="text('common.words.name')" name="'fieldScreenSchemeName'" size="'30'">
            <ui:param name="'mandatory'">true</ui:param>
        </ui:textfield>

        <ui:textfield label="text('common.words.description')" name="'fieldScreenSchemeDescription'" size="'60'" />

        <ui:component name="'id'" template="hidden.jsp" theme="'single'" />
    </page:applyDecorator>
    </p>
</body>
</html>
