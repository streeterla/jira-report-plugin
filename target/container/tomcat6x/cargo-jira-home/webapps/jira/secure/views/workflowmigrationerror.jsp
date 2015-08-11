<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.workflowmigration.error.title'" /></title>
</head>

<body>
<page:applyDecorator name="jiraform">
    <page:param name="method">get</page:param>
    <page:param name="title"><webwork:text name="'admin.workflowmigration.error.title'" /></page:param>
    <page:param name="description">
        <p>
            <webwork:text name="'admin.workflowmigration.error.issue.errors'" /><br>
            <webwork:text name="'admin.workflowmigration.error.correct'" /><br>
            <webwork:text name="'admin.workflowmigration.error.no.db.changes'" />
        </p>
        <p>
            <webwork:text name="'admin.workflowmigration.errors.contact.admin'">
                <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/Administrators.jspa"></webwork:param>
                <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>
            <webwork:text name="'admin.workflowmigration.error.integrity.checker'" />
        </p>
    </page:param>
    <page:param name="instructions">

        <page:param name="action">AcknowledgeTask.jspa</page:param>
        <webwork:if test="/currentTask/userWhoStartedTask == true">
            <page:param name="submitId">acknowledge_submit</page:param>
            <page:param name="submitName"><webwork:text name="'common.words.acknowledge'"/></page:param>
            <ui:component name="'taskId'" template="hidden.jsp"/>
        </webwork:if>
        <webwork:else>
            <page:param name="submitId">done_submit</page:param>
            <page:param name="submitName"><webwork:text name="'common.words.done'"/></page:param>
            <div class="infoBox">
            <webwork:text name="'common.tasks.cant.acknowledge.task.you.didnt.start'">
                <webwork:param name="'value0'"><a href="<webwork:property value="/currentTask/userURL"/>"><webwork:property value="/currentTask/user"/></a></webwork:param>
            </webwork:text>
            </div>
        </webwork:else>
        <ui:component name="'destinationURL'" value="destinationURL" template="hidden.jsp"/>
    </page:param>
</page:applyDecorator>

</body>
</html>
