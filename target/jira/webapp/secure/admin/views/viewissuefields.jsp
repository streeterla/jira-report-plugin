<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:if test="/enterprise == true"><webwork:text name="'admin.issuefields.fieldconfigurations.view.field.configuration'"/></webwork:if><webwork:else><webwork:text name="'admin.issuefields.view.issue.fields'"/></webwork:else></title>
</head>
<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:if test="/enterprise == true"><webwork:text name="'admin.issuefields.fieldconfigurations.view.field.configuration'"/></webwork:if><webwork:else><webwork:text name="'admin.issuefields.view.issue.fields'"/></webwork:else></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">issuefields</page:param>
    <p>
        <webwork:if test="/enterprise == true">
            <webwork:text name="'admin.issuefields.the.table.below.shows'">
                <webwork:param name="'value0'"><b><webwork:property value="/fieldLayout/name" /></b></webwork:param>
            </webwork:text>
        </webwork:if>
        <webwork:else>
            <webwork:text name="'admin.issuefields.the.table.below.shows2'"/>
        </webwork:else>
    </p>
    <p><webwork:text name="'admin.issuefields.configure.page.description'"/></p>
    <webwork:if test="/enterprise == true">
        <ul class="square">
            <li><webwork:text name="'admin.issuefields.configure.view.all'">
                <webwork:param name="'value0'"><b><a id="view_fieldlayouts" href="ViewFieldLayouts.jspa"></webwork:param>
                <webwork:param name="'value1'"></a></b></webwork:param>
            </webwork:text></li>
        </ul>
    </webwork:if>
    <webwork:if test ="hasDefaultFieldLayout == false">
        <ul class="square">
            <li><b><a id="restore_default" href="RestoreDefaults.jspa"><webwork:text name="'admin.common.phrases.restore.defaults'"/></a></b></li>
        </ul>
    </webwork:if>
