<%@ page import="com.atlassian.jira.ComponentManager" %>
<%@ page import="com.atlassian.jira.config.properties.ApplicationProperties" %>
<%@ page import="com.atlassian.jira.config.properties.LookAndFeelBean" %>
<%@ page import="com.atlassian.jira.portal.PortletConfiguration" %>
<%@ page import="com.atlassian.jira.web.portlet.bean.PortletRenderer" %>
<%@ page import="com.atlassian.plugin.webresource.UrlMode" %>
<%@ page import="com.atlassian.plugin.webresource.WebResourceManager" %>
<%@ page import="webwork.action.CoreActionContext" %>
<%@ taglib uri="webwork" prefix="webwork" %>

<%
    final ApplicationProperties applicationProperties = ComponentManager.getInstance().getApplicationProperties();
    final WebResourceManager webResourceManager = ComponentManager.getInstance().getWebResourceManager();
%>
<%
    webResourceManager.requireResource("jira.webresources:global-static");
    webResourceManager.requireResource("jira.webresources:jira-global");
    webResourceManager.includeResources(out, UrlMode.ABSOLUTE);
%>
<webwork:property value="portletConfiguration">
    <%= new PortletRenderer().renderPortlet(request, response, (PortletConfiguration) CoreActionContext.getValueStack().findValue((String) null), false) %>
</webwork:property>
