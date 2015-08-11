<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.setpassword.set.password'"/>: <webwork:property value="user/fullName" /></title>
</head>

<body>

<page:applyDecorator name="jiraform">
	<page:param name="title"><webwork:text name="'admin.setpassword.set.password'"/>: <webwork:property value="user/fullName" /></page:param>
	<page:param name="width">100%</page:param>
	<page:param name="description"><webwork:text name="'admin.setpassword.instruction'"/></page:param>
	<page:param name="action">SetPassword.jspa</page:param>
	<page:param name="submitId">update_submit</page:param>
	<page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
	<page:param name="cancelURI"><webwork:url value="'ViewUser.jspa'"><webwork:param name="'name'" value="user/name" /></webwork:url></page:param>

	<ui:password label="text('common.words.password')" name="'password'" size="12">
        <ui:param name="'autocomplete'" value="'off'"/>
    </ui:password>

    <ui:password label="text('common.forms.confirm')" name="'confirm'"  size="12">
        <ui:param name="'autocomplete'" value="'off'"/>
    </ui:password>

    <ui:component name="'name'" template="hidden.jsp" theme="'single'"  />
</page:applyDecorator>

</body>
</html>
