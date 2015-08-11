<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.atlassian.jira.ComponentManager"%>
<%@ page import="com.atlassian.jira.ManagerFactory"%>
<%@ page import="com.atlassian.jira.config.properties.APKeys"%>
<%@ page import="com.atlassian.jira.config.properties.ApplicationProperties"%>
<%@ page import="com.atlassian.jira.config.properties.LookAndFeelBean"%>
<%@ page import="com.atlassian.plugin.webresource.UrlMode" %>
<%@ page import="com.atlassian.plugin.webresource.WebResourceManager" %>
<%@ page import="com.opensymphony.util.TextUtils" %>
<%@ page import="com.atlassian.jira.plugin.keyboardshortcut.KeyboardShortcutManager" %>
<%@ taglib uri="sitemesh-decorator" prefix="decorator" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%--


  =============++========++++==========================
    NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE
  =============++========++++==========================

IF YOU EDIT THIS - BE SURE TO CHECK IF YOU NEED TO EDIT DECORATORS/FRONTPAGE.JSP && popups.jsp && header-deprecated
 
--%>
<%
ApplicationProperties ap = ManagerFactory.getApplicationProperties();
LookAndFeelBean lAndF = LookAndFeelBean.getInstance(ap);
%>
<decorator:usePage id="originalPage" />
<%
    //this is all to ensure that the title prefix is not the same as the title.
    //See JRA-404
    String origTitle = originalPage.getTitle();
    String titlePrefix = ap.getDefaultBackedString(APKeys.JIRA_TITLE);
    if (origTitle != null && origTitle.equals(titlePrefix))
    {
        titlePrefix = null;
    }

    WebResourceManager webResourceManager = ComponentManager.getInstance().getWebResourceManager();
    final KeyboardShortcutManager shortcutManager = ComponentManager.getComponentInstanceOfType(KeyboardShortcutManager.class);
%>
<html>
<head>
    <title><decorator:title default="Welcome" /><% if (titlePrefix != null) { %> - <%= TextUtils.htmlEncode(titlePrefix) %> <% } %></title>

    <decorator:head/>
    <meta http-equiv="Content-Type" content="<%= ap.getContentType() %>" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="-1" />
    <%@ include file="/includes/decorators/xsrftoken.jsp" %>
    <link rel="shortcut icon" href="<%= webResourceManager.getStaticResourcePrefix(UrlMode.RELATIVE)%>/favicon.ico">
    <link rel="icon" type="image/png" href="<%= webResourceManager.getStaticResourcePrefix(UrlMode.RELATIVE)%>/images/icons/favicon.png">

    <%-- TODO: Do this nicer --%>
    <script type="text/javascript">var contextPath = '<%=request.getContextPath()%>';</script>
<%
    webResourceManager.requireResource("jira.webresources:global-static");
    webResourceManager.requireResource("jira.webresources:jira-global");
    webResourceManager.requireResource("jira.webresources:key-commands");
    webResourceManager.requireResource("jira.webresources:header");
    webResourceManager.includeResources(out, UrlMode.RELATIVE);
%>
    <script type="text/javascript" src="<%=request.getContextPath() + shortcutManager.includeShortcuts()%>"></script>
</head>

<%@ include file="/includes/decorators/bodytop.jsp" %>

