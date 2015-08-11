<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <webwork:if test="hasLiveTasks == true">
        <meta http-equiv="refresh" content="20">
    </webwork:if>
    <title>
         <webwork:text name="'admin.task.taskadmin.title'"/>
    </title>
</head>
<body>
<page:applyDecorator name="jiraform">
    <page:param name="columns">1</page:param>
    <tr bgcolor="#ffffff"><td>
        <div class="infoBox"><span><webwork:text name="'admin.task.taskadmin.refresh.warning'"><webwork:param name="'value0'">20</webwork:param></webwork:text></span></div>
    </td></tr>
    <tr bgcolor="#ffffff"><td>
        <webwork:iterator value="allTasks" status="''">
            <ui:component template="taskdescriptor.jsp" name="'.'">
                <webwork:if test="finished == true && userWhoStartedTask == true">
                    <ui:param name="'acknowledgementURL'"><webwork:property value="/acknowledgementURL(.)" escape="false" /></ui:param>
                </webwork:if>
            </ui:component>
        </webwork:iterator>
    </td></tr>
    <page:param name="method">get</page:param>
    <page:param name="action">TaskAdmin.jspa</page:param>
    <page:param name="submitId">refresh_submit</page:param>
    <page:param name="submitName"><webwork:text name="'admin.common.words.refresh'"/></page:param>
</page:applyDecorator>
</body>
</html>
