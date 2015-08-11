<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>


<html>
<head>
	<title><webwork:text name="'admin.generalconfiguration.jira.configuration'"/></title>
    <style type="text/css">
        .on
        {
            color: #090;
            font-weight:bold;
        }
        .off
        {
            color: #900;
            font-weight:bold;
        }

    </style>
</head>

<body>

<p>
<page:applyDecorator name="jiratable">
    <page:param name="title"><webwork:text name="'admin.common.words.settings'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURLFragment">#settings</page:param>
    <page:param name="helpURL">configuration</page:param>
    <page:param name="titleColspan">2</page:param>

    <tr bgcolor="#ffffff">
		<td valign="top" width="40%">&nbsp;&nbsp;<b><webwork:text name="'admin.common.words.title'"/></b></td>
		<td valign="top" width="60%"><webwork:property value="applicationProperties/string('jira.title')"/></td>
	</tr>
    <tr bgcolor="#fffff0">
        <td valign="top">&nbsp;&nbsp;<b><webwork:text name="'admin.common.words.mode'"/></b></td>
        <td valign="top"><webwork:property value="/jiraMode"/></td>
    </tr>
    <tr bgcolor="#ffffff">
		<td valign="top">&nbsp;&nbsp;<b><webwork:text name="'admin.generalconfiguration.maximum.authentication.attempts.allowed'"/></b></td>
        <webwork:if test="applicationProperties/defaultBackedString('jira.maximum.authentication.attempts.allowed') != null && applicationProperties/defaultBackedString('jira.maximum.authentication.attempts.allowed')/length() > 0">
            <td valign="top"><webwork:property value="applicationProperties/defaultBackedString('jira.maximum.authentication.attempts.allowed')" /></td>
        </webwork:if>
        <webwork:else>
            <td valign="top"><webwork:text name="'common.words.unlimited'"/></td>
        </webwork:else>
	</tr>
    <tr bgcolor="#fffff0">
        <td valign="top">&nbsp;&nbsp;<b><webwork:text name="'admin.generalconfiguration.captcha.on.signup'"/></b></td>
        <td valign="top">
            <webwork:if test="applicationProperties/option('jira.option.captcha.on.signup') == true">
                <span class="on"><webwork:text name="'admin.common.words.on'"/></span>
            </webwork:if>
            <webwork:else>
                <span class="off"><webwork:text name="'admin.common.words.off'"/></span>
            </webwork:else>
        </td>
    </tr>
	<tr bgcolor="#ffffff">
		<td valign="top">&nbsp;&nbsp;<b><webwork:text name="'admin.generalconfiguration.base.url'"/></b></td>
		<td valign="top"><a href="<webwork:property value="applicationProperties/string('jira.baseurl')"/>" target="_blank"><webwork:property value="applicationProperties/string('jira.baseurl')"/></a></td>
	</tr>
    <tr bgcolor="#fffff0">
        <td valign="top">&nbsp;&nbsp;<b><webwork:text name="'admin.generalconfiguration.email.from.header'"/></b></td>
        <td valign="top"><webwork:property value="applicationProperties/defaultBackedString('jira.email.fromheader.format')"/></td>
    </tr>
    <tr bgcolor="#ffffff">
		<td valign="top">&nbsp;&nbsp;<b><webwork:text name="'admin.common.words.introduction'"/></b></td>
		<td valign="top"><webwork:property value="applicationProperties/text('jira.introduction')" escape="false" /></td>
	</tr>
</page:applyDecorator>
</p>

