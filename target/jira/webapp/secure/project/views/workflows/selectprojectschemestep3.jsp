<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <webwork:if test="/currentTask/finished == false">
        <meta http-equiv="refresh" content="5">
    </webwork:if>
    <title>
        <webwork:text name="'admin.selectworkflowscheme.select.workflow.scheme'"/>
    </title>
</head>
<body>
<page:applyDecorator name="jiraform">
    <page:param name="method">get</page:param>
    <page:param name="columns">1</page:param>
    <page:param name="title">
        <webwork:text name="'admin.selectworkflowscheme.associate.scheme.to.project'"/> : <webwork:property value="project/string('name')"/>
    </page:param>
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

                <page:param name="description">
                    <p>
                        <webwork:text name="'admin.selectworkflowscheme.step3.done'">
                            <webwork:param name="'value0'"><b></webwork:param>
                            <webwork:param name="'value1'"></b></webwork:param>
                        </webwork:text>
                    </p>
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
                    <page:param name="action">ViewProjects.jspa</page:param>
                    <page:param name="submitId">done_submit</page:param>
                    <page:param name="submitName"><webwork:text name="'common.words.done'"/></page:param>
                    <page:param name="autoSelectFirst">false</page:param>
                </webwork:if>
                <webwork:else>
                    <page:param name="description">
                        <p>
                            <webwork:text name="'admin.selectworkflowscheme.step3.inprogress'">
                                <webwork:param name="'value0'"><b></webwork:param>
                                <webwork:param name="'value1'"></b></webwork:param>
                            </webwork:text>
                        </p>
                    </page:param>

                    <page:param name="action">SelectProjectWorkflowSchemeStep3.jspa</page:param>
                    <page:param name="submitId">refresh_submit</page:param>
                    <page:param name="submitName"><webwork:text name="'admin.common.words.refresh'"/></page:param>
                    <page:param name="autoSelectFirst">false</page:param>

                    <ui:component name="'projectId'" template="hidden.jsp"/>
                    <ui:component name="'taskId'" template="hidden.jsp"/>
                    <ui:component name="'schemeId'" template="hidden.jsp"/>
                    <webwork:if test="origSchemeId != null">
                        <ui:component name="'origSchemeId'" template="hidden.jsp"/>
                    </webwork:if>
                </webwork:else>
            </webwork:else>
        </td>
    </tr>

</page:applyDecorator>
</body>
</html>
