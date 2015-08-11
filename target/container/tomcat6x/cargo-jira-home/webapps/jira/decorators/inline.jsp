<%@ page import="com.atlassian.jira.ComponentManager" %>
<%@ page import="com.atlassian.plugin.webresource.WebResourceManager" %>
<%@ page import="com.atlassian.plugin.webresource.UrlMode" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%
        WebResourceManager webResourceManager = ComponentManager.getInstance().getWebResourceManager();
        webResourceManager.includeResources(out, UrlMode.RELATIVE);
%>
<%@ include file="/includes/decorators/xsrftoken.jsp" %>
<decorator:body />

