<%@ page import="com.atlassian.jira.web.util.ExternalLinkUtilImpl"%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<% com.atlassian.jira.web.util.ExternalLinkUtil externalLinkUtil = ExternalLinkUtilImpl.getInstance(); %>
<html>
<head>
	<title><webwork:text name="'admin.license.information'"/></title>
</head>
<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.license.information'"/></page:param>
    <page:param name="width">100%</page:param>
    <webwork:text name="'admin.license.this.page.shows'"/>
    <p>
    <webwork:text name="'admin.license.you.instructions'"/>
</page:applyDecorator>
<p>
<form action="RefreshActiveUserCount.jspa" method="post">
<table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="80%"><tr><td>
<table border="0" cellpadding="3" cellspacing="1" width="100%" id="license_table">
	<tr>
		<td bgcolor="#f0f0f0" class="colHeaderLink" width="20%" valign="top">
			<b><webwork:text name="'admin.license.organisation'"/></b>
		</td>
        <td bgcolor="#ffffff">
			<b><webwork:property value="/licenseDetails/organisation"/></b>
		</td>
	</tr>
	<tr bgcolor="#f0f0f0">
        <td class="colHeaderLink" valign="top">
            <b><webwork:text name="'admin.license.date.purchased'"/></b>
        </td>
        <td bgcolor="#ffffff">
			<b><webwork:property value="/purchaseDate"/></b>
		</td>
	</tr>
    <tr bgcolor="#f0f0f0">
        <td class="colHeaderLink" valign="top">
            <b><webwork:text name="'admin.license.type'"/></b>
        </td>
        <td bgcolor="#ffffff">
			<b><webwork:property value="/licenseDetails/description"/></b>
			<webwork:property value="/licenseExpiryStatusMessage" escape="false"/>
        </td>
    </tr>
    <tr bgcolor="#f0f0f0">
        <td class="colHeaderLink" valign="top">
            <b><webwork:text name="'admin.server.id'"/></b>
        </td>
        <td bgcolor="#ffffff">
			<b><span id="serverId"><webwork:property value="/serverId"/></span></b>
		</td>
    </tr>
    <tr bgcolor="#f0f0f0">
        <td class="colHeaderLink" valign="top">
            <b><webwork:text name="'admin.license.sen'"/></b>
        </td>
        <td bgcolor="#ffffff">
            <b><webwork:property value="/licenseDetails/supportEntitlementNumber"/></b>
        </td>
    </tr>
    <webwork:if test="/licenseRequiresUserLimit == true">
        <tr bgcolor="#f0f0f0">
            <td class="colHeaderLink" valign="top">
                <b><webwork:text name="'admin.license.user.limit'"/></b>
            </td>
            <td bgcolor="#ffffff" <webwork:if test="/hasExceededUserLimit == true">style="color: #ff0000;"</webwork:if>>
                <b><webwork:if test="/licenseDetails/unlimitedNumberOfUsers == true"><webwork:text name="'common.words.unlimited'"/></webwork:if><webwork:else><webwork:property value="/licenseDetails/maximumNumberOfUsers"/></webwork:else></b>
                (<webwork:text name="'admin.license.active.user.count'">
                    <webwork:param name="'value0'"><webwork:property value="/activeUserCount"/></webwork:param>
                </webwork:text>) &nbsp;
                <input type="submit" name="<webwork:text name="'admin.common.words.refresh'"/>" value="<webwork:text name="'admin.common.words.refresh'"/>"/>
            </td>
        </tr>
    </webwork:if>
    <webwork:else>
        <tr bgcolor="#f0f0f0">
            <td class="colHeaderLink" valign="top">
                <b><webwork:text name="'admin.license.user.limit'"/></b>
            </td>
            <td bgcolor="#ffffff">
                <b><webwork:if test="/licenseDetails/unlimitedNumberOfUsers == true"><webwork:text name="'common.words.unlimited'"/></webwork:if><webwork:else><webwork:property value="/licenseDetails/maximumNumberOfUsers"/></webwork:else></b>
            </td>
        </tr>
    </webwork:else>
    <webwork:property value="/licenseDetails/partnerName">
        <webwork:if test=". != null && . != ''">
            <tr bgcolor="#f0f0f0">
                <td class="colHeaderLink" valign="top">
                    <b><webwork:text name="'admin.license.partner.name'"/></b>
                </td>
                <td bgcolor="#ffffff">
                    <b><webwork:property value="."/></b>
                </td>
            </tr>
        </webwork:if>
    </webwork:property>

    <webwork:if test="/licenseStatusMessage != null">
        <tr bgcolor="#f0f0f0">
            <td class="colHeaderLink" valign="top">
                <b><webwork:text name="'admin.license.maintenance.period'"/></b>
            </td>
            <td bgcolor="#ffffff">
                <webwork:property value="/licenseStatusMessage" escape="false"/>
            </td>
        </tr>
    </webwork:if>

</table>
</td></tr></table>
</form>
<style type="text/css">
.fieldLabelArea
{
    width: 10%;
}
</style>
<p>
<page:applyDecorator name="jiraform">
	<page:param name="action">ViewLicense.jspa</page:param>
	<page:param name="submitId">add_submit</page:param>
	<page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
	<page:param name="width">100%</page:param>
	<page:param name="title"><webwork:if test="/licenseDetails/licenseSet == true"><webwork:text name="'admin.license.update.license'"/></webwork:if><webwork:else><webwork:text name="'admin.license.add.license'"/></webwork:else></page:param>
	<page:param name="description"><webwork:text name="'admin.license.copy.and.paste'">
        <webwork:param name="'value0'"><a href="<%= externalLinkUtil.getProperty("external.link.atlassian.my.account") %>"></webwork:param>
        <webwork:param name="'value1'"></a></webwork:param>
    </webwork:text></page:param>
	<ui:textarea label="text('admin.license')" name="'license'" cols="50" rows="10" />
</page:applyDecorator>
</p>
</body>
</html>
