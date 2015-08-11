<%@ taglib uri="webwork" prefix="webwork" %>
<html>
<head>
	<title><webwork:text name="'issue.does.not.exist.title'"/></title>
    <meta name="decorator" content="navigator">
</head>
<body class="lp">
<div id="main-content">
    <div class="active-area">
        <h2><webwork:text name="'issue.does.not.exist.title'"/></h2>
        <p class="notify warn">
            <webwork:text name="'issue.does.not.exist.desc'"/>
        </p>
        <p>
        <webwork:text name="'contact.admin.for.perm'">
            <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/Administrators.jspa"></webwork:param>
            <webwork:param name="'value1'"></a></webwork:param>
        </webwork:text>
        </p>
    </div>
</div>
</body>
</html>
