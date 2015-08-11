<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.atlassian.jira.ComponentManager,
                 com.atlassian.jira.ManagerFactory,
                 com.atlassian.jira.config.properties.APKeys" %>
<%@ page import="com.atlassian.jira.config.properties.ApplicationProperties" %>
<%@ page import="com.atlassian.jira.config.properties.LookAndFeelBean" %>
<%@ page import="com.atlassian.jira.util.BrowserUtils" %>
<%@ page import="com.atlassian.plugin.webresource.WebResourceManager" %>
<%@ page import="com.opensymphony.util.TextUtils" %>
<%@ page import="com.opensymphony.user.User" %>
<%@ taglib uri="sitemesh-decorator" prefix="decorator" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="jiratags" prefix="jira" %>

<%
    ApplicationProperties ap = ManagerFactory.getApplicationProperties();
    WebResourceManager webResourceManager = ComponentManager.getInstance().getWebResourceManager();
    final LookAndFeelBean lAndF = LookAndFeelBean.getInstance(ap);
%>

<%-- get the decorator page object, for use within the decorator --%>
<decorator:usePage id="decoratorPage"/>
<html>
<head>
    <title><decorator:title default="JIRA"/></title>
    <meta http-equiv="Content-Type" content="<%= ap.getContentType() %>"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="-1"/>

    <%@ include file="/includes/decorators/xsrftoken.jsp" %>
    <%
        webResourceManager.requireResource("jira.webresources:global-static");
        webResourceManager.requireResource("jira.webresources:jira-global");
        webResourceManager.includeResources(out);
    %>
</head>
<%
    String topBgColour = lAndF.getTopBackgroundColour();
    String topSepBgColour = lAndF.getTopSeparatorBackgroundColor();
    String menuBgColour = lAndF.getMenuBackgroundColour();
    String linkColour = lAndF.getTextLinkColour();
    String linkAColour = lAndF.getTextActiveLinkColour();
    String applicationID = lAndF.getApplicationID();

    String jiraLogo = lAndF.getLogoUrl();
    if (jiraLogo != null && !jiraLogo.startsWith("http://") && !jiraLogo.startsWith("https://"))
    {
        jiraLogo = request.getContextPath() + jiraLogo;
    }

    String userAgent = TextUtils.noNull(request.getHeader("USER-AGENT"));
    boolean logoNeedsOpacityFix = jiraLogo != null && jiraLogo.endsWith(".png") && BrowserUtils.isFilterBasedPngOpacity(userAgent);
    final User user = ComponentManager.getInstance().getJiraAuthenticationContext().getUser();
    request.setAttribute("username", user == null ? null : user.getName());
%>
<body id="<%= applicationID %>" <decorator:getProperty property="body.class" writeEntireProperty="true"/>>
<div id="header-top">
    <table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#ffffff">
        <tr>
            <td bgcolor="<%= topBgColour %>">
                <webwork:component name="'default'" template="logoWithOpacity.jsp">
                    <webwork:param name="'needsOpacityFix'"><%= logoNeedsOpacityFix %></webwork:param>
                    <webwork:param name="'logoTitle'"><%= TextUtils.htmlEncode(ap.getDefaultBackedString(APKeys.JIRA_TITLE)) %></webwork:param>
                    <webwork:param name="'logoUrl'"><%= jiraLogo %></webwork:param>
                    <webwork:param name="'logoWidth'"><%= lAndF.getLogoWidth() %></webwork:param>
                    <webwork:param name="'logoHeight'"><%= lAndF.getLogoHeight() %></webwork:param>
                </webwork:component>
            </td>
            <td bgcolor="<%= topBgColour %>" align="right">
                <webwork:if test="@username != null">
                    <span id="popup-profile-user"><jira:formatuser user="@username" type="'fullName'" id="'popup-user-link'"/></span>
                </webwork:if>
            </td>
        </tr>
        <tr>
            <td colspan="2" bgcolor="<%= menuBgColour %>">
                <img src="<%= request.getContextPath() %>/images/border/spacer.gif" height="5" width="1" alt=""></td>
        </tr>
    </table>
    <table border="0" cellpadding="10" cellspacing="0" width="100%" bgcolor="#ffffff">
        <tr>
            <td>
                <decorator:body/>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
