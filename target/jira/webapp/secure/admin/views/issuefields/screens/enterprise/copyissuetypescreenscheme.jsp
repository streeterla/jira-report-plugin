<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.issuefields.issuetypescreenschemes.copy'"/></title>
</head>
<body>
    <p>
    <page:applyDecorator name="jiraform">
        <page:param name="action">CopyIssueTypeScreenScheme.jspa</page:param>
        <page:param name="submitId">copy_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.words.copy'"/></page:param>
    	<page:param name="cancelURI"><webwork:url page="ViewIssueTypeScreenSchemes.jspa" /></page:param>
        <page:param name="title"><webwork:text name="'admin.issuefields.issuetypescreenschemes.copy'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="description">
            <p>
                <webwork:text name="'admin.issuefields.issuetypescreenschemes.copy.instruction'">
                    <webwork:param name="'value0'"><b><webwork:property value="/issueTypeScreenScheme/name" /></b></webwork:param>
                </webwork:text>
            </p>
        </page:param>

        <ui:textfield label="text('common.words.name')" name="'schemeName'" size="'30'">
            <ui:param name="'mandatory'">true</ui:param>
        </ui:textfield>

        <ui:textfield label="text('common.words.description')" name="'schemeDescription'" size="'60'" />

        <ui:component name="'id'" template="hidden.jsp" theme="'single'" />

        <ui:component name="'edited'" value="'true'" template="hidden.jsp" theme="'single'" />
    </page:applyDecorator>
    </p>
</body>
</html>
