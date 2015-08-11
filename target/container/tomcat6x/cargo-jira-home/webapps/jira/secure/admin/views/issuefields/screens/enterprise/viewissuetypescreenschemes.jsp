<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.issuefields.issuetypescreenschemes.view.issue.type.screen.schemes'"/></title>
</head>
<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.issuefields.issuetypescreenschemes.view.issue.type.screen.schemes'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">issuetype_screenschemes</page:param>
    <p>
        <webwork:text name="'admin.issuefields.issuetypescreenschemes.the.table.below'">
            <webwork:param name="'value0'"><a href="ViewFieldScreenSchemes.jspa"></webwork:param>
            <webwork:param name="'value1'"></a></webwork:param>
            <webwork:param name="'value2'"><a href="ViewFieldScreens.jspa"></webwork:param>
            <webwork:param name="'value3'"></a></webwork:param>
        </webwork:text>
    </p>
    <p>
        <webwork:text name="'admin.issuefields.issuetypescreenschemes.instruction'"/>
    </p>
    <p>
        <webwork:text name="'admin.issuefields.issuetypescreenschemes.note'">
            <webwork:param name="'value0'"><span class="note"></webwork:param>
            <webwork:param name="'value1'"></span></webwork:param>
        </webwork:text>

    </p>
</page:applyDecorator>
<p>
    <table class="gridBox" cellpadding="3" cellspacing="1" width="90%" align="center">
        <tr bgcolor=#f0f0f0>
            <td class="colHeaderLink" width="20%">
                <b><webwork:text name="'common.words.name'"/></b>
            </td>
            <td class="colHeaderLink" width="40%">
                <b><webwork:text name="'common.words.description'"/></b>
            </td>
            <td class="colHeaderLink" width="25%">
                <b><webwork:text name="'common.concepts.projects'"/></b>
            </td>
            <td class="colHeaderLink" width="15%" align="left">
                <b><webwork:text name="'common.words.operations'"/></b>
            </td>
        </tr>

        <webwork:if test="/issueTypeScreenSchemes/empty == false">
            <webwork:iterator value="/issueTypeScreenSchemes" status="'status'">
            <tr class="<webwork:if test="@status/odd == true">rowNormal</webwork:if><webwork:else>rowAlternate</webwork:else>">
                    <td valign=top>
                        <webwork:property value="./name" />
                    </td>
                    <td valign=top>
                        <webwork:property value="./description" />
                    </td>
                    <td valign=top>
                        <webwork:if test="/projects(.)/empty == false">
                            <ul class="square_blue">
                            <webwork:iterator value="/projects(.)">
                                <li><a id="view_project" href="ViewProject.jspa?pid=<webwork:property value="./long('id')" />"><webwork:property value="./string('name')" /></a></li>
                            </webwork:iterator>
                            </ul>
                        </webwork:if>
                    </td>
                    <td valign=top nowrap align="left">
                        <a id="configure_issuetypescreenscheme_<webwork:property value="./name" />" href="ConfigureIssueTypeScreenScheme.jspa?id=<webwork:property value="./id" />" title="<webwork:text name="'admin.issuefields.issuetypescreenschemes.configure.the.scheme'">
                            <webwork:param name="'value0'"><webwork:property value="./name" /></webwork:param>
                        </webwork:text>"><webwork:text name="'admin.common.words.configure'"/></a>
                        | <a id="edit_issuetypescreenscheme_<webwork:property value="./name" />" href="EditIssueTypeScreenScheme!default.jspa?id=<webwork:property value="./id" />" title="<webwork:text name="'admin.issuefields.issuetypescreenschemes.edit'">
                            <webwork:param name="'value0'"><webwork:property value="./name" /></webwork:param>
                        </webwork:text>"><webwork:text name="'common.words.edit'"/></a>
                        | <a id="copy_issuetypescreenscheme_<webwork:property value="./name" />" href="CopyIssueTypeScreenScheme.jspa?id=<webwork:property value="./id" />" title="<webwork:text name="'admin.issuefields.issuetypescreenschemes.copy.entry'">
                            <webwork:param name="'value0'"><webwork:property value="./name" /></webwork:param>
                        </webwork:text>"><webwork:text name="'common.words.copy'"/></a>
                        <webwork:if test="/projects(.)/empty == true && ./default == false">
                            | <a id="delete_issuetypescreenscheme_<webwork:property value="./name" />" href="DeleteIssueTypeScreenScheme.jspa?id=<webwork:property value="./id" />" title="<webwork:text name="'admin.issuefields.issuetypescreenschemes.delete.entry'">
                                <webwork:param name="'value0'"><webwork:property value="./name" /></webwork:param>
                            </webwork:text>"><webwork:text name="'common.words.delete'"/></a>
                        </webwork:if>
                    </td>
            </tr>
            </webwork:iterator>
        </webwork:if>
        <webwork:else>
            <tr><td colspan="3" bgcolor="#ffffff"><webwork:text name="'admin.issuefields.issuetypescreenschemes.no.screen.schemes.configured'"/></td></tr>
        </webwork:else>
    </table>
</p>
<p>
<page:applyDecorator name="jiraform">
    <page:param name="action">AddIssueTypeScreenScheme.jspa</page:param>
    <page:param name="submitId">add_submit</page:param>
    <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
    <page:param name="title"><webwork:text name="'admin.issuefields.issuetypescreenschemes.add'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">issuetype_screenschemes</page:param>
    <page:param name="description">
        <webwork:text name="'admin.issuefields.issuetypescreenschemes.add.instruction'">
            <webwork:param name="'value0'"><b><webwork:text name="'common.forms.add'"/></b></webwork:param>
        </webwork:text>
    </page:param>

    <ui:textfield label="text('common.words.name')" name="'schemeName'" size="'30'">
        <ui:param name="'mandatory'">true</ui:param>
    </ui:textfield>

    <ui:textfield label="text('common.words.description')" name="'schemeDescription'" size="'60'" />

    <ui:select label="text('admin.projects.screen.scheme')" name="'fieldScreenSchemeId'" list="/fieldScreenSchemes" listKey="'./id'" listValue="'./name'">
        <ui:param name="'mandatory'">true</ui:param>
        <ui:param name="'description'"><webwork:text name="'admin.issuefields.issuetypescreenschemes.screen.scheme.description'"/></ui:param>
    </ui:select>
</page:applyDecorator>
</p>
</body>
</html>
