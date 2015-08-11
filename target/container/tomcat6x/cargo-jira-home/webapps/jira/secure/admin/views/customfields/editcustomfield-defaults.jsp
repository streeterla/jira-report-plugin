<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.issuefields.customfields.create.custom.field.defaults'"/></title>
</head>

<body>
    <!-- JRA-4345 - need to statically include the javascript to address IE6 refresh issue -->
    <%@ include file="/includes/js/date_picker.jsp" %>

	<page:applyDecorator name="jiraform">
		<page:param name="title"><webwork:text name="'admin.issuefields.customfields.set.custom.field.defaults'"/></page:param>
		<page:param name="description"><webwork:text name="'admin.issuefields.customfields.set.defaults.description'">
		   <webwork:param name="'value0'"><webwork:property value="customField/name" /></webwork:param>
		</webwork:text></page:param>
		<page:param name="action">EditCustomFieldDefaults.jspa</page:param>
		<page:param name="width">100%</page:param>
		<page:param name="submitId">set_defaults_submit</page:param>
		<page:param name="submitName"><webwork:text name="'admin.issuefields.customfields.set.defaults'"/></page:param>
        <page:param name="cancelURI">ViewCustomFields.jspa</page:param>
        <page:param name="helpURL">customfields</page:param>

        <ui:component name="'fieldConfigId'" template="hidden.jsp" theme="'single'"  />
        <ui:component name="'fieldConfigSchemeId'" template="hidden.jsp" theme="'single'"  />
        <webwork:property value="/customFieldHtml" escape="false" />
    </page:applyDecorator>
</body>
</html>
