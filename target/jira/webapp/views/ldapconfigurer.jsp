<%@ page import="com.atlassian.jira.web.util.HelpUtil" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.ldap.jira.ldap.configurer'"/></title>
</head>

<body>
	<page:applyDecorator name="jiraform">

        <page:param name="title"><webwork:text name="'admin.ldap.configure.ldap.authentication'"/></page:param>
        <page:param name="helpURL">ldap</page:param>
		<page:param name="action">LDAPConfigurer.jspa</page:param>
		<page:param name="submitId">ldap_submit</page:param>
		<page:param name="submitName"><webwork:text name="'admin.common.words.submit'"/></page:param>
        <page:param name="autoSelectFirst">false</page:param>
		<page:param name="cancelURI">../default.jsp</page:param>
        <page:param name="width">100%</page:param>
        <page:param name="description">
            <p><webwork:text name="'admin.ldap.description'"/></p>
            <p><webwork:text name="'admin.ldap.instructions'"/></p>
            <% request.setAttribute("ldapLink", "<a href=\"" + new HelpUtil().getHelpPath("ldap").getUrl() + "\" target=\"_jirahelp\">"); %>
            <p><webwork:text name="'admin.ldap.doc.link'">
                    <webwork:param name="'value0'" value="@ldapLink"/>
                    <webwork:param name="'value1'" value="'</a>'"/>
                </webwork:text></p>
        </page:param>

		<ui:textfield label="text('admin.ldap.ldap.host')" name="'host'" size="40">
            <ui:param name="'mandatory'" value="'true'" />
            <ui:param name="'description'"><webwork:text name="'admin.ldap.host.description'"/></ui:param>
        </ui:textfield>
		<ui:textfield label="text('admin.ldap.basedn')" name="'baseDN'" size="40">
            <ui:param name="'description'"><webwork:text name="'admin.ldap.basedn.description'"/></ui:param>
            <ui:param name="'mandatory'" value="'true'" />
        </ui:textfield>

        <tr>
            <td style="height:2px; font-size:1px; background-color:#fffff0;">&nbsp;</td>
            <td style="height:2px; font-size:1px; background-color:#ffffff;">&nbsp;</td>
        </tr>

		<ui:textfield label="text('admin.ldap.bind.dn')" name="'bindDN'" size="40">
            <ui:param name="'description'"><webwork:text name="'admin.ldap.bind.dn.description'"/></ui:param>
        </ui:textfield>

		<ui:password label="text('admin.ldap.bind.password')" name="'bindPassword'" size="40">
            <ui:param name="'description'"><webwork:text name="'admin.ldap.bind.password.description'"/></ui:param>
        </ui:password>


		<ui:textfield label="text('admin.ldap.search.attribute')" name="'searchAttribute'" >
            <ui:param name="'mandatory'" value="'true'" />
            <ui:param name="'description'"><webwork:text name="'admin.ldap.search.attribute.description'"/></ui:param>
        </ui:textfield>

        <tr>
            <td style="height:2px; font-size:1px; background-color:#fffff0;">&nbsp;</td>
            <td style="height:2px; font-size:1px; background-color:#ffffff;">&nbsp;</td>
        </tr>

        <ui:component label="text('admin.ldap.sample.user')" name="'userName'" template="userselect.jsp">
            <ui:param name="'formname'" value="'jiraform'" />
            <ui:param name="'imageName'" value="'userImage'"/>
            <ui:param name="'size'" value="40"/>
            <ui:param name="'description'"><webwork:text name="'admin.ldap.sample.user.description'"/></ui:param>
        </ui:component>

        <ui:password label="text('admin.ldap.sample.user.password')" name="'userPassword'" size="40">
            <ui:param name="'description'"><webwork:text name="'admin.ldap.sample.user.password.description'"/></ui:param>
        </ui:password>

	</page:applyDecorator>
</body>
</html>
