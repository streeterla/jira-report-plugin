<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.issuefields.screens.configure.screen'"/></title>
</head>
<body>
<style>

#renameTabForm
{
    margin: 0px;
    padding: 0px;
}

#tabForm
{
    margin: 0px;
    padding: 0px;
}

<webwork:if test="/tabsAllowed == true">
.grid
{
    padding-top: 0px;
    margin-top: 0px;
    border-top-style: none;
}

.grid td
{
    border-top-style: none;
}
</webwork:if>

</style>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.issuefields.screens.configure.screen'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">fieldscreens</page:param>
    <p>
        <webwork:text name="'admin.issuefields.screens.configure.main.page.description'">
            <webwork:param name="'value0'"><b><webwork:property value="/fieldScreen/name" /></b></webwork:param>
        </webwork:text>
    </p>

    <p>
        <webwork:if test="/tabsAllowed == true">
            <webwork:text name="'admin.issuefields.screens.configure.page.description.a'"/>
        </webwork:if>
        <webwork:else>
            <webwork:text name="'admin.issuefields.screens.configure.page.description.b'"/>
        </webwork:else>
    </p>
    <p>
        <webwork:text name="'admin.issuefields.screens.configure.note'">
            <webwork:param name="'value0'"><span class="warning"></webwork:param>
            <webwork:param name="'value1'"></span></webwork:param>
        </webwork:text>
    </p>
    <ul class="square">
        <li><webwork:text name="'admin.issuefields.screens.configure.view.all'">
            <webwork:param name="'value0'"><b><a id="view_screen" href="ViewFieldScreens.jspa"></webwork:param>
            <webwork:param name="'value1'"></a></b></webwork:param>
        </webwork:text></li>
    </ul>
