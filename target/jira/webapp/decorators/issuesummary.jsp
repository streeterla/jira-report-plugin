<%@ page import="com.atlassian.jira.exception.IssueNotFoundException" %>
<%@ page import="com.atlassian.jira.exception.IssuePermissionException" %>
<%@ page import="com.atlassian.jira.issue.Issue" %>
<%@ page import="com.atlassian.jira.web.action.issue.IssueSummaryAware" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%--
    A decorator used to print the 'summary' on the left-hand side of the issue.  To use this decorator
    the action must implement IssueSummaryAware.
--%>
<webwork:property value="/" id="action"/>
<%
    Object action = pageContext.getAttribute("action");
    if (action instanceof IssueSummaryAware)
    {
        IssueSummaryAware issueSummaryAware = (IssueSummaryAware) action;
        Issue issue;
        try
        {
            //This call may raise an IssueNotFoundException or an IssuePermissionException. In this case, the
            //input HTML is completetly ignored even though it may contain some data. Changing the decorator
            //to expsose the generated HTML on Exception will expose informatiion that actions did not expect. The actions seem to make the
            //assumption that when an Exception is thrown this decorator will not display the generated html.
            //
            //For example, the CommentAssignIssue action actually generates some valid HTML when trying to assign an
            //issue that a user does not have permission to see. It stops the user from seeing this HTML by throwing
            //an IssueNotFoundException or IssuePermissionException.
            issue = issueSummaryAware.getSummaryIssue();
%>

<%@ include file="/includes/decorators/header.jsp" %>

<decorator:body/>

<%@ include file="/includes/decorators/footer.jsp" %>

<%
        }
        catch (IssueNotFoundException e)
        {
%>
<page:applyDecorator name="navigator">
    <table cellspacing="0" cellpadding="10" border="0" width="100%" bgcolor="#ffffff">
        <tr>
            <td valign="top">
                <page:applyDecorator name="jiraform">
                    <page:param name="title">
                        <webwork:text name="'generic.notloggedin.title'"/>
                    </page:param>
                    <tr>
                        <td colspan="2">
                            <webwork:text name="'admin.errors.issues.current.issue.null'"/>
                        </td>
                    </tr>
                </page:applyDecorator>
            </td>
        </tr>
    </table>
</page:applyDecorator>

<%
        }
        catch (IssuePermissionException e)
        {
%>
<page:applyDecorator name="general">
    <body class="lp">
        <%@ include file="/includes/generic-notloggedin.jsp" %>    
    </body>
</page:applyDecorator>

<%
        }
    }
    else
    {
        throw new UnsupportedOperationException("Action " + action + " does not implement IssueSummaryAware");
    }
%>
