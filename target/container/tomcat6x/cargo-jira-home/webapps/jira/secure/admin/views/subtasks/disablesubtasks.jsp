<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><webwork:text name="'admin.subtasks.disable'"/></title>
</head>
<body>
    <p>
        <page:applyDecorator name="jiraform">
            <page:param name="action">DisableSubTasks.jspa</page:param>
            <page:param name="columns">1</page:param>
            <page:param name="width">100%</page:param>
            <page:param name="title"><webwork:text name="'admin.subtasks.disable'"/></page:param>
            <page:param name="submitId">ok_submit</page:param>
            <page:param name="submitName"> <webwork:text name="'admin.common.words.ok'"/> </page:param>
            <page:param name="autoSelectFirst">false</page:param>
            <tr><td bgcolor="#ffffff">
                <webwork:text name="'admin.subtasks.disable.subtasks.present.in.system'">
                    <webwork:param name="'value0'"><b><webwork:property value="/subTaskCount"/></b></webwork:param>
                    <webwork:param name="'value1'"><br></webwork:param>
                    <webwork:param name="'value2'"><b><font color="#990000"></webwork:param>
                    <webwork:param name="'value3'"></font></b></webwork:param>
                </webwork:text>
            </td></tr>
        </page:applyDecorator>
   </p>
</body>
</html>
