<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title>
        <webwork:if test="/currentTask/finished == false">
            <meta http-equiv="refresh" content="5">
        </webwork:if>
        <webwork:text name="'admin.translations.activate.workflow'">
            <webwork:param name="'value0'">
                <webwork:property value="workflowName"/>
            </webwork:param>
        </webwork:text>
    </title>
</head>
<body>
<page:applyDecorator name="jiraform">
    <page:param name="columns">1</page:param>
    <page:param name="method">get</page:param>
    <page:param name="instructions">
        <webwork:if test="/currentTask/finished == true && /currentTask/userWhoStartedTask == false">
            <div class="infoBox">
            <webwork:text name="'common.tasks.cant.acknowledge.task.you.didnt.start'">
                <webwork:param name="'value0'"><a href="<webwork:property value="/currentTask/userURL"/>"><webwork:property value="/currentTask/user"/></a></webwork:param>
            </webwork:text>
            </div>
        </webwork:if>
    </page:param>
    <tr bgcolor="#ffffff">
        <td>
            <ui:component template="taskdescriptor.jsp" name="'/currentTask'"/>
            <webwork:if test="/done == true">
                <page:param name="title">
                    <webwork:text name="'admin.translations.activate.workflow.success'">
                        <webwork:param name="'value0'">
                            <webwork:property value="workflowName"/>
                        </webwork:param>
                    </webwork:text>
                </page:param>
                <page:param name="action">AcknowledgeTask.jspa</page:param>
                <webwork:if test="/currentTask/userWhoStartedTask == true">
                    <page:param name="submitId">acknowledge_submit</page:param>
                    <page:param name="submitName"><webwork:text name="'common.words.acknowledge'"/></page:param>
                    <ui:component name="'taskId'" template="hidden.jsp"/>
                </webwork:if>
                <webwork:else>
                    <page:param name="submitId">done_submit</page:param>
                    <page:param name="submitName"><webwork:text name="'common.words.done'"/></page:param>
                </webwork:else>
                <ui:component name="'destinationURL'" template="hidden.jsp"/>
            </webwork:if>
            <webwork:else>
                <webwork:if test="/currentTask == null">
                    <page:param name="title">
                        <webwork:text name="'common.tasks.task.not.found.title'"/>
                    </page:param>
                    <page:param name="action">ListWorkflows.jspa</page:param>
                    <page:param name="submitId">done_submit</page:param>
                    <page:param name="submitName"><webwork:text name="'common.words.done'"/></page:param>
                </webwork:if>
                <webwork:else>
                    <page:param name="title">
                        <webwork:text name="'admin.translations.activate.workflow.inprogress'">
                            <webwork:param name="'value0'">
                                <webwork:property value="workflowName"/>
                            </webwork:param>
                        </webwork:text>
                    </page:param>
                    <page:param name="action">ActivateWorkflowStep2.jspa</page:param>
                    <page:param name="submitId">refresh_submit</page:param>
                    <page:param name="submitName"><webwork:text name="'admin.common.words.refresh'"/></page:param>
                    <page:param name="autoSelectFirst">false</page:param>

                    <ui:component name="'taskId'" template="hidden.jsp"/>
                </webwork:else>
            </webwork:else>
        </td>
    </tr>

</page:applyDecorator>
</body>
</html>
