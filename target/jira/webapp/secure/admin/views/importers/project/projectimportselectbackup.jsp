<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title>
        <webwork:text name="'admin.project.import.select.backup.title'"/>
    </title>
</head>
<body>

<page:applyDecorator name="jiraform">
    <page:param name="action">ProjectImportSelectBackup.jspa</page:param>
    <page:param name="submitId">next_submit</page:param>
    <page:param name="submitName"><webwork:text name="'common.forms.next'"/></page:param>
    <page:param name="autoSelectFirst">true</page:param>
    <page:param name="title">
        <webwork:text name="'admin.project.import.select.backup.title'"/>
    </page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">restore_project</page:param>
    <page:param name="description">
        <webwork:text name="'admin.project.import.select.backup.desc'">
            <webwork:param name="'value0'"><p/></webwork:param>
            <webwork:param name="'value1'"><a href="<webwork:property value="/docsLink"/>"></webwork:param>
            <webwork:param name="'value2'"></a></webwork:param>
            <webwork:param name="'value3'"><webwork:property value="/version"/></webwork:param>
            <webwork:param name="'value4'"><webwork:property value="/edition"/></webwork:param>
            <webwork:param name="'value5'"><span class="note"></webwork:param>
            <webwork:param name="'value6'"></span></webwork:param>
            <webwork:param name="'value7'"><a href="<%=request.getContextPath()%>/secure/admin/XmlBackup!default.jspa"/></webwork:param>
        </webwork:text>
        <webwork:if test="/showResumeLinkStep2 == true">
            <div class="infoBox">
                <webwork:text name="'admin.project.import.select.backup.resume.step2'">
                    <webwork:param name="'value0'"><a href='<%=request.getContextPath()%>/secure/admin/ProjectImportSelectProject!default.jspa'></webwork:param>
                    <webwork:param name="'value1'"></a></webwork:param>
                </webwork:text>
            </div>
        </webwork:if>
        <webwork:if test="/showResumeLinkStep3 == true">
            <div class="infoBox">
                <webwork:text name="'admin.project.import.select.backup.resume.step3'">
                    <webwork:param name="'value0'"><webwork:property value="/selectedProjectName"/></webwork:param>
                    <webwork:param name="'value1'"><a href='<%=request.getContextPath()%>/secure/admin/ProjectImportSummary!reMapAndValidate.jspa'></webwork:param>
                    <webwork:param name="'value2'"></a></webwork:param>
                </webwork:text>
            </div>
        </webwork:if>
    </page:param>

    <ui:textfield label="text('admin.project.import.select.backup.filename.label')" name="'backupXmlPath'">
        <ui:param name="'size'">50</ui:param>
        <ui:param name="'description'">
            <webwork:text name="'admin.project.import.select.backup.filename.desc'"/>
        </ui:param>
        <ui:param name="'mandatory'">true</ui:param>
    </ui:textfield>

    <ui:textfield label="text('admin.project.import.select.backup.attachment.label')" name="'backupAttachmentPath'">
        <ui:param name="'size'">50</ui:param>
        <ui:param name="'description'">
            <webwork:text name="'admin.project.import.select.backup.attachment.desc'"/>
        </ui:param>
    </ui:textfield>

</page:applyDecorator>


</body>
</html>