</page:applyDecorator>
    <webwork:if test="/fieldScreen && /fieldScreen/tabs/empty == false">

    <%-- The empty paragraph tags *need* to be there as firefox does not work very well if the p tags surround the tables that follow. However we need spacing between the jirapanel above and the tables.--%>
    <p></p>

    <webwork:if test="/tabsAllowed == true">
    <%-- Show tab headings --%>
    <table cellpadding="2" cellspacing="0" border="0" width="100%" align="center">
        <tr>
        <webwork:iterator value="/fieldScreen/tabs" status="'status'">
            <td width="1%" nowrap valign="middle" align="center" <webwork:if test="@status/index == /tabPosition">bgcolor="#bbbbbb"</webwork:if><webwork:else>bgcolor="#ffffff"</webwork:else>>
                <webwork:if test="@status/index == /tabPosition">
                    <table border="0" cellspacing="0" cellpadding="1">
                        <tr>
                            <webwork:if test="@status/first == false">
                            <td>
                                <a id="move_tableft" href="MoveFieldScreenTabLeft.jspa?id=<webwork:property value="/id" />&tabPosition=<webwork:property value="/tabPosition" />"><img src="<%= request.getContextPath()%>/images/icons/arrow_left_small.gif" height="16" width="16" border="0" title="<webwork:text name="'admin.issuefields.screens.configure.move.tab.left'"/>"></a>
                            </td>
                            </webwork:if>
                            <td nowrap class="selectedTabFont">&nbsp;<webwork:property value="./name"/>&nbsp;</td>
                            <webwork:if test="@status/last == false">
                            <td>
                                <a id="move_tabright" href="MoveFieldScreenTabRight.jspa?id=<webwork:property value="/id" />&tabPosition=<webwork:property value="/tabPosition" />"><img src="<%= request.getContextPath()%>/images/icons/arrow_right_small.gif" height="16" width="16" border="0" title="<webwork:text name="'admin.issuefields.screens.configure.move.tab.right'"/>"></a>
                            </td>
                            </webwork:if>
                        </tr>
                    </table>
                </webwork:if>
                <webwork:else>
                    &nbsp;<a href="ConfigureFieldScreen.jspa?id=<webwork:property value="/id" />&tabPosition=<webwork:property value="@status/index" />" class="unselectedTabFont"><webwork:property value="./name" /></a>&nbsp;
                </webwork:else>
            </td>
        </webwork:iterator>
        <td width="100%">&nbsp;</td>
        </tr>
    </table>
    </webwork:if>

    <%-- Show the tab --%>
    <webwork:property value="/tab">
    <webwork:if test="/tabsAllowed == true">
        <table id="field_tab_table" class="gridBox" style="padding: 0; margin: 0;" cellpadding="3" cellspacing="1" width="100%" align="center">
            <%-- Show the tab's operations --%>
            <tr>
                <td bgcolor="#ffffff" colspan="<webwork:property value="/controlRowSize" />">
                    <form id="renameTabForm" name="ranameTabForm" action="RenameFieldScreenTab.jspa" method="post">
                    <ul class="square">
                        <li><webwork:text name="'admin.issuefields.screens.configure.delete.tab'">
                            <webwork:param name="'value0'"><b><a id="delete_fieldscreentab" href="DeleteFieldScreenTab.jspa?id=<webwork:property value="/id" />&tabPosition=<webwork:property value="/tabPosition" />"></webwork:param>
                            <webwork:param name="'value1'"></a></b></webwork:param>
                        </webwork:text></li>
                        <li><webwork:text name="'admin.issuefields.screens.configure.rename.tab'">
                            <webwork:param name="'value0'"><input type="text" name="tabName" value="<webwork:property value="/tabName" />" style="border: 1px solid #bbbbbb; font-size: 80%;">
                                <input type="submit" value="<webwork:text name="'admin.common.words.ok'"/>" class="subtleButton" />
                                <webwork:if test="/errors/('tabName')"> - <span class="warning"><webwork:property value="/errors/('tabName')" /></span></webwork:if>
                            </webwork:param>
                        </webwork:text></li>
                    </ul>
                    <input type="hidden" name="id" value="<webwork:property value="/id" />">
                    <input type="hidden" name="tabPosition" value="<webwork:property value="/tabPosition" />">
                    </form>
                </td>
            </tr>
        </table>
        </webwork:if>
        <form id="tabForm" name="tabFormOperations" action="ConfigureFieldScreenTab.jspa" method="post"><table id="field_table" class="grid" width="100%" align="center">
        <%-- Show headings for tab's layout items--%>
        <tr bgcolor=#f0f0f0>
            <td class="colHeaderLink" width="1%">
                <b><webwork:text name="'admin.issuefields.screens.configure.position'"/></b>
            </td>
            <td class="colHeaderLink" width="70%">
                <b><webwork:text name="'common.words.name'"/></b>
            </td>
            <webwork:if test="/tab/fieldScreenLayoutItems/size > 1">
                <td class="colHeaderLink" width="1%" align="center">
                    <b><webwork:text name="'admin.issuefields.screens.configure.order'"/></b>
                </td>
                <td class="colHeaderLink" align="center">
                    <b><webwork:text name="'admin.issuefields.screens.configure.move.to.position'"/></b>
                </td>
            </webwork:if>
            <webwork:if test="/fieldScreen/tabs/size > 1 && /tab/fieldScreenLayoutItems/empty == false">
                <td class="colHeaderLink" align="center">
                    <b><webwork:text name="'admin.issuefields.screens.configure.move.to.tab'"/></b>
                </td>
            </webwork:if>
            <webwork:if test="/tab/fieldScreenLayoutItems/empty == false">
                <td class="colHeaderLink" align="center">
                    <b><webwork:text name="'admin.common.words.remove'"/></b>
                </td>
            </webwork:if>
        </tr>
        <%-- Show the tab's layout items --%>
        <webwork:if test="./fieldScreenLayoutItems/empty == false">
            <webwork:iterator value="./fieldScreenLayoutItems" status="'status'">
                <tr class="<webwork:if test="/hlFields/contains(./orderableField/id) == true">rowHighlighted</webwork:if><webwork:elseIf test="@status/odd == true">rowNormal</webwork:elseIf><webwork:else>rowAlternate</webwork:else>">
                    <td>
                        <webwork:property value="@status/count" />.
                    </td>
                    <td>
                        <webwork:if test="./orderableField">
                            <b><webwork:property value="./orderableField/name"/></b>
                        </webwork:if>
                        <webwork:else>
                            <span class="warning"><webwork:text name="'admin.issuefields.screens.configure.invalid.or.disabled.field'">
                                <webwork:param name="'value0'"><webwork:property value="./fieldId" /></webwork:param>
                            </webwork:text></span>
                        </webwork:else>
                    </td>
                    <webwork:if test="../fieldScreenLayoutItems/size > 1">
                        <td nowrap>
                            <webwork:if test="@status/first == false">
                            <a id="moveToFirst_<webwork:property value="./orderableField/id" />" href="FieldScreenLayoutItemFirst.jspa?id=<webwork:property value="/id" />&tabPosition=<webwork:property value="/tabPosition"/>&fieldPosition=<webwork:property value="@status/index"/>"><img src="<%= request.getContextPath() %>/images/icons/arrow_first.gif" border="0" width="16" height="16" title="<webwork:text name="'admin.issuefields.screens.configure.move.field.to.first'"/>"></a>
                            <a id="moveUp_<webwork:property value="./orderableField/id" />" href="FieldScreenLayoutItemUp.jspa?id=<webwork:property value="/id" />&tabPosition=<webwork:property value="/tabPosition"/>&fieldPosition=<webwork:property value="@status/index"/>"><img src="<%= request.getContextPath() %>/images/icons/arrow_up_blue.gif" border="0" width="16" height="16" title="<webwork:text name="'admin.issuefields.screens.configure.move.field.up'"/>"></a></webwork:if>
                            <webwork:else><image src="<%= request.getContextPath() %>/images/border/spacer.gif" border=0 width=13 height=14><image src="<%= request.getContextPath() %>/images/border/spacer.gif" border="0" width="20" height="16"></webwork:else>
                            <webwork:if test="@status/last != true">
                            <a id="moveDown_<webwork:property value="./orderableField/id" />" href="FieldScreenLayoutItemDown.jspa?id=<webwork:property value="/id" />&tabPosition=<webwork:property value="/tabPosition"/>&fieldPosition=<webwork:property value="@status/index"/>"><img src="<%= request.getContextPath() %>/images/icons/arrow_down_blue.gif" border="0" width="16" height="16" title="<webwork:text name="'admin.issuefields.screens.configure.move.field.down'"/>"></a>
                            <a id="moveToLast_<webwork:property value="./orderableField/id" />" href="FieldScreenLayoutItemLast.jspa?id=<webwork:property value="/id" />&tabPosition=<webwork:property value="/tabPosition"/>&fieldPosition=<webwork:property value="@status/index"/>"><img src="<%= request.getContextPath() %>/images/icons/arrow_last.gif" border="0" width="16" height="16" title="<webwork:text name="'admin.issuefields.screens.configure.move.field.to.last'"/>"></a></webwork:if>
                            <webwork:else><image src="<%= request.getContextPath() %>/images/border/spacer.gif" border=0 width=13 height=14><image src="<%= request.getContextPath() %>/images/border/spacer.gif" border="0" width="20" height="16"></webwork:else>
                        </td>

                        <ui:textfield name="/newPositionTextBoxName(@status/index)" label="text('admin.issuefields.screens.configure.new.field.position')" theme="'single'" value="/newPositionValue(@status/index)" size="'4'">
                            <ui:param name="'class'" value="'fullyCentered'" />
                        </ui:textfield>

                    </webwork:if>
                    <webwork:if test="/fieldScreen/tabs/size > 1">
                        <td align="center">
                            <select name="<webwork:property value="/destinationTabBoxName(@status/index)" />">
                                <option value="" selected ><webwork:text name="'admin.issuefields.screens.configure.select.tab'"/></option>
                                <webwork:iterator value="/destinationTabs">
                                    <option value="<webwork:property value="./position" />"><webwork:property value="./name" /></option>
                                </webwork:iterator>
                            </select>
                        </td>
                    </webwork:if>
                    <td align="center">
                        <input id="removebox_<webwork:property value="./orderableField/id"/>" type="checkbox" name="<webwork:property value="/removeFieldBoxName(@status/index)" />">
                    </td>
                </tr>
            </webwork:iterator>
            <tr class="rowHeader" align="center">
                <td colspan="<webwork:property value="/buttonRowSize" />">&nbsp<input type="hidden" name="tabPosition" value="<webwork:property value="/tabPosition" />"><input type="hidden" name="id" value="<webwork:property value="/id" />"></td>
                <webwork:if test="./fieldScreenLayoutItems/size > 1"><td><input type="submit" name="moveFieldsToPosition" value="<webwork:text name="'common.forms.move'"/>"></td></webwork:if>
                <webwork:if test="/fieldScreen/tabs/size > 1"><td><input type="submit" name="moveFieldsToTab" value="<webwork:text name="'common.forms.move'"/>"></td></webwork:if>
                <webwork:if test="./fieldScreenLayoutItems/empry == false"></webwork:if><td><input type="submit" name="deleteFieldsFromTab" value="<webwork:text name="'admin.common.words.remove'"/>"></td>
            </tr>
        </webwork:if>
        <webwork:else>
            <tr bgcolor="#ffffff">
                <td colspan="<webwork:property value="/controlRowSize" />">
                    <webwork:text name="'admin.issuefields.screens.configure.no.fields'"/>
                </td>
            </tr>
        </webwork:else>
    </table>
    </form>
    </webwork:property>
    </webwork:if>
    <webwork:else>
        <webwork:text name="'admin.issuefields.screens.configure.no.screens'"/>
    </webwork:else>
