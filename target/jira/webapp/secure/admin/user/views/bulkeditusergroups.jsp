<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.bulkeditgroups.title'"/></title>
</head>
<body>
<page:applyDecorator name="jiraform">
    <page:param name="action">BulkEditUserGroups.jspa</page:param>
    <page:param name="title"><webwork:text name="'admin.bulkeditgroups.title'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="description">
        <webwork:text name="'admin.bulkeditgroups.description'"/>
        <p>
            <webwork:text name="'admin.bulkeditgroups.description2'"/>
        </p>
        <ul>
            <li>
                <webwork:text name="'admin.bulkeditgroups.memberslist.description'"/>
            </li>
            <li>
                <webwork:text name="'admin.bulkeditgroups.removing.description'">
                <webwork:param name="'value0'"><strong></webwork:param>
                <webwork:param name="'value1'"></strong></webwork:param>
                </webwork:text>
            </li>
            <li>
                <webwork:text name="'admin.bulkeditgroups.adding.description'">
                <webwork:param name="'value0'"><strong></webwork:param>
                <webwork:param name="'value1'"></strong></webwork:param>
                </webwork:text>
            </li>
        </ul>
        <p>
        <webwork:text name="'admin.bulkeditgroups.step.one'">
            <webwork:param name="'value0'"><strong></webwork:param>
            <webwork:param name="'value1'"></strong></webwork:param>
        </webwork:text><br>
        <webwork:text name="'admin.bulkeditgroups.step.two'">
            <webwork:param name="'value0'"><strong></webwork:param>
            <webwork:param name="'value1'"></strong></webwork:param>
        </webwork:text>
        </p>
    </page:param>
    <webwork:if test="prunedUsersToAssign != null">
        <tr>
            <td>
                <div id="prunePanel" class="infoBox" style="display: none; cursor: pointer;" onclick="pruneErroneousNames();">
                    <webwork:text name="'admin.bulkeditgroups.prune.erroneous.names'">
                        <webwork:param name="'value0'"><a id="prune" href="#" onclick="pruneErroneousNames();return false;"></webwork:param>
                        <webwork:param name="'value1'"></a></webwork:param>
                    </webwork:text>
                </div>
            </td>
        </tr>
    </webwork:if>
    <tr>
    <td>
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
        <tr>
            <td bgcolor="#fffff0" align="center">
                <b><webwork:text name="'admin.bulkeditgroups.selected.x.of.y.groups'">
                    <webwork:param name="'value0'"><webwork:property value="selectedGroupsUserHasPermToSee/size"/></webwork:param>
                    <webwork:param name="'value1'"><webwork:property value="allVisibleGroups/size"/></webwork:param>
                </webwork:text></b>
            </td>
            <td bgcolor="#fffff0" align="center">
                <b>
                <webwork:if test="membersList/size == 1">
                    <webwork:text name="'admin.bulkeditgroups.n.group.members'">
                        <webwork:param name="'value0'"><webwork:property value="assignedUsersCount"/></webwork:param>
                    </webwork:text>
                </webwork:if>
                <webwork:else>
                    <webwork:text name="'admin.bulkeditgroups.group.members'"/>
                </webwork:else>
                </b>
            </td>
            <td bgcolor="#fffff0" align="center">
                <b><webwork:text name="'admin.bulkeditgroups.add.group.members'"/></b>
            </td>
        </tr>
        <tr>
            <td bgcolor="#ffffff" align="center">
                &nbsp;
            </td>
            <td bgcolor="#ffffff" align="center">
                <input name="unassign" type="submit" value="<webwork:text name="'admin.editusergroups.leave'"/> &gt;&gt;">
            </td>
            <td bgcolor="#ffffff" align="center">
                <input name="assign" type="submit" value="&lt;&lt; <webwork:text name="'admin.editusergroups.join'"/>">
            </td>
        </tr>
        <tr>
            <webwork:if test="allVisibleGroups != null && allVisibleGroups/size > 0">
                <td bgcolor="#ffffff" align="center" valign="top" width="33%">
                    <select id="selectedGroupsStr" name="selectedGroupsStr" multiple size="<webwork:property value="listSize(allVisibleGroups/size)" />">
                        <webwork:iterator value="allVisibleGroups">
                            <option <webwork:if test="isGroupSelected(.) == 'true'">selected</webwork:if> value="<webwork:property value="." />"><webwork:property value="." /></option>
                        </webwork:iterator>
                    </select>
                    <p>

                    <div id="groupRefreshPanel" name="groupRefreshPanel" class="infoBox" style="display:none;" onclick="refreshDependentFields();">
                        <webwork:text name="'admin.bulkeditgroups.please.refresh'">
                            <webwork:param name="'value0'"><a id="refresh" href="#" onclick="refreshDependentFields();return false;"></webwork:param>
                            <webwork:param name="'value1'"></a></webwork:param>
                        </webwork:text>
                    </div>
                    <noscript>
                        <div class="noteBox" style="margin: 10px;">
                            <webwork:text name="'admin.bulkeditgroups.please.refresh.no.javascript'">
                                <webwork:param name="'value0'"><input name="refresh" type="submit" value="<webwork:text name="'admin.bulkeditgroups.click.here'"/>"></webwork:param>
                            </webwork:text>
                        </div>
                    </noscript>
                    </p>
                </td>
                <td bgcolor="#ffffff" align=center valign=top width="33%">
                    <webwork:if test="assignedUsersCount > 0">
                        <select id="usersToUnassign" name="usersToUnassign" multiple size="<webwork:property value="assignedUsersListSize" />">
                            <webwork:iterator value="membersList">
                                <optgroup label="<webwork:property value="./name"/>">
                                    <webwork:iterator value="./childOptions">
                                        <option value="<webwork:property value="optionValue(.)"/>">
                                            <webwork:property value="./name"/>
                                        </option>
                                    </webwork:iterator>
                                </optgroup>
                            </webwork:iterator>
                        </select>
                        <webwork:if test="tooManyUsersListed == 'true'">
                            <p>
                            <div class="noteBox">
                                <webwork:text name="'admin.bulkeditgroups.warn.too.many.users.for.groups'">
                                    <webwork:param name="'value0'"><webwork:property value="prettyPrintOverloadedGroups"/></webwork:param>
                                    <webwork:param name="'value1'"><webwork:property value="maxUsersDisplayedPerGroup"/></webwork:param>
                                </webwork:text>
                            </div>
                            </p>
                        </webwork:if>
                    </webwork:if>
                    <webwork:else>
                        <webwork:text name="'admin.bulkeditgroups.no.users.in.selection'"/>
                    </webwork:else>
                </td>
                <ui:component name="'usersToAssignStr'" value="usersToAssignStr" template="multiuserpicker.jsp">
                    <ui:param name="'nolabel'" value="'true'"/>
                    <ui:param name="'style'" value="''"/>
                </ui:component>
            </webwork:if>
            <webwork:else>
                <td colspan="3">
                    <webwork:text name="'admin.bulkeditgroups.no.groups'"/>
                </td>
            </webwork:else>
        </tr>
        </table>
    </td>
    </tr>

