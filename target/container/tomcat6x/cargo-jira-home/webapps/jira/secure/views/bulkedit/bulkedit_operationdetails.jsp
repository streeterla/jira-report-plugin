<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<!-- Step 3 - Bulk Operation: Operation Details -->

<html>
<head>
	<title><webwork:text name="'bulkedit.title'"/></title>
</head>
<body>
<%--Added the script tags around fieldenabler due to the print out of the file --%>
<jsp:include page="/includes/js/date_picker.jsp" flush="true" />
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
<script type="text/javascript">
  function toggleUnavailableActions() {
        var hiddenActions = document.getElementById("hiddenActions");
        var hiddenActionsArrow = document.getElementById("hiddenActionsArrow");
        if (hiddenActions.style.display == 'none') {
          hiddenActions.style.display = '';
          hiddenActionsArrow.src='<%= request.getContextPath() %>/images/icons/navigate_down.gif';
        } else {
          hiddenActions.style.display='none';
          hiddenActionsArrow.src='<%= request.getContextPath() %>/images/icons/navigate_right.gif';
        }
  }
</script>
<table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#ffffff">
<tr>
    <td width="200" valign="top" bgcolor="#f0f0f0">
        <jsp:include page="/secure/views/bulkedit/bulkedit_leftpane.jsp" flush="false" />
    </td>
    <td valign="top">
        <table cellspacing="0" cellpadding="10" border="0" width="100%"><tr><td>
            <page:applyDecorator name="jirapanel">
                <page:param name="title"><webwork:text name="'bulkedit.title'"/>: <webwork:text name="'bulkedit.step3.title'"/></page:param>
                <page:param name="description">
                    <webwork:text name="'bulkedit.step3'"/>
                </page:param>
                <page:param name="width">100%</page:param>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td colspan="2">
                        <!-- check for EDIT_ISSUE permissions and show an appropriate error message if user does not have this permission -->
                        <webwork:if test="hasAvailableActions == false">
                            <webwork:if test="/bulkEditBean/multipleProjects == true">
                                <webwork:text name="'bulkedit.step2.note.noactions.multiple'">
                                    <webwork:param name="'value0'"><b><webwork:property value="/bulkEditBean/selectedIssues/size"/></b></webwork:param>
                                    <webwork:param name="'value1'"><b><webwork:property value="/bulkEditBean/projectIds/size"/></b></webwork:param>
                                </webwork:text>
                            </webwork:if>
                            <webwork:else>
                                <webwork:text name="'bulkedit.step2.note.noactions.single'">
                                    <webwork:param name="'value0'"><b><webwork:property value="/bulkEditBean/selectedIssues/size"/></b></webwork:param>
                                    <webwork:param name="'value1'"><b><webwork:property value="/bulkEditBean/project/string('name')"/></b></webwork:param>
                                </webwork:text>
                            </webwork:else>
                        </webwork:if>
                        <webwork:else>
                            <webwork:text name="'bulkedit.step2.desc'">
                                <webwork:param name="'value0'"><b><webwork:property value="/bulkEditBean/selectedIssues/size"/></b></webwork:param>
                            </webwork:text><br>
                        </webwork:else>
                        </td>
                    </tr>
                </table>
            </page:applyDecorator>
            <p>
            <form name="jiraform" action="BulkEditDetailsValidation.jspa" method="POST">
            <%@include file="bulkchooseaction_submit_buttons.jsp"%>
            <webwork:if test="visibleActions/empty == 'false'">
            <p>
            <table id="availableActionsTable" class="grid" border="0" cellpadding="3" cellspacing="1" width="100%">
                <webwork:iterator value="visibleActions">
                    <tr>
                        <td align="center" valign="top" bgcolor="#fffff0" width="1%">
                            <input type="checkbox" id="cb<webwork:property value="./field/id"/>" name="actions" value="<webwork:property value="./field/id"/>" <webwork:if test="/checked(./field/id) == true">checked</webwork:if>></input>
                        </td>
                        <td align="left" valign="top" bgcolor="#fffff0">
                            <label for="cb<webwork:property value="./field/id"/>">
                            <webwork:text name="'bulkedit.actions.changefield'">
                                <webwork:param name="'value0'"><webwork:text name="./fieldName"/></webwork:param>
                            </webwork:text>:
                            </label>
                        </td>
                        <webwork:property value="/fieldHtml(./field/id)" escape="'false'" />
                    </tr>
                </webwork:iterator>
            </table>
            </p>
            <script language="JavaScript" type="text/javascript">
            <!--
                /* check the cbox on field.change (check for null, since radio/multicheckbox custom fields have different id scheme causing fields afterwards to stop auto checking cbox) */
                <webwork:iterator value="visibleActions">
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
                </webwork:iterator>
            //-->
            </script>
            </webwork:if>

            <webwork:if test="hiddenActions/empty == 'false'">
            <p>
            <script type="text/javascript">
                document.write("<img id='hiddenActionsArrow' src='<%= request.getContextPath() %>/images/icons/navigate_right.gif' width='8' height='8' border='0'>");
                document.write("<a href='#'  onclick='toggleUnavailableActions(); return false;'><webwork:text name="'bulkedit.actions.show.unavailable'"/></a>");
                document.write("<div id='hiddenActions' style='display: none'>");
            </script>
            <noscript>
                <img id="hiddenActionsArrow" src="<%= request.getContextPath() %>/images/icons/navigate_down.gif" width="8" height="8" border="0">
                <webwork:text name="'bulkedit.actions.show.unavailable'"/>
                <div id="hiddenActions">
            </noscript>
                <table id="unavailableActionsTable" class="grid" border="0" cellpadding="0" cellspacing="1" width="100%">
                    <webwork:iterator value="hiddenActions">
                        <tr>
                            <td valign="top" bgcolor="#f0f0f0" align="center"><webwork:text name="'bulkedit.constants.na'"/></td>
                            <td align="left" valign="top" bgcolor="#fffff0">
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
                        </tr>
                    </webwork:iterator>
                </table>
            </div>
            </p>
            </webwork:if>

            <p>
            <jsp:include page="/includes/bulkedit/bulkedit-sendnotifications.jsp"/>
            </p>

            <%@include file="bulkchooseaction_submit_buttons.jsp"%>

            <!-- Hidden field placed here so as not affect the buttons -->
            <webwork:if test="/canDisableMailNotifications() == false">
                <ui:component name="'sendBulkNotification'" template="hidden.jsp" theme="'single'" value="'true'" />
            </webwork:if>
        
            </form>
        </td></tr></table>
    </td>
</tr>
</table>
</body>
</html>