<p>
<page:applyDecorator name="jiratable">
    <page:param name="id">language-info</page:param>
    <page:param name="title"><webwork:text name="'admin.generalconfiguration.internationalisation'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURLFragment">#i18n</page:param>
    <page:param name="helpURL">configuration</page:param>
    <page:param name="titleColspan">2</page:param>

    <tr bgcolor="#ffffff">
		<td valign="top" width="40%">&nbsp;&nbsp;<b><webwork:text name="'admin.generalconfiguration.character.encoding'"/></b></td>
		<td valign="top" width="60%"><webwork:property value="applicationProperties/string('webwork.i18n.encoding')" /></td>
	</tr>
    <tr bgcolor="#fffff0">
		<td valign="top">&nbsp;&nbsp;<b><webwork:text name="'admin.generalconfiguration.indexing.language'"/></b></td>
		<td valign="top"><webwork:property value="applicationProperties/string('jira.i18n.language.index')" /></td>
	</tr>
    <tr bgcolor="#ffffff">
		<td valign="top">&nbsp;&nbsp;<b><webwork:text name="'admin.generalconfiguration.installed.languages'"/></b></td>
		<td valign="top">
        <webwork:iterator value="/localeManager/installedLocales" status="'status'">
            <webwork:property value="/displayNameOfLocale(.)"/><webwork:if test="@status/last == false"><br></webwork:if>
        </webwork:iterator>
        </td>
	</tr>
    <tr bgcolor="#fffff0">
		<td valign="top">&nbsp;&nbsp;<b><webwork:text name="'admin.generalconfiguration.default.language'"/></b></td>
		<td valign="top"><webwork:property value="/displayNameOfLocale(/applicationProperties/defaultLocale)" /></td>
	</tr>
</page:applyDecorator>
</p>

