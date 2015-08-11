<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="webwork" prefix="iterator" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'session.timeout.message.title'"/></title>
</head>

<body>

	<table cellpadding=1 cellspacing=0 border=0 align=center width=80% bgcolor=#cc0000><tr><td>
	<table cellpadding=4 cellspacing=0 border=0 width=100% bgcolor=#ffffff><tr><td>
		<font color="#cc0000"><b><webwork:text name="'session.timeout.message.title'"/></b></font>
		<p>
            <webwork:property value="/errorMessage"/>
        </p>
	</td></tr></table>
	</td></tr></table>

</body>
</html>
