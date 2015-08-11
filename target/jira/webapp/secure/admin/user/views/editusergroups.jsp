<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><webwork:text name="'admin.editusergroups.edit.user.groups'"/></title>
</head>
<body>
<page:applyDecorator name="jiraform">
    <page:param name="action">EditUserGroups.jspa</page:param>
    <page:param name="title"><webwork:text name="'admin.editusergroups.edit.user.groups'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="description">
        <webwork:text name="'admin.editusergroups.page.description'"/>
    </page:param>
    <tr>
        <td bgcolor=#ffffff colspan=2 align=center>
            <b><a id="return_link" href="<webwork:url page="ViewUser.jspa"><webwork:param name="'name'" value="name"/></webwork:url>">&lt;&lt;
                <webwork:text name="'admin.editusergroups.return.to.viewing.user'">
                    <webwork:param name="'value0'">'<webwork:property value="user/fullName"/>'</webwork:param>
                </webwork:text></a></b>
        </td>
    </tr>
    <tr>
        <td bgcolor=#fffff0 align=center>
            <b><webwork:text name="'admin.editusergroups.available.groups'"/></b>
        </td>

        <td bgcolor=#fffff0 align=center>
            <b><webwork:text name="'common.words.groups'"/></b>
        </td>
    </tr>
    <tr>
        <td bgcolor=#ffffff align=center valign=top>
            <webwork:if test="/nonMemberGroups != null && /nonMemberGroups/size > 0">
                <input name="join" type="submit" value="<webwork:text name="'admin.editusergroups.join'"/> &gt;&gt;"><br>
                <select name="groupsToJoin" multiple size="<webwork:property value="/nonMemberGroups/size" />">
                    <webwork:iterator value="/nonMemberGroups">
                        <option value="<webwork:property value="." />"><webwork:property value="."/></option>
                    </webwork:iterator>
                </select>
            </webwork:if>
            <webwork:else>
                <webwork:text name="'admin.editusergroups.user.is.a.member.of.all'"/>
            </webwork:else>
        </td>
        <td bgcolor=#ffffff align=center valign=top>
            <webwork:if test="memberGroups != null && memberGroups/size > 0">
                <input name="leave" type="submit" value="&lt;&lt; <webwork:text name="'admin.editusergroups.leave'"/>"><br>
                <select name="groupsToLeave" multiple size="<webwork:property value="memberGroups/size" />">
                    <webwork:iterator value="memberGroups">
                        <option value="<webwork:property value="." />"><webwork:property value="."/></option>
                    </webwork:iterator>
                </select>
            </webwork:if>
            <webwork:else>
                <webwork:text name="'admin.editusergroups.user.is.a.member.of.no.groups'"/>
            </webwork:else>
        </td>
    </tr>

    <ui:component name="'name'" template="hidden.jsp" theme="'single'"/>
</page:applyDecorator>
</body>
</html>
