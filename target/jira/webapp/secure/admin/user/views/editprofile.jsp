
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.editprofile.edit.profile'"/>: <webwork:property value="editedUser/fullName" /></title>
</head>

<body>

<page:applyDecorator name="jiraform">
	<page:param name="title"><webwork:text name="'admin.editprofile.edit.profile'"/>: <webwork:property value="editedUser/fullName" /></page:param>
	<page:param name="width">100%</page:param>
	<page:param name="description"><webwork:text name="'admin.editprofile.instructions'"/></page:param>
	<page:param name="action">EditUser.jspa</page:param>
	<page:param name="submitId">update_submit</page:param>
	<page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
	<page:param name="cancelURI"><webwork:url value="'ViewUser.jspa'"><webwork:param name="'name'" value="editedUser/name" /></webwork:url></page:param>

	<ui:textfield label="text('common.words.fullname')" name="'fullName'" size="40" />
	<ui:textfield label="text('common.words.email')" name="'email'"  size="40"/>
	<ui:component name="'editName'" template="hidden.jsp"  theme="'single'" />
</page:applyDecorator>

</body>
</html>
