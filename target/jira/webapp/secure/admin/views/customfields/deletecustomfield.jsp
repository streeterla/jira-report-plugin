
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>


<html>
<head>
	<title><webwork:text name="'admin.issuefields.customfields.delete'">
	    <webwork:param name="'value0'"><webwork:property value="customField/name" /></webwork:param>
	</webwork:text></title>
</head>
<body>

<page:applyDecorator name="jiraform">
	<page:param name="title"><webwork:text name="'admin.issuefields.customfields.delete'">
	    <webwork:param name="'value0'"><webwork:property value="customField/name" /></webwork:param>
	</webwork:text></page:param>
	<page:param name="autoSelectFirst">false</page:param>
	<page:param name="description">
        <p><webwork:text name="'admin.issuefields.customfields.confirmation'"/></p>
        <p><webwork:text name="'admin.issuefields.customfields.deletion.note'">
            <webwork:param name="'value0'"><font color=#990000></webwork:param>
            <webwork:param name="'value1'"></font></webwork:param>
        </webwork:text></p>
	</page:param>

		<page:param name="width">100%</page:param>
	<page:param name="action">DeleteCustomField.jspa</page:param>
	<page:param name="submitId">delete_submit</page:param>
	<page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
	<page:param name="cancelURI">ViewCustomFields.jspa</page:param>

	<ui:component name="'id'" template="hidden.jsp" theme="'single'"  />
</page:applyDecorator>

</body>
</html>
