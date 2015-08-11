<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.attachmentsettings.edit.attachment.settings'"/></title>
</head>
<body>

<jsp:include page="/secure/admin/fixes/pathwarnings.jsp"/>

<page:applyDecorator name="jiraform">
	<page:param name="action">EditAttachmentSettings.jspa</page:param>
	<page:param name="submitId">edit_attachment</page:param>
	<page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
	<page:param name="cancelURI">ViewAttachmentSettings.jspa</page:param>
	<page:param name="title"><webwork:text name="'admin.attachmentsettings.edit.attachment.settings'"/></page:param>
	<page:param name="width">100%</page:param>

    <webwork:if test="/systemAdministrator == true">
        <script language="javascript" type="text/javascript">
            window.onload = function(){
                jQuery("#attachmentPathOption_CUSTOM").toggleField("#attachmentPath")
            }
        </script>

        <ui:component template="radio-attachment-config.jsp" label="text('setup.attachmentpath.label')" name="'attachmentPath'"/>
    </webwork:if>
    <tr>
        <ui:textfield label="text('admin.attachmentsettings.attachment.size')" name="'attachmentSize'">
            <ui:param name="'size'">40</ui:param>
            <ui:param name="'description'">
                <webwork:text name="'admin.attachmentsettings.attachment.size.description'">
                    <webwork:param name="'value0'"><br/></webwork:param>
                </webwork:text>
            </ui:param>
        </ui:textfield>
    </tr>
    <tr>
		<td align="right" valign="top" bgcolor="#fffff0"><span class="label">
			<webwork:text name="'admin.attachmentsettings.enable.thumbnails'"/>
        </span></td>
		<td bgcolor="#ffffff">
			<input type="radio" value="true" name="thumbnailsEnabled" <webwork:if test="thumbnailsEnabled == true">checked</webwork:if>> <webwork:text name="'admin.common.words.on'"/>
			&nbsp;
			<input type="radio" value="false" name="thumbnailsEnabled" <webwork:if test="thumbnailsEnabled == false">checked</webwork:if>> <webwork:text name="'admin.common.words.off'"/>
			<br/><font size="1">
				<webwork:text name="'admin.attachmentsettings.enable.thumbnails.description'"/>
			</font>
		</td>
	</tr>
    <tr>
		<td align="right" valign="top" bgcolor="#fffff0"><span class="label">
			<webwork:text name="'admin.attachmentsettings.enable.zipsupport'"/>
        </span></td>
		<td bgcolor="#ffffff">
			<input type="radio" value="true" name="zipSupport" <webwork:if test="zipSupport == true">checked</webwork:if>> <webwork:text name="'admin.common.words.on'"/>
			&nbsp;
			<input type="radio" value="false" name="zipSupport" <webwork:if test="zipSupport == false">checked</webwork:if>> <webwork:text name="'admin.common.words.off'"/>
			<br/><font size="1">
				<webwork:text name="'admin.attachmentsettings.enable.zipsupport.description'"/>
			</font>
		</td>
	</tr>
</page:applyDecorator>
</body>
</html>
