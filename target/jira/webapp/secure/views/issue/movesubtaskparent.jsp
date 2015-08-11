<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="webwork" prefix="iterator" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'movesubtask.title'"/>: <webwork:property value="issue/string('key')" /></title>
</head>

<body>

<table cellpadding=0 cellspacing=0 border=0 width=100%>
<tr>
    <td width=200 bgcolor="#f0f0f0" valign=top>
        <jsp:include page="/secure/views/issue/movetaskpane.jsp" flush="false" />
    </td>
    <td bgcolor=#ffffff valign=top>
        <table width=100% cellpadding=10 cellspacing=0 border=0>
        <tr>
            <td>
                <page:applyDecorator name="jiraform">
                    <page:param name="title"><webwork:text name="'movesubtask.title'"/>: <webwork:property value="issue/string('key')" /></page:param>
                    <page:param name="description">
                        <webwork:text name="'move.subtask.step4.desc'"/>
                    </page:param>
                    <page:param name="width">100%</page:param>
                    <page:param name="action"><webwork:url page="MoveSubTaskParent.jspa"><webwork:param name="'id'" value="id" /></webwork:url></page:param>
                    <page:param name="autoSelectFirst">false</page:param>
                    <page:param name="cancelURI"><webwork:property value="issuePath" /></page:param>
                    <page:param name="submitId">reparent_submit</page:param>
                    <page:param name="submitName"><webwork:text name="'move.subtask.parent.submit'"/></page:param>

                    <ui:component label="'Parent Issue'" name="'parentIssue'" template="issuepicker.jsp">
                        <ui:param name="'size'" value="18"/>
                        <ui:param name="'formname'" value="'jiraform'"/>
                        <ui:param name="'singleSelectOnly'" value="'true'"/>
                        <ui:param name="'showSubTasks'" value="'false'"/>
                        <ui:param name="'showSubTasksParent'" value="'false'"/>
                        <ui:param name="'selectedProjectId'" value="currentPid"/>
                        <ui:param name="'currentissue'" value="issue/string('key')" />
                        <ui:param name="'currentJQL'" value="/currentJQL" />
                        <ui:param name="'mandatory'" value="'true'"/>
                    </ui:component>

                    <ui:component name="'id'" template="hidden.jsp" />
                </page:applyDecorator>
            </td>
        </tr>
        </table>
    </td>
</tr>
</table>

</body>
</html>
