<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.userdefaults.user.defaults'"/></title>
</head>

<body>

    <page:applyDecorator name="jirapanel">
        <page:param name="title"><webwork:text name="'admin.userdefaults.user.default.settings'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="titleColspan">2</page:param>
        <page:param name="description">
            <webwork:text name="'admin.userdefaults.set.default.values'"/>
        </page:param>

        <ul class="square">
            <li><a href="EditUserDefaultSettings!default.jspa"><webwork:text name="'admin.userdefaults.edit.default.values'"/></a></li>
        </ul>
    </page:applyDecorator>

<br/>

<table id="view_user_defaults" class="grid maxWidth">

    <tr bgcolor="#f0f0f0">
        <td class="colHeaderLink">
            <b><webwork:text name="'common.words.name'"/></b>
        </td>
        <td class="colHeaderLink">
            <b><webwork:text name="'admin.common.words.value'"/></b>
        </td>
        <td class="colHeaderLink">
            <b><webwork:text name="'common.words.operations'"/></b>
        </td>
    </tr>


    <tr class="rowNormal">
        <td valign="top" align=left>
        &nbsp; <b> <webwork:text name="'admin.userdefaults.outgoing.email.format'"/></b>
        </td>
        <td>
            <webwork:property value="applicationProperties/defaultBackedString('user.notifications.mimetype')"/>
        </td>
        <td>
            <a href="SetGlobalEmailPreference!default.jspa" title="<webwork:text name="'admin.userdefaults.force.user.defaults'"/>"><webwork:text name="'admin.common.words.apply'"/></a>
        </td>
    </tr>
    <tr class="rowAlternate">
        <td valign="top" align=left>
        &nbsp; <b> <webwork:text name="'admin.userdefaults.number.of.issues'"/></b>
        </td>
        <td>
            <webwork:property value="applicationProperties/defaultBackedString('user.issues.per.page')"/>
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr class="rowNormal">
        <td valign="top" align="left">
        &nbsp; <b> <webwork:text name="'admin.userdefaults.notify.users.of.own.changes'"/></b>
        </td>
        <td>
            <webwork:if test="applicationProperties/option('user.notify.own.changes') == true">
                <span style="color:#090;font-weight:bold;"><webwork:text name="'admin.common.words.yes'"/></span>
            </webwork:if>
            <webwork:else>
                <span style="color:#900;font-weight:bold;"><webwork:text name="'admin.common.words.no'"/></span>
            </webwork:else>
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr class="rowNormal">
        <td valign="top" align="left">
        &nbsp; <b> <webwork:text name="'admin.userdefaults.default.share'"/></b>
        </td>
        <td>
        <webwork:if test="applicationProperties/option('user.default.share.private') == false">
            <b><webwork:text name="'admin.common.words.public'"/></b>
        </webwork:if>
        <webwork:else>
            <b><webwork:text name="'admin.common.words.private'"/></b>
        </webwork:else>
        </td>
        <td>
            &nbsp;
        </td>
    </tr>

</table>
</body>
</html>
