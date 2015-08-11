<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'bulkedit.title'"/></title>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#ffffff">
<tr>
    <td width="200" valign="top" bgcolor="#f0f0f0">
        <jsp:include page="/secure/views/bulkedit/bulkedit_leftpane.jsp" flush="false" />
    </td>
    <td valign="top">
        <table cellspacing="0" cellpadding="10" border="0" width="100%"><tr><td>
        <page:applyDecorator name="jiraform">
            <page:param name="title"><webwork:text name="'bulk.delete.error'"/></page:param>
            <page:param name="autoSelectFirst">false</page:param>
            <page:param name="action">IssueNavigator.jspa</page:param>
            <page:param name="width">100%</page:param>
            <page:param name="submitId">ok_submit</page:param>
            <page:param name="submitName">&nbsp;OK&nbsp;</page:param>
        </page:applyDecorator>
        </td></tr></table>
    </td>
</tr>
</table>
</body>
</html>
