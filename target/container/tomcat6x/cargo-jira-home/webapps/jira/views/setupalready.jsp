<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'setup.already.title'"/></title>
</head>

<body>

	<table cellpadding=1 cellspacing=0 border=0 align=center width=80% bgcolor=#cc0000><tr><td>
	<table cellpadding="4" cellspacing="0" border="0" width="100%" class="formErrors"><tr><td>
		<font color="#cc0000"><b><webwork:property value="text('common.words.error')"/></b></font>
		<p>
		<webwork:text name="'setup.already.error.line1'"/>
		</p>
		<p>
        <webwork:text name="'setup.already.error.line2'">
            <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/Administrators.jspa"></webwork:param>
            <webwork:param name="'value1'"></a></webwork:param>
        </webwork:text>
		</p>
	</td></tr></table>
	</td></tr></table>

</body>
</html>
