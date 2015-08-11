<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="webwork" prefix="iterator" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'createissue.title'" /></title>
</head>
<body>
<webwork:if test="/parentIssueKey">
    <webwork:if test="allowedProjects/size > 0">
    <div class="intform">
        <page:applyDecorator name="jiraform">
            <page:param name="title"><webwork:text name="'createsubtaskissue.title'" /></page:param>
            <page:param name="description"><webwork:text name="'createsubtaskissue.step1.desc'" /></page:param>
            <page:param name="action">CreateSubTaskIssue.jspa</page:param>
            <page:param name="submitId">next_submit</page:param>
            <page:param name="submitName"><webwork:text name="'common.forms.next'" />&gt;&gt;</page:param>

            <ui:component name="'pid'" template="hidden.jsp" theme="'single'" >
                <ui:param name="'id'">project</ui:param>
            </ui:component>

            <webwork:property value="/field('issuetype')/createHtml(null, /, /, /issueObject)" escape="'false'" />

            <ui:component name="'parentIssueId'" template="hidden.jsp" theme="'single'" />

        </page:applyDecorator>
    </div>
    </webwork:if>
    <webwork:else>
        <page:applyDecorator name="jiraform">
            <page:param name="title"><webwork:text name="'createsubtaskissue.title'" /></page:param>
            <%@ include file="/includes/noprojects.jsp" %>
        </page:applyDecorator>
    </webwork:else>
</webwork:if>
<webwork:else> <%-- Issue has been deleted. Show same error as other operations (IssueSummary.jsp) --%>
    <table cellspacing="0" cellpadding="10" border="0" width="100%" bgcolor="#ffffff">
        <tr>
            <td valign="top">
                <page:applyDecorator name="jiraform">
                    <page:param name="title">
                        <webwork:text name="'generic.notloggedin.title'"/>
                    </page:param>
                    <tr>
                        <td colspan="2">
                            <webwork:text name="'admin.errors.issues.current.issue.null'"/>
                        </td>
                    </tr>
                </page:applyDecorator>
            </td>
        </tr>
    </table>
</webwork:else>
</body>
</html>
