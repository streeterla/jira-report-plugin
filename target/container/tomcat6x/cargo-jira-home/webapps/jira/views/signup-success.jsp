<%@ page import="java.util.*"%>
<%@ taglib uri="webwork" prefix="webwork" %>

<html>
<head>
	<title><webwork:text name="'signup.title'"/></title>
</head>

<body>
	<h2><webwork:text name="'signup.heading'"/></h2>
	<p><webwork:text name="'signup.success'"/></p>
	<p><a href="<%= request.getContextPath() %>/secure"><webwork:text name="'login.click'"/></a>.</p>
    <p>
    <webwork:text name="'signup.stay.in.touch'">
        <webwork:param name="'value0'"><a href='<webwork:property value="/externalLinkUtils/property('external.link.atlassian.news')"/>'></webwork:param>
        <webwork:param name="'value1'"></a></webwork:param>
    </webwork:text>
    </p>
</body>
</html>
