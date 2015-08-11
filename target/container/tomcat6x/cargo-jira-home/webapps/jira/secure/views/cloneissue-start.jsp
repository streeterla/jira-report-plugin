<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="webwork" prefix="iterator" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'cloneissue.title'" /></title>
</head>
<body class="type-a">
<div class="item-header">
    <webwork:property value="issue">
        <jsp:include page="/includes/panels/issue_headertable.jsp" />
    </webwork:property>
</div>
<div id="main-content">
    <div class="active-area">
        <div id="primary" class="column">
        <webwork:if test="/issueValid == true">
            <div class="content intform">
            <page:applyDecorator name="jiraform">
                <page:param name="title"><webwork:text name="'cloneissue.title'" /></page:param>
                <page:param name="description">
                    <webwork:text name="'cloneissue.step1.desc'" />
                    <%-- if there is no 'clone' link type in the system, print a warning --%>
                    <webwork:if test="displayCloneLinkWarning == true">
                        <p><webwork:text name="'cloneissue.linktype.does.not.exist'" value0="'<span class=\"warning\">'" value1="'</span>'" value2="cloneLinkTypeName"/></p>
                    </webwork:if>
                    <%-- if the user cannot modify the reporter, print a warning --%>
                    <webwork:if test="canModifyReporter == false">
                        <p><webwork:text name="'cloneissue.reporter.modify'" value0="'<span class=\"warning\">'" value1="'</span>'"/></p>
                    </webwork:if>
                </page:param>
                <page:param name="action">CloneIssueDetails.jspa</page:param>
                <page:param name="submitId">create_submit</page:param>
                <page:param name="submitName"><webwork:text name="'cloneissue.create'" /></page:param>
                <page:param name="cancelURI"><%= request.getContextPath() %>/browse/<webwork:property value="/issue/string('key')"/></page:param>

                <webwork:if test="/originalIssue">
                    <webwork:property value="/fieldScreenRenderLayoutItem('summary')/createHtml(/, /, /issueObject)" escape="'false'" />

                    <webwork:if test="/displayCopySubTasks == true">
                        <ui:checkbox name="'cloneSubTasks'" fieldValue="'true'" label="text('cloneissue.clone.subtasks.label')" >
                            <ui:param name="'description'"><webwork:text name="'cloneissue.clone.subtasks.description'"/></ui:param>
                        </ui:checkbox>
                    </webwork:if>

                    <webwork:if test="/displayCopyAttachments == true">
                        <ui:checkbox name="'cloneAttachments'" fieldValue="'true'" label="text('cloneissue.clone.attachments.label')" >
                            <ui:param name="'description'"><webwork:text name="'cloneissue.clone.attachments.description'"/></ui:param>
                        </ui:checkbox>
                    </webwork:if>

                    <webwork:if test="/displayCopyLink == true">
                        <ui:checkbox name="'cloneLinks'" fieldValue="'true'" label="text('cloneissue.clone.issuelinks.label')" >
                            <ui:param name="'description'"><webwork:text name="'cloneissue.clone.issuelinks.description'"/></ui:param>
                        </ui:checkbox>
                    </webwork:if>
                </webwork:if>

                <%-- The id of the issue to clone --%>
                <ui:component name="'id'" template="hidden.jsp"  theme="'single'" />

            </page:applyDecorator>
            </div>
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
        </div>
    </div>
</div>
</body>
</html>
