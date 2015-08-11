<%@ taglib uri="webwork" prefix="webwork" %>
<html>
<head>
    <content tag="section">find_link</content>
	<title><webwork:if test="searchRequest/name">[<webwork:property value="searchRequest/name"/>] </webwork:if><webwork:text name="'navigator.title'"/></title>
    <webwork:if test="/hasAnyErrors == false &&  /searchResults/total > 0">
        <LINK REL="alternate" TITLE="<webwork:property value="searchRequest/name"/>" HREF="<%= request.getContextPath() %>/secure/IssueNavigator.jspa?view=rss&<webwork:property value="jqlQueryString" />&tempMax=100&reset=true&decorator=none" TYPE="application/rss+xml">
    </webwork:if>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#ffffff" class="ie-f">
    <tr class="hidden">
        <%-- This is here to get around a rendering problem on Mozilla which manifests when viewing the page
        over a relatively slow connection. The filterform is rendered to take up more than half the page. By
        givving a 'relative' row to the browser first we ensure that the rest of the rows are rendered similarly and
        hence the width of the filterform column is fixed. Fixes JRA-5116 --%>
        <webwork:if test="/mode == 'show'">
            <td class="filterFormCell">&nbsp;</td>
        </webwork:if>
        <webwork:else>
            <td class="filterSummaryCell">&nbsp;</td>
	    </webwork:else>
        <td>&nbsp;</td>
    </tr>
    <tr>
    <webwork:if test="/mode == 'show'">
        <td class="filterFormCell">
            <!--[if IE]>
            <table cellspacing="0" cellpadding="0" border="0" width="100%"><tr><td>
            <![endif]-->
            <jsp:include page="/includes/navigator/filter-form.jsp" flush="false" />
            <!--[if IE]>
            </td></tr></table>
            <![endif]-->
        </td>
    </webwork:if>
    <webwork:else>
        <td class="filterSummaryCell">
            <!--[if IE]>
            <table cellspacing="0" cellpadding="0" border="0" width="100%"><tr><td>
            <![endif]-->
            <jsp:include page="/includes/navigator/summary-pane.jsp" flush="false" />
            <!--[if IE]>
            </td></tr></table>
            <![endif]-->
        </td>
    </webwork:else>
    <%-- end remove --%>
        <td valign="top">
            <div class="issue-nav-wrap">
            <webwork:if test="valid == 'true'">
                <jsp:include page="/includes/navigator/table.jsp" flush="false" />
            </webwork:if>
            <webwork:else>
                <jsp:include page="/includes/navigator/cantviewfilter.jsp" flush="false" />
            </webwork:else>
            </div>
        </td>
    </tr>
</table>
</body>
</html>
