<%@ page import="com.atlassian.jira.ComponentManager"%>
<%@ page import="com.atlassian.jira.plugin.webfragment.model.JiraHelper"%>
<%@ page import="com.atlassian.jira.web.component.webfragment.WebFragmentWebComponent"%>
<%@ page import="com.atlassian.util.profiling.UtilTimerStack"%>
<%@ page import="org.ofbiz.core.entity.GenericValue"%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'common.words.project'"/>: <webwork:property value="project/string('name')" /></title>
</head>
<body>
<%@ include file="/includes/errormessages.jsp" %>
<%@ include file="/includes/admin/project/summary.jsp" %>

<webwork:property value="project" id="project">
<%
    UtilTimerStack.push("Rendering view project operations");
    GenericValue project = (GenericValue) pageContext.getAttribute("project");
    WebFragmentWebComponent webFragment = (WebFragmentWebComponent) ComponentManager.getComponentInstanceOfType(WebFragmentWebComponent.class);
    JiraHelper jiraHelper = new JiraHelper(request, project);
%>
<%= webFragment.getHtml("templates/plugins/webfragments/system-view-project-operations.vm", "system.view.project.operations", jiraHelper) %>
<%
    UtilTimerStack.pop("Rendering view project operations");
%>

<table cellpadding="3" cellspacing="3" border="0" width="100%">
<tr width="100%">
<td width="49%" valign="top">
	<!-- show components for this project -->
	<jsp:include page="/includes/panels/project/components.jsp" />
</td>
<td width="2%">&nbsp;&nbsp;</td>
<td width="49%" valign="top">
	<!-- show version for this project -->
	<jsp:include page="/includes/panels/project/versions.jsp" />
</td>
</tr>
</table>

</body>
</html>

</webwork:property>
