<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<webwork:bean name="'com.atlassian.jira.util.JiraDateUtils'" id="dateUtils" />
<html>
<head>
	<title><webwork:text name="'admin.indexing.jira.indexing'"/></title>
    <webwork:if test="/ourTask/finished == false">
        <meta http-equiv="refresh" content="5">
    </webwork:if>
</head>
<body>
    <page:applyDecorator name="jiraform">
        <page:param name="columns">1</page:param>
        <page:param name="action">IndexProgress.jspa</page:param>
        <page:param name="method">get</page:param>
        <page:param name="columns">1</page:param>        
        <page:param name="submitId">refresh_submit</page:param>
        <page:param name="submitName"><webwork:text name="'admin.common.words.refresh'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="title"><webwork:text name="'admin.indexing.reindexing'"/></page:param>
        <page:param name="helpURL">searchindex</page:param>
        <%--    <page:param name="helpDescription">with Indexing</page:param>--%>
        <page:param name="instructions">
            <webwork:if test="/ourTask/finished == true && /ourTask/userWhoStartedTask == false">
                <div class="infoBox">
                <webwork:text name="'common.tasks.cant.acknowledge.task.you.didnt.start'">
                    <webwork:param name="'value0'"><a href="<webwork:property value="/ourTask/userURL"/>"><webwork:property value="/ourTask/user"/></a></webwork:param>
                </webwork:text>
                </div>
            </webwork:if>
        </page:param>
        <tr bgcolor="#ffffff"><td>
            <ui:component template="taskdescriptor.jsp" name="'/ourTask'"/>
            <webwork:if test="/ourTask/finished == true">
                <page:param name="action">AcknowledgeTask.jspa</page:param>
                <webwork:if test="/ourTask/userWhoStartedTask == true">
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
                <webwork:if test="/ourTask == null">
                    <page:param name="title">
                        <webwork:text name="'common.tasks.task.not.found.title'"/>
                    </page:param>
                    <page:param name="action">IndexAdmin.jspa</page:param>
                    <page:param name="submitId">done_submit</page:param>
                    <page:param name="submitName"><webwork:text name="'common.words.done'"/></page:param>
                </webwork:if>
                <webwork:else>
                    <page:param name="action">IndexProgress.jspa</page:param>
                    <page:param name="submitId">refresh_submit</page:param>
                    <page:param name="submitName"><webwork:text name="'admin.common.words.refresh'"/></page:param>
                    <ui:component name="'taskId'" template="hidden.jsp"/>
                </webwork:else>
            </webwork:else>
        </td></tr>
    </page:applyDecorator>
</body>
</html>
