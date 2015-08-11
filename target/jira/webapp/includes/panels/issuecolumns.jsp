<%@ page import="com.atlassian.jira.web.action.issue.IssueNavigator,
                 java.util.List,
                 com.atlassian.jira.web.component.IssuePager,
                 com.atlassian.jira.web.component.IssueTableLayoutBean,
                 com.atlassian.jira.web.component.IssueTableWebComponent,
                 com.atlassian.jira.web.action.user.ViewUserIssueColumns,
                 com.atlassian.jira.web.component.AllIssuesIssuePager,
                 com.atlassian.jira.web.action.AbstractViewIssueColumns"%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
&nbsp;

<h2 class="formtitle"><webwork:text name="'issue.columns.reorder.columns'"/></h2>
<p>
    <webwork:text name="'issue.columns.reorder.instructions.first.line'"/><br>
    <webwork:text name="'issue.columns.reorder.instructions.second.line'">
        <webwork:param name="'value0'"><img src="<%= request.getContextPath()%>/images/icons/prev.gif" height=16 width=16 border=0></webwork:param>
        <webwork:param name="'value1'"><img src="<%= request.getContextPath()%>/images/icons/next.gif" height=16 width=16 border=0></webwork:param>
        <webwork:param name="'value2'"><img src="<%= request.getContextPath()%>/images/icons/trash_16.gif" height=16 width=16 border=0></webwork:param>
    </webwork:text>
</p>

<webwork:if test="/sampleIssues && /sampleIssues/size > 0">


<table id="searchresult_table" border="0" cellpadding="3" cellspacing="1" width="100%">
    <tr><td>


<%-- Set this so that it can be used further down --%>
<webwork:property value="/" id="issueColumns" />

<%
    Long filterId = (Long) request.getAttribute("filterId");
    String actionUrl = (String) request.getAttribute("actionUrl");
    Boolean showActionsColumn = (Boolean) request.getAttribute("showActionsColumn");

    AbstractViewIssueColumns issueColumns = (AbstractViewIssueColumns) request.getAttribute("issueColumns");

    List currentPage = issueColumns.getSampleIssues();
    List columns = issueColumns.getColumns();
    IssueTableLayoutBean layoutBean = new IssueTableLayoutBean(columns);
    layoutBean.setSortingEnabled(false);
    layoutBean.setShowHeaderDescription(true);
    layoutBean.addCellDisplayParam(IssueTableLayoutBean.CELL_NO_LINK, Boolean.TRUE);
    layoutBean.setAlternateRowColors(false);
    layoutBean.setShowTableEditHeader(true);
    layoutBean.setFilterId(filterId);
    layoutBean.setActionUrl(actionUrl);
    layoutBean.setShowActionColumn(showActionsColumn != null && showActionsColumn.booleanValue());

%>
<%= new IssueTableWebComponent().getHtml(layoutBean, currentPage, null) %>

</webwork:if>
<webwork:else>

    <page:applyDecorator name="jirapanel">
        <page:param name="width">100%</page:param>
        <webwork:text name="'issue.columns.no.issues'"/>
    </page:applyDecorator>

</webwork:else>

</td></tr></table>
</p>
