<%@ taglib uri="webwork" prefix="webwork" %>
<%@ page import="java.util.List"%>
<%@ page import="com.atlassian.jira.ComponentManager"%>
<%@ page import="com.atlassian.jira.web.component.IssueTableLayoutBean"%>
<%@ page import="com.atlassian.core.user.UserUtils"%>
<%@ page import="com.atlassian.jira.web.component.TableLayoutFactory"%>
<%@ page import="com.opensymphony.user.User"%>
<%@ page import="com.atlassian.jira.web.component.IssueTableWebComponent"%>
<%@ page import="com.atlassian.jira.issue.fields.layout.column.ColumnLayoutItem"%>
<%@ page import="com.atlassian.jira.util.JiraKeyUtils" %>
<webwork:property value="." id="issues"/>
<webwork:property value="/deleteColumnLayoutItem(.. , @isOutward)" id="columnLayoutItem"/>
<webwork:if test=". != null && ./empty == false">
    <%
        List issues = (List) pageContext.getAttribute("issues");
        ColumnLayoutItem columnLayoutItem = (ColumnLayoutItem) pageContext.getAttribute("columnLayoutItem");
        IssueTableWebComponent issueTable = new IssueTableWebComponent();
        User user = UserUtils.getUser(request.getRemoteUser());
        TableLayoutFactory layoutFactory = (TableLayoutFactory) ComponentManager.getComponentInstanceOfType(TableLayoutFactory.class);
        IssueTableLayoutBean layout = layoutFactory.getLinkedIssuesLayout(user, columnLayoutItem);
        layout.addCellDisplayParam(JiraKeyUtils.STRIKE_THROUGH_CLOSED_KEYS, "true");
        out.print(issueTable.getHtml(layout, issues, null));
    %>
</webwork:if>
<webwork:else>&nbsp;</webwork:else>
