<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.notifications.add.notification'"/></title>
</head>

<body>
<page:applyDecorator name="jiraform">
    <page:param name="action">AddNotification.jspa</page:param>
    <page:param name="submitId">add_submit</page:param>
    <page:param name="submitName"> <webwork:text name="'common.forms.add'"/> </page:param>
    <page:param name="cancelURI"><webwork:url page="EditNotifications!default.jspa"><webwork:param name="'schemeId'" value="schemeId"/></webwork:url></page:param>
    <page:param name="title"><webwork:text name="'admin.notifications.add.notification'"/></page:param>
    <page:param name="helpURL">notification_schemes</page:param>
    <page:param name="width">100%</page:param>
    <page:param name="columns">1</page:param>
    <page:param name="instructions">
    <webwork:text name="'admin.projects.notification.scheme'"/>: <strong> <webwork:property value="scheme/string('name')"/>  </strong>
    <p><webwork:text name="'admin.notifications.instruction'"/></p>
    </page:param>

    <tr>
        <td>
        <div class="container padded">
           <table class="leftColumn grid">
                <ui:select label="text('admin.notifications.events')" name="'eventTypeIds'" template="selectmultiple.jsp"
                    list="events" listKey="'key'" listValue="'value/translatedName(/remoteUser)'" size="7" >
                    <ui:param name="'description'">
                        <webwork:text name="'admin.notifications.events.description'"/>
                    </ui:param>
                </ui:select>
            </table>

            <table class="rightColumn grid">
                <webwork:iterator value="types/keySet" status="'itStatus'">
                <tr bgcolor="#<webwork:if test="@itStatus/odd == true">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">

                    <td width="5%" align=center><input type="radio" name="type" id="label_<webwork:property/>" value="<webwork:property value="."/>" <webwork:if test="type==.">checked</webwork:if>></td>
                    <td width="25%" align="left"><label for="label_<webwork:property/>"><webwork:property value="types/(.)/displayName"/></label></td>
                    <webwork:if test="types/(.)/type == 'email'">
                        <td>
                            <input type="text" name="<webwork:property value="."/>" value="<webwork:property value="../parameter(.)"/>" onkeydown="document.forms['jiraform'].type[<webwork:property value="@itStatus/index"/>].checked = true;" />
                            <div class="fieldDescription"><webwork:text name="'admin.notifications.only.public.issues'">
                                <webwork:param name="'value0'"><strong></webwork:param>
                                <webwork:param name="'value1'"></strong></webwork:param>
                            </webwork:text></div>
                        </td>
                    </webwork:if>
                    <webwork:elseIf test="types/(.)/type == 'user'">
                        <td>
                            <ui:component label="''" name="." template="userselect.jsp" theme="'raw'">
                                <ui:param name="'formname'" value="'jiraform'" />
                                <ui:param name="'imageName'" value="'userImage'"/>
                                <ui:param name="'onchange'">document.forms['jiraform'].type[<webwork:property value="@itStatus/index"/>].checked = true;</ui:param>
                            </ui:component>
                        </td>
                    </webwork:elseIf>
                    <webwork:elseIf test="types/(.)/type == 'group'">
                        <td>
                        <select name="<webwork:property value="."/>" onClick="document.forms['jiraform'].type[<webwork:property value="@itStatus/index"/>].checked = true;">
                            <option value=""><webwork:text name="'admin.notifications.choose.a.group'"/></option>
                            <webwork:iterator value="types/(.)/groups" >
                                <option value="<webwork:property value="name"/>" <webwork:if test="../../parameter(..) == name" >selected</webwork:if>><webwork:property value="name"/></option>
                            </webwork:iterator>
                        </select>
                        </td>
                    </webwork:elseIf>
                    <webwork:elseIf test="types/(.)/type == 'projectrole'">
                        <td>
                        <select name="<webwork:property value="."/>" onClick="document.forms['jiraform'].type[<webwork:property value="@itStatus/index"/>].checked = true;">
                            <option value=""><webwork:text name="'admin.notifications.choose.a.projectrole'"/></option>
                            <webwork:iterator value="types/(.)/projectRoles" >
                                <option value="<webwork:property value="id"/>" <webwork:if test="../../parameter(..) == name" >selected</webwork:if>><webwork:property value="name"/></option>
                            </webwork:iterator>
                        </select>
                        </td>
                    </webwork:elseIf>
                    <webwork:elseIf test="types/(.)/type == 'userCF'">
                        <td>
                        <select name="<webwork:property value="."/>" onClick="document.forms['jiraform'].type[<webwork:property value="@itStatus/index"/>].checked = true;">
                            <option value=""><webwork:text name="'admin.notifications.choose.a.custom.field'"/></option>
                            <webwork:iterator value="types/(.)/fields" >
                                <option value="<webwork:property value="id"/>" <webwork:if test="../../parameter(..) == id" >selected</webwork:if>><webwork:property value="name"/></option>
                            </webwork:iterator>
                        </select>
                        </td>
                    </webwork:elseIf>
                    <webwork:elseIf test="types/(.)/type == 'groupCF'">
                        <td>
                        <select name="<webwork:property value="."/>" onClick="document.forms['jiraform'].type[<webwork:property value="@itStatus/index"/>].checked = true;">
                            <option value=""><webwork:text name="'admin.notifications.choose.a.custom.field'"/></option>
                            <webwork:iterator value="types/(.)/fields" >
                                <option value="<webwork:property value="id"/>" <webwork:if test="../../parameter(..) == id" >selected</webwork:if>><webwork:property value="name"/></option>
                            </webwork:iterator>
                        </select>
                        </td>
                    </webwork:elseIf>
                    <webwork:else><td>&nbsp;</td></webwork:else>
                </tr>
                </webwork:iterator>
                <ui:component name="'schemeId'" template="hidden.jsp"/>
                <ui:component name="'event'" template="hidden.jsp"/>
            </table>
            </div>
        </td>
    </tr>

</page:applyDecorator>


</body>
</html>
