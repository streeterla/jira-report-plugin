
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.export.backup.data.confirm'"/></title>
</head>

<body>


<jsp:include page="/secure/admin/fixes/backupwarnings.jsp"/>


<table cellpadding=0 cellspacing=0 border=0 width=100%>
<tr>
<td bgcolor=#ffffff valign=top>

<table width=100% cellpadding=10 cellspacing=0 border=0><tr><td>

    <page:applyDecorator name="jiraform">
        <page:param name="title"><webwork:text name="'admin.export.backup.data.confirm'"/></page:param>
        <page:param name="description">
            <p><webwork:text name="'admin.export.file.already.exists'">
                <webwork:param name="'value0'"><b><font color="#ff0000"><webwork:property value="destinationFile" /></font></b></webwork:param>
            </webwork:text></p>
            <p><webwork:text name="'admin.export.confirm.file.replacement'"/></p>
        </page:param>
        <page:param name="columns">1</page:param>
        <page:param name="width">100%</page:param>
        <page:param name="autoSelectFirst">false</page:param>
        <page:param name="action">XmlBackup.jspa</page:param>
        <page:param name="submitId">replace_submit</page:param>
        <page:param name="submitName"><webwork:text name="'admin.export.replace.file'"/></page:param>
        <page:param name="cancelURI"><webwork:url page="XmlBackup!default.jspa"><webwork:param name="'filename'" value="filename" /><webwork:param name="'useZip'" value="useZip" /></webwork:url></page:param>


        <ui:component name="'filename'" template="hidden.jsp" />
        <ui:component name="'useZip'" template="hidden.jsp" />
        <ui:component name="'saxParser'" template="hidden.jsp" />

        <input type="hidden" name="confirm" value="true">
    </page:applyDecorator>

</td></tr></table>
</td></tr></table>

</body>
</html>
