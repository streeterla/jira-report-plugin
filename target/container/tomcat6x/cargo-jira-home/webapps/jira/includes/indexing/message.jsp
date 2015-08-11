<%@ taglib uri="webwork" prefix="webwork" %>
<tr><td bgcolor=#ffffff>
    Indexing is currently not configured so no issue searching can be performed.<br>&nbsp;<br>
    <webwork:if test="/hasPermission('admin') == true">
        To configure indexing please click <a href="<%= request.getContextPath() %>/secure/admin/jira/IndexAdmin.jspa">here</a>
    </webwork:if>
    <webwork:else>
        Please contact your administrator to get indexing configured
    </webwork:else>
</td></tr>
