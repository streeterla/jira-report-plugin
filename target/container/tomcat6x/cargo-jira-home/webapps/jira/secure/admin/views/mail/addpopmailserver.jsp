
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.mailservers.add.pop.imap.mail.server'"/></title>
</head>

<body>

    <p>
    <table width=100% cellpadding=10 cellspacing=0 border=0>
    <page:applyDecorator name="jiraform">
        <page:param name="action">AddPopMailServer.jspa</page:param>
        <page:param name="submitId">add_submit</page:param>
        <page:param name="submitName"> <webwork:text name="'common.forms.add'"/> </page:param>
    	<page:param name="cancelURI">ViewMailServers.jspa</page:param>
        <page:param name="title"><webwork:text name="'admin.mailservers.add.pop.imap.mail.server'"/></page:param>
        <page:param name="description">
            <p><webwork:text name="'admin.mailservers.add.pop.server.description'"/></p>
        </page:param>
        <page:param name="width">100%</page:param>
        <page:param name="instructions">
            <webwork:if test="/validMailParameters == false">
                <%@include file="/includes/admin/email/badmailprops.jsp"%>
            </webwork:if>
        </page:param>

        <ui:textfield label="text('common.words.name')" name="'name'" size="'30'">
            <ui:param name="'description'"><webwork:text name="'admin.mailservers.pop.name.description'"/></ui:param>
        </ui:textfield>

        <ui:textfield label="text('common.words.description')" name="'description'" size="'60'" />

        <ui:textfield label="text('admin.mailservers.host.name')" name="'serverName'">
            <ui:param name="'description'"><webwork:text name="'admin.mailservers.pop.host.name.description'"/></ui:param>
        </ui:textfield>

        <ui:textfield label="text('common.words.username')" name="'username'">
            <ui:param name="'description'"><webwork:text name="'admin.mailservers.pop.username.description'"/></ui:param>
        </ui:textfield>

        <ui:password label="text('common.words.password')" name="'password'">
            <ui:param name="'description'"><webwork:text name="'admin.mailservers.pop.password.description'"/></ui:param>
        </ui:password>

        <ui:component name="'type'" value="types[0]" template="hidden.jsp" theme="'single'"  />
    </page:applyDecorator>
    </table>
    </p>

</body>
</html>
