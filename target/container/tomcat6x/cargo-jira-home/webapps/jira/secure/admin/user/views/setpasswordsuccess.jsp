<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title>
        <webwork:text name="'admin.setpassword.success.title'"><webwork:param name="param1"><webwork:property value="/user/fullName"/></webwork:param></webwork:text></title>
</head>
<body>
<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'admin.setpassword.success.title'"><webwork:param name="param1"><webwork:property value="/user/fullName"/></webwork:param></webwork:text></page:param>
    <page:param name="description"><webwork:text name="'admin.setpassword.success.desc'"><webwork:param name="param1"><webwork:property value="user/name"/></webwork:param></webwork:text></page:param>
    <page:param name="buttons">
        <input type="button" id="ok" value="<webwork:text name="'admin.common.words.ok'"/>" onclick="window.location='<webwork:url value="'ViewUser.jspa'"><webwork:param name="'name'" value="user/name" /></webwork:url>'"/>
    </page:param>
</page:applyDecorator>
</body>
</html>
