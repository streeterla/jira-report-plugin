<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.globalsettings.attachment.settings'"/></title>
</head>

<body>

    <jsp:include page="/secure/admin/fixes/pathwarnings.jsp"/>


    <page:applyDecorator name="jiratable">
        <page:param name="id">AttachmentSettings</page:param>
        <page:param name="title"><webwork:text name="'admin.globalsettings.attachment.settings'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="titleColspan">2</page:param>
        <page:param name="helpURL">attachments</page:param>
        <page:param name="description">
        <webwork:text name="'admin.attachmentsettings.instruction1'">
            <webwork:param name="'value0'"><b></webwork:param>
            <webwork:param name="'value1'"><webwork:text name="'admin.permissions.CREATE_ATTACHMENT'"/></webwork:param>
            <webwork:param name="'value2'"></b></webwork:param>
        </webwork:text>
        <ul>
          <li><webwork:text name="'admin.attachmentsettings.attachment.path.explanation'">
              <webwork:param name="'value0'"><b></webwork:param>
              <webwork:param name="'value1'"></b></webwork:param>
              <webwork:param name="'value2'"><br/></webwork:param>
          </webwork:text>
          </li>
          <li><webwork:text name="'admin.attachmentsettings.attachment.size.explanation'">
              <webwork:param name="'value0'"><b></webwork:param>
              <webwork:param name="'value1'"></b></webwork:param>
          </webwork:text>
          </li>
          <li><webwork:text name="'admin.attachmentsettings.enable.thumbnails.explanation'">
              <webwork:param name="'value0'"><b></webwork:param>
              <webwork:param name="'value1'"></b></webwork:param>
          </webwork:text>
          </li>
          <li><webwork:text name="'admin.attachmentsettings.enable.zip.support.explanation'">
              <webwork:param name="'value0'"><strong></webwork:param>
              <webwork:param name="'value1'"></strong></webwork:param>
          </webwork:text>
          </li>
        </ul>

          <webwork:text name="'admin.common.phrases.more.information'"/>

          <webwork:if test="/systemAdministrator == false && applicationProperties/option('jira.option.allowattachments') == false">
              <p>
              <webwork:text name="'admin.attachmentsettings.disabled.contact.sys.admin'">
                  <webwork:param name="'value0'"><a href="<%=request.getContextPath()%>/secure/Administrators.jspa#sysadmins"></webwork:param>
                  <webwork:param name="'value1'"></a></webwork:param>
              </webwork:text>
              </p>
          </webwork:if>
        </page:param>

        <tr class="rowNormal">
            <td valign="top"  width="40%" align="left">
            &nbsp; <b><webwork:text name="'admin.attachmentsettings.allow.attachments'"/></b>
            <td width="60%">
                <webwork:if test="applicationProperties/option('jira.option.allowattachments') == true">
                    <font color="#009900"><b><webwork:text name="'admin.common.words.on'"/></b></font>
			    </webwork:if>
			    <webwork:else>
				    <font color="#990000"><b><webwork:text name="'admin.common.words.off'"/></b></font>
                </webwork:else>
            </td>
        </tr>
        <tr class="rowAlternate">
		<td valign="top" width="40%">&nbsp; <b><webwork:text name="'admin.attachmentsettings.attachment.path'"/></b></td>
		<td valign="top" width="60%"><webwork:property value="attachmentPath" /></td>
	</tr>
        <tr class="rowNormal">
            <td valign="top" width="40%">&nbsp; <b><webwork:text name="'admin.attachmentsettings.attachment.size'"/></b></td>
            <td valign="top" width="60%"><webwork:property value="prettyAttachmentSize"/></td>
        </tr>
        <tr class="rowAlternate">
            <td valign="top" width="40%" align="left">
            &nbsp; <b><webwork:text name="'admin.attachmentsettings.enable.thumbnails'"/></b>
            </td>
            <td width="60%">
                <webwork:if test="applicationProperties/option('jira.option.allowthumbnails') == true">
                    <font color="#009900"><b><webwork:text name="'admin.common.words.on'"/></b></font>
			    </webwork:if>
			    <webwork:else>
				    <font color="#990000"><b><webwork:text name="'admin.common.words.off'"/></b></font>
                </webwork:else>
            </td>
        </tr>
        <tr class="rowNormal">
            <td valign="top" width="40%" align="left">
            &nbsp; <b><webwork:text name="'admin.attachmentsettings.enable.zipsupport'"/></b>
            </td>
            <td width="60%">
                <webwork:if test="/zipSupport == true">
                    <font color="#009900"><b><webwork:text name="'admin.common.words.on'"/></b></font>
			    </webwork:if>
			    <webwork:else>
				    <font color="#990000"><b><webwork:text name="'admin.common.words.off'"/></b></font>
                </webwork:else>
            </td>
        </tr>
    </page:applyDecorator>
    <webwork:if test="/pathsAllowedToBetSet == true">
        <webwork:if test="/systemAdministrator == true || applicationProperties/option('jira.option.allowattachments') == true">
        <p>
        <table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>
        <table border="0" cellpadding="3" cellspacing="1" width="100%">
            <tr bgcolor="#f0f0f0">
                <td class="colHeaderLink" colspan="2" align="center">
                    <a href="EditAttachmentSettings!default.jspa"><b><webwork:text name="'admin.common.phrases.edit.configuration'"/></b></a>
                </td>
            </tr>
        </table>
        </td></tr></table>
        </p>
        </webwork:if>
    </webwork:if>


</body>
</html>
