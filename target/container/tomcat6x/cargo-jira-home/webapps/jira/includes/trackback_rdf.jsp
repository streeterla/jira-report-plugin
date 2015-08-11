<%@ page import="com.atlassian.core.util.DateUtils" %>
<%@ page import="com.atlassian.jira.ComponentManager" %>
<%@ page import="com.atlassian.jira.config.properties.APKeys" %>
<%@ page import="com.atlassian.jira.config.properties.ApplicationProperties" %>
<%@ page import="com.atlassian.jira.util.velocity.DefaultVelocityRequestContextFactory" %>
<%@ page import="org.ofbiz.core.entity.GenericValue" %>
<%@ page import="webwork.action.CoreActionContext" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%
    final ApplicationProperties applicationProperties = ComponentManager.getInstance().getApplicationProperties();
    if (applicationProperties.getOption(APKeys.JIRA_OPTION_TRACKBACK_RECEIVE))
    {
        final String baseUrl = new DefaultVelocityRequestContextFactory(applicationProperties).getJiraVelocityRequestContext().getCanonicalBaseUrl();
        GenericValue issue = (GenericValue) CoreActionContext.getValueStack().findValue("issue");
        String issueUrl = baseUrl + "/browse/" + issue.getString("key");
        String issueUrlViaId = baseUrl + "/secure/ViewIssue.jspa?id=" + issue.getString("id");
        String issueUrlViaKey = baseUrl + "/secure/ViewIssue.jspa?key=" + issue.getString("key");
        DateUtils dateUtils = new DateUtils(null); //ISO8601 does not need the resource bundle.  We should split this out
        pageContext.setAttribute("dateUtils", dateUtils);
%>
<webwork:bean name="'com.atlassian.core.util.StringUtils'" id="stringUtils" />
<webwork:bean name="'com.opensymphony.util.TextUtils'" id="textUtils" />
<!--
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
         xmlns:dc="http://purl.org/dc/elements/1.1/"
         xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
<rdf:Description rdf:about="<%= issueUrl %>"
    dc:title="[#<webwork:property value="string('key')" />] <webwork:property value="@stringUtils/replaceAll(@textUtils/htmlEncode(string('summary')),'--', '&#45;&#45;')" escape="false" />"
    dc:subject="<webwork:property value="@stringUtils/replaceAll(@textUtils/htmlEncode(/projectManager/project(long('project'))/string('name')),'--', '&#45;&#45;')" escape="false" />"
    dc:description="<webwork:property value="@stringUtils/replaceAll(@textUtils/htmlEncode(@stringUtils/crop(string('description'), 100, ' ...')),'--', '&#45;&#45;')" escape="false" />"
    dc:date="<webwork:property value="@dateUtils/formatDateISO8601(timestamp('created'))" />"
    dc:identifier="<%= issueUrl %>"
    trackback:ping="<%= baseUrl %>/rpc/trackback/<webwork:property value="string('key')"/>"/>

<rdf:Description rdf:about="<%= issueUrlViaId %>"
    dc:title="[#<webwork:property value="string('key')" />] <webwork:property value="@stringUtils/replaceAll(@textUtils/htmlEncode(string('summary')),'--', '&#45;&#45;')" escape="false" />"
    dc:subject="<webwork:property value="@stringUtils/replaceAll(@textUtils/htmlEncode(/projectManager/project(long('project'))/string('name')),'--', '&#45;&#45;')" escape="false" />"
    dc:description="<webwork:property value="@stringUtils/replaceAll(@textUtils/htmlEncode(@stringUtils/crop(string('description'), 100, ' ...')),'--', '&#45;&#45;')" escape="false" />"
    dc:date="<webwork:property value="@dateUtils/formatDateISO8601(timestamp('created'))" />"
    dc:identifier="<%= issueUrlViaId %>"
    trackback:ping="<%= baseUrl %>/rpc/trackback/<webwork:property value="string('key')"/>"/>

<rdf:Description rdf:about="<%= issueUrlViaKey %>"
    dc:title="[#<webwork:property value="string('key')" />] <webwork:property value="@stringUtils/replaceAll(@textUtils/htmlEncode(string('summary')),'--', '&#45;&#45;')" escape="false" />"
    dc:subject="<webwork:property value="@stringUtils/replaceAll(@textUtils/htmlEncode(/projectManager/project(long('project'))/string('name')),'--', '&#45;&#45;')" escape="false" />"
    dc:description="<webwork:property value="@stringUtils/replaceAll(@textUtils/htmlEncode(@stringUtils/crop(string('description'), 100, ' ...')),'--', '&#45;&#45;')" escape="false" />"
    dc:date="<webwork:property value="@dateUtils/formatDateISO8601(timestamp('created'))" />"
    dc:identifier="<%= issueUrlViaKey %>"
    trackback:ping="<%= baseUrl %>/rpc/trackback/<webwork:property value="string('key')"/>"/>
</rdf:RDF>-->
<% } %>
