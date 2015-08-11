
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.mailservers.add.smtp.mail.server'"/></title>
</head>

<body>

    <p>
    <table width=100% cellpadding=10 cellspacing=0 border=0>
    <page:applyDecorator name="jiraform">
        <page:param name="action">AddSmtpMailServer.jspa</page:param>
        <page:param name="submitId">add_submit</page:param>
        <page:param name="submitName"> <webwork:text name="'common.forms.add'"/> </page:param>
    	<page:param name="cancelURI">ViewMailServers.jspa</page:param>
        <page:param name="title"><webwork:text name="'admin.mailservers.add.smtp.mail.server'"/></page:param>
        <page:param name="description"><webwork:text name="'admin.mailservers.add.smtp.instruction'"/></page:param>
        <page:param name="helpURL">smtpconfig</page:param>
        <page:param name="width">100%</page:param>

        <ui:textfield label="text('common.words.name')" name="'name'" size="'30'">
            <ui:param name="'description'"><webwork:text name="'admin.mailservers.name.description'"/></ui:param>
            <ui:param name="'mandatory'">true</ui:param>
        </ui:textfield>
        <ui:textfield label="text('common.words.description')" name="'description'" size="'60'" />

        <ui:textfield label="text('admin.mailservers.from.address')" name="'from'">
            <ui:param name="'description'"><webwork:text name="'admin.mailservers.from.address.description'"/></ui:param>
            <ui:param name="'mandatory'">true</ui:param>
        </ui:textfield>
        <ui:textfield label="text('admin.mailservers.email.prefix')" name="'prefix'">
            <ui:param name="'description'"><webwork:text name="'admin.mailservers.email.prefix.description'"/></ui:param>
            <ui:param name="'mandatory'">true</ui:param>
        </ui:textfield>

        <tr>
            <td colspan=2 bgcolor=#ffffff>&nbsp;</td>
        </tr>

        <tr>
            <td colspan=2 bgcolor=#f0f0f0><b><webwork:text name="'admin.mailservers.server.details'"/></b><br>
            <webwork:text name="'admin.mailservers.server.details.description'">
                <webwork:param name="'value0'"><i></webwork:param>
                <webwork:param name="'value1'"></i></webwork:param>
                <webwork:param name="'value2'"><i></webwork:param>
                <webwork:param name="'value3'"></i></webwork:param>
            </webwork:text></td>
        </tr>

        <tr>
            <td colspan=2 bgcolor=#f0f0f0><b><webwork:text name="'admin.mailservers.smtp.host'"/></b></td>
        </tr>

        <ui:textfield label="text('admin.mailservers.host.name')" name="'serverName'">
            <ui:param name="'description'"><webwork:text name="'admin.mailservers.smtp.host.name.description'"/></ui:param>
        </ui:textfield>

        <ui:textfield label="text('admin.mailservers.smtp.port')" name="'smtpPort'">
            <ui:param name="'description'"><webwork:text name="'admin.mailservers.smtp.port.description'"/></ui:param>
        </ui:textfield>

        <ui:textfield label="text('common.words.username')" name="'username'">
            <ui:param name="'description'"><webwork:text name="'admin.mailservers.username.description'"/></ui:param>
        </ui:textfield>

        <ui:password label="text('common.words.password')" name="'password'">
            <ui:param name="'description'"><webwork:text name="'admin.mailservers.password.description'"/></ui:param>
        </ui:password>

        <tr>
            <td bgcolor=#ffffff><b><webwork:text name="'common.words.or'"/></b></td>
            <td bgcolor=#ffffff align=center>&nbsp;</td>
        </tr>

        <tr>
            <td colspan=2 bgcolor=#f0f0f0><b><webwork:text name="'admin.mailservers.jndi.location'"/></b></td>
        </tr>

        <ui:textfield label="text('admin.mailservers.jndi.location')" name="'jndiLocation'">
            <ui:param name="'description'"><webwork:text name="'admin.mailservers.jndi.location.description'"/></ui:param>
        </ui:textfield>

        <ui:component name="'type'" value="types[1]" template="hidden.jsp" theme="'single'"  />

    </page:applyDecorator>
    </table>
    </p>

</body>
</html>
