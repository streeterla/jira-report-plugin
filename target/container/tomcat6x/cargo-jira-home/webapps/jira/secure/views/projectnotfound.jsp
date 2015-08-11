<%@ taglib uri="webwork" prefix="webwork" %>
<html>
<head>
	<title><webwork:text name="'project.does.not.exist.title'"/></title>
    <meta name="decorator" content="navigator">
</head>
<body>
	<table cellpadding=1 cellspacing=0 border=0 align=center width=80% bgcolor=#cc0000><tr><td>
	<table cellpadding="4" cellspacing="0" border="0" width="100%" class="formErrors"><tr><td>
		<font color="#cc0000"><b><webwork:text name="error"/></b></font>
		<p>

		<webwork:text name="'project.does.not.exist.desc'">
            <webwork:param name="'value0'"><a href="<%= request.getContextPath()%>/browse"></webwork:param>
            <webwork:param name="'value1'"></a></webwork:param>
        </webwork:text>
		</p>
		<p>
		<webwork:text name="'contact.admin.for.perm'">
            <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/Administrators.jspa"></webwork:param>
            <webwork:param name="'value1'"></a></webwork:param>
        </webwork:text>
		</p>
	</td></tr></table>
	</td></tr></table>
</body>
</html>
