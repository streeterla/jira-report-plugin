<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<html>
<head>
	<title><webwork:text name="'search.request.error.title'"/></title>
</head>
<body>
	<table cellpadding=1 cellspacing=0 border=0 align=center width=80% bgcolor=#cc0000><tr><td>
	<table cellpadding=4 cellspacing=0 border=0 width=100% bgcolor=#ffffff><tr><td>
		<font color="#cc0000"><b><webwork:text name="'search.request.error.title'"/></b></font>
		<p>
            <webwork:text name="'search.request.invalid.permission'"/>
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
