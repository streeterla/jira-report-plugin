<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%-- This file is a partial hack until we merge the other constants to deal in the same way issue types are dealt with --%>
<webwork:if test="/issueConstantType == 'issuetype'">
    <%@include file="/secure/admin/views/issuetypes/viewissuetypes.jsp"%>
</webwork:if>
<webwork:else>
<html>
<head>
    <title><webwork:text name="'admin.issuesettings.translations'">
        <webwork:param name="'value0'"><webwork:property value="/issueConstantName" /></webwork:param>
    </webwork:text></title>
</head>
<body>
    <%@include file="viewtranslations.jsp"%>
</body>
</html>
</webwork:else>

