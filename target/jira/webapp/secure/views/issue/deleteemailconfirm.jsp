<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'viewissue.emaildelete.title'"/></title>
</head>
<body>

<table cellpadding=0 cellspacing=0 border=0 width=100%>
<tr>
<td width=200 bgcolor="#f0f0f0" valign=top>
    <jsp:include page="/includes/panels/email/summary.jsp" />
</td>
<td bgcolor=#ffffff valign=top>

<table width=100% cellpadding=10 cellspacing=0 border=0><tr><td>

<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'viewissue.emaildelete.title'"/></page:param>
	<page:param name="description">
		<p><webwork:text name="'viewissue.emaildelete.message'"/></p>
	</page:param>
	<page:param name="width">100%</page:param>
	<page:param name="action">DeleteEmail.jspa</page:param>
	<page:param name="submitId">delete_submit</page:param>
	<page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
	<page:param name="cancelURI"><webwork:property value="issuePath"/></page:param>

    <tr><td colspan=2 bgcolor=#ffffff>
	<ui:component name="'id'" template="hidden.jsp" />
	<input type="hidden" name="confirm" value="true">

    <div class="action-box">
        <jira:linkbugkeys><jira:text2html><webwork:property value="body" escape="false" /></jira:text2html></jira:linkbugkeys>
    </div>
    </td></tr>
</page:applyDecorator>

</td></tr></table>
</td></tr></table>

</body>
</html>
