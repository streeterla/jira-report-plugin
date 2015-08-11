<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.schemes.issuesecurity.edit.issue.security.levels'"/></title>
</head>

<body>
    <page:applyDecorator name="jirapanel">
        <page:param name="title"><webwork:text name="'admin.schemes.issuesecurity.edit.issue.security.levels'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="helpURL">security_levels</page:param>
        <p>
        <webwork:text name="'admin.schemes.issuesecurity.on.this.page'">
            <webwork:param name="'value0'"><webwork:property value="scheme/string('name')"/></webwork:param>
        </webwork:text>
        </p>
        <webwork:text name="'admin.schemes.issuesecurity.each.security.level'"/>
        <p>
        <webwork:text name="'admin.schemes.issuesecurity.issue.can.be.assigned.security.level'"/>
        </p>
        <p>
        <webwork:text name="'admin.schemes.issuesecurity.be.sure.to.set.issue.security'"/>
        </p>
        <p>
        <ul class="square">
            <li><webwork:text name="'admin.schemes.issuesecurity.view.all.issue.security.schemes'">
                <webwork:param name="'value0'"><b><a href="ViewIssueSecuritySchemes.jspa"></webwork:param>
                <webwork:param name="'value1'"></a></b></webwork:param>
            </webwork:text></li>
            <webwork:if test="/scheme/long('defaultlevel') != null">
                <li><a href="<webwork:url page="EditIssueSecurities!makeDefaultLevel.jspa"><webwork:param name="'schemeId'" value="scheme/long('id')"/><webwork:param name="'levelId'" value="'-1'"/></webwork:url>"><webwork:text name="'admin.schemes.issuesecurity.change.default.security.to.none'"/></a></li>
            </webwork:if>
        </ul>
        </p>
    </page:applyDecorator>

    <p>

        <table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="90%"><tr><td>
        <table border="0" cellpadding="3" cellspacing="1" width="100%">
            <tr bgcolor="#f0f0f0">
                <td class="colHeaderLink">
                    <b><webwork:text name="'admin.schemes.issuesecurity.security.level'"/></b>
                </td>
                <td class="colHeaderLink">
                    <b><webwork:text name="'admin.common.words.users.groups.roles'"/></b>
                </td>
                <td class="colHeaderLink" width="10%">
                    <b><webwork:text name="'common.words.operations'"/></b>
                </td>
            </tr>

            <webwork:iterator value="schemeIssueSecurities/keySet" status="'status'">
            <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
                <td valign="top"><b><webwork:property value="schemeIssueSecurities/(.)"/></b><webwork:if test="../default(.) == true"> (<webwork:text name="'admin.common.words.default'"/>)</webwork:if>
                <br>
                <font size="1"><webwork:property value="issueSecurityDescription(.)" /></font>
                </td>
                <td valign="top">
                <webwork:iterator value="securities(.)">
                    <img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height="8" width="8" border="0" align="absmiddle">
                    <webwork:property value="../../type(string('type'))/displayName" />
                    <webwork:if test="string('parameter')!= null">
                        (<webwork:property value="../../type(string('type'))/argumentDisplay(string('parameter'))" />)
                    </webwork:if>
                    <webwork:elseIf test="string('type') == 'reporter' || string('type') == 'lead' || string('type') == 'assignee'">
                    </webwork:elseIf>
                    <webwork:else>
                        (<webwork:text name="'admin.common.words.anyone'"/>)
                    </webwork:else>
                    <font size="1">
                       (<a id="delGroup_<webwork:property value="string('parameter')"/>_<webwork:property value="schemeIssueSecurities/(..)"/>" href="<webwork:url page="DeleteIssueSecurity!default.jspa"><webwork:param name="'id'" value="long('id')"/><webwork:param name="'schemeId'" value="schemeId"/></webwork:url>"title="<webwork:text name="'admin.schemes.issuesecurity.delete.this.user.group'"/>"><webwork:text name="'common.words.delete'"/></a>)
                    </font>
                    <br>
                </webwork:iterator>
                </td>
                <td nowrap valign="top">
                    <a id="add_<webwork:property value="schemeIssueSecurities/(.)"/>" href="<webwork:url page="AddIssueSecurity!default.jspa"><webwork:param name="'schemeId'" value="../schemeId"/><webwork:param name="'security'" value="."/></webwork:url>"title="<webwork:text name="'admin.schemes.issuesecurity.add.a.user.group'"/>"><webwork:text name="'common.forms.add'"/></a>
                    <webwork:if test="../default(.) != true">
                    |
                    <a id="default_<webwork:property value="schemeIssueSecurities/(.)"/>" href="<webwork:url page="EditIssueSecurities!makeDefaultLevel.jspa"><webwork:param name="'schemeId'" value="../schemeId"/><webwork:param name="'levelId'" value="."/></webwork:url>"title="<webwork:text name="'admin.schemes.issuesecurity.make.default'"/>"><webwork:text name="'admin.common.words.default'"/></a>
                    </webwork:if>
                    |
                     <a id="delLevel_<webwork:property value="schemeIssueSecurities/(.)"/>" href="<webwork:url page="DeleteIssueSecurityLevel!default.jspa">
                    <webwork:param name="'levelId'" value="."/><webwork:param name="'schemeId'" value="scheme/long('id')"/></webwork:url>"title="<webwork:text name="'admin.schemes.issuesecurity.delete.security.level'"/>"><webwork:text name="'common.words.delete'"/></a>
                </td>


            </tr>
            </webwork:iterator>
        </table>
        </td></tr></table>

    <p><br><br>
    <page:applyDecorator name="jiraform">
        <page:param name="action">EditIssueSecurities!addLevel.jspa</page:param>
        <page:param name="submitId">level_submit</page:param>
        <page:param name="submitName"><webwork:text name="'admin.schemes.issuesecurity.add.security.level'"/></page:param>
        <page:param name="title"><webwork:text name="'admin.schemes.issuesecurity.add.security.level'"/></page:param>
        <page:param name="width">90%</page:param>
        <page:param name="description"><webwork:text name="'admin.schemes.issuesecurity.add.security.level.instruction'"/></page:param>
        <page:param name="helpURL">security_levels</page:param>
        <page:param name="helpURLFragment">#Creating+a+Security+Level</page:param>
        <ui:textfield label="text('common.words.name')" name="'name'" size="'30'"/>
        <ui:textfield label="text('common.words.description')" name="'description'" size="'60'"/>
        <ui:component name="'schemeId'" template="hidden.jsp"/>
    </page:applyDecorator>
    </p>
    </body>
</html>
