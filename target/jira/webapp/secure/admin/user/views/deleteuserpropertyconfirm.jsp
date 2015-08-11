<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.deleteuserproperty.delete.property'">: <webwork:param name="'value0'" value="key" /></webwork:text></title>
</head>

<body>
	<page:applyDecorator name="jiraform">
		<page:param name="description">
            <p>
                <webwork:text name="'admin.deleteuserproperty.description'">
                    <webwork:param name="'value0'"><b><webwork:property value="/key"/></b></webwork:param>
                    <webwork:param name="'value0'"><b><webwork:property value="/user/fullName"/></b></webwork:param>
                </webwork:text>
            </p>

        </page:param>
        <page:param name="title"><webwork:text name="'admin.deleteuserproperty.delete.property'">: <webwork:param name="'value0'" value="key" /></webwork:text></page:param>
		<page:param name="labelWidth">50%</page:param>
        <page:param name="width">100%</page:param>
		<page:param name="action">DeleteUserProperty.jspa</page:param>
		<page:param name="submitId">delete_submit</page:param>
		<page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
		<page:param name="cancelURI"><webwork:url page="EditUserProperties.jspa"><webwork:param name="'name'" value="name"/></webwork:url></page:param>

		<ui:component name="'name'" template="hidden.jsp" theme="'single'"  />
        <ui:component name="'key'" template="hidden.jsp" theme="'single'" />
        <ui:component name="'confirm'" value="'true'" template="hidden.jsp" theme="'single'"  />

    </page:applyDecorator>
</body>
</html>
