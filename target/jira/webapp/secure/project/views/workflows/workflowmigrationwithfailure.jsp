<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.workflowmigration.withfailure.title'" /></title>
</head>

<body>
<page:applyDecorator name="jiraform">
    <page:param name="method">get</page:param>
    <page:param name="columns">1</page:param>
    <page:param name="title">
        <webwork:text name="'admin.workflowmigration.withfailure.title'" />
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

    <%-- If this page is refreshed the migration will run again. Maybe need to rewrite as a redirect. --%>
    <tr><td><div class="warningBox">
        <%-- In professional the scheme is always null, since this method does not exist. --%>
        <webwork:if test="/scheme != null">
            <webwork:text name="'admin.workflowmigration.withfailure.associatedscheme'">
                <webwork:param name="'value0'"><webwork:property value="/scheme/string('name')" /></webwork:param>
                <webwork:param name="'value1'"><webwork:property value="/project/string('name')" /></webwork:param>
            </webwork:text>
        </webwork:if>
        <webwork:elseIf test="/enterprise == true">
            <webwork:text name="/failureMigrationMessageKey">
                    <webwork:param name="'value1'"><webwork:property value="/project/string('name')" /></webwork:param>
            </webwork:text>
        </webwork:elseIf>
        <webwork:else>
            <webwork:text name="/failureMigrationMessageKey"/>
        </webwork:else>


        <webwork:text name="'admin.workflowmigration.withfailure.errors'" />

        <ol>
        <webwork:iterator value="/failedIssueIds()">
            <li>
                <webwork:text name="'admin.workflowmigration.withfailure.issues'">
                    <webwork:param name="'value0'"><webwork:property value="./key()" /></webwork:param>
                    <webwork:param name="'value1'"><a href="<%= request.getContextPath() %>/browse/<webwork:property value="./value()" />"><webwork:property value="./value()" /></a></webwork:param>
                </webwork:text>
            </li>
        </webwork:iterator>
        </ol>

        <webwork:text name="'admin.workflowmigration.withfailure.refertolog'" />
        <webwork:if test="/enterprise == true">
        <p>
            <a href="<%= request.getContextPath() %>/secure/project/ViewProject.jspa?pid=<webwork:property value="/project/long('id')" />">
                <webwork:text name="'admin.workflowmigration.withfailure.returntoproject'">
                    <webwork:param name="'value0'"><webwork:property value="./project/string('name')" /></webwork:param>
                </webwork:text>
            </a>
        </p>
        </webwork:if>
    </div></td></tr>
</page:applyDecorator>
</body>
</html>
