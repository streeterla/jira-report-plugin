<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.export.backup.all.jira.data'"/></title>
</head>
<body>

<jsp:include page="/secure/admin/fixes/backupwarnings.jsp"/>


<page:applyDecorator name="jiraform">
	<page:param name="action">XmlBackup.jspa</page:param>
	<page:param name="title"><webwork:text name="'admin.export.backup.jira.data'"/></page:param>
	<page:param name="description">
		<p><webwork:text name="'admin.export.xml.backup.description'"/></p>
        <p><webwork:text name="'admin.export.xml.backup.description2'"/><p>
		<webwork:text name="'admin.export.xml.backup.note'">
		    <webwork:param name="'value0'"><span class="note"></webwork:param>
		    <webwork:param name="'value1'"></span></webwork:param>
		</webwork:text>
        <p><webwork:text name="'admin.export.xml.backup.note2'">
            <webwork:param name="'value0'"><span class="note"></webwork:param>
            <webwork:param name="'value1'"></span></webwork:param>
        </webwork:text></p>
    </page:param>
	<page:param name="submitId">backup_submit</page:param>
	<page:param name="submitName"><webwork:text name="'admin.common.words.backup'"/></page:param>
	<page:param name="cancelURI">default.jsp</page:param>
	<page:param name="width">100%</page:param>
    <page:param name="helpURL">backup_data</page:param>
	<ui:textfield label="text('admin.export.file.name')" name="'filename'">
		<ui:param name="'size'">50</ui:param>
		<ui:param name="'style'">width:95%;</ui:param>
	</ui:textfield>
    <ui:checkbox label="text('admin.export.backup.as.zip')" name="'useZip'" fieldValue="'true'">
		<ui:param name="'description'"><webwork:text name="'admin.export.xml.backup.use.zip'"/></ui:param>
	</ui:checkbox>

    <ui:component name="'saxParser'" template="hidden.jsp" theme="'single'"  />
</page:applyDecorator>
</body>
</html>
