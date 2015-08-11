<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="webwork" prefix="iterator" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'moveissue.title'"/>: <webwork:property value="issue/string('key')"/></title>
</head>

<body>
<table cellpadding=0 cellspacing=0 border=0 width="100%">
    <tr>
        <td width=200 bgcolor="#f0f0f0" valign=top>
            <jsp:include page="/secure/views/issue/moveissuepane.jsp" flush="false"/>
        </td>
        <td bgcolor="#ffffff" valign=top>
            <table width="100%" cellpadding=10 cellspacing=0 border=0>
                <tr>
                    <td>
                        <page:applyDecorator name="jiraform">
                        <page:param name="title">
                            <webwork:text name="'moveissue.subtasks.issuetypes.title'"/>
                        </page:param>
                        <page:param name="description">
                            <webwork:text name="'moveissue.subtasks.issuetypes.desc'"/>
                        </page:param>
                        <page:param name="columns">1</page:param>
                        <page:param name="width">100%</page:param>
                        <page:param name="action">MoveIssueSubtasks.jspa</page:param>
                        <page:param name="autoSelectFirst">false</page:param>
                        <page:param name="cancelURI"><webwork:property value="issuePath"/></page:param>
                        <page:param name="submitId">next_submit</page:param>
                        <page:param name="submitName"><webwork:property value="text('common.forms.next')"/> &gt;&gt;</page:param>
                <tr>
                    <td bgcolor="ffffff">
                        <table id="issuetypechoices" width="75%" align="absmiddle" class="centred">
                            <tr>
                                <td>
                                    <div width="80%" style="border: 1px solid #bbbbbb;padding: 2px;">
                                        <table width="100%">
                                            <tr>
                                                <td bgcolor="#f0f0f0" colspan="5">
                                                    <strong><webwork:text name="'moveissue.subtask.choose.issuetypes'"/></strong>
                                                </td>
                                            </tr>
                                            <webwork:iterator value="/migrateIssueTypes">
                                                <tr>
                                                        <%-- Select Issue Type --%>
                                                    <td align="absmiddle" width="20%" nowrap><strong><webwork:text name="'moveissue.currentissuetype'"/></strong>:</td>
                                                    <td align="absmiddle" nowrap><webwork:property value="./name"/></td>
                                                    <td align="absmiddle" nowrap><img src="<%= request.getContextPath() %>/images/icons/arrow_right_small.gif" height=16 width=16 border=0 align="absmiddle"></td>
                                                        <%-- Target Issue Type --%>
                                                    <td align="absmiddle" width="20%" nowrap><strong><webwork:text name="'moveissue.newissuetype'"/></strong>:</td>
                                                    <td align="absmiddle" nowrap><select name="<webwork:property value="/prefixIssueTypeId(./id)"/>"><webwork:iterator value="/projectSubtaskIssueTypes"><option value="<webwork:property value="./id"/>"><webwork:property value="./name"/></option></webwork:iterator></select></td>
                                                </tr>
                                            </webwork:iterator>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <ui:component name="'id'" template="hidden.jsp" theme="'single'"/>
                            </page:applyDecorator>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
