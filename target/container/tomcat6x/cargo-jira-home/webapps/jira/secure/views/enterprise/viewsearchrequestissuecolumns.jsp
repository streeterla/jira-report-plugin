<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'issue.columns.user.title'"/></title>
    <content tag="section">find_link</content>
</head>
<body>
<table cellpadding=0 cellspacing=0 border=0 width=100%>
<tr>
<td class="filterSummaryCell">
    <jsp:include page="/includes/navigator/summary-pane.jsp" />
</td>
<td bgcolor=#ffffff valign=top>

<table width=100% cellpadding=10 cellspacing=0 border=0><tr><td>

    <page:applyDecorator name="jirapanel">
        <page:param name="title"><webwork:text name="'issue.columns.user.title'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="action">/secure/views/enterprise/<webwork:property value="actionName"/>.jspa</page:param>
        <page:param name="helpURL">issuecolumn_hiding_and_reordering</page:param>

        <webwork:if test="/usingDefaultColumns == true">
            <webwork:text name="'issue.columns.searchrequest.description.first.line.nocolumns'">
                <webwork:param name="'value0'"><webwork:property value="/searchRequest/name"/></webwork:param>
                <webwork:param name="'value1'"><a href="<%= request.getContextPath() %>/secure/IssueNavigator.jspa?mode=hide&requestId=<webwork:property value='/filterId'/>"></webwork:param>
                <webwork:param name="'value2'"></a></webwork:param>
            </webwork:text>
        </webwork:if>
        <webwork:else>
            <webwork:text name="'issue.columns.searchrequest.description.first.line.columns'">
                <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/IssueNavigator.jspa?mode=hide&requestId=<webwork:property value='/filterId'/>"></webwork:param>
                <webwork:param name="'value1'"></a></webwork:param>
                <webwork:param name="'value2'"><webwork:property value="/searchRequest/name"/></webwork:param>
            </webwork:text>
        </webwork:else>
        <br>
        <webwork:text name="'issue.columns.description.second.line'"/>

        <webwork:if test="sampleIssues/empty == false">
            <ul class="actionlist">
                <webwork:if test="/usingDefaultColumns == false">
                    <li>
                        <span class="actionlabel"><a href="<webwork:property value="actionName"/>.jspa?operation=5&filterId=<webwork:property value="/filterId"/>"><webwork:text name="'issue.columns.remove.layout'"/></a></span>
                    </li>
                </webwork:if>
                <li>
                    <form name="addcolumnform" method="post" action="<webwork:property value="actionName"/>.jspa">
                        <span class="actionlabel"><webwork:text name="'issue.columns.add.new.columns'"/></span>
                        <ui:select label="'Column to add'" name="'fieldId'" theme="'single'" list="addableColumns" listKey="'id'" listValue="'/text(nameKey)'">
                            <ui:param name="'headerrow'"><webwork:text name="'issue.columns.select.column'"/></ui:param>
                            <ui:param name="'noTable'">true</ui:param>
                        </ui:select>
                        <input type="submit" name="add" value="<webwork:text name="'issue.columns.add.button'"/>">
                        <ui:component name="'operation'" value="'1'" template="hidden.jsp" />
                        <ui:component name="'filterId'" value="/filterId" template="hidden.jsp" />
                    </form>
                </li>
            </ul>
        </webwork:if>
    </page:applyDecorator>

    <webwork:property value="/filterId" id="filterId" />
    <webwork:property value="'ViewSearchRequestIssueColumns.jspa'" id="actionUrl" />
    <%@ include file="/includes/panels/issuecolumns.jsp" %>

</td></tr></table>
</td></tr></table>

</body>
</html>