</page:applyDecorator>

<script language="JavaScript" type="text/javascript">
    <!--
    var groupsSelectList = document.getElementById("selectedGroupsStr");
    var originalGroupValue = getMultiSelectValues(groupsSelectList);

    function refreshDependentFields()
    {
        document.jiraform.submit();
    }

    function toggleRefresh()
    {
        var groupRefreshPanel = document.getElementById("groupRefreshPanel");
        if (originalGroupValue == getMultiSelectValues(groupsSelectList) && groupRefreshPanel != null)
        {
            groupRefreshPanel.style.display = 'none';
        }
        else
        {
            groupRefreshPanel.style.display = '';
        }
    }

    <webwork:if test="prunedUsersToAssign != null">
    function pruneErroneousNames()
    {
        var usersToAssignElement = document.getElementById("usersToAssignStr");
        usersToAssignElement.value = '<webwork:property value="prunedUsersToAssign"/>';
        var prunePanel = document.getElementById("prunePanel");
        if (prunePanel != null)
        {
            prunePanel.style.display = 'none';
        }
    }

    function showPrunePanel()
    {
        var prunePanel = document.getElementById("prunePanel");
        if (prunePanel != null)
        {
            prunePanel.style.display = '';
        }
    }

    showPrunePanel();
    </webwork:if>

    groupsSelectList.onchange = toggleRefresh;

    toggleRefresh();
//-->
</script>

</body>
</html>
