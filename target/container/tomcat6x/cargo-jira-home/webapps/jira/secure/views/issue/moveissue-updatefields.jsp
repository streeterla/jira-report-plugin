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
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr>
<td width="200" bgcolor="#f0f0f0" valign="top">
    <webwork:if test="subTask == true">
        <jsp:include page="/secure/views/issue/movetaskpane.jsp" flush="false" />
    </webwork:if>
    <webwork:else>
        <jsp:include page="/secure/views/issue/moveissuepane.jsp" flush="false" />
    </webwork:else>
</td>
<td bgcolor="#ffffff" valign="top">
<table width="100%" cellpadding="10" cellspacing="0" border="0"><tr><td>

	<page:applyDecorator name="jiraform">
		<page:param name="title">
            <webwork:if test="subTask == true">
                <webwork:text name="'movesubtask.title'"/>: <webwork:text name="'moveissue.update.fields'"/>
            </webwork:if>
            <webwork:else>
                <webwork:text name="'moveissue.title'"/>: <webwork:text name="'moveissue.update.fields'"/>
            </webwork:else>
        </page:param>
		<page:param name="description">
            <webwork:if test="subTask == true">
                <%-- Sub Task --%>
                <webwork:text name="'movesubtask.step2.desc'"/>
            </webwork:if>
            <webwork:else>
                <webwork:if test="enterprise == true">
                    <webwork:text name="'moveissue.updatefields.desc.ent'"/>
                    <%-- If current statues of issue and all subtasks exist in the target workflows - these statuses will remain in effect --%>
                    <%-- This means that step 2 of move process has been skipped --%>
                    <webwork:if test="statusChangeRequired == false">
                        <p>
                        <span class="red-highlight"><b><webwork:text name="'common.words.note'"/></b></span>:&nbsp;<webwork:text name="'moveissue.step2.notrequired'"/>.
                        </p>
                    </webwork:if>
                </webwork:if>
                <webwork:else>
                    <webwork:text name="'moveissue.updatefields.desc.pro'"/>
                </webwork:else>
            </webwork:else>
        </page:param>
		<page:param name="action">MoveIssueUpdateFields.jspa</page:param>
        <page:param name="width">100%</page:param>
		<page:param name="autoSelectFirst">false</page:param>
        <page:param name="cancelURI"><webwork:property value="issuePath" /></page:param>
		<page:param name="submitId">next_submit</page:param>
		<page:param name="submitName"><webwork:property value="text('common.forms.next')"/> &gt;&gt;</page:param>

        <webwork:if test="moveFieldLayoutItems != null && moveFieldLayoutItems/empty == false">
            <webwork:iterator value="moveFieldLayoutItems">
                <webwork:property value="/fieldHtml(.)" escape="'false'" />
            </webwork:iterator>
        </webwork:if>
        <webwork:else>
            <%-- We still need to go through this action and this step in teh move issue wizard, as during the doValidation stage of this action errors can be detected.
            For example, if a field is required but cannot be set by the user becuase of permissions, the error will be detected here. Later need to refactor that the step is skipped,
            however, the doValidation() of the action still needs to be executed. --%>
            <tr bgcolor="#fffff0"><td><webwork:text name="'moveissue.step3.nofieldsneedupdate'"/></td></tr>
            <page:param name="columns">1</page:param>
        </webwork:else>

        <%-- Do not put these in the MoveIssueBean --%>
        <ui:component name="'id'" template="hidden.jsp" theme="'single'" />

	</page:applyDecorator>

</td></tr></table>
</td></tr></table>

</body>
</html>
