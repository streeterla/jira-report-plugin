<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'bulk.migrate.title'"/></title>
</head>
<body>

<page:applyDecorator name="bulkpanel" >
    <page:param name="title">
        <webwork:text name="'bulk.migrate.title'"/>:
        <webwork:text name="'bulk.migrate.overview.subtask.title'">
            <webwork:param name="'value0'"><strong><webwork:property value="/rootBulkEditBean/relatedMultiBulkMoveBean/currentBulkEditBean/targetProjectGV/string('name')"/></strong></webwork:param>
            <webwork:param name="'value1'"><strong><webwork:property value="/rootBulkEditBean/relatedMultiBulkMoveBean/currentBulkEditBean/targetIssueTypeGV/string('name')"/></strong></webwork:param>
        </webwork:text>
    </page:param>
    <page:param name="action">BulkMigrateChooseSubTaskContext.jspa</page:param>
    <page:param name="instructions">
        <p>
        <webwork:text name="'bulk.migrate.overview.subtask.instructions'">
            <webwork:param name="'value0'"><strong><webwork:property value="/currentRootBulkEditBean/selectedIssues/size"/></strong></webwork:param>
            <webwork:param name="'value1'"><strong><webwork:property value="/rootBulkEditBean/relatedMultiBulkMoveBean/currentBulkEditBean/targetIssueTypeGV/string('name')"/></strong></webwork:param>
            <webwork:param name="'value2'"><strong><webwork:property value="/rootBulkEditBean/relatedMultiBulkMoveBean/currentBulkEditBean/targetProjectGV/string('name')"/></strong></webwork:param>
            <webwork:param name="'value3'"><strong><webwork:property value="/multiBulkMoveBean/issuesInContext/size"/></strong></webwork:param>
        </webwork:text>
        </p>
    </page:param>

    <ui:component name="'subTaskPhase'" template="hidden.jsp"  />

    <webwork:iterator value="/rootBulkEditBean/relatedMultiBulkMoveBean/bulkEditBeans" status="'status'">
        <webwork:if test="./value/relatedMultiBulkMoveBean/bulkEditBeans != null">
            <webwork:iterator value="./value/relatedMultiBulkMoveBean/bulkEditBeans" status="'status'">
                <%@include file="/secure/views/bulkedit/includes/chooseContext.jsp" %>
            </webwork:iterator>
        </webwork:if>
    </webwork:iterator>

</page:applyDecorator>

</body>
</html>
