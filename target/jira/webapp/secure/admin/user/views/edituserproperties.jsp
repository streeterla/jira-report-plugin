<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><webwork:text name="'admin.edituserproperties.edit.properties'"/></title>
</head>
<body>

<page:applyDecorator name="jirapanel">
<page:param name="action">EditUserProperties.jspa</page:param>
    <page:param name="title"><webwork:text name="'admin.edituserproperties.edit.properties'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="description"> </page:param>
    <page:param name="title"><webwork:text name="'admin.edituserproperties.edit.properties'"/>: <webwork:property value="/user/fullName" /></page:param>

    <p><webwork:text name="'admin.edituserproperties.page.description'">
        <webwork:param name="'value0'"><b><webwork:property value="/user/fullName"/></b></webwork:param>
    </webwork:text></p>
    <p><webwork:text name="'admin.edituserproperties.available.properties.description'"/></p>

    <p>
        <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height=8 width=8 border=0 align=absmiddle>
        <b><a id="view_user" href="<webwork:url page="ViewUser.jspa"><webwork:param name="'name'" value="name"/></webwork:url>"><webwork:text name="'admin.userbrowser.view.user'"/></a></b>
    </p>

</page:applyDecorator>

<p>
<webwork:if test="userProperties != null && userProperties/size > 0">
    <table class="grid" width=70% align=center>
        <tr bgcolor="#f0f0f0">
            <th width="40%">
                <webwork:text name="'common.words.key'"/>
            </th>
            <th width="40%">
                <webwork:text name="'common.words.value'"/>
            </th>
            <th>
                <webwork:text name="'common.words.operations'"/>
            </th>
        </tr>
        <webwork:iterator value="userProperties">
        <tr>
            <td bgcolor="#ffffff"><webwork:property value="key" /></td>
            <td><webwork:property value="value" /> </td>
            <td>
                <a href="<webwork:url page="EditUserProperty.jspa"><webwork:param name="'name'" value="user/name" /><webwork:param name="'key'" value="key" /></webwork:url>">Edit</a> |
                <a href="<webwork:url page="DeleteUserProperty!default.jspa"><webwork:param name="'name'" value="user/name" /><webwork:param name="'key'" value="key"/></webwork:url>" id="delete_<webwork:property value="key"/>">Delete</a>
            </td>
        </tr>
        </webwork:iterator>
    </table>
</webwork:if>
<webwork:else>
    <table class="grid" align="center" width="90%">
        <tr>
            <td>
                <webwork:text name="'admin.edituserproperties.user.has.no.properties'">
                    <webwork:param name="'value0'"><b><webwork:property value="/user/fullName"/></b></webwork:param>
                </webwork:text>
            </td>
        </tr>
    </table>
</webwork:else>
</p>

<p>
<page:applyDecorator name="jiraform">
    <page:param name="action">EditUserProperties!add.jspa</page:param>
    <page:param name="submitId">submit_add</page:param>
    <page:param name="submitName"> <webwork:text name="'common.forms.add'"/> </page:param>
    <page:param name="title"><webwork:text name="'admin.edituserproperties.add.property'"/></page:param>
    <page:param name="description"><webwork:text name="'admin.edituserproperties.example'"/></page:param>
    <page:param name="width">90%</page:param>

    <ui:textfield label="text('common.words.key')" name="'key'" size="20" />

    <ui:textfield label="text('common.words.value')" name="'value'" size="20" />

    <ui:component name="'name'" template="hidden.jsp" theme="'single'" />

</page:applyDecorator>
</p>

</body>
</html>
