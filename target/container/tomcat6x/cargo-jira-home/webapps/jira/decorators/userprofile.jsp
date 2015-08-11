<%@ page import="com.atlassian.jira.ComponentManager" %>
<%@ page import="com.atlassian.jira.security.JiraAuthenticationContext" %>
<%@ page import="webwork.action.ActionContext" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<%@ include file="/includes/decorators/header-deprecated.jsp" %>
<%
    JiraAuthenticationContext authenticationContext = ComponentManager.getInstance().getJiraAuthenticationContext();
    final HttpServletRequest originalRequest = ActionContext.getRequest();
    try
    {
        //full user format requires the request to be set in the ActionContext :(
        ActionContext.setRequest(request);
        if(authenticationContext.getUser() != null)
        {
            request.setAttribute("username", authenticationContext.getUser().getName());
        }
%>
<body>

<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr>
<td width="200" bgcolor="#f0f0f0" valign="top" style="border-right: 1px solid #cccccc;">
    <jira:formatuser user="@username" type="'fullProfile'" id="'view_profile'"/>
</td>
<td valign="top" height="100%" bgcolor="#ffffff">
    <div style="padding:1em;">
        <decorator:body />
    </div>
</td>
</tr>
</table>

<%
    }
    finally
    {
        ActionContext.setRequest(originalRequest);
    }
%>
<%@ include file="/includes/decorators/footer.jsp" %>
