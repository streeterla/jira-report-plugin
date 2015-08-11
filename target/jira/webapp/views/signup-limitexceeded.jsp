<%@ taglib uri="webwork" prefix="webwork" %>

<html>
<head>
	<title><webwork:text name="'signup.title'"/></title>
</head>

<body>
	<h2><webwork:text name="'signup.heading'"/></h2>
    <p><webwork:text name="'signup.limit.exceeded'"/></p>
    <p><webwork:text name="'signup.contact.admin'">
        <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/Administrators.jspa"></webwork:param>
        <webwork:param name="'value1'"></a></webwork:param>
    </webwork:text></p>
    <p><webwork:text name="'signup.return.to.dashboard'">
        <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/Dashboard.jspa"></webwork:param>
        <webwork:param name="'value1'"></a></webwork:param>
    </webwork:text></p>
</body>
</html>
