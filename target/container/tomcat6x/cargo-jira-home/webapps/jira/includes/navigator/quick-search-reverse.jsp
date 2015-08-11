<%@ taglib uri="webwork" prefix="webwork" %>

<%@ page import="com.atlassian.jira.issue.search.util.DefaultQueryCreator" %>
<%--  If we have used a 'smart search' then inform the user of this fact, and allow them to query again without smart search --%>
<% if ("true".equalsIgnoreCase(request.getParameter("usedQuickSearch"))) { %>
<div>
    <%-- resin has a bug where you can't get URL parameters multiple times, so retrieve it here, and pass it around --%>
    <webwork:property value="$originalQuickSearchQuery" id="origQuery" />

    <form method="POST" action="<%= DefaultQueryCreator.QUERY_PREFIX%>" name="smartquery">
    <input type="hidden" name="query" value="<webwork:property value="@origQuery" />" >
        <div class="noteBox fullyCentered" style="width:50%;">
            <span style="float: right;">
                <webwork:component template="help.jsp" name="'quicksearch'" >
                    <webwork:param name="'noalign'" value="true"/>
                </webwork:component>
            </span>
        <webwork:text name="'navigator.quicksearch.activated'"/>
        <a href="<%= DefaultQueryCreator.QUERY_PREFIX%>&query=<webwork:property value="@origQuery" />"
           onClick="document.smartquery.submit(); return false;"><webwork:text name="'navigator.quicksearch.runwithout'"/></a>.
        </div>
    </form>
</div>
<% } %>
