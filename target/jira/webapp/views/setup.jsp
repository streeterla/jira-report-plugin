<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%
// don't show ANYTHING to the user if they come here looking for trouble
if (com.atlassian.jira.util.JiraUtils.isSetup()) {
%>
<%--
Leave this as a raw HTML. Do not use response.getWriter() or response.getOutputStream() here as this will fail
on Orion. Let the application server figure out how it want to output this text.
--%>
JIRA has already been set up.
<%
} else {
%>
<html>
<head>
	<title><webwork:text name="'setup.title'" /></title>
</head>
<body>
<table width="100%" border="0" cellpadding="4">
<tr>
<td width="80%" valign="top">
<page:applyDecorator name="jiraform">
	<page:param name="title"><webwork:text name="'setup.step1'" /></page:param>
	<page:param name="width">100%</page:param>
	<page:param name="description">
        <webwork:text name="'setup.globalproperties'" />
        <p>
        <webwork:text name="'setup.existingimport'">
            <webwork:param name="'value0'"><span style="color:#990000"></webwork:param>
            <webwork:param name="'value1'"></span></webwork:param>
            <webwork:param name="'value2'"><a href="SetupImport!default.jspa"></webwork:param>
            <webwork:param name="'value3'"></a></webwork:param>
        </webwork:text>
        </p>
    </page:param>
	<page:param name="action">Setup.jspa</page:param>

	<ui:textfield label="text('setup.applicationtitle.label')" name="'title'">
		<ui:param name="'size'">40</ui:param>
		<ui:param name="'description'">
			<webwork:text name="'setup.applicationtitle.desc'" />
		</ui:param>
		<ui:param name="'mandatory'" value="true" />
	</ui:textfield>

	<ui:select label="text('setup.mode.label')" name="'mode'"
		list="allowedModes" listKey="'key'" listValue="'value'">
		<ui:param name="'description'">
			<webwork:text name="'setup.mode.line1.desc'" />:<br>
			<webwork:text name="'setup.mode.line2.desc'" /><br>
			<webwork:text name="'setup.mode.line3.desc'" />.
		</ui:param>
		<ui:param name="'mandatory'" value="true" />
	</ui:select>

	<ui:textfield label="text('setup.baseurl.label')" name="'baseURL'">
        <ui:param name="'size'">40</ui:param>
		<ui:param name="'description'">
			<webwork:text name="'setup.baseurl.desc'" />
		</ui:param>
		<ui:param name="'mandatory'" value="true" />
	</ui:textfield>

    <ui:component template="radio-indexing-config.jsp" label="text('setup.index.label')" name="'indexPath'"/>

    <ui:component template="radio-attachment-config.jsp" label="text('setup.attachment.label')" name="'attachmentPath'"/>

    <ui:component template="radio-backup-config.jsp" label="text('setup.backup.label')" name="'backupPath'"/>

    <script language="javascript" type="text/javascript">
        window.onload = function()
        {
            jQuery("#attachmentPathOption_CUSTOM").toggleField("#attachmentPath")
            jQuery("#indexPathOption_CUSTOM").toggleField("#indexPath")
            jQuery("#backupPathOption_CUSTOM").toggleField("#backupPath")
        }
    </script>

    <tr>
		<td class="formLabel" align="right">&nbsp;</td>
		<td class="rowNormal">&nbsp;</td>
	</tr>

	<tr>
		<td colspan="2" bgcolor="#f0f0f0"><h3 class="formtitle"><webwork:text name="'setup.license.title'" /></h3></td>
	</tr>
    <tr>
        <td class="formLabel" align="right"><webwork:text name="'admin.server.id'"/>:</td>
		<td class="rowNormal"><webwork:property value="/serverId"/></td>
    </tr>
    <ui:textarea label="text('setup.license.label')" name="'license'" cols="50" rows="6">
		<ui:param name="'description'">
            <webwork:text name="'setup.license.description.generate.eval'">
                <webwork:param name="'value0'"><a target="_blank" href="<webwork:component name="'external.link.jira.license.view'" template="externallink.jsp" >
                    <webwork:param name="'value0'"><webwork:property value="/buildUtilsInfo/version"/></webwork:param>
                    <webwork:param name="'value1'"><webwork:property value="/buildUtilsInfo/currentBuildNumber"/></webwork:param>
                    <webwork:param name="'value2'">enterprise</webwork:param>
                    <webwork:param name="'value3'"><webwork:property value="/serverId"/></webwork:param>
                </webwork:component>"></webwork:param>
                <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>
            <br/>
            <webwork:text name="'setup.license.description.retrieve'">
                <webwork:param name="'value0'"><a target="_blank" href="<webwork:component name="'external.link.jira.licenses'" template="externallink.jsp"/>"></webwork:param>
                <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>
		</ui:param>
        <ui:param name="'mandatory'" value="true" />
    </ui:textarea>
    <tr>
        <td bgcolor="#ffffff" valign="top" colspan="2" align="center">
            <input type="submit" name="next" value="<webwork:property value="text('common.words.next')"/>&gt;&gt;" accesskey="<webwork:text name="'common.forms.submit.accesskey'"/>">
            <input type="hidden" name="language" value="<webwork:property value="language"/>"/>
        </td>
    </tr>
</page:applyDecorator>
</td>
<td width="20%" valign="top">
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:property value="text('setup.choose.language')"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="description"> </page:param>

    <table align="center" width="100%">
    <script language="JavaScript">
        function setLanguage(lang)
        {
            var form = document.forms['jiraform'];
            form.elements['language'].value = lang;
            form.submit();
        }
    </script>

    <webwork:iterator value="/installedLocales" status="'status'">
        <webwork:if test="@status/even == false">
            <tr>
        </webwork:if>

            <td align="center" width="50%">
                <webwork:if test="./toString == /applicationProperties/defaultLocale/toString">
                    <img src="<%= request.getContextPath() %>/images/flags/<webwork:property value="./toString"/>.gif" alt="<webwork:property value="./displayLanguage"/>" />
                </webwork:if>
                <webwork:else>
                    <a href="javascript:setLanguage('<webwork:property value="./toString"/>');"><img border="0" src="<%= request.getContextPath() %>/images/flags/<webwork:property value="./toString"/>.gif" alt="<webwork:property value="./displayName"/>"></a>
                </webwork:else>
                <br/>
                <webwork:if test="./toString == /applicationProperties/defaultLocale/toString">
                    <b><webwork:property value="./displayLanguage"/> (<webwork:text name="'setup.language.default'"/>)</b>
                </webwork:if>
                <webwork:else>
                    <a href="javascript:setLanguage('<webwork:property value="./toString"/>');"><webwork:property value="./displayName"/></a>
                </webwork:else>
            </td>
            <%-- Add an empty TD at the end if we have odd number of locales --%>
            <webwork:if test="@status/last == true && @status/even == false">
                <td width="50%">&nbsp;</td>
            </webwork:if>

        <webwork:if test="@status/even == true || (@status/last == true && @status/even == false)">
            </tr>
        </webwork:if>

    </webwork:iterator>

    </table>
</page:applyDecorator>
<webwork:if test="/unavailableLocales/empty == false">
<p>
    <page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:property value="text('setup.third.party.translations')"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="description"> </page:param>
        <table align="center" width="100%">
            <webwork:iterator value="/unavailableLocales" status="'status'">
                <webwork:if test="@status/even == false">
                    <tr>
                </webwork:if>

                    <td align="center" width="50%">
                        <webwork:if test="./toString == /applicationProperties/defaultLocale/toString">
                            <img src="<%= request.getContextPath() %>/images/flags/<webwork:property value="./toString"/>.gif" alt="<webwork:property value="./displayLanguage"/>" />
                        </webwork:if>
                        <webwork:else>
                            <a href="SetupDisplayLocaleInfo!default.jspa?localeCode=<webwork:property value="./toString"/>"><img border=0 src="<%= request.getContextPath() %>/images/flags/<webwork:property value="./toString"/>.gif" alt="<webwork:property value="./displayName"/>" /></a>
                        </webwork:else>
                        <br/>
                        <webwork:if test="./toString == /applicationProperties/defaultLocale/toString">
                            <b><webwork:property value="./displayLanguage"/> (<webwork:text name="'admin.common.words.default'"/>)</b>
                        </webwork:if>
                        <webwork:else>
                            <a href="SetupDisplayLocaleInfo!default.jspa?localeCode=<webwork:property value="./toString"/>"><webwork:property value="./displayName"/></a>
                        </webwork:else>
                    </td>
                    <%-- Add an empty TD at the end if we have odd number of locales --%>
                    <webwork:if test="@status/last == true && @status/even == false">
                        <td width="50%">&nbsp;</td>
                    </webwork:if>

                <webwork:if test="@status/even == true || (@status/last == true && @status/even == false)">
                    </tr>
                </webwork:if>
            </webwork:iterator>
        </table>
    </page:applyDecorator>
<p/>
</webwork:if>
</td>
</tr>
</table>
</body>
</html>
<% } %>
