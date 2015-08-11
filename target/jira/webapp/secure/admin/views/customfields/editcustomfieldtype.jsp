
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.issuefields.customfields.edit.custom.field.type.details'"/></title>
</head>

<body>

	<page:applyDecorator name="jiraform">
		<page:param name="title"><webwork:text name="'admin.issuefields.customfields.edit.custom.field.type'"/></page:param>
		<page:param name="action">EditCustomFieldType.jspa</page:param>
        <page:param name="submitId">update_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
		<page:param name="width">100%</page:param>
		<page:param name="cancelURI"><webwork:property value="cancelURI"/></page:param>

	    <%@ include file="/includes/admin/customfields/customfieldtypefields.jsp" %>
        <ui:component name="'id'" template="hidden.jsp" />
        <%-- record what page to redirect after success --%>
        <ui:component name="'redirectURI'" template="hidden.jsp" />
	</page:applyDecorator>

</body>
</html>
