<%@ page import="com.atlassian.jira.ComponentManager"%>
<%@ page import="com.atlassian.jira.config.ReindexMessageManager"%>
<%@ page import="com.atlassian.jira.plugin.webfragment.model.JiraHelper"%>
<%@ page import="com.atlassian.jira.web.component.webfragment.WebFragmentWebComponent"%>
<%@ page import="com.atlassian.seraph.auth.DefaultAuthenticator" %>
<%@ page import="com.atlassian.util.profiling.UtilTimerStack" %>
<%@ page import="com.opensymphony.user.User" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%
    // Lets highlight the admin section menu
    request.setAttribute("jira.selected.section", "admin_link");
%>
<%@ include file="/includes/decorators/header-deprecated.jsp" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<script language="JavaScript" src="<%= ComponentManager.getInstance().getWebResourceManager().getStaticResourcePrefix() %>/includes/js/adminMenu.js"></script>

<table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#ffffff">
<tr>
    <td class="adminMenuWrap">
        <div id="adminMenu">
        <%
            UtilTimerStack.push("Rendering Admin menu");
            WebFragmentWebComponent webFragment = (WebFragmentWebComponent) ComponentManager.getComponentInstanceOfType(WebFragmentWebComponent.class);
        %>
        <%= webFragment.getHtml("templates/plugins/webfragments/system-admin.vm", "system.admin", new JiraHelper(request)) %>
        <%
            UtilTimerStack.pop("Rendering Admin menu");
        %>
        </div>
    </td>
    <td width="1" bgcolor="#bbbbbb"><img src="<%= request.getContextPath() %>/images/border/spacer.gif" height="1" width="1" alt=""/></td>
    <td valign="top">
        <table cellspacing="0" cellpadding="10" border="0" width="100%">
            <%
                HttpSession httpSession = request.getSession(false); //dont create the session if there isnt one
                User remoteUser = httpSession != null ? (User) httpSession.getAttribute(DefaultAuthenticator.LOGGED_IN_KEY) : null;

                // JRA-19624 We need this cast for now so we can compile JSPs as Java 1.4
                ReindexMessageManager reindexMessageManager = (ReindexMessageManager) ComponentManager.getComponentInstanceOfType(ReindexMessageManager.class);
                final String message = reindexMessageManager.getMessage(remoteUser);
                if (!StringUtils.isBlank(message))
                {
            %>
        <tr><td><div id="adminMessages" class="notify info"><span class="help"><webwork:component template="help.jsp" name="'reindex_after_configuration_changes'" ></webwork:component></span>
            <%= message %>
        </div></td></tr>
            <%
                }
            %>
        <tr><td><decorator:body />
        </td></tr></table>
    </td>
</tr>
</table>

<%@ include file="/includes/decorators/footer.jsp" %>
