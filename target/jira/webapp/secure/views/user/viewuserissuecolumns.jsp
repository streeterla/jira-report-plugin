<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<html>
<head>
	<title><webwork:text name="'issue.columns.user.title'"/></title>
    <content tag="section">find_link</content>
</head>

<body>
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="ie-f">
<tr>
<td width="200" bgcolor="#f0f0f0" valign="top">
    <jira:formatuser user="/user" type="'fullProfile'" id="'view_user_issue_cols'"/>
</td>
<td bgcolor="#ffffff" valign="top">
    <div id="jqlcomponent" class="issue-nav-wrap">

    <page:applyDecorator name="jirapanel">
        <page:param name="title"><webwork:text name="'issue.columns.user.title'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="action">/secure/views/user/<webwork:property value="actionName"/>.jspa</page:param>
        <page:param name="helpURL">issuecolumn_hiding_and_reordering</page:param>
        <webwork:text name="'issue.columns.user.description.first.line'">
            <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/IssueNavigator.jspa"></webwork:param>
            <webwork:param name="'value1'"></a></webwork:param>
        </webwork:text>
        <br>
        <webwork:text name="'issue.columns.description.second.line'"/>

        <webwork:if test="sampleIssues/empty == false">
            <ul class="actionlist">
                <webwork:if test="/usingDefaultColumns == false">
                    <li>
                        <span class="actionlabel"><a href="<webwork:property value="actionName"/>.jspa?operation=5"><webwork:text name="'issue.columns.restore.defaults'"/></a></span>
                        <font size="1">(<webwork:text name="'issue.columns.defaults.are'"/>
                        <webwork:iterator value="/defaultColumns" status="'columnStatus'">
                            <webwork:property value="./navigableField">
                                <webwork:text name="./nameKey"/><webwork:if test="@columnStatus/last == false"> |</webwork:if>
                            </webwork:property>
                        </webwork:iterator>)</font>
                    </li>
                </webwork:if>
                <li id="toggleActionsColumn">
                    <webwork:if test="/actionsAndOperationsShowing/booleanValue() == true">
                        <span class="actionlabel"><webwork:text name="'issue.actions.and.operations'"/>:</span><a href="<webwork:property value="actionName"/>!hideActionsColumn.jspa"><webwork:text name="'issue.actions.and.operations.column.hide'"/></a>
                    </webwork:if>
                    <webwork:else>
                        <span class="actionlabel"><webwork:text name="'issue.actions.and.operations'"/>:</span><a href="<webwork:property value="actionName"/>!showActionsColumn.jspa"><webwork:text name="'issue.actions.and.operations.column.show'"/></a>
                    </webwork:else>
                </li>
                <li>
                    <form name="addcolumnform" method="post" action="<webwork:property value="actionName"/>.jspa">
                        <span class="actionlabel"><webwork:text name="'issue.columns.add.new.columns'"/></span>
                        <ui:select label="'Column to add'" name="'fieldId'" theme="'single'" list="addableColumns" listKey="'id'" listValue="'/text(nameKey)'">
                            <ui:param name="'headerrow'"><webwork:text name="'issue.columns.select.column'"/></ui:param>
                            <ui:param name="'noTable'">true</ui:param>
                        </ui:select>
                        <input type="submit" name="add" value="<webwork:text name="'issue.columns.add.button'"/>">
                        <ui:component name="'operation'" value="'1'" template="hidden.jsp" />
                    </form>
                </li>
            </ul>            
        </webwork:if>
    </page:applyDecorator>

    <webwork:property value="'ViewUserIssueColumns.jspa'" id="actionUrl"/>
    <webwork:property value="/actionsAndOperationsShowing" id="showActionsColumn"/>
    <%@ include file="/includes/panels/issuecolumns.jsp" %>

    </div>
</td></tr></table>
</body>
</html>
