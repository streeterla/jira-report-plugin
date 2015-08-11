<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.issuefields.fieldconfigschemes.view.field.configuration.schemes'"/></title>
</head>
<body>
    <page:applyDecorator name="jirapanel">
        <page:param name="title"><webwork:text name="'admin.issuefields.fieldconfigschemes.view.field.configuration.schemes'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="helpURL">issuefieldschemes</page:param>
        <p>
            <webwork:text name="'admin.issuefields.fieldconfigschemes.the.table.below'"/>
        </p>
        <p>
            <webwork:text name="'admin.issuefields.fieldconfigschemes.description'">
                <webwork:param name="'value0'"><a href="ViewFieldLayouts.jspa"></webwork:param>
                <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>
        </p>
    </page:applyDecorator>

    <p>
        <table align=center bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width=90%>
        <tr><td>
        <table border="0" cellpadding="3" cellspacing="1" width=100%>
            <tr bgcolor=#f0f0f0>
                <td class="colHeaderLink">
                    <b><webwork:text name="'common.words.name'"/></b>
                </td>
                <td class="colHeaderLink">
                    <b><webwork:text name="'common.concepts.projects'"/></b>
                </td>
                <td class="colHeaderLink">
                    <b><webwork:text name="'common.words.operations'"/></b>
                </td>
            </tr>

            <webwork:iterator value="/fieldLayoutScheme" status="'status'">
            <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
                <td valign=top>
                    <img src="<%= request.getContextPath() %>/images/icons/form_blue_small.gif" width=16 height=16 title="<webwork:text name="'admin.issuefields.fieldconfigurations.field.layout.scheme'"/>" STYLE="float:left; padding-right:3; align">
                    <a href="<webwork:url page="/secure/admin/ConfigureFieldLayoutScheme!default.jspa"><webwork:param name="'id'" value="./id"/></webwork:url>" title="<webwork:text name="'admin.issuefields.fieldconfigschemes.change.field.layouts'"/>">
                    <b><webwork:property value="./name"/></b><br>
                    </a>
                    <webwork:property value="./description"/></td>
                <td valign=top nowrap>
                <webwork:iterator value="/schemeProjects(.)">
                    <ul class="square_blue">
                        <li><a href="<webwork:url page="/secure/project/ViewProject.jspa"><webwork:param name="'pid'" value="./long('id')" /></webwork:url>"><webwork:property value="./string('name')" /></a><br></li>
                    </ul>
                </webwork:iterator>
                </td>
                <td width="1%" valign=top nowrap>
                    <a href="<webwork:url page="/secure/admin/ConfigureFieldLayoutScheme!default.jspa"><webwork:param name="'id'" value="./id"/></webwork:url>" title="<webwork:text name="'admin.issuefields.fieldconfigschemes.change.field.layouts'"/>"><webwork:text name="'admin.common.words.configure'"/></a>
                    |
                    <a href="<webwork:url page="/secure/admin/CopyFieldLayoutScheme!default.jspa"><webwork:param name="'id'" value="./id"/></webwork:url>" title="<webwork:text name="'admin.issuefields.fieldconfigschemes.create.a.copy'"/>"><webwork:text name="'common.words.copy'"/></a>
                    |
                    <a href="<webwork:url page="/secure/admin/EditFieldLayoutScheme!default.jspa"><webwork:param name="'id'" value="./id"/></webwork:url>" title="<webwork:text name="'admin.issuefields.fieldconfigschemes.edit.name.and.description'"/>"><webwork:text name="'common.words.edit'"/></a>
                    <!-- Scheme can only be deleted if it is not associated with an issue type/project -->
                    <webwork:if test="/schemeProjects(.)/empty == true">
                        |
                        <a id="del_<webwork:property value="./name"/>" href="<webwork:url page="/secure/admin/DeleteFieldLayoutScheme!default.jspa"><webwork:param name="'id'" value="./id"/></webwork:url>" title="<webwork:text name="'admin.issuefields.fieldconfigschemes.delete.this.scheme'"/>"><webwork:text name="'common.words.delete'"/></a>
                    </webwork:if>
                </td>
            </tr>
            </webwork:iterator>
            <webwork:if test="fieldLayoutScheme/size == 0">
            <tr bgcolor=#ffffff>
                <td colspan=3><webwork:text name="'admin.issuefields.fieldconfigschemes.no.field.configuration.schemes.configured'"/></td>
            </tr>
            </webwork:if>
        </table>
        </td></tr>
        </table>
    </p>

    <p>
    <page:applyDecorator name="jiraform">
        <page:param name="action">AddFieldLayoutScheme.jspa</page:param>
        <page:param name="submitId">add_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
        <page:param name="title"><webwork:text name="'admin.issuefields.fieldconfigschemes.add.field.configuration.scheme'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="description">
            <webwork:text name="'admin.issuefields.fieldconfigschemes.add.field.configuration.scheme.instruction'">
                <webwork:param name="'value0'"><b></webwork:param>
                <webwork:param name="'value1'"></b></webwork:param>
            </webwork:text>
        </page:param>

        <ui:textfield label="text('common.words.name')" name="'fieldLayoutSchemeName'" size="'30'">
            <ui:param name="'mandatory'">true</ui:param>
        </ui:textfield>

        <ui:textfield label="text('common.words.description')" name="'fieldLayoutSchemeDescription'" size="'60'" />
    </page:applyDecorator>
    </p>
</body>
</html>
