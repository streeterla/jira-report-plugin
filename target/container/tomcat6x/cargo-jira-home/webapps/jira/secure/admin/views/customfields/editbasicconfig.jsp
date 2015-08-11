<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.issuefields.customfields.config.for.customfield'">
	    <webwork:param name="'value0'"><webwork:property value="title" /></webwork:param>
	    <webwork:param name="'value1'"><webwork:property value="customField/name" /></webwork:param>
	</webwork:text></title>
</head>

<body>
	<page:applyDecorator name="jiraform">
		<page:param name="title"><webwork:text name="'admin.issuefields.customfields.config.for.customfield'">
	    <webwork:param name="'value0'"><webwork:property value="title" /></webwork:param>
	    <webwork:param name="'value1'"><webwork:property value="customField/name" /></webwork:param>
	</webwork:text></page:param>
		<page:param name="instructions"><webwork:property value="instructions" /></page:param>
		<page:param name="action">EditBasicConfig.jspa</page:param>
		<page:param name="submitId">words_submit</page:param>
		<page:param name="submitName"><webwork:text name="'admin.common.words.ok'"/></page:param>
        <page:param name="cancelURI">ViewCustomFields.jspa</page:param>
        <page:param name="helpURL">customfields</page:param>

        <ui:component name="'className'" template="hidden.jsp" theme="'single'" />
        <ui:component name="'fieldConfigId'" template="hidden.jsp" theme="'single'"  />

    <webwork:iterator value="/configFields" status="'status'">
        <ui:textfield label="./name" name="./key" value="/fieldValue(./key)" >
            <ui:param name="'description'"><webwork:property value="./description" /> <webwork:property value="/fieldValue(./key)" /></ui:param>
        </ui:textfield>
    </webwork:iterator>
    </page:applyDecorator>
</body>
</html>
