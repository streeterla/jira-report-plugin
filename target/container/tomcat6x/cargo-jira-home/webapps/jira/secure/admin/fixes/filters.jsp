<%@ taglib uri="jiratags" prefix="jira" %>
<%@ page import="com.atlassian.core.ofbiz.CoreFactory,
                 org.ofbiz.core.entity.GenericDelegator,
                 java.util.List,
                 org.ofbiz.core.entity.GenericValue,
                 org.apache.commons.lang.StringUtils"%>
<%
    String oldIssueKey = "<searchSort field='key'";
    String newIssueKey = "<searchSort field='issuekey'";
    String oldDateCreated = "<searchSort field='datecreated'";
    String newDateCreated = "<searchSort field='created'";
    String oldDateUpdated = "<searchSort field='lastupdated'";
    String newDateUpdate = "<searchSort field='updated'";

    GenericDelegator genericDelegator = CoreFactory.getGenericDelegator();
    List filters = genericDelegator.findAll("SearchRequest");
    for (int i = 0; i < filters.size(); i++)
    {
        GenericValue filter = (GenericValue) filters.get(i);
        String requestXml = filter.getString("request");
        if (requestXml.indexOf(oldIssueKey) != -1 || requestXml.indexOf(oldDateCreated) != -1 || requestXml.indexOf(oldDateUpdated) != -1)
        {
%>
<h2><webwork:text name="'admin.filters.updating'"/></h2>
<jira:text2html><%=requestXml%></jira:text2html>
<br>
<%
            requestXml = StringUtils.replace(requestXml, oldIssueKey, newIssueKey);
            requestXml = StringUtils.replace(requestXml, oldDateCreated, newDateCreated);
            requestXml = StringUtils.replace(requestXml, oldDateUpdated, newDateUpdate);
            filter.set("request",requestXml);
            filter.store();
        }
    }
%>
