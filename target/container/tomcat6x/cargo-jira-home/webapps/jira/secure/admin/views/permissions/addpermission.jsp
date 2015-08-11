<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.permissions.add.title'"/></title>
</head>

<body>
<style>
<!--
    .grid
    {
        margin: 10px 0px;
    }
-->
</style>
<page:applyDecorator name="jiraform">
    <page:param name="action">AddPermission.jspa</page:param>
    <page:param name="submitId">add_submit</page:param>
    <page:param name="submitName"> <webwork:text name="'common.forms.add'"/> </page:param>
    <page:param name="cancelURI"><webwork:url page="EditPermissions!default.jspa"><webwork:param name="'schemeId'" value="schemeId"/></webwork:url></page:param>
    <page:param name="title"><webwork:text name="'admin.permissions.add.title'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="columns">1</page:param>
    <page:param name="helpURL">permissionsHelp</page:param>
    <page:param name="helpURLFragment">#adding_to_permission</page:param>
    <page:param name="instructions">
    <webwork:text name="'admin.projects.permission.scheme'"/>: <strong> <webwork:property value="scheme/string('name')"/>  </strong>
    <p><webwork:text name="'admin.permissions.add.longdesc'"/></p>
    </page:param>

    <tr>
        <td>
            <div class="container padded">
                <table class="rightColumn grid">
                <%-- todo - this iterator status gets buggered up on Resin.  Not sure why --%>
                <webwork:iterator value="types/keySet" status="'itStatus'">
                <%-- rows with different types of permissions (eg group / single user) --%>
                    <tr <webwork:if test="@itStatus/even != true">class="rowAlternate"</webwork:if> >
                        <%-- radio button cell --%>
                        <td width="5%" align=center><input type="radio" name="type" value="<webwork:property value="."/>" id="type_<webwork:property />" <webwork:if test="type==.">checked</webwork:if>></td>
                        <%-- Description cell --%>
                        <td width="25%" align="left"><label for="type_<webwork:property />"><webwork:property value="types/(.)/displayName"/></label></td>
                        <%-- For types that need a select value (eg which group), display the custom values --%>
                        <td>
                            <%-- For users, show the user picker --%>
                            <webwork:if test="types/(.)/type == 'user'">
                                <ui:component label="''" name="." template="userselect.jsp" theme="'common'">
                                    <ui:param name="'formname'" value="'jiraform'" />
                                    <ui:param name="'imageName'" value="'userImage'"/>
                                    <ui:param name="'onchange'">document.forms['jiraform'].type[<webwork:property value="@itStatus/index"/>].checked = true;</ui:param>
                                </ui:component>
                            </webwork:if>
                            <%-- For groups, show a dropdown with a list of groups --%>
                            <webwork:elseIf test="types/(.)/type == 'group'">
                                <!-- Only set the 'onChange' if there is more than one option available -->
                                <select name="<webwork:property value="."/>" <webwork:if test="types/size > 1">onClick="document.forms['jiraform'].type[<webwork:property value="@itStatus/index"/>].checked = true;"</webwork:if>>
                                    <option value=""><webwork:text name="'admin.common.words.anyone'"/></option>
                                    <webwork:iterator value="types/(.)/groups" status="'a'">
                                        <option value="<webwork:property value="name"/>" <webwork:if test="../../parameter(..) == name" >selected</webwork:if>><webwork:property value="name"/></option>
                                    </webwork:iterator>
                                </select>
                            </webwork:elseIf>
                            <webwork:elseIf test="types/(.)/type == 'projectrole'">
                                <select name="<webwork:property value="."/>" onClick="document.forms['jiraform'].type[<webwork:property value="@itStatus/index"/>].checked = true;">
                                    <option value=""><webwork:text name="'admin.notifications.choose.a.projectrole'"/></option>
                                    <webwork:iterator value="types/(.)/projectRoles" >
                                        <option value="<webwork:property value="id"/>" <webwork:if test="../../parameter(..) == name" >selected</webwork:if>><webwork:property value="name"/></option>
                                    </webwork:iterator>
                                </select>
                            </webwork:elseIf>
                            <webwork:elseIf test="types/(.)/type == 'userCF'">
                                <select name="<webwork:property value="."/>" <webwork:if test="types/size > 1">onClick="document.forms['jiraform'].type[<webwork:property value="@itStatus/index"/>].checked = true;"</webwork:if>>
                                    <option value=""><webwork:text name="'admin.notifications.choose.a.custom.field'"/></option>
                                    <webwork:iterator value="types/(.)/displayFields" >
                                        <option value="<webwork:property value="id"/>" <webwork:if test="../../parameter(..) == id" >selected</webwork:if>><webwork:property value="name"/></option>
                                    </webwork:iterator>
                                </select>
                            </webwork:elseIf>
                            <webwork:elseIf test="types/(.)/type == 'groupCF'">
                                <select name="<webwork:property value="."/>" <webwork:if test="types/size > 1">onClick="document.forms['jiraform'].type[<webwork:property value="@itStatus/index"/>].checked = true;"</webwork:if>>
                                    <option value=""><webwork:text name="'admin.notifications.choose.a.custom.field'"/></option>
                                    <webwork:iterator value="types/(.)/displayFields" >
                                        <option value="<webwork:property value="id"/>" <webwork:if test="../../parameter(..) == id" >selected</webwork:if>><webwork:property value="name"/></option>
                                    </webwork:iterator>
                                </select>
                            </webwork:elseIf>
                            <%-- Other inputs do not require a text box --%>
                            <webwork:else>&nbsp;</webwork:else>
                        </td>
                    </tr>
                </webwork:iterator>

            <ui:component name="'schemeId'" template="hidden.jsp"/>
            <ui:component name="'permission'" template="hidden.jsp"/>
            </table>
            <table class="leftColumn grid">
                <ui:select label="text('admin.common.words.permissions')" name="'permissions'" template="selectmultiple.jsp"
                    list="allPermissions" listKey="'key'" listValue="'text(value/nameKey)'" size="7" >
                    <ui:param name="'description'">
                        (<webwork:text name="'admin.permissions.add.short.instruction'"/>).
                    </ui:param>
                </ui:select>
            </table>
            </div>

</page:applyDecorator>


</body>
</html>
