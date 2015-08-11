<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'bulk.migrate.title'"/></title>
</head>
<body>

<page:applyDecorator name="bulkpanel">
    <page:param name="action">BulkMigrateChooseStatus.jspa</page:param>
    <page:param name="title"><webwork:text name="'bulk.migrate.title'"/>:
        <webwork:text name="'bulk.migrate.status.title'">
            <webwork:param name="'value0'"><webwork:property value="/bulkEditBean/targetProjectGV/string('name')" /></webwork:param>
            <webwork:param name="'value1'"><webwork:property value="/bulkEditBean/targetIssueTypeObject/name" /></webwork:param>
        </webwork:text>
    </page:param>
    <page:param name="instructions">
        <webwork:text name="'bulk.migrate.status.instructions'">
            <webwork:param name="'value0'">
                <webwork:iterator value="./bulkEditBean/issueTypeObjects" status="'status'">
                    <webwork:component name="'issuetype'" template="constanticon.jsp">
                      <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                      <webwork:param name="'iconurl'" value="./iconUrl" />
                      <webwork:param name="'alt'"><webwork:property value="./name" /></webwork:param>
                    </webwork:component> <strong><webwork:property value="./name" /></strong><webwork:if test="@status/last == false">, </webwork:if>
                </webwork:iterator>
            </webwork:param>
            <webwork:param name="'value1'">
                <webwork:iterator value="./bulkEditBean/projects" status="'status'">
                    <strong><webwork:property value="./string('name')" /></strong><webwork:if test="@status/last == false">, </webwork:if>
                </webwork:iterator>
            </webwork:param>
            <webwork:param name="'value2'">
                <webwork:component name="'issuetype'" template="constanticon.jsp">
                  <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                  <webwork:param name="'iconurl'" value="/bulkEditBean/targetIssueTypeObject/iconUrl" />
                  <webwork:param name="'alt'"><webwork:property value="/bulkEditBean/targetIssueTypeObject/name" /></webwork:param>
                </webwork:component> <strong><webwork:property value="/bulkEditBean/targetIssueTypeObject/name" /></strong>
            </webwork:param>
            <webwork:param name="'value3'"><strong><webwork:property value="/bulkEditBean/targetProjectGV/string('name')" /></strong></webwork:param>
        </webwork:text>

        <webwork:text name="'bulk.move.statusmapping'" />.
    </page:param>

    <%@include file="/secure/views/bulkedit/includes/statusmapping.jsp"%>

</page:applyDecorator>

</body>
</html>
