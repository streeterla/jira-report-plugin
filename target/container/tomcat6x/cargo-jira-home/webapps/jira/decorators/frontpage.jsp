<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.atlassian.jira.config.properties.APKeys"%>
<%@ page import="com.atlassian.jira.config.properties.ApplicationProperties"%>
<%@ page import="com.atlassian.jira.plugin.navigation.FooterModuleDescriptor"%>
<%@ page import="com.atlassian.jira.plugin.navigation.PluggableFooter"%>
<%@ page import="com.atlassian.jira.plugin.util.ModuleDescriptorComparator"%>
<%@ page import="java.util.Collections"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="com.atlassian.jira.config.properties.LookAndFeelBean" %>
<%@ page import="com.atlassian.jira.ManagerFactory" %>
<%@ page import="com.atlassian.plugin.webresource.WebResourceManager" %>
<%@ page import="com.atlassian.jira.ComponentManager" %>
<%@ page import="com.opensymphony.util.TextUtils" %>
<%@ page import="com.atlassian.jira.util.BrowserUtils" %>
<%@ page import="com.atlassian.jira.plugin.keyboardshortcut.KeyboardShortcutManager" %>
<%@ taglib uri="sitemesh-decorator" prefix="decorator" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%
    WebResourceManager webResourceManager = ComponentManager.getInstance().getWebResourceManager();
    final KeyboardShortcutManager shortcutManager = ComponentManager.getComponentInstanceOfType(KeyboardShortcutManager.class);
    ApplicationProperties ap = ManagerFactory.getApplicationProperties();
    final LookAndFeelBean lAndF = LookAndFeelBean.getInstance(ap);
    String topBgColour = lAndF.getTopBackgroundColour();
    String topSepBgColour = lAndF.getTopSeparatorBackgroundColor();
    String menuBgColour = lAndF.getMenuBackgroundColour();
    String linkColour = lAndF.getTextLinkColour();
    String linkAColour = lAndF.getTextActiveLinkColour();
    String applicationID = lAndF.getApplicationID();

    //don't use default backed string here, as we will use the large logo
    String jiraLogo = lAndF.getLogoUrl();
    if (jiraLogo != null && !jiraLogo.startsWith("http://") && !jiraLogo.startsWith("https://"))
    {
        jiraLogo = webResourceManager.getStaticResourcePrefix() + jiraLogo;
    }

    String userAgent = TextUtils.noNull(request.getHeader("USER-AGENT"));
    boolean logoNeedsOpacityFix = jiraLogo != null && jiraLogo.endsWith(".png") && BrowserUtils.isFilterBasedPngOpacity(userAgent);
%>
<html>
<head>
	<title><%= TextUtils.htmlEncode(ap.getDefaultBackedString(APKeys.JIRA_TITLE)) %> - <decorator:title default="New Generation Issue Tracking" /></title>
    <meta http-equiv="Content-Type" content="<%= ap.getContentType() %>" />
    <%@ include file="/includes/decorators/xsrftoken.jsp" %>
<%
    webResourceManager.requireResource("jira.webresources:global-static");
    webResourceManager.requireResource("jira.webresources:jira-global");
    webResourceManager.includeResources(out);
%>
    <script type="text/javascript" src="<%=request.getContextPath() + shortcutManager.includeShortcuts()%>"></script>
</head>

<body id="<%= applicationID %>" class="lp <decorator:getProperty property="body.class" />">
<div id="header">
    <div id="header-top">
        <a id="logo" href="<%= request.getContextPath() %>/secure/Dashboard.jspa">
            <webwork:component name="'default'" template="logoWithOpacity.jsp" >
                <webwork:param name="'needsOpacityFix'"><%= logoNeedsOpacityFix %></webwork:param>
                <webwork:param name="'logoTitle'"><%= TextUtils.htmlEncode(ap.getString(APKeys.JIRA_TITLE)) %></webwork:param>
                <webwork:param name="'logoUrl'"><%= jiraLogo %></webwork:param>
                <webwork:param name="'logoWidth'"><%= lAndF.getLogoWidth() %></webwork:param>
                <webwork:param name="'logoHeight'"><%= lAndF.getLogoHeight() %></webwork:param>
            </webwork:component>
        </a>
        <span style="float:right;padding:.5em;">
            <webwork:component name="'default'" template="help.jsp">
                <webwork:param name="'align'" value="'middle'"/>
            </webwork:component>
        </span>
    </div>
</div>
<div id="main-content" >
    <div class="active-area">
        <decorator:body />
    </div>
</div>
<%
    // Get all the footer module descriptions and sort them by order
    List footerPlugins = ComponentManager.getInstance().getPluginAccessor().getEnabledModuleDescriptorsByClass(FooterModuleDescriptor.class);
    Collections.sort(footerPlugins, ModuleDescriptorComparator.COMPARATOR);

    // Render all the footer plugins
    for (Iterator iterator = footerPlugins.iterator(); iterator.hasNext();)
    {
        FooterModuleDescriptor footerModuleDescriptor = (FooterModuleDescriptor) iterator.next();
        PluggableFooter pluggableFooter = (PluggableFooter)footerModuleDescriptor.getModule();
%>
<%= pluggableFooter.getSmallFooterHtml(request) %>
<%
    }
%>
</body>
</html>