</page:applyDecorator>
<p>
    <table align=center bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="90%"><tr><td>
    <table id="field_table" border="0" cellpadding="3" cellspacing="1" width=100%>
        <tr bgcolor=#f0f0f0>
            <td class="colHeaderLink" width="50%">
                <b><webwork:text name="'common.words.name'"/></b>
            </td>
            <td class="colHeaderLink" width="30%" align="left">
                <b><webwork:text name="'admin.issuefields.screens'"/></b>
            </td>
            <td class="colHeaderLink" width="20%" align="center">
                <b><webwork:text name="'common.words.operations'"/></b>
            </td>
        </tr>

        <webwork:iterator value="/orderedList" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/odd == true">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
            <webwork:if test="./hidden == true">
                <td valign=top class="hiddenField">
                    <table cellpadding=1 cellspacing=0 border=0 width="100%">
                        <tr>
                            <td class="hiddenField">
                                <b><webwork:property value="/fieldName(./orderableField)"/></b><webwork:if test="./orderableField/renderable == true"><br><font color="grey" size="1"> [<webwork:property value="/rendererDisplayName(./rendererType)"/>]</font></webwork:if>
                            </td>
                        </tr>
                        <webwork:if test="./fieldDescription != null">
                        <tr>
                            <td class="hiddenField">
                                <%-- this section just prints out if it is a custom field, and prints out the type of custom field that it is --%>
                                <font size="1"><webwork:property value="./fieldDescription" escape="'false'"/></font>
                            </td>
                        </tr>
                        </webwork:if>
                    </table>
                </td>
                <td valign=top align=left>
                    <webwork:if test="/unscreenable(.) == true">
                        <webwork:text name="'admin.issuefields.field.cannot.be.placed.on.screens'"/>
                    </webwork:if>
                    <webwork:if test="/fieldScreenTabs(./orderableField)/empty == false">
                        <webwork:iterator value="/fieldScreenTabs(./orderableField)" status="'tabStatus'">
                            <img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height=8 width=8 border=0 align=absmiddle>
                            <webwork:if test="./fieldScreen/tabs/size > 1">
                                <a href="<%= request.getContextPath() %>/secure/admin/ConfigureFieldScreen.jspa?id=<webwork:property value="./fieldScreen/id" />&tabPosition=<webwork:property value="./position" />"><webwork:property value="./fieldScreen/name" /></a> <span class="small">(<webwork:property value="./name" />)</span>
                            </webwork:if>
                            <webwork:else>
                                <a href="<%= request.getContextPath() %>/secure/admin/ConfigureFieldScreen.jspa?id=<webwork:property value="./fieldScreen/id" />"><webwork:property value="./fieldScreen/name" /></a>
                            </webwork:else>
                            <webwork:if test="@tabStatus/last == false"><br></webwork:if>
                        </webwork:iterator>
                    </webwork:if>
                    <webwork:else>&nbsp;</webwork:else>
                </td>
                <td valign=top nowrap align="left" class="hiddenField">
                    <webwork:text name="'common.words.edit'"/> |
                    <a id="show_<webwork:property value="@status/index"/>" href="<webwork:url page="IssueFieldHide.jspa"><webwork:param name="'hide'" value="@status/index" /></webwork:url>" title="<webwork:text name="'admin.issuefields.show.field'">
                        <webwork:param name="'value0'">'<webwork:property value="/fieldName(./orderableField)"/>'</webwork:param>
                    </webwork:text>"><webwork:text name="'admin.common.words.show'"/></a>
                    <webwork:if test="/mandatory(.) == false">
                      <webwork:if test="/requirable(.) == true">|
                          <webwork:text name="'admin.common.words.required'"/>
                      </webwork:if>
                    </webwork:if>
                </td>
            </webwork:if>
            <webwork:else>
                <td valign=top>
                    <table cellpadding=1 cellspacing=0 border=0 width="100%">
                        <tr>
                            <td width=60%>
                                <b><webwork:property value="/fieldName(./orderableField)"/></b><webwork:if test="./orderableField/renderable == true"><br><font color="grey" size="1"> [<webwork:property value="/rendererDisplayName(./rendererType)"/>]</font></webwork:if>
                            </td>
                            <td width=40% align="right" valign="bottom">
                                <webwork:if test="/mandatory(.) == true || ./required == true"><font color="#990000" size="1"><webwork:text name="'admin.common.words.required'"/></font></webwork:if>
                            </td>
                        </tr>
                        <webwork:if test="./fieldDescription != null">
                        <tr>
                            <td colspan=2>
                                <%-- this section just prints out if it is a custom field, and prints out the type of custom field that it is --%>
                                <font size="1"><webwork:property value="./fieldDescription" escape="'false'"/></font>
                            </td>
                        </tr>
                        </webwork:if>
                    </table>
                </td>
               <td valign=top align=left>
                   <webwork:if test="/unscreenable(.) == true">
                       <webwork:text name="'admin.issuefields.field.cannot.be.placed.on.screens'"/>
                   </webwork:if>
                    <webwork:if test="/fieldScreenTabs(./orderableField)/empty == false">
                        <webwork:iterator value="/fieldScreenTabs(./orderableField)" status="'tabStatus'">
                            <img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height=8 width=8 border=0 align=absmiddle>
                            <webwork:if test="./fieldScreen/tabs/size > 1">
                                <a href="<%= request.getContextPath() %>/secure/admin/ConfigureFieldScreen.jspa?id=<webwork:property value="./fieldScreen/id" />&tabPosition=<webwork:property value="./position" />"><webwork:property value="./fieldScreen/name" /></a> <span class="small">(<webwork:property value="./name" />)</span>
                            </webwork:if>
                            <webwork:else>
                                <a href="<%= request.getContextPath() %>/secure/admin/ConfigureFieldScreen.jspa?id=<webwork:property value="./fieldScreen/id" />"><webwork:property value="./fieldScreen/name" /></a>
                            </webwork:else>
                            <webwork:if test="@tabStatus/last == false"><br></webwork:if>
                        </webwork:iterator>
                    </webwork:if>
                    <webwork:else>&nbsp;</webwork:else>
                </td>
                <td valign=top nowrap align="left">
                    <a id="edit_<webwork:property value="@status/index"/>" href="<webwork:url page="/secure/admin/EditDefaultFieldLayoutItem!default.jspa"><webwork:param name="'position'" value="@status/index"/></webwork:url>"><webwork:text name="'common.words.edit'"/></a>
                    <webwork:if test="/hideable(.) == true">
                        | <a id="hide_<webwork:property value="@status/index"/>" href="<webwork:url page="IssueFieldHide.jspa"><webwork:param name="'hide'" value="@status/index" /></webwork:url>" title="<webwork:text name="'admin.issuefields.hide.field'">
                            <webwork:param name="'value0'">'<webwork:property value="/fieldName(./orderableField)"/>'</webwork:param>
                        </webwork:text>"><webwork:text name="'admin.common.words.hide'"/></a>
                    </webwork:if>
                    <webwork:if test="/mandatory(.) == false">
                        <webwork:if test="/requirable(.) == true">
                            | <a id="require_<webwork:property value="@status/index"/>" href="<webwork:url page="IssueFieldRequire.jspa"><webwork:param name="'require'" value="@status/index" /></webwork:url>" <webwork:if test="required == false">title="<webwork:text name="'admin.issuefields.make.field.required'">
                                <webwork:param name="'value0'">'<webwork:property value="/fieldName(./orderableField)"/>'</webwork:param>
                            </webwork:text>"><webwork:text name="'admin.common.words.required'"/></webwork:if><webwork:else>title="<webwork:text name="'admin.issuefields.make.field.optional'">
                                <webwork:param name="'value0'">'<webwork:property value="/fieldName(./orderableField)"/>'</webwork:param>
                            </webwork:text>"><webwork:text name="'admin.common.words.optional'"/></webwork:else></a>
                        </webwork:if>
                    </webwork:if>
                    <webwork:if test="/unscreenable(.) == false">
                        | <a id="associate_<webwork:property value="./orderableField/id" />" href="AssociateFieldToScreens!default.jspa?fieldId=<webwork:property value="./orderableField/id"/>&returnUrl=ViewIssueFields.jspa"><webwork:text name="'admin.issuefields.screens'"/></a>
                   </webwork:if>
                   <webwork:if test="./orderableField/renderable == true">
                        | <a id="renderer_<webwork:property value="/fieldName(./orderableField)"/>" href="<webwork:url page="EditFieldLayoutItemRenderer!default.jspa"><webwork:param name="'rendererEdit'" value="@status/index" /></webwork:url>" title="<webwork:text name="'admin.issuefields.choose.renderer'">
                            <webwork:param name="'value0'">'<webwork:property value="/fieldName(./orderableField)"/>'</webwork:param>
                        </webwork:text>"><webwork:text name="'admin.issuefields.renderers'"/></a>
                   </webwork:if>
                </td>
            </webwork:else>
        </tr>
        </webwork:iterator>
    </table>
    </td></tr>
    </table>
</body>
</html>
