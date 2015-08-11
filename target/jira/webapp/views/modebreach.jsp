<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'mode.breach.title'"/></title>
</head>

<body>
	<h2><webwork:text name="'common.words.error'"/></h2>
    <p>
    <webwork:text name="'mode.breach.desc'"/>
    </p>
    <p>
    <webwork:text name="'contact.admin.for.perm'">
        <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/Administrators.jspa"></webwork:param>
        <webwork:param name="'value1'"></a></webwork:param>
    </webwork:text>
    </p>
</body>
</html>
