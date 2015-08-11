<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.issuefields.screenschemes.delete'"/></title>
</head>
<body>
    <p>
    <page:applyDecorator name="jiraform">
        <page:param name="action">DeleteFieldScreenScheme.jspa</page:param>
        <page:param name="submitId">delete_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
    	<page:param name="cancelURI"><webwork:url page="ViewFieldScreenSchemes.jspa" /></page:param>
        <page:param name="title"><webwork:text name="'admin.issuefields.screenschemes.delete'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="description">
            <p>
                <webwork:text name="'admin.issuefields.screenschemes.confirm.delete'">
                    <webwork:param name="'value0'"><b><webwork:property value="/fieldScreenScheme/name" /></b></webwork:param>
                </webwork:text>
            </p>
        </page:param>

        <ui:component name="'id'" template="hidden.jsp" theme="'single'" />
        <ui:component name="'confirm'" value="'true'" template="hidden.jsp" theme="'single'" />

    </page:applyDecorator>
    </p>
</body>
</html>
