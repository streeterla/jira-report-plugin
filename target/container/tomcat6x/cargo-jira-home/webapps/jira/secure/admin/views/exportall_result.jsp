<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<html>
<head>
	<title><webwork:text name="'admin.export.backup.all.jira.data'"/></title>
</head>
<body>

<jsp:include page="/secure/admin/fixes/backupwarnings.jsp"/>

<page:applyDecorator name="jiraform">
	<page:param name="title"><webwork:text name="'admin.export.backup.jira.data'"/></page:param>
	<page:param name="action">XmlBackup.jspa</page:param>
	<page:param name="autoSelectFirst">false</page:param>
	<page:param name="width">100%</page:param>
	<tr>
		<td colspan=2 bgcolor=#ffffff>
			<webwork:if test="filename == null">
				<p>
				<webwork:text name="'admin.export.cut.and.paste.xml'"/>
				</p>
				<textarea name="foobar" rows=20 cols=80><webwork:property value="xml" /></textarea>
			</webwork:if>
			<webwork:else>
				<webwork:text name="'admin.export.data.exported.to'"/> <b><webwork:property value="destinationFile" /></b>
			</webwork:else>
		</td>
	</tr>
 </page:applyDecorator>
</body>
</html>
