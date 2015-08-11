<%@ page import="com.atlassian.jira.util.JiraUtils" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="jiratags" prefix="jira" %>

<webwork:if test="/contentOnly == true">
    <% response.setContentType("application/json"); %>
    {permissionsError: true}
</webwork:if>
<webwork:else>
<html>
<head>
    <title>
        <webwork:if test="remoteUser == null"><webwork:text name="'login.required.title'"/></webwork:if>
        <webwork:else><webwork:text name="'perm.violation.title'"/></webwork:else>
    </title>
    <meta name="decorator" content="navigator">
</head>
<body class="lp">
<%@ include file="/includes/permissionsviolationfragment.jsp"%>
</body>
</html>
</webwork:else>