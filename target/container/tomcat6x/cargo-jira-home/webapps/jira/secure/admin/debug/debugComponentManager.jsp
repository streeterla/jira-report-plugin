<%@ page import="com.atlassian.jira.ComponentManager"%>
<%@ page import="org.picocontainer.ComponentAdapter"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.util.Iterator"%>



<html>
<head>
    <title>Views the classes loaded by the component manager</title>
</head>
<body>
<table class="grid">
    <tr>
        <th>
            Class
        </th>
        <td>
            Instance
        </td>
    </tr>
    <%
        Collection componentAdapters = ComponentManager.getInstance().getContainer().getComponentAdapters();

        for (Iterator iterator = componentAdapters.iterator(); iterator.hasNext();)
        {
            ComponentAdapter aClass = (ComponentAdapter) iterator.next();
    %>
    <tr>
        <th>
            <%=aClass.getComponentKey()%>
        </th>
        <td>
            <%=aClass.getComponentInstance()%>
        </td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
