
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.trustedapps.delete.app'"/>: <webwork:property value="/name" /></title>
</head>

<body>

<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'admin.trustedapps.delete.app'"/>: <webwork:property value="/name" /></page:param>

    <webwork:if test="/editable == true">
    	<page:param name="submitId">delete_submit</page:param>
    	<page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
        <page:param name="description">
            <p><webwork:text name="'admin.trustedapps.delete.confirmation'">
                <webwork:param name="'value0'"><strong></webwork:param>
                <webwork:param name="'value1'"><webwork:property value="/name" /></webwork:param>
                <webwork:param name="'value2'"></strong></webwork:param>
            </webwork:text></p>
        </page:param>
    </webwork:if>

	<page:param name="width">100%</page:param>
	<page:param name="action">DeleteTrustedApplication.jspa</page:param>
    <page:param name="cancelURI">ViewTrustedApplications.jspa</page:param>
	<page:param name="autoSelectFirst">false</page:param>

	<ui:component name="'id'" template="hidden.jsp" />
	<input type="hidden" name="confirm" value="true">
</page:applyDecorator>

</body>
</html>
