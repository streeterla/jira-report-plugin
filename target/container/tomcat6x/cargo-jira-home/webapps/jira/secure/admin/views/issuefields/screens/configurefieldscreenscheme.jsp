<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.issuefields.screenschemes.configure.screen.scheme'"/></title>
</head>
<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.issuefields.screenschemes.configure.screen.scheme'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">fieldscreenschemes</page:param>
    <webwork:if test="/fieldScreensAllowed == true">
    <p>
        <webwork:text name="'admin.issuefields.screenschemes.configure.page.description'">
            <webwork:param name="'value0'"><b><webwork:property value="/fieldScreenScheme/name" /></b></webwork:param>
        </webwork:text>
    </p>
    </webwork:if>
    <p>
        <webwork:text name="'admin.issuefields.screenschemes.configure.instruction'"/>
    </p>
    <p>
    <webwork:if test="/enterprise == true">
        <webwork:text name="'admin.issuefields.screenschemes.configure.instruction2'">
            <webwork:param name="'value0'"><a href="ViewIssueTypeScreenSchemes.jspa"><webwork:text name="'admin.projects.issue.type.screen.scheme'"/></a></webwork:param>
        </webwork:text>
    </webwork:if>
    <webwork:elseIf test="/professional == true">
        <webwork:text name="'admin.issuefields.screenschemes.to.activate2'"/>
    </webwork:elseIf>
    </p>
    <p>
        <webwork:text name="'admin.issuefields.screenschemes.note2'">
            <webwork:param name="'value0'"><span class="warning"></webwork:param>
            <webwork:param name="'value1'"></span></webwork:param>
            <webwork:param name="'value2'"><i></webwork:param>
            <webwork:param name="'value3'"></i></webwork:param>
            <webwork:param name="'value4'"><b></webwork:param>
            <webwork:param name="'value5'"></b></webwork:param>
            <webwork:param name="'value6'"><a href="ViewCustomFields.jspa"></webwork:param>
            <webwork:param name="'value7'"></a></webwork:param>
        </webwork:text>
    </p>
    <webwork:if test="/fieldScreensAllowed == true">
    <ul class="square">
        <li><webwork:text name="'admin.issuefields.screenschemes.view.all'">
            <webwork:param name="'value0'"><b><a id="view_fieldscreenschemes" href="ViewFieldScreenSchemes.jspa"></webwork:param>
            <webwork:param name="'value1'"></a></b></webwork:param>
        </webwork:text></li>
    </ul>
    </webwork:if>