<webwork:if test="/fieldScreen">
<p>
    <table border="0" width="100%">
        <tr>
            <webwork:if test="/fieldScreen/tabs/empty == false">
            <%-- Add Fields to Tab Form --%>
            <td width="50%" valign="top">
                <webwork:if test="/addableFields/empty == false">
                <page:applyDecorator name="jiraform">
                    <page:param name="action">AddFieldScreenLayoutItem.jspa</page:param>
                    <page:param name="submitId">add_submit</page:param>
                    <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
                    <page:param name="title"><webwork:text name="'admin.issuefields.screens.configure.add.field'"/></page:param>
                    <page:param name="width">100%</page:param>
                    <page:param name="description">
                    <webwork:if test="/tabsAllowed == true">
                        <webwork:text name="'admin.issuefields.screens.configure.add.field.description.tab'">
                            <webwork:param name="'value0'"><b><webwork:property value="/tab/name" /></b></webwork:param>
                        </webwork:text>
                    </webwork:if>
                    <webwork:else>
                        <webwork:text name="'admin.issuefields.screens.configure.add.field.description.screen'">
                            <webwork:param name="'value0'"><b><webwork:property value="/fieldScreen/name" /></b></webwork:param>
                        </webwork:text>
                    </webwork:else>
                    </page:param>

                    <ui:select label="text('admin.issuefields.screens.configure.fields.to.add')" name="'fieldId'" list="/addableFields" listKey="'id'" listValue="'/fieldName(.)'" template="selectmultiple.jsp">
                        <webwork:param name="'size'"><webwork:if test="/addableFields/size < 2">2</webwork:if><webwork:elseIf test="/addableFields/size < 5"><webwork:property value="/addableFields/size" /></webwork:elseIf><webwork:else>5</webwork:else></webwork:param>
                    </ui:select>

                    <ui:textfield label="text('admin.issuefields.screens.configure.position')" name="'fieldPosition'" >
                        <ui:param name="'description'"><webwork:if test="/tabsAllowed == true"><webwork:text name="'admin.issuefields.screens.configure.leave.blank.a'"/></webwork:if>
                            <webwork:else><webwork:text name="'admin.issuefields.screens.configure.leave.blank.b'"/></webwork:else></ui:param>
                    </ui:textfield>

                    <%-- Field Screen id --%>
                    <ui:component name="'id'" value="/fieldScreen/id" template="hidden.jsp" theme="'single'"/>

                    <%-- Field Screen Tab position --%>
                    <ui:component name="'tabPosition'" template="hidden.jsp" theme="'single'" />
                </page:applyDecorator>
                </webwork:if>
                <webwork:else>
                     <page:applyDecorator name="jirapanel">
                        <page:param name="title"><webwork:text name="'admin.issuefields.screens.configure.add.field.to.tab'"/></page:param>
                        <page:param name="width">100%</page:param>
                        <p><webwork:text name="'admin.issuefields.screens.configure.no.fields.to.add'"/></p>
                    </page:applyDecorator>
                </webwork:else>
            </td>
            </webwork:if>
            <webwork:if test="/tabsAllowed == true">
            <%-- Add New tab Form --%>
            <td width="50%" valign="top">
                <page:applyDecorator name="jiraform">
                    <page:param name="action">AddFieldScreenTab.jspa</page:param>
                    <page:param name="submitId">add_submit</page:param>
                    <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
                    <page:param name="title"><webwork:text name="'admin.issuefields.screens.configure.add.new.tab'"/></page:param>
                    <page:param name="width">100%</page:param>
                    <page:param name="formName">jiraTabForm</page:param>
                    <page:param name="description">
                        <webwork:text name="'admin.issuefields.screens.configure.add.new.tab.to.screen'">
                            <webwork:param name="'value0'"><b><webwork:property value="/fieldScreen/name" /></b></webwork:param>
                        </webwork:text>
                    </page:param>

                    <ui:textfield label="text('common.words.name')" name="'newTabName'" >
                        <ui:param name="'mandatory'" value="true" />
                    </ui:textfield>

                    <%-- Field Screen id --%>
                    <ui:component name="'id'" value="/fieldScreen/id" template="hidden.jsp" theme="'single'" />

                    <%-- Field Screen Tab position to return to incase of error--%>
                    <ui:component name="'tabPosition'" template="hidden.jsp" theme="'single'" />
                </page:applyDecorator>
            </td>
            </webwork:if>
        </tr>
    </table>
</p>
</webwork:if>
</body>
</html>
