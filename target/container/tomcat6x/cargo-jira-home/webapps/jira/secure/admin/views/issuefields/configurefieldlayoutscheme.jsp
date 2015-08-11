<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.issuefields.fieldconfigschemes.configure.field.configuration.scheme'"/></title>
</head>
<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.issuefields.fieldconfigschemes.configure.field.configuration.scheme'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">fieldscreenschemes</page:param>
    <p>
        <webwork:text name="'admin.issuefields.fieldconfigschemes.configure.description'">
            <webwork:param name="'value0'"><b><webwork:property value="/fieldLayoutScheme/name" /></b></webwork:param>
        </webwork:text>
    </p>
    <p>
        <webwork:text name="'admin.issuefields.fieldconfigschemes.configure.instructions'">
            <webwork:param name="'value0'"><i></webwork:param>
            <webwork:param name="'value1'"></i></webwork:param>
        </webwork:text>
    </p>
    <p>
        <webwork:text name="'admin.issuefields.fieldconfigschemes.scheme.association'"/>
    </p>
    <ul class="square">
        <li><webwork:text name="'admin.issuefields.fieldconfigschemes.view.all.field.layout.schemes'">
            <webwork:param name="'value0'"><b><a id="view_fieldlayoutschemes" href="ViewFieldLayoutSchemes.jspa"></webwork:param>
            <webwork:param name="'value1'"></a></b></webwork:param>
        </webwork:text></li>
    </ul>
</page:applyDecorator>
<p>
    <table id="scheme_entries" class="gridBox" cellpadding="3" cellspacing="1" width="90%" align="center">
        <tr bgcolor=#f0f0f0>
            <td class="colHeaderLink" width="20%">
                <b><webwork:text name="'common.concepts.issuetype'"/></b>
            </td>
            <td class="colHeaderLink" width="65%">
                <b><webwork:text name="'admin.issuefields.fieldconfigschemes.field.configuration'"/></b>
            </td>
            <td class="colHeaderLink" width="15%" align="center">
                <b><webwork:text name="'common.words.operations'"/></b>
            </td>
        </tr>

        <webwork:if test="/fieldLayoutSchemeItems/empty == false">
            <webwork:iterator value="/fieldLayoutSchemeItems" status="'status'">
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
                            <span class="small"><webwork:text name="'admin.issuefields.fieldconfigschemes.used.for.all.unmapped.issue.types'"/></span>
                        </webwork:else>
                    </td>
                    <td valign=top>
                        <webwork:property value="/fieldLayout(./fieldLayoutId)">
                            <webwork:if test="./type">
                                <a id="configure_fieldlayout" href="ViewIssueFields.jspa"><webwork:property value="./name" /></a>
                            </webwork:if>
                            <webwork:else>
                                <a id="configure_fieldlayout" href="ConfigureFieldLayout.jspa?id=<webwork:property value="./id" />"><webwork:property value="./name" /></a>
                            </webwork:else>
                        </webwork:property>
                    </td>
                    <td valign=top nowrap align="left">
                        <webwork:if test="./issueType == null">
                            <a id="edit_fieldlayoutschemeentity" href="EditFieldLayoutSchemeEntity.jspa?id=<webwork:property value="/id" />" title="<webwork:text name="'admin.issuefields.fieldconfigschemes.edit.default.mapping'"/>"><webwork:text name="'common.words.edit'"/></a>
                        </webwork:if>
                        <webwork:else>
                            <a id="edit_fieldlayoutschemeentity_<webwork:property value="./issueType/string('id')"/>" href="EditFieldLayoutSchemeEntity.jspa?id=<webwork:property value="/id" />&issueTypeId=<webwork:property value="./issueType/string('id')" />" title="<webwork:text name="'admin.issuefields.fieldconfigschemes.edit.entry'"/>"><webwork:text name="'common.words.edit'"/></a>
                            | <a id="delete_fieldlayoutschemeentity_<webwork:property value="./issueType/string('id')" />" href="DeleteFieldLayoutSchemeEntity.jspa?id=<webwork:property value="/id" />&issueTypeId=<webwork:property value="./issueType/string('id')" />" title="<webwork:text name="'admin.issuefields.fieldconfigschemes.delete.entry'"/>"><webwork:text name="'common.words.delete'"/></a>
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
        <page:param name="action">AddFieldLayoutSchemeEntity.jspa</page:param>
        <page:param name="submitId">add_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
        <page:param name="title"><webwork:text name="'admin.issuefields.fieldconfigschemes.add.issue.type'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="description">
            <webwork:text name="'admin.issuefields.fieldconfigschemes.associate.instruction'">
                <webwork:param name="'value0'"><b></webwork:param>
                <webwork:param name="'value1'"></b></webwork:param>
            </webwork:text>
        </page:param>

        <ui:select label="text('common.concepts.issuetype')" name="'issueTypeId'" list="/addableIssueTypes" listKey="'./genericValue/string('id')'" listValue="'./nameTranslation'" />

        <ui:select label="text('admin.issuefields.fieldconfigschemes.field.configuration')" name="'fieldConfigurationId'" list="/fieldLayouts" listKey="'/fieldLayoutId(.)'" listValue="'./name'">
            <ui:param name="'description'"><webwork:text name="'admin.issuefields.fieldconfigschemes.field.configuration.chosen'"/></ui:param>
        </ui:select>

        <ui:component name="'id'" template="hidden.jsp" theme="'single'"/>
    </page:applyDecorator>
</webwork:if>
<webwork:else>
    <page:applyDecorator name="jirapanel">
        <page:param name="title"><webwork:text name="'admin.issuefields.fieldconfigschemes.add.issue.type'"/></page:param>
        <page:param name="width">100%</page:param>
            <p><webwork:text name="'admin.issuefields.fieldconfigschemes.all.issue.types.have.associations'"/></p>
    </page:applyDecorator>
</webwork:else>
</p>
</body>
</html>