</page:applyDecorator>
<p>
    <table class="gridBox" cellpadding="3" cellspacing="1" width="90%" align="center">
        <tr bgcolor=#f0f0f0>
            <td class="colHeaderLink" width="20%">
                <b><webwork:text name="'admin.issuefields.screenschemes.issue.operation'"/></b>
            </td>
            <td class="colHeaderLink" width="65%">
                <b><webwork:text name="'admin.common.words.screen'"/></b>
            </td>
            <td class="colHeaderLink" width="15%" align="left">
                <b><webwork:text name="'common.words.operations'"/></b>
            </td>
        </tr>

        <webwork:property value="/fieldScreenScheme">
            <webwork:if test="./fieldScreenSchemeItems/empty == false">
                <webwork:iterator value="./fieldScreenSchemeItems" status="'status'">
                <tr class="<webwork:if test="@status/odd == true">rowNormal</webwork:if><webwork:else>rowAlternate</webwork:else>">
                        <td valign=top>
                            <webwork:if test="./issueOperation == null"><i><webwork:property value="/text(./issueOperationName)" /></i><br><span class="small"><webwork:text name="'admin.issuefields.screenschemes.used.for.unmapped'"/></class></webwork:if>
                            <webwork:else><webwork:property value="/text(./issueOperationName)" /></webwork:else>
                        </td>
                        <td valign=top>
                            <a id="configure_fieldscreen" href="ConfigureFieldScreen.jspa?id=<webwork:property value="./fieldScreen/id" />"><webwork:property value="./fieldScreen/name" /></a>
                        </td>
                        <td valign=top nowrap align="left">
                            <a id="edit_fieldscreenscheme_<webwork:property value="text(./issueOperationName)"/>" href="EditFieldScreenSchemeItem!default.jspa?id=<webwork:property value="/id" /><webwork:if test="./issueOperation">&issueOperationId=<webwork:property value="./issueOperation/id" /></webwork:if>" title="<webwork:text name="'admin.issuefields.screenschemes.edit.value'">
                                <webwork:param name="'value0'"><webwork:property value="./name" /></webwork:param>
                            </webwork:text>"><webwork:text name="'common.words.edit'"/></a>
                            <%-- Only allow to delete non-default scheme entities --%>
                            <webwork:if test="./issueOperation">
                            | <a id="delete_fieldscreenscheme_<webwork:property value="text(./issueOperationName)"/>" href="DeleteFieldScreenSchemeItem.jspa?id=<webwork:property value="/id" /><webwork:if test="./issueOperation">&issueOperationId=<webwork:property value="./issueOperation/id" /></webwork:if>" title="<webwork:text name="'admin.issuefields.screenschemes.delete.value'">
                                <webwork:param name="'value0'"><webwork:property value="./name" /></webwork:param>
                            </webwork:text>"><webwork:text name="'common.words.delete'"/></a>
                            </webwork:if>
                        </td>
                </tr>
                </webwork:iterator>
            </webwork:if>
            <webwork:else>
                <tr><td colspan="3" bgcolor="#ffffff"><webwork:text name="'admin.issuefields.screenschemes.no.issue.operation'"/></td></tr>
            </webwork:else>
        </webwork:property>
    </table>
</p>
<p>
<webwork:if test="/addableIssueOperations/empty == false && /fieldScreens/empty == false">
    <page:applyDecorator name="jiraform">
        <page:param name="action">AddFieldScreenSchemeItem.jspa</page:param>
        <page:param name="submitId">add_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
        <page:param name="title"><webwork:text name="'admin.issuefields.screenschemes.add.issue.operation'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="description">
            <webwork:text name="'admin.issuefields.screenschemes.association.instruction'">
                <webwork:param name="'value0'"><b><webwork:text name="'common.forms.add'"/></b></webwork:param>
            </webwork:text>
        </page:param>

        <ui:select label="text('admin.issuefields.screenschemes.issue.operation')" name="'issueOperationId'" list="/addableIssueOperations" listKey="'/issueOperaionId(.)'" listValue="'/text(./nameKey)'" />

        <ui:select label="text('admin.common.words.screen')" name="'fieldScreenId'" list="/fieldScreens" listKey="'./id'" listValue="'./name'">
            <ui:param name="'description'"><webwork:text name="'admin.issuefields.screenschemes.add.description'"/></ui:param>
        </ui:select>

        <ui:component name="'id'" template="hidden.jsp" theme="'single'"/>
    </page:applyDecorator>
</webwork:if>
<webwork:else>
    <page:applyDecorator name="jirapanel">
        <page:param name="title"><webwork:text name="'admin.issuefields.screenschemes.add.issue.operation'"/></page:param>
        <page:param name="width">100%</page:param>
        <webwork:if test="/addableIssueOperations/empty == true">
            <p><webwork:text name="'admin.issuefields.screenschemes.all.operations.have.an.association'"/></p>
        </webwork:if>
        <webwork:elseIf test="/fieldScreens/empty == true">
            <p><webwork:text name="'admin.issuefields.screenschemes.no.screens.exist'">
                <webwork:param name="'value0'"><b><a id="create_fieldscreen" href="ViewFieldScreens.jspa"></webwork:param>
                <webwork:param name="'value1'"></a></b></webwork:param>
            </webwork:text></p>
        </webwork:elseIf>
    </page:applyDecorator>
</webwork:else>
</p>
</body>
</html>
