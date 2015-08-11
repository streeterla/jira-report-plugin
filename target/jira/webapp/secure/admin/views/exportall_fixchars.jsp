

<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.export.backup.data.invalid.characters'"/></title>
</head>

<body>

<table cellpadding=0 cellspacing=0 border=0 width=100%>
<tr>
<td bgcolor=#ffffff valign=top>

<table width=100% cellpadding=10 cellspacing=0 border=0><tr><td>

    <page:applyDecorator name="jiraform">
        <page:param name="title"><webwork:text name="'admin.export.invalid.xml'"/></page:param>
        <page:param name="description">
          <p><webwork:text name="'admin.export.invalid.description'"/>
        </page:param>
        <page:param name="width">100%</page:param>
        <page:param name="autoSelectFirst">false</page:param>
        <page:param name="action">XmlBackup!fixChars.jspa</page:param>
        <page:param name="submitId">clean_submit</page:param>
        <page:param name="submitName"><webwork:text name="'admin.export.clean.from.database'"/></page:param>
        <page:param name="cancelURI"><webwork:url page="XmlBackup!default.jspa"><webwork:param name="'filename'" value="filename" /><webwork:param name="'useZip'" value="useZip" /><webwork:param name="'saxParser'" value="saxParser"/></webwork:url></page:param>
    </page:applyDecorator>

</td></tr></table>
</td></tr></table>

</body>
</html>
