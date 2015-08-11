<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<!-- Step 3 - Bulk Operation: Operation Details -->

<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'bulkworkflowtransition.title'"/></title>
</head>
<body>
<script type="text/javascript" language="javascript">
    function check(field_id)
    {
        var cbox = document.getElementById("cb" + field_id);
        if (cbox)
        {
            cbox.checked = true;
        }
    }
</script>
<script type="text/javascript" language="JavaScript">

    var tabClasses = new Array(<webwork:property value="/fieldScreenRenderTabs/size" />);
    var j = 0;
    <webwork:iterator value="/fieldScreenRenderTabs">
        <webwork:if test="parameters['errortabs']/contains(.) == true">tabClasses[j++] = 'errorTabCell';</webwork:if>
        <webwork:else>tabClasses[j++] = 'unselectedTabCell';</webwork:else>
    </webwork:iterator>

    function showTab(tabId)
    {
        for(i = 1; i <= <webwork:property value="/fieldScreenRenderTabs/size" />; i++)
        {
            var tableObject = document.getElementById('tab' + i);
            var tableCellObject = document.getElementById('tabCell' + i);
            var tabCellTextSelected = document.getElementById('tabCellTextSelected' + i);
            var tabCellTextNotSelected = document.getElementById('tabCellTextNotSelected' + i);
            if (i == tabId)
            {
                tableObject.className = 'borderedTabBox'; 
                tableCellObject.className='selectedTabCell';
                tabCellTextSelected.style.display ='inline';
                tabCellTextNotSelected.style.display ='none';
            }
            else
            {
                tableObject.className = 'borderedTabBoxHidden';
                tableCellObject.className = tabClasses[i - 1];
                tabCellTextSelected.style.display ='none';
                tabCellTextNotSelected.style.display ='inline';
            }
        }
    }
</script>

