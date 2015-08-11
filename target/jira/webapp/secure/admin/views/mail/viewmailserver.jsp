
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.mailservers.mail.servers'"/></title>
</head>

<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.mailservers.smtp.mail.servers'"/></page:param>
    <page:param name="width">100%</page:param>
    <p><webwork:text name="'admin.mailservers.the.table.below.smtp'"/></p>
</page:applyDecorator>

<p>

    <table align=center bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width=90%><tr><td>
    <table border="0" cellpadding="3" cellspacing="1" width=100%>
        <tr bgcolor=#f0f0f0>
            <td class="colHeaderLink">
                <b><webwork:text name="'common.words.name'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'admin.common.words.details'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'common.words.operations'"/></b>
            </td>
        </tr>

        <webwork:iterator value="smtpMailServers" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
            <td valign=top>
                <b><webwork:property value="name"/></b>

                <webwork:if test="description">
                    <br>
                    <font size=1><webwork:property value="description"/></font>
                </webwork:if>
            </td>
            <td valign=top>
                <b><webwork:text name="'admin.mailservers.from'"/></b>: <webwork:property value="defaultFrom" /><br>
                <b><webwork:text name="'admin.mailservers.prefix'"/></b>: <webwork:property value="prefix" /><br>

                <webwork:if test="sessionServer == true">
                    <b><webwork:text name="'admin.mailservers.jndi.location'"/></b>: <webwork:property value="jndiLocation" /><br>
                </webwork:if>
                <webwork:else>
                    <b><webwork:text name="'admin.mailservers.host'"/></b>: <webwork:property value="hostname" /><br>
                    <webwork:if test="smtpPort">
                        <b><webwork:text name="'admin.mailservers.smtp.port'"/></b>: <webwork:property value="smtpPort" /><br>
                    </webwork:if>
                    <webwork:if test="username">
                        <b><webwork:text name="'common.words.username'"/></b>: <webwork:property value="username" /><br>
                    </webwork:if>
                </webwork:else>
            </td>
            <td valign=top align=left>
                <a href="UpdateSmtpMailServer!default.jspa?id=<webwork:property value="id"/>"><webwork:text name="'common.words.edit'"/></a>
                | <a id="deleteSMTP" href="DeleteMailServer!default.jspa?id=<webwork:property value="id"/>"><webwork:text name="'common.words.delete'"/></a>
                | <a href="SendTestMail!default.jspa"><webwork:text name="'admin.mailservers.send.a.test.email'"/></a>
            </td>
        </tr>
        </webwork:iterator>
        <webwork:if test="smtpMailServers/size == 0">
            <tr>
                <td colspan=3 bgcolor=#ffffff>
                    <webwork:text name="'admin.mailservers.no.smtp.servers.configured'"/>
                </td>
            </tr>
        </webwork:if>
    </table>
    </td></tr></table>

</p>
<webwork:if test="smtpMailServers/size == 0">
<p>
    <table align=center border="0" cellpadding="0" cellspacing="0" width=90%>
    <tr>
    <td align="center">
    <table border="0" cellpadding="3" cellspacing="1">
    <tr>
        <td><a href="AddSmtpMailServer!default.jspa"><webwork:text name="'admin.mailservers.configure.new.smtp.mail.server'"/></a></td>
    </tr>
    </table>
    </td>
    </tr>
    </table>
</p>
</webwork:if>

&nbsp;<br>

<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.mailservers.pop.imap.servers'"/></page:param>
    <page:param name="width">100%</page:param>

    <p><webwork:text name="'admin.mailservers.the.table.below.pop'"/></p>
    <webwork:if test="/validMailParameters == false && popMailServers/empty == false">
        <%@include file="/includes/admin/email/badmailprops.jsp"%>
    </webwork:if>
</page:applyDecorator>

<p>

    <table align=center bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width=90%><tr><td>
    <table border="0" cellpadding="3" cellspacing="1" width=100%>
        <tr bgcolor=#f0f0f0>
            <td class="colHeaderLink">
                <b><webwork:text name="'common.words.name'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'admin.common.words.details'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'common.words.operations'"/></b>
            </td>
        </tr>

        <webwork:iterator value="popMailServers" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
            <td valign=top>
                <b><webwork:property value="name"/></b>

                <webwork:if test="description">
                    <br>
                    <font size=1><webwork:property value="description"/></font>
                </webwork:if>
            </td>
            <td valign=top>
                <b><webwork:text name="'admin.mailservers.host'"/></b>: <webwork:property value="hostname" /><br>
                <b><webwork:text name="'common.words.username'"/></b>: <webwork:property value="username" /><br>
            </td>
            <td valign=top align=left>
                <a href="UpdatePopMailServer!default.jspa?id=<webwork:property value="id"/>"><webwork:text name="'common.words.edit'"/></a>
                | <a id="deletePOP" href="DeleteMailServer!default.jspa?id=<webwork:property value="id"/>"><webwork:text name="'common.words.delete'"/></a>
            </td>
        </tr>
        </webwork:iterator>
        <webwork:if test="popMailServers/size == 0">
            <tr>
                <td colspan=3 bgcolor=#ffffff>
                    <webwork:text name="'admin.mailservers.no.pop.imap.servers.configured'"/>
                </td>
            </tr>
        </webwork:if>
    </table>
    </td></tr></table>

</p>

<p>
    <table align=center border="0" cellpadding="0" cellspacing="0" width=90%>
    <tr>
    <td align="center">
    <table border="0" cellpadding="3" cellspacing="1">
    <tr>
        <td><a href="AddPopMailServer!default.jspa"><webwork:text name="'admin.mailservers.configure.new.pop.imap.mail.server'"/></a></td>
    </tr>
    </table>
    </td>
    </tr>
    </table>
</p>

</body>
</html>
