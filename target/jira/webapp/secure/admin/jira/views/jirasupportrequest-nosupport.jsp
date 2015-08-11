<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><webwork:text name="'admin.supportrequest.no.support.error.title'"/></title>
</head>

<body>
<table width="100%" cellpadding="10" cellspacing="0" border="0">
    <page:applyDecorator name="jirapanel">
        <page:param name="title"><webwork:text name="'admin.supportrequest.no.support.error.title'"/></page:param>
        <webwork:property value="/supportRequestMessage" escape="false"/>
    </page:applyDecorator>
</table>
</body>
</html>
