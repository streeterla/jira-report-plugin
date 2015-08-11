<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<html>
<head>
	<title><webwork:text name="'admin.globalpermissions.global.permissions'"/></title>
</head>
<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.globalpermissions.global.permissions'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">global_permissions</page:param>
<p>
<webwork:text name="'admin.globalpermissions.description'"/>
</p>
<p>
<webwork:text name="'admin.globalpermissions.instruction'">
    <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/admin/ViewPermissionSchemes.jspa"></webwork:param>
    <webwork:param name="'value1'"></a></webwork:param>
</webwork:text>
</p>
<webwork:if test="/hasExceededUserLimit == true">
    <div class="warningBox">
        <webwork:text name="'admin.globalpermissions.user.limit.warning'">
            <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/admin/ViewLicense.jspa"></webwork:param>
            <webwork:param name="'value1'"></a></webwork:param>
        </webwork:text>
    </div>
</webwork:if>
</page:applyDecorator>
<p>
<jsp:include page="/includes/panels/permissionslist.jsp" />
</body>
</html>

