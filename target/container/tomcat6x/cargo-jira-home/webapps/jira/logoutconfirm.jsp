
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
</head>

<body>

<page:applyDecorator name="auiform">
    <page:param name="title">Confirm Logout</page:param>
    <page:param name="theme">lp-desc</page:param>
	<page:param name="description">If you log out, any automatic login will be stopped.</page:param>
	<page:param name="action">Logout.jspa</page:param>
	<page:param name="submitId">Logout</page:param>
	<page:param name="submitName">Logout</page:param>
	<page:param name="autoSelectFirst">true</page:param>
	<page:param name="cancelURI">javascript:history.back()</page:param>
	<input type="hidden" name="confirm" value="true">
</page:applyDecorator>

</body>
</html>
