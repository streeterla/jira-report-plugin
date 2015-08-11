<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.schemes.issuesecurity.add.user.group.to.issue.security.level'"/></title>
</head>

<body>
<page:applyDecorator name="jiraform">
    <page:param name="action">AddIssueSecurity.jspa</page:param>
    <page:param name="columns">1</page:param>
    <page:param name="submitId">add_submit</page:param>
    <page:param name="submitName"> <webwork:text name="'common.forms.add'"/> </page:param>
    <page:param name="cancelURI"><webwork:url page="EditIssueSecurities!default.jspa"><webwork:param name="'schemeId'" value="schemeId"/></webwork:url></page:param>
    <page:param name="title"><webwork:text name="'admin.schemes.issuesecurity.add.user.group.to.issue.security.level'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="description">
    <p>
        <webwork:property value="securityLevel(security)/string('name')">
            <webwork:text name="'admin.schemes.issuesecurity.issue.security.scheme'"/>: <b> <webwork:property value="scheme/string('name')"/>  </b> <br>
            <webwork:text name="'admin.schemes.issuesecurity.issue.security.level'"/>: <b> <webwork:property value="."/> </b>
            <p>
            <webwork:text name="'admin.schemes.issuesecurity.add.instruction'"/>
            </p>
            <webwork:text name="'admin.schemes.issuesecurity.add.description'"/>:
            <ul>
                <li><webwork:text name="'admin.schemes.issuesecurity.add.description.dotpoint1'"/></li>
                <li><webwork:text name="'admin.schemes.issuesecurity.add.description.dotpoint2'"><webwork:param name="'value0'"><b><webwork:property value="."/></b></webwork:param></webwork:text></li>
            </ul>
        </webwork:property>
    </page:param>

    <tr>
        <td bgcolor="#ffffff">
            <table class="grid" width="100%" align="center">
                <webwork:iterator value="types/keySet" status="'status'">
                <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">

                    <td width="5%" align="center"><input type="radio" name="type" value="<webwork:property value="."/>" id="<webwork:property value="."/>_id" <webwork:if test="type==.">checked</webwork:if>></td>
                    <td width="25%" align="left"><label for="<webwork:property value="."/>_id"><webwork:property value="types/(.)/displayName"/></label></td>
                    <webwork:if test="types/(.)/type == 'email'">
                        <td><input type="text" name="<webwork:property value="."/>" value="<webwork:property value="../parameter(.)"/>"></td>
                    </webwork:if>
                    <webwork:elseIf test="types/(.)/type == 'user'">
                        <td>
                            <ui:component label="''" name="." template="userselect.jsp" theme="'raw'">
                                <ui:param name="'formname'" value="'jiraform'" />
                                <ui:param name="'imageName'" value="'userImage'"/>
                                <ui:param name="'onchange'">document.forms['jiraform'].type[<webwork:property value="@status/index"/>].checked = true;</ui:param>
                            </ui:component>
                        </td>
<%--                        <td><input type="text" name="<webwork:property value="."/>" value="<webwork:property value="../parameter(.)"/>"></td>--%>
                    </webwork:elseIf>
                    <webwork:elseIf test="types/(.)/type == 'group'">
                        <td>
                        <select name="<webwork:property value="."/>" onClick="document.forms['jiraform'].type[<webwork:property value="@status/index"/>].checked = true;">
                            <option value=""><webwork:text name="'admin.common.words.anyone'"/></option>
                            <webwork:iterator value="types/(.)/groups" >
                                <option value="<webwork:property value="name"/>" <webwork:if test="../../parameter(..) == name" >selected</webwork:if>><webwork:property value="name"/></option>
                            </webwork:iterator>
                        </select>
                        </td>
                    </webwork:elseIf>
                    <webwork:elseIf test="types/(.)/type == 'projectrole'">
                        <td>
                        <select name="<webwork:property value="."/>" onClick="document.forms['jiraform'].type[<webwork:property value="@status/index"/>].checked = true;">
                            <option value=""><webwork:text name="'admin.notifications.choose.a.projectrole'"/></option>
                            <webwork:iterator value="types/(.)/projectRoles" >
                                <option value="<webwork:property value="id"/>" <webwork:if test="../../parameter(..) == name" >selected</webwork:if>><webwork:property value="name"/></option>
                            </webwork:iterator>
                        </select>
                        </td>
                    </webwork:elseIf>
                    <webwork:elseIf test="types/(.)/type == 'userCF'">
                        <td>
                        <select name="<webwork:property value="."/>" onClick="document.forms['jiraform'].type[<webwork:property value="@status/index"/>].checked = true;">
                            <option value=""><webwork:text name="'admin.schemes.issuesecurity.choose.a.custom.field'"/></option>
                            <webwork:iterator value="types/(.)/displayFields" >
                                <option value="<webwork:property value="id"/>" <webwork:if test="../../parameter(..) == id" >selected</webwork:if>><webwork:property value="name"/></option>
                            </webwork:iterator>
                        </select>
                        </td>
                    </webwork:elseIf>
                    <webwork:elseIf test="types/(.)/type == 'groupCF'">
                        <td>
                        <select name="<webwork:property value="."/>" onClick="document.forms['jiraform'].type[<webwork:property value="@status/index"/>].checked = true;">
                            <option value=""><webwork:text name="'admin.notifications.choose.a.custom.field'"/></option>
                            <webwork:iterator value="types/(.)/displayFields" >
                                <option value="<webwork:property value="id"/>" <webwork:if test="../../parameter(..) == id" >selected</webwork:if>><webwork:property value="name"/></option>
                            </webwork:iterator>
                        </select>
                        </td>
                    </webwork:elseIf>
                    <webwork:else><td>&nbsp;</td></webwork:else>
                </tr>
                </webwork:iterator>
                <ui:component name="'schemeId'" template="hidden.jsp"/>
                <ui:component name="'security'" template="hidden.jsp"/>
            </table>
        </td>
    </tr>

</page:applyDecorator>
</body>
</html>
