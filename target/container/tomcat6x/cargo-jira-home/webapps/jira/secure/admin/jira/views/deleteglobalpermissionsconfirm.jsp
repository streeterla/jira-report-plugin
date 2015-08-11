
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.globalpermissions.confirm.title'"/></title>
</head>

<body>

    <p>
    <table width=100% cellpadding=10 cellspacing=0 border=0>
    <page:applyDecorator name="jiraform">
        <page:param name="action">GlobalPermissions.jspa</page:param>
        <page:param name="submitId">delete_permission_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
    	<page:param name="cancelURI">GlobalPermissions!default.jspa</page:param>
        <page:param name="title"><webwork:text name="'admin.globalpermissions.confirm.title'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="autoSelectFirst">false</page:param>
	    <page:param name="description">
        <input type="hidden" name="action" value="del">
        <input type="hidden" name="permType" value="<webwork:property value="permType" />">
        <input type="hidden" name="groupName" value="<webwork:property value="groupName" />">

        <webwork:text name="'admin.globalpermissions.confirm.question'">
            <webwork:param name="'value0'"><webwork:if test="groupName == null"><webwork:text name="'admin.common.words.anyone'"/></webwork:if> <webwork:property value="groupName" /></webwork:param>
            <webwork:param name="'value1'"><webwork:property value="permTypeName" /></webwork:param>
        </webwork:text>
        </page:param>
    </page:applyDecorator>
    </table>
    </p>

</body>
</html>
