<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.atlassian.jira.ComponentManager"%>
<%@ page import="com.atlassian.jira.ManagerFactory"%>
<%@ page import="com.atlassian.jira.config.properties.ApplicationProperties"%>
<%@ page import="com.atlassian.jira.license.LicenseJohnsonEventRaiser"%>
<%@ page import="com.atlassian.johnson.JohnsonEventContainer"%>
<%@ page import="com.atlassian.johnson.event.Event"%>
<%@ page import="com.atlassian.johnson.event.EventType"%>
<%@ page import="com.atlassian.plugin.webresource.WebResourceManager" %>
<%@ page import="com.opensymphony.util.TextUtils" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-decorator" prefix="decorator" %>
<%
    ApplicationProperties ap = ManagerFactory.getApplicationProperties();
    final WebResourceManager webResourceManager = ComponentManager.getInstance().getWebResourceManager();
%>
<html>
<%
    JohnsonEventContainer appEventContainer = JohnsonEventContainer.get(pageContext.getServletContext());
    //if there are Events outstanding then display them in a table
    if (appEventContainer.hasEvents() ) {
%>
<body class="errorpage">
<meta http-equiv="Refresh" content="30;"/>
<h2><webwork:text name="'system.error.access.constraints.title'"/></h2>

<p class="notify error"><webwork:text name="'system.error.access.constrinats.desc'"/></p>
<table class="grid" width="100%" bgcolor="#ffffff">

    <tr bgcolor="#f0f0f0">
        <td class="colHeaderLink" width="40%">
            <b><webwork:text name="'common.words.description'"/></b>
        </td>
        <td class="colHeaderLink" nowrap>
            <b><webwork:text name="'common.words.time'"/></b>
        </td>
        <td class="colHeaderLink">
            <b><webwork:text name="'common.words.level'"/></b>
        </td>
        <td class="colHeaderLink" width="40%">
            <b><webwork:text name="'common.words.exception'"/></b>
        </td>
    </tr>

    <%
        com.atlassian.jira.web.util.ExternalLinkUtil externalLinkUtil = com.atlassian.jira.web.util.ExternalLinkUtilImpl.getInstance();
        Collection events  = appEventContainer.getEvents();
        for (Iterator iterator = events.iterator(); iterator.hasNext();)
        {
            Event event = (Event) iterator.next();
            %>
    <tr bgcolor="#ffffff">
        <td bgcolor="#fffff0">
        <% if (EventType.get("export-illegal-xml").equals(event.getKey())) { %>
            <webwork:component template="help.jsp" name="'autoexport'"><webwork:param name="'helpURLFragment'"/></webwork:component><br/>
        <% } %>
        <%= event.getDesc() %><br/>
        <% if (event.hasProgress()) {%>
            <br/><webwork:text name="'system.error.progress.completed'">
                <webwork:param name="value0"><%=event.getProgress()%></webwork:param>
            </webwork:text>
        <%}%>
        <% if (EventType.get(LicenseJohnsonEventRaiser.LICENSE_INVALID).equals(event.getKey()))
           { %>
           <br/><a href="<%= request.getContextPath() %>/secure/ConfirmInstallationWithLicense!default.jspa"><webwork:text name="'system.error.edit.license'"/></a>
        <% }
           else if (EventType.get(LicenseJohnsonEventRaiser.LICENSE_TOO_OLD).equals(event.getKey()))
           { %>
           <br/><a href="<%= request.getContextPath() %>/secure/ConfirmNewInstallationWithOldLicense!default.jspa"><webwork:text name="'system.error.edit.license.or.evaluate'"/></a>
        <% }
           else if (EventType.get("export-illegal-xml").equals(event.getKey()))
           { %>
           <br/><a href="<%= request.getContextPath() %>/secure/CleanData!default.jspa"><webwork:text name="'system.error.clean.characters.from.database'"/></a><br/>
           <webwork:text name="'system.error.disable.export.on.upgrade.desc'">
               <webwork:param name="value0"><b></webwork:param>
               <webwork:param name="value1"></b></webwork:param>
           </webwork:text> &nbsp;
        <% }
           else if (EventType.get("index-lock-already-exists").equals(event.getKey()))
           { %>
            <p>
                <webwork:text name="'system.error.unexpected.index.lock.found.desc1'"/>
                <br/>
                <br/>
                <%
                   Object lockFiles = event.getAttribute("lockfiles");
                   if (lockFiles != null)
                   {
                       out.println(lockFiles);
                   }
                %>
                <br/>
                <br/>
                <webwork:text name="'system.error.unexpected.index.lock.found.desc2'"/>
            </p>
            <p>
                <webwork:text name="'system.error.unexpected.index.lock.found.desc3'">
                    <webwork:param name="value0"><strong></webwork:param>
                    <webwork:param name="value1"></strong></webwork:param>
                </webwork:text>
            </p>
        <% }
           else if (EventType.get("upgrade").equals(event.getKey()))
           {
               String exportFilePath = ManagerFactory.getUpgradeManager().getExportFilePath();
               if (TextUtils.stringSet(exportFilePath))
               {
               %>
               <br/>
                <webwork:text name="'system.error.data.before.upgrade.exported.to'">
                    <webwork:param name="value0"><%= exportFilePath %></webwork:param>
                </webwork:text>
            <% } %>
        <% } %>
            <!-- (<webwork:text name="'system.error.type'">
                    <webwork:param name="value0"><%= event.getKey().getType() %></webwork:param>
                </webwork:text>) -->

        </td>
        <td nowrap><%=event.getDate()%></td>
        <td nowrap><%=event.getLevel().getLevel()%> </td>
        <td><pre><%= event.getException() == null ? "" : event.getException() %></pre></td>
    </tr>
    <% } %>
</table>
<% } else { %>
<body>
<meta http-equiv="Refresh" content="30;"/>
    <h2><webwork:text name="'system.error.access.constraints.title'"/></h2>

        <p class="notify success"><webwork:text name="'system.error.no.problems.accessing.jira'"/></p>
        <p><a href="<%=request.getContextPath()%>/secure/Dashboard.jspa"><webwork:text name="'system.error.go.to.dashboard'"/></a></p>
 <% } %>

    </body>
</html>
