<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.itss.configure.issue.type.screen.scheme'"/></title>
</head>
<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.itss.configure.issue.type.screen.scheme'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">issuetype_screenschemes</page:param>
    <p>
        <webwork:text name="'admin.itss.configure.page.desc'">
            <webwork:param name="'value0'"><b><webwork:property value="/issueTypeScreenScheme/name" /></b></webwork:param>
        </webwork:text>
    </p>
    <p>
        <webwork:text name="'admin.itss.configure.instruction'">
            <webwork:param name="'value0'"><a href="ViewFieldScreens.jspa"></webwork:param>
            <webwork:param name="'value1'"></a></webwork:param>
        </webwork:text>
    </p>
    <p>
        <webwork:text name="'admin.itss.configure.instruction2'"/>
    </p>
    <ul class="square">
        <li><webwork:text name="'admin.itss.configure.view.all.itss'">
            <webwork:param name="'value0'"><b><a id="view_issuetypescreenschemes" href="ViewIssueTypeScreenSchemes.jspa"></webwork:param>
            <webwork:param name="'value1'"></a></b></webwork:param>
        </webwork:text></li>
    </ul>
</page:applyDecorator>
<p>
    <table class="gridBox" cellpadding="3" cellspacing="1" width="90%" align="center">
        <tr bgcolor=#f0f0f0>
            <td class="colHeaderLink" width="20%">
                <b><webwork:text name="'gadget.filterstats.field.statistictype.issuetype'"/></b>
            </td>
            <td class="colHeaderLink" width="65%">
                <b><webwork:text name="'admin.projects.screen.scheme'"/></b>
            </td>
            <td class="colHeaderLink" width="15%" align="center">
                <b><webwork:text name="'common.words.operations'"/></b>
            </td>
        </tr>

        <webwork:if test="/issueTypeScreenSchemeEntities/empty == false">
            <webwork:iterator value="/issueTypeScreenSchemeEntities" status="'status'">
            <webwork:if test="/shouldDisplay(.) == true">
            <tr class="<webwork:if test="@status/odd == true">rowNormal</webwork:if><webwork:else>rowAlternate</webwork:else>">
                    <td valign=top>
                        <webwork:if test="./issueType">
                            <webwork:property value="./issueTypeObject">
                                <webwork:component name="'issuetype'" template="constanticon.jsp">
                                    <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                                    <webwork:param name="'iconurl'" value="./iconUrl" />
                                    <webwork:param name="'alt'"><webwork:property value="./nameTranslation" /></webwork:param>
                                    <webwork:param name="'title'"><webwork:property value="./nameTranslation" /> - <webwork:property value="./descTranslation" /></webwork:param>
                                </webwork:component>
                                <webwork:property value="./nameTranslation" />
                            </webwork:property>
                        </webwork:if>
                        <webwork:else>
                            <i><webwork:text name="'admin.common.words.default'"/></i><br>
                            <span class="small"><webwork:text name="'admin.itss.configure.used.for.all.unmapped.issue.types'"/></span>
                        </webwork:else>
                    </td>
                    <td valign=top>
                        <webwork:property value="./fieldScreenScheme">
                            <a id="configure_fieldscreenscheme" href="ConfigureFieldScreenScheme.jspa?id=<webwork:property value="./id" />"><webwork:property value="./name" /></a>
                        </webwork:property>
                    </td>
                    <td valign=top nowrap align="left">
                        <webwork:if test="./issueType == null">
                            <a id="edit_issuetypescreenschemeentity_default" href="EditIssueTypeScreenSchemeEntity.jspa?id=<webwork:property value="/id" />" title="<webwork:text name="'admin.issuefields.fieldconfigschemes.edit.default.mapping'"/>"><webwork:text name="'common.words.edit'"/></a>
                        </webwork:if>
                        <webwork:else>
                            <a id="edit_issuetypescreenschemeentity_<webwork:property value="./issueType/string('name')" />" href="EditIssueTypeScreenSchemeEntity.jspa?id=<webwork:property value="/id" />&issueTypeId=<webwork:property value="./issueType/string('id')" />" title="<webwork:text name="'admin.issuefields.fieldconfigschemes.edit.entry'"/>"><webwork:text name="'common.words.edit'"/></a>
                            | <a id="delete_issuetypescreenschemeentity_<webwork:property value="./issueType/string('name')" />" href="DeleteIssueTypeScreenSchemeEntity.jspa?id=<webwork:property value="/id" />&issueTypeId=<webwork:property value="./issueType/string('id')" />" title="<webwork:text name="'admin.issuefields.fieldconfigschemes.delete.entry'"/>"><webwork:text name="'common.words.delete'"/></a>
                        </webwork:else>
                    </td>
            </tr>
            </webwork:if>
            </webwork:iterator>
        </webwork:if>
        <webwork:else>
            <tr><td colspan="3" bgcolor="#ffffff"><webwork:text name="'admin.no.issue.mappings.alert'"/></td></tr>
        </webwork:else>
    </table>
</p>
<p>
<webwork:if test="/addableIssueTypes/empty == false">
    <page:applyDecorator name="jiraform">
        <page:param name="action">AddIssueTypeScreenSchemeEntity.jspa</page:param>
        <page:param name="submitId">add_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
        <page:param name="title"><webwork:text name="'admin.itss.configure.add.issue.type.to.screen.scheme'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="description">
            <webwork:text name="'admin.itss.configure.association.instruction'">
                <webwork:param name="'value0'"><b></webwork:param>
                <webwork:param name="'value1'"><webwork:text name="'common.forms.add'"/></webwork:param>
                <webwork:param name="'value2'"></b></webwork:param>
            </webwork:text>
        </page:param>

        <ui:select label="text('common.concepts.issuetype')" name="'issueTypeId'" list="/addableIssueTypes" listKey="'./genericValue/string('id')'" listValue="'./nameTranslation'" />

        <ui:select label="text('admin.menu.issuefields.screen.scheme')" name="'fieldScreenSchemeId'" list="/fieldScreenSchemes" listKey="'./id'" listValue="'./name'">
            <ui:param name="'description'"><webwork:text name="'admin.itss.configure.field.configuration.to.use.for.chosen.issue.type'"/></ui:param>
        </ui:select>

        <ui:component name="'id'" template="hidden.jsp" theme="'single'"/>
    </page:applyDecorator>
</webwork:if>
<webwork:else>
    <page:applyDecorator name="jirapanel">
        <page:param name="title"><webwork:text name="'admin.itss.configure.add.issue.type.to.screen.scheme'"/></page:param>
        <page:param name="width">100%</page:param>
            <p><webwork:text name="'admin.itss.configure.long.instruction'">
                <webwork:param name="'value0'"><webwork:text name="'common.words.edit'"/></webwork:param>
            </webwork:text></p>
    </page:applyDecorator>
</webwork:else>
</p>
</body>
</html>