<page:applyDecorator name="bulkpanel" >
    <page:param name="title"><webwork:text name="'bulkworkflowtransition.title'"/>: <webwork:text name="'bulkworkflowtransition.edit.fields'"/></page:param>
    <page:param name="action">BulkWorkflowTransitionEditValidation.jspa</page:param>
    <webwork:property value="'true'" id="hideSubMenu" />
    <page:param name="instructions">
        <p>
        <webwork:text name="'bulkworkflowtransition.fields.available.edit'"/>
        </p>
    </page:param>
    
        <table class="grid bordered centered defaultWidth" >
        <tr><td>
            <b><webwork:text name="'bulkworkflowtransition.issue.workflow'"/></b>: <webwork:property value="/bulkEditBean/selectedWFTransitionKey/workflowName" />
        </td></tr>
        <tr><td>
            <b><webwork:text name="'bulkworkflowtransition.selected.transition'"/></b>: <webwork:property value="/bulkWorkflowTransitionOperation/actionDescriptor(/bulkEditBean/selectedWFTransitionKey)/name" />
        </td></tr>
        <tr><td>
            <b><webwork:text name="'bulkworkflowtransition.status.transition'"/></b>:
            <webwork:property value="/originStatus(/bulkEditBean/selectedWFTransitionKey)">
                <webwork:component name="'status'" template="constanticon.jsp">
                    <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                    <webwork:param name="'iconurl'" value="./string('iconurl')" />
                    <webwork:param name="'alt'"><webwork:property value="/nameTranslation(.)" /></webwork:param>
                </webwork:component>
                <webwork:property value="/nameTranslation(.)" />
            </webwork:property>
            <img src="<%= request.getContextPath() %>/images/icons/arrow_right_small.gif" height="16" width="16" border="0" alt="" align=absmiddle>
            <webwork:property value="/destinationStatus(/bulkEditBean/selectedWFTransitionKey)">
                <webwork:component name="'status'" template="constanticon.jsp">
                    <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                    <webwork:param name="'iconurl'" value="./string('iconurl')" />
                    <webwork:param name="'alt'"><webwork:property value="/nameTranslation(.)" /></webwork:param>
                </webwork:component>
                <webwork:property value="/nameTranslation(.)" />
            </webwork:property>
        </td></tr>
        <tr><td>
            <webwork:text name="'bulkworkflowtransition.number.affected.issues'">
                <webwork:param name="'value0'"><strong><webwork:property value="/bulkEditBean/selectedIssues/size()" /></strong></webwork:param>
            </webwork:text>
        </td></tr>
        </table>

        <webwork:if test="/fieldScreenRenderTabs/empty == true">
            <div class="grid borderedbox centered defaultWidth">
                <webwork:text name="'bulkworkflowtransition.nofields.onscreen'">
                    <webwork:param name="'value0'"><strong></webwork:param>
                    <webwork:param name="'value1'"></strong></webwork:param>
                </webwork:text>
            </div>
        </webwork:if>
        <webwork:else>
        <table id="editfields" class="grid centered defaultWidth bordered">

            <webwork:if test="/fieldScreenRenderTabs/size > 1">
                <tr><td>


                    <%-- Show tab headings --%>
                    <table cellpadding="2" cellspacing="0" border="0" width="100%" align="center">
                        <tr>
                        <webwork:iterator value="/fieldScreenRenderTabs" status="'status'">
                            <td id="tabCell<webwork:property value="@status/count" />"
                                <webwork:if test="@status/count == /selectedTab">class="selectedTabCell"</webwork:if>
                                <webwork:else>
                                    <%-- Test if the tab has any errors on it, and if so highlight it --%>
                                    <webwork:if test="/errorTabs/contains(.) == true">class="errorTabCell"</webwork:if>
                                    <%-- If not simply show normal header --%>
                                    <webwork:else>class="unselectedTabCell"</webwork:else>
                                </webwork:else>
                                width=1% nowrap align=center onClick="showTab(<webwork:property value="@status/count"/>);">

                                <webwork:if test="@status/count == /selectedTab">
                                    &nbsp;<span id="tabCellTextSelected<webwork:property value="@status/count" />" class="selectedTabFont" style="display: inline;"><webwork:property value="./name"/></span><span id="tabCellTextNotSelected<webwork:property value="@status/count" />" class="unselectedTabFont" style="display: none;"><a href="javascript:showTab(<webwork:property value="@status/count" />)"><webwork:property value="./name" /></a></span>&nbsp;
                                </webwork:if>
                                <webwork:else>
                                    &nbsp;<span id="tabCellTextSelected<webwork:property value="@status/count" />" class="selectedTabFont" style="display: none;"><webwork:property value="./name"/></span><span id="tabCellTextNotSelected<webwork:property value="@status/count" />" class="unselectedTabFont" style="display: inline;"><a href="javascript:showTab(<webwork:property value="@status/count" />)"><webwork:property value="./name" /></a></span>&nbsp;
                                </webwork:else>
                            </td>
                        </webwork:iterator>
                        <td width="100%">&nbsp;</td>
                        </tr>
                    </table>
            </webwork:if>

            <%-- Show the actual tabs with their fields --%>
            <webwork:iterator value="/fieldScreenRenderTabs" status="'status'">
                <webwork:if test="/fieldScreenRenderTabs/size > 1">
                    <table id="tab<webwork:property value="@status/count"/>" <webwork:if test="@status/count == /selectedTab">class="borderedTabBox"</webwork:if><webwork:else>class="borderedTabBoxHidden"</webwork:else> cellpadding="0" cellspacing="0" align="center">
                </webwork:if>

                    <%-- Show tab's fields --%>
                    <webwork:iterator value="/editActions(./name)">
                        <tr>
                        <webwork:if test="./available(/bulkEditBean) == true">
                            <td align="center" valign="top" bgcolor="#fffff0" width="1%">
                                <!-- Force Resolution requirability -->
                                <!-- If a resolution is detected on a screen - force the user to make a selection -->
                                <!-- Avoids transitioning the issue to a 'Resolved' status without setting the 'resolution' -->
                                <webwork:if test="/forceResolution(./field) == true">
                                    <input type="checkbox" disabled="true" id="cb<webwork:property value="./field/id"/>" name="actions" value="<webwork:property value="./field/id"/>" checked="true" />
                                    <input type="hidden" name="forcedResolution" value="<webwork:property value="./field/id"/>">
                                </webwork:if>
                                <webwork:else>
                                    <input type="checkbox" id="cb<webwork:property value="./field/id"/>" name="actions" value="<webwork:property value="./field/id"/>" <webwork:if test="/checked(./field/id) == true">checked</webwork:if> />
                                </webwork:else>
                            </td>
                            <td class="fieldLabelAreaBulk">
                                <label for="cb<webwork:property value="./field/id"/>">
                                <webwork:text name="'bulkedit.actions.changefield'">
                                    <webwork:param name="'value0'"><webwork:text name="./fieldName"/></webwork:param>
                                </webwork:text>:
                                </label>
                            </td>
                            <webwork:property value="/fieldHtml(./field)" escape="'false'" />
                        </webwork:if>
                        <webwork:else>
                            <td valign="top" bgcolor="#f0f0f0" align="center" width="1%"><webwork:text name="'bulkedit.constants.na'"/></td>
                            <td class="fieldLabelAreaBulk">
                                <webwork:text name="'bulkedit.actions.changefield'">
                                    <webwork:param name="'value0'"><webwork:property value="./fieldName" /></webwork:param>
                                </webwork:text>:
                            </td>
                            <td bgcolor="#f0f0f0" align="left">
                                <webwork:text name="unavailableMessage">
                                    <webwork:param name="'value0'"><font color="#bb0000"></webwork:param>
                                    <webwork:param name="'value1'"></font></webwork:param>
                                </webwork:text>
                            </td>
                        </webwork:else>
                        </tr>
                    </webwork:iterator>
                <webwork:if test="/fieldScreenRenderTabs/size > 1">
                    </table>
                </webwork:if>
            </webwork:iterator>

            <webwork:if test="/fieldScreenRenderTabs/size > 1">
                </td></tr>
            </webwork:if>

        <webwork:if test="/commentBulkEditAction/available(/bulkEditBean) == true">
            <tr><td bgcolor="#f0f0f0" <webwork:if test="/fieldScreenRenderTabs/size == 1">colspan="3"</webwork:if>>
                    <b><webwork:text name="'comment.update.title'"/></b>: (<webwork:text name="'comment.update.desc'"/>)
            </td></tr>
            <webwork:if test="/fieldScreenRenderTabs/size > 1">
                <tr><td <webwork:if test="/fieldScreenRenderTabs/size == 1">colspan="3"</webwork:if> bgcolor="#ffffff">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
            </webwork:if>

            <tr>
                <td align="center" valign="top" bgcolor="#fffff0" width="1%">
                    <input type="checkbox" id="cb<webwork:property value="/commentBulkEditAction/field/id"/>" name="commentaction" value="<webwork:property value="/commentBulkEditAction/field/id"/>" <webwork:if test="/checked(/commentBulkEditAction/field/id) == true">checked</webwork:if> />
                </td>
                <td class="fieldLabelAreaBulk">
                    <label for="cb<webwork:property value="/commentBulkEditAction/field/id"/>">
                    <webwork:text name="'bulkedit.actions.changefield'">
                        <webwork:param name="'value0'"><webwork:text name="/commentBulkEditAction/fieldName"/></webwork:param>
                    </webwork:text>:
                    </label>
                </td>
                <webwork:property value="/commentHtml" escape="false" />
            </tr>

            <webwork:if test="/fieldScreenRenderTabs/size > 1">
                    </table>
                </td></tr>
            </webwork:if>
        </webwork:if>

        </table>
        <script language="JavaScript" type="text/javascript">
        <!--
            <webwork:iterator value="/fieldScreenRenderTabs">
                <webwork:iterator value="/editActions(./name)">
                    <webwork:if test="./available(/bulkEditBean) == true">
                        <webwork:if test="/forceResolution(./field) == false">
                            var field_<webwork:property value="./field/id"/> = document.getElementById('<webwork:property value="./field/id"/>');
                            if (field_<webwork:property value="./field/id"/>) {
                                /* Check if the field has the onchange function already */
                                if (field_<webwork:property value="./field/id"/>.onchange)
                                {
                                    /* If it does, then we need to call that function first. */
                                    old_on_change_<webwork:property value="./field/id"/> = field_<webwork:property value="./field/id"/>.onchange;
                                    field_<webwork:property value="./field/id"/>.onchange = function() { old_on_change_<webwork:property value="./field/id"/>(); check('<webwork:property value="./field/id"/>'); };
                                }
                                else
                                {
                                    /* Otherwise, just call the check function. */
                                    field_<webwork:property value="./field/id"/>.onchange = function() { check('<webwork:property value="./field/id"/>'); };
                                }
                            }
                        </webwork:if>
                    </webwork:if>
                </webwork:iterator>
            </webwork:iterator>
            var commentField = document.getElementById('<webwork:property value="/commentBulkEditAction/field/id"/>');
            commentField.onchange = function() { check('<webwork:property value="/commentBulkEditAction/field/id"/>'); };
        //-->
        </script>
        </webwork:else>

        <table class="centered defaultWidth"><tr><td>
            <jsp:include page="/includes/bulkedit/bulkedit-sendnotifications.jsp"/>
        </td></tr></table>
</page:applyDecorator>

</body>
</html>
