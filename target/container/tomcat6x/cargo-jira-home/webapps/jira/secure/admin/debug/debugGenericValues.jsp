<%@ page import="com.atlassian.jira.ComponentManager"%>
<%@ page import="org.ofbiz.core.entity.GenericDelegator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Collections"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>



<html>
<head>
    <title>Views the all GenricValue types and their respective counts</title>
</head>
<body>
<table class="grid">
    <tr>
        <th>
            Table
        </th>
        <td>
            Count
        </td>
    </tr>
    <%
        GenericDelegator delegator = (GenericDelegator) ComponentManager.getComponentInstanceOfType(GenericDelegator.class);
        List entityNames = new ArrayList(delegator.getModelReader().getEntityNames());
        Collections.sort(entityNames);
        for (Iterator iterator = entityNames.iterator(); iterator.hasNext();)
        {
            String entityName = (String) iterator.next();
    %>
    <tr>
        <th>
            <%=entityName%>
        </th>
        <td>
            <%=delegator.findAll(entityName).size()%>
        </td>
    </tr>
    <%
        }
    %>
</table>

<%
    // Play area
%>
</body>
</html>
