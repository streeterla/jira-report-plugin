<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.issuefields.screenschemes.view.screen.schemes'"/></title>
</head>
<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.issuefields.screenschemes.view.screen.schemes'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">fieldscreenschemes</page:param>
    <p>
        <webwork:text name="'admin.issuefields.screenschemes.the.table.below'"/>
    </p>
    <p>
        <webwork:text name="'admin.issuefields.screenschemes.you.can.add'"/>
        <webwork:if test="/enterprise == true">
            <webwork:text name="'admin.issuefields.screenschemes.screens.schemes.are.mapped'">
                <webwork:param name="'value0'"><a href="ViewIssueTypeScreenSchemes.jspa"></webwork:param>
                <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>
        </webwork:if>
        <webwork:else>
            <webwork:text name="'admin.issuefields.screenschemes.to.activate'"/>
        </webwork:else>
    </p>
    <p>
        <webwork:if test="/enterprise == true">
            <webwork:text name="'admin.issuefields.screenschemes.note1'">
                <webwork:param name="'value0'"><span class="note"></webwork:param>
                <webwork:param name="'value1'"></span></webwork:param>
            </webwork:text>
        </webwork:if>
        <webwork:else>
            <webwork:text name="'admin.issuefields.screenschemes.note2'">
                <webwork:param name="'value0'"><span class="note"></webwork:param>
                <webwork:param name="'value1'"></span></webwork:param>
            </webwork:text>
        </webwork:else>
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
            <webwork:if test="/enterprise == true">
                <td class="colHeaderLink" width="25%">
                    <b><webwork:text name="'admin.menu.issuefields.issue.type.screen.schemes'"/></b>
                </td>
            </webwork:if>
            <webwork:else>
                <td class="colHeaderLink" width="25%">
                    <b><webwork:text name="'common.concepts.project'"/></b>
                </td>
            </webwork:else>
            <td class="colHeaderLink" width="15%" align="left">
                <b><webwork:text name="'common.words.operations'"/></b>
            </td>
        </tr>

        <webwork:if test="/fieldScreenSchemes/empty == false">
            <webwork:iterator value="/fieldScreenSchemes" status="'status'">
            <tr class="<webwork:if test="@status/odd == true">rowNormal</webwork:if><webwork:else>rowAlternate</webwork:else>">
                    <td valign=top>
                        <webwork:property value="./name" />
                    </td>
                    <td valign=top>
                        <webwork:property value="./description" />
                    </td>
                    <webwork:if test="/enterprise == true">
                        <td valign=top>
                            <webwork:if test="/issueTypeScreenSchemes(.)/empty == false">
                                <ul class="square_blue">
                                <webwork:iterator value="/issueTypeScreenSchemes(.)">
                                    <li><a id="configure_issuetypescreenscheme" href="ConfigureIssueTypeScreenScheme.jspa?id=<webwork:property value="./id" />"><webwork:property value="./name" /></a></li>
                                </webwork:iterator>
                                </ul>
                            </webwork:if>
                        </td>
                    </webwork:if>
                    <webwork:else>
                        <td valign=top>
                            <webwork:if test="/projects(.)/empty == false">
                                <ul class="square_blue">
                                <webwork:iterator value="/projects(.)">
                                    <li><a id="configure_screenscheme" href="ViewProject.jspa?pid=<webwork:property value="./long('id')" />"><webwork:property value="./string('name')" /></a></li>
                                </webwork:iterator>
                                </ul>
                            </webwork:if>
                        </td>
                    </webwork:else>
                    <td valign=top nowrap align="left">
                        <a id="configure_fieldscreenscheme_<webwork:property value="./name" />" href="ConfigureFieldScreenScheme.jspa?id=<webwork:property value="./id" />" title="<webwork:text name="'admin.issuefields.screenschemes.configure.screens.for'">
                            <webwork:param name="'value0'"><webwork:property value="./name" /></webwork:param>
                        </webwork:text>"><webwork:text name="'admin.common.words.configure'"/></a>
                        | <a id="edit_fieldscreenscheme_<webwork:property value="./name" />" href="EditFieldScreenScheme!default.jspa?id=<webwork:property value="./id" />" title="<webwork:text name="'admin.issuefields.screenschemes.edit.value'">
                            <webwork:param name="'value0'"><webwork:property value="./name" /></webwork:param>
                        </webwork:text>"><webwork:text name="'common.words.edit'"/></a>
                        | <a id="copy_fieldscreenscheme_<webwork:property value="./name" />" href="CopyFieldScreenScheme.jspa?id=<webwork:property value="./id" />" title="<webwork:text name="'admin.issuefields.screenschemes.copy.value'">
                            <webwork:param name="'value0'"><webwork:property value="./name" /></webwork:param>
                        </webwork:text>"><webwork:text name="'common.words.copy'"/></a>
                        <webwork:if test="/issueTypeScreenSchemes(.)/empty == true">
                            | <a id="delete_fieldscreenscheme_<webwork:property value="./name" />" href="DeleteFieldScreenScheme.jspa?id=<webwork:property value="./id" />" title="<webwork:text name="'admin.issuefields.screenschemes.delete.value'">
                                <webwork:param name="'value0'"><webwork:property value="./name" /></webwork:param>
                            </webwork:text>"><webwork:text name="'common.words.delete'"/></a>
                        </webwork:if>
                    </td>
            </tr>
            </webwork:iterator>
        </webwork:if>
        <webwork:else>
            <tr><td colspan="3" bgcolor="#ffffff"><webwork:text name="'admin.issuefields.screenschemes.no.screen.schemes.configured'"/></td></tr>
        </webwork:else>
    </table>
</p>
<p>
<page:applyDecorator name="jiraform">
    <page:param name="action">AddFieldScreenScheme.jspa</page:param>
    <page:param name="submitId">add_submit</page:param>
    <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
    <page:param name="title"><webwork:text name="'admin.issuefields.screenschemes.add.screen.scheme'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="description">
        <webwork:text name="'admin.issuefields.screenschemes.add.instruction'">
            <webwork:param name="'value0'"><b><webwork:text name="'common.forms.add'"/></b></webwork:param>
        </webwork:text>
    </page:param>

    <ui:textfield label="text('common.words.name')" name="'fieldScreenSchemeName'" size="'30'">
        <ui:param name="'mandatory'">true</ui:param>
    </ui:textfield>

    <ui:textfield label="text('common.words.description')" name="'fieldScreenSchemeDescription'" size="'60'" />

    <ui:select label="text('admin.issuefields.screenschemes.default.screen')" name="'fieldScreenId'" list="/fieldScreens" listKey="'./id'" listValue="'./name'">
        <ui:param name="'description'"><webwork:text name="'admin.issuefields.screenschemes.default.screen.description'"/></ui:param>
    </ui:select>
</page:applyDecorator>
</p>
</body>
</html>
