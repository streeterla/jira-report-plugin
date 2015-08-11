<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="webwork" prefix="iterator" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<webwork:bean id="fieldVisibility" name="'com.atlassian.jira.web.bean.FieldVisibilityBean'" />
<html>
<head>
	<title><webwork:if test="subTask == true"><webwork:text name="'movesubtask.title'"/></webwork:if><webwork:else><webwork:text name="'moveissue.title'"/></webwork:else>: <webwork:property value="issue/string('key')" /></title>
</head>
<body>
<table cellpadding=0 cellspacing=0 border=0 width=100%>
<tr>
<td width=200 bgcolor="#f0f0f0" valign=top>
    <webwork:if test="subTask == true">
        <jsp:include page="/secure/views/issue/movetaskpane.jsp" flush="false" />
    </webwork:if>
    <webwork:else>
        <jsp:include page="/secure/views/issue/moveissuepane.jsp" flush="false" />
    </webwork:else>
</td>
<td bgcolor=#ffffff valign=top>
<table width=100% cellpadding=10 cellspacing=0 border=0><tr><td>

    <page:applyDecorator name="jiraform">
        <page:param name="action">MoveIssueConfirm.jspa</page:param>
        <page:param name="columns">1</page:param>
        <page:param name="cancelURI"><webwork:property value="issuePath" /></page:param>
        <page:param name="submitId">move_submit</page:param>
        <page:param name="submitName"><webwork:property value="text('common.forms.move')"/></page:param>
        <page:param name="width">100%</page:param>
		<page:param name="autoSelectFirst">false</page:param>
        <page:param name="title">
            <webwork:if test="subTask == true">
                <webwork:text name="'movesubtask.title'"/>: <webwork:text name="'moveissue.confirm'"/>
            </webwork:if>
            <webwork:else>
                <webwork:text name="'moveissue.title'"/>: <webwork:text name="'moveissue.confirm'"/>
            </webwork:else>
        </page:param>
        <page:param name="description">
            <webwork:if test="enterprise == true">
                <webwork:text name="'moveissue.confirm.desc.ent'"/>
            </webwork:if>
            <webwork:else>
                <webwork:text name="'moveissue.confirm.desc.pro'"/>
            </webwork:else>

            <webwork:if test="subTasks/empty == false">
            <p>
                <webwork:text name="'movesubtask.loss.of.data'">
                    <webwork:param name="'value0'"><span class="warning"></webwork:param>
                    <webwork:param name="'value0'"></span></webwork:param>
                </webwork:text>
            </p>
        </webwork:if>
        </page:param>

        <tr><td colspan=2 bgcolor=#ffffff>
        <br>

        <table id="move_confirm_table" class="gridTabBox" cellpadding="3" cellspacing="1" align="center" width="95%">
            <tr>
                <td bgcolor="#dddddd" width="20%"><b>&nbsp;</b></td>
                <td bgcolor="#dddddd" width="40%"><b><webwork:text name="'moveissue.originalvalue'"/></b></td>
                <td bgcolor="#dddddd" width="40%"><b><webwork:text name="'moveissue.newvalue'"/></b></td>
            </tr>


            <!-- Breaking page into smaller parts - JRA-5059 -->
            <jsp:include page="/secure/views/issue/moveissue-confirm-part1.jsp" flush="false" />

            <%-- Show all the fields that have changed for the move --%>
            <webwork:iterator value="confimationFieldLayoutItems">
                <tr>
                    <td bgcolor="#f0f0f0" width="20%" valign="top"><webwork:property value="/fieldName(./orderableField)" /></td>
                    <td bgcolor="#ffffff" class="red-highlight" width="40%" valign="top">
                        <webwork:property value="oldViewHtml(./orderableField)" escape="'false'" />
                    </td>
                    <td bgcolor="#ffffff" class="green-highlight" width="40%" valign="top">
                        <webwork:property value="newViewHtml(./orderableField)" escape="'false'" />
                    </td>
                </tr>
            </webwork:iterator>
            <%-- Show all the fields that will be removed --%>
            <webwork:iterator value="removeFields">
                <tr>
                    <td bgcolor="#f0f0f0" width="20%" valign="top"><webwork:property value="/fieldName(.)" /></td>
                    <td bgcolor="#ffffff" class="red-highlight" width="40%" valign="top">
                        <webwork:property value="oldViewHtml(.)" escape="'false'" />
                    </td>
                    <td bgcolor="#ffffff" class="green-highlight" width="40%" valign="top">
                        &nbsp;
                    </td>
                </tr>
            </webwork:iterator>
        </table>

    <%-- Do not put these in the MoveIssueBean --%>
    <ui:component name="'confirm'" value="'true'" template="hidden.jsp" />
    <ui:component name="'id'" template="hidden.jsp" />

    </td></tr>
    </page:applyDecorator>
</td></tr></table>
</td>
</tr></table>
</body>
</html>