<p>
<page:applyDecorator name="jiratable">
    <page:param name="id">options_table</page:param>
    <page:param name="title"><webwork:text name="'admin.common.words.options'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURLFragment">#options</page:param>
    <page:param name="helpURL">configuration</page:param>
    <page:param name="titleColspan">2</page:param>

	<tr bgcolor="#ffffff">
		<td valign="top" width="40%">&nbsp;&nbsp;<b><webwork:text name="'admin.generalconfiguration.allow.users.to.vote'"/></b></td>
		<td valign="top" width="60%">
			<webwork:if test="applicationProperties/option('jira.option.voting') == true">
				<span class="on"><webwork:text name="'admin.common.words.on'"/></span>
			</webwork:if>
			<webwork:else>
				<span class="off"><webwork:text name="'admin.common.words.off'"/></span>
			</webwork:else>
		</td>
	</tr>
	<tr bgcolor="#fffff0">
		<td valign="top">&nbsp;&nbsp;<b><webwork:text name="'admin.generalconfiguration.allow.users.to.watch'"/></b></td>
		<td valign="top">
			<webwork:if test="applicationProperties/option('jira.option.watching') == true">
				<span class="on"><webwork:text name="'admin.common.words.on'"/></span>
			</webwork:if>
			<webwork:else>
				<span class="off"><webwork:text name="'admin.common.words.off'"/></span>
			</webwork:else>
		</td>
	</tr>
	<tr bgcolor="#ffffff">
		<td valign="top">&nbsp;&nbsp;<b><webwork:text name="'admin.generalconfiguration.allow.unassigned.issues'"/></b></td>
		<td valign="top">
			<webwork:if test="applicationProperties/option('jira.option.allowunassigned') == true">
				<span class="on"><webwork:text name="'admin.common.words.on'"/></span>
			</webwork:if>
			<webwork:else>
				<span class="off"><webwork:text name="'admin.common.words.off'"/></span>
			</webwork:else>
		</td>
	</tr>
	<tr bgcolor="#fffff0">
		<td valign="top">&nbsp;&nbsp;<b><webwork:text name="'admin.generalconfiguration.external.user.management'"/></b></td>
		<td valign="top">
			<webwork:if test="applicationProperties/option('jira.option.user.externalmanagement') == true">
				<span class="on"><webwork:text name="'admin.common.words.on'"/></span>
			</webwork:if>
			<webwork:else>
				<span class="off"><webwork:text name="'admin.common.words.off'"/></span>
			</webwork:else>
		</td>
	</tr>
	<tr bgcolor="#ffffff">
		<td valign="top">&nbsp;&nbsp;<b><webwork:text name="'admin.generalconfiguration.external.password.management'"/></b></td>
		<td valign="top">
			<webwork:if test="applicationProperties/option('jira.option.user.externalpasswordmanagement') == true">
				<span class="on"><webwork:text name="'admin.common.words.on'"/></span>
			</webwork:if>
			<webwork:else>
				<span class="off"><webwork:text name="'admin.common.words.off'"/></span>
			</webwork:else>
		</td>
	</tr>
    <tr bgcolor="#fffff0">
		<td valign="top">&nbsp;&nbsp;<b><webwork:text name="'admin.generalconfiguration.logout.confirmation'"/></b></td>
		<td valign="top"><strong>
			<webwork:if test="applicationProperties/defaultBackedString('jira.option.logoutconfirm') == 'never'">
				<webwork:text name="'admin.common.words.never'"/>
			</webwork:if>
            <webwork:elseIf test="applicationProperties/defaultBackedString('jira.option.logoutconfirm') == 'cookie'">
                <webwork:text name="'admin.common.words.cookie'"/>
            </webwork:elseIf>
			<webwork:else>
				<webwork:text name="'admin.common.words.always'"/>
			</webwork:else>
            </strong>
        </td>
	</tr>
    <tr bgcolor="#ffffff">
		<td valign="top">&nbsp;&nbsp;<b><webwork:text name="'admin.generalconfiguration.use.gzip.compression'"/></b></td>
		<td valign="top">
			<webwork:if test="applicationProperties/option('jira.option.web.usegzip') == true">
				<span class="on"><webwork:text name="'admin.common.words.on'"/></span>
			</webwork:if>
			<webwork:else>
				<span class="off"><webwork:text name="'admin.common.words.off'"/></span>
			</webwork:else>
		</td>
	</tr>
    <tr bgcolor="#fffff0">
		<td valign="top">&nbsp;&nbsp;<b><webwork:text name="'admin.generalconfiguration.accept.remote.api.calls'"/></b></td>
		<td valign="top">
			<webwork:if test="applicationProperties/option('jira.option.rpc.allow') == true">
				<span class="on"><webwork:text name="'admin.common.words.on'"/></span>
			</webwork:if>
			<webwork:else>
				<span class="off"><webwork:text name="'admin.common.words.off'"/></span>
			</webwork:else>
		</td>
	</tr>
    <tr bgcolor="#ffffff">
		<td valign="top">&nbsp;&nbsp;<b><webwork:text name="'admin.generalconfiguration.user.email.visibility'"/></b></td>
		<td valign="top"><strong>
			<webwork:if test="applicationProperties/defaultBackedString('jira.option.emailvisible') == 'show'">
				<webwork:text name="'admin.generalconfiguration.public'"/>
			</webwork:if>
			<webwork:elseIf test="applicationProperties/defaultBackedString('jira.option.emailvisible') == 'hide'">
				<webwork:text name="'admin.generalconfiguration.hidden'"/>
			</webwork:elseIf>
			<webwork:elseIf test="applicationProperties/defaultBackedString('jira.option.emailvisible') == 'mask'">
				<webwork:text name="'admin.generalconfiguration.masked'"><webwork:param name="value0">user at example dot com</webwork:param></webwork:text>
			</webwork:elseIf>
			<webwork:else>
				<webwork:text name="'admin.generalconfiguration.logged.in.only'"/>
			</webwork:else>
            </strong>
        </td>
	</tr>

    <tr bgcolor="#fffff0">
		<td valign="top">&nbsp;&nbsp;<b><webwork:text name="'admin.generalconfiguration.commentlevel.visibility'"/></b></td>
		<td valign="top">
			<webwork:if test="applicationProperties/option('jira.comment.level.visibility.groups') == true">
                <strong><webwork:text name="'admin.generalconfiguration.commentlevel.visibility.both'"/></strong>
            </webwork:if>
            <webwork:else>
                <strong><webwork:text name="'admin.generalconfiguration.commentlevel.visibility.rolesonly'"/></strong>
            </webwork:else>
		</td>
	</tr>

    <tr bgcolor="#ffffff">
		<td valign="top">&nbsp;&nbsp;<b><webwork:text name="'admin.generalconfiguration.enable.email.header'">
		    <webwork:param name="'value0'"></b><br>&nbsp;&nbsp;</webwork:param>
		    <webwork:param name="'value1'">Precedence: bulk</webwork:param>
		</webwork:text></td>
		<td valign="top">
			<webwork:if test="applicationProperties/option('jira.option.precedence.header.exclude') == true">
				<span class="on"><webwork:text name="'admin.common.words.on'"/></span>
			</webwork:if>
			<webwork:else>
				<span class="off"><webwork:text name="'admin.common.words.off'"/></span>
			</webwork:else>
		</td>
	</tr>
    <webwork:if test="applicationProperties/option('jira.option.cache.issues') == true">
	<tr bgcolor="#fffff0">
		<td valign="top">&nbsp;&nbsp;<b><webwork:text name="'admin.generalconfiguration.cache.issues'"/></b></td>
		<td valign="top">
			<%--<webwork:if test="applicationProperties/option('jira.option.cache.issues') == true">--%>
				<span class="on"><webwork:text name="'admin.common.words.on'"/></span>
			<%--</webwork:if>
			<webwork:else>
				<span class="off"><webwork:text name="'admin.common.words.off'"/></span>
			</webwork:else>--%>
		</td>
	</tr>
    </webwork:if>
   <tr bgcolor="#fffff0">
		<td valign="top">&nbsp;&nbsp;<b><webwork:text name="'admin.generalconfiguration.enable.ajax.issue.picker'" /></b></td>
		<td valign="top">
			<webwork:if test="applicationProperties/option('jira.ajax.autocomplete.issuepicker.enabled') == true">
				<span class="on"><webwork:text name="'admin.common.words.on'"/></span>
			</webwork:if>
			<webwork:else>
				<span class="off"><webwork:text name="'admin.common.words.off'"/></span>
			</webwork:else>
		</td>
	</tr>
    <tr bgcolor="#ffffff">
          <td valign="top">&nbsp;&nbsp;<b><webwork:text name="'admin.generalconfiguration.enable.ajax.user.full.search'" /></b></td>
          <td valign="top">
              <webwork:if test="/canPerformAjaxSearch() == true">
                  <span class="on"><webwork:text name="'admin.common.words.on'"/></span>
              </webwork:if>
              <webwork:else>
                  <span class="off"><webwork:text name="'admin.common.words.off'"/></span>
              </webwork:else>
          </td>
    </tr>
    <tr bgcolor="#fffff0">
         <td valign="top">&nbsp;&nbsp;<b><webwork:text name="'admin.generalconfiguration.enabled.jql.autocomplete'" /></b></td>
         <td valign="top">
             <webwork:if test="applicationProperties/option('jira.jql.autocomplete.disabled') == false">
                 <span class="on"><webwork:text name="'admin.common.words.on'"/></span>
             </webwork:if>
             <webwork:else>
                 <span class="off"><webwork:text name="'admin.common.words.off'"/></span>
             </webwork:else>
         </td>
    </tr>
    <tr bgcolor="#ffffff">
		<td valign="top">&nbsp;&nbsp;<b><webwork:text name="'admin.generalconfiguration.ie.mime.sniffing'"/></b></td>
		<td valign="top"><strong>
			<webwork:if test="applicationProperties/defaultBackedString('jira.attachment.download.mime.sniffing.workaround') == 'workaround'">
				<webwork:text name="'admin.generalconfiguration.ie.mime.sniffing.workaround'"/>
			</webwork:if>
			<webwork:elseIf test="applicationProperties/defaultBackedString('jira.attachment.download.mime.sniffing.workaround') == 'secure'">
				<webwork:text name="'admin.generalconfiguration.ie.mime.sniffing.paranoid'"/>
			</webwork:elseIf>
			<webwork:elseIf test="applicationProperties/defaultBackedString('jira.attachment.download.mime.sniffing.workaround') == 'insecure'">
				<webwork:text name="'admin.generalconfiguration.ie.mime.sniffing.owned'"><webwork:param name="value0">user at example dot com</webwork:param></webwork:text>
			</webwork:elseIf>
			<webwork:else>
				<webwork:text name="'admin.generalconfiguration.logged.in.only'"/>
			</webwork:else>
            </strong>
        </td>
	</tr>

</page:applyDecorator>
</p>

<p>
<table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>
<table border="0" cellpadding="3" cellspacing="1" width=100%>
	<tr bgcolor="#f0f0f0">
		<td class="colHeaderLink" colspan="2" align="center">
			<a href="EditApplicationProperties!default.jspa"><b><webwork:text name="'admin.common.phrases.edit.configuration'"/></b></a>
		</td>
	</tr>
</table>
</td></tr></table>
</p>

</body>
</html>
