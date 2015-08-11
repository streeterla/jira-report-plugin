<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.issuefields.fieldconfigurations.view.field.configurations'"/></title>
</head>
<body>
    <page:applyDecorator name="jirapanel">
        <page:param name="title"><webwork:text name="'admin.issuefields.fieldconfigurations.view.field.configurations'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="helpURL">issuefields</page:param>
        <p>
            <webwork:text name="'admin.issuefields.fieldconfigurations.the.table.below'"/>
        </p>
        <p>
             <webwork:text name="'admin.issuefields.fieldconfigurations.description'"/>
         </p>
         <p>
             <webwork:text name="'admin.issuefields.fieldconfigurations.activation'">
                 <webwork:param name="'value0'"><a href="ViewFieldLayoutSchemes.jspa"></webwork:param>
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
                    <b><webwork:text name="'admin.issuefields.fieldconfigurations.field.configuration.schemes'"/></b>
                </td>
                <td class="colHeaderLink">
                    <b><webwork:text name="'common.words.operations'"/></b>
                </td>
            </tr>

            <webwork:iterator value="/fieldLayouts" status="'status'">
            <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
                <td valign=top>
                    <img src="<%= request.getContextPath() %>/images/icons/form_blue_small.gif" width=16 height=16 title="<webwork:text name="'admin.issuefields.fieldconfigurations.field.layout.scheme'"/>" STYLE="float:left; padding-right:3; align">
                    <webwork:if test="./type">
                        <a href="<webwork:url page="/secure/admin/ViewIssueFields.jspa" />" title="<webwork:text name="'admin.issuefields.fieldconfigurations.edit.field.properties'"/>"><b><webwork:property value="./name"/></b></a>
                    </webwork:if>
                    <webwork:else>
                        <a href="<webwork:url page="/secure/admin/ConfigureFieldLayout!default.jspa"><webwork:param name="'id'" value="./id"/></webwork:url>" title="<webwork:text name="'admin.issuefields.fieldconfigurations.edit.field.properties'"/>"><b><webwork:property value="./name"/></b></a>
                    </webwork:else>
                    <br>
                    <webwork:property value="./description"/></td>
                <td valign=top nowrap>
                    <webwork:if test="/fieldLayoutSchemes(.)/empty == false">
                        <ul class="square_blue">
                            <webwork:iterator value="/fieldLayoutSchemes(.)">
                                <li><a href="<webwork:url page="/secure/admin/ConfigureFieldLayoutScheme.jspa"><webwork:param name="'id'" value="./id" /></webwork:url>"><webwork:property value="./name" /></a></li>
                            </webwork:iterator>
                        </ul>
                    </webwork:if>
                </td>
                <td width="1%" valign=top nowrap>
                    <webwork:if test="./type">
                        <a id="configure-<webwork:property value="./name"/>" href="<webwork:url page="/secure/admin/ViewIssueFields.jspa" />" title="<webwork:text name="'admin.issuefields.fieldconfigurations.edit.field.properties'"/>"><webwork:text name="'admin.common.words.configure'"/></a>
                    </webwork:if>
                    <webwork:else>
                        <a id="configure-<webwork:property value="./name"/>" href="<webwork:url page="/secure/admin/ConfigureFieldLayout!default.jspa"><webwork:param name="'id'" value="./id"/></webwork:url>" title="<webwork:text name="'admin.issuefields.fieldconfigurations.edit.field.properties'"/>"><webwork:text name="'admin.common.words.configure'"/></a>
                    </webwork:else>
                    |
                    <a id="copy-<webwork:property value="./name"/>" href="<webwork:url page="/secure/admin/CopyFieldLayout!default.jspa"><webwork:param name="'id'" value="./id"/></webwork:url>" title="<webwork:text name="'admin.issuefields.fieldconfigurations.create.copy.of'">
                        <webwork:param name="'value0'"><webwork:property value="./name" /></webwork:param>
                    </webwork:text>"><webwork:text name="'common.words.copy'"/></a>
                    <webwork:if test="./type == null">
                        |
                        <a id="edit-<webwork:property value="./name"/>" href="<webwork:url page="/secure/admin/EditFieldLayout!default.jspa"><webwork:param name="'id'" value="./id"/></webwork:url>" title="<webwork:text name="'admin.issuefields.fieldconfigurations.edit'">
                            <webwork:param name="'value0'"><webwork:property value="./name" /></webwork:param>
                        </webwork:text>"><webwork:text name="'common.words.edit'"/></a>
                    </webwork:if>

                    <!-- Field Configuration can only be deleted if it is not associated with a scheme -->
                    <webwork:if test="./type == null && /fieldLayoutSchemes(.)/empty == true">
                        |
                        <a id="delete-<webwork:property value="./name"/>" href="<webwork:url page="/secure/admin/DeleteFieldLayout!default.jspa"><webwork:param name="'id'" value="./id"/></webwork:url>" title="<webwork:text name="'admin.issuefields.fieldconfigurations.delete'">
                            <webwork:param name="'value0'"><webwork:property value="./name" /></webwork:param>
                        </webwork:text>"><webwork:text name="'common.words.delete'"/></a>
                    </webwork:if>

                </td>
            </tr>
            </webwork:iterator>
            <webwork:if test="fieldLayoutScheme/size == 0">
            <tr bgcolor=#ffffff>
                <td colspan=3><webwork:text name="'admin.issuefields.fieldconfigurations.no.schemes.configured'"/></td>
            </tr>
            </webwork:if>
        </table>
        </td></tr>
        </table>
    </p>

    <p>
    <page:applyDecorator name="jiraform">
        <page:param name="action">AddFieldLayout.jspa</page:param>
        <page:param name="submitId">add_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
        <page:param name="title"><webwork:text name="'admin.issuefields.fieldconfigurations.add.field.configuration'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="description">
            <webwork:text name="'admin.issuefields.fieldconfigurations.add.field.instructions'">
                <webwork:param name="'value0'"><b></webwork:param>
                <webwork:param name="'value1'"></b></webwork:param>
            </webwork:text>
        </page:param>

        <ui:textfield label="text('common.words.name')" name="'fieldLayoutName'" size="'30'">
            <ui:param name="'mandatory'">true</ui:param>
        </ui:textfield>

        <ui:textfield label="text('common.words.description')" name="'fieldLayoutDescription'" size="'60'" />
    </page:applyDecorator>
    </p>
</body>
</html>
