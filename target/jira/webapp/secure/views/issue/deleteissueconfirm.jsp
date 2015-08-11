
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <meta content="issuesummary" name="decorator" />
	<title><webwork:text name="'deleteissue.title'"/>: [<webwork:property value="issue/string('key')" />] <webwork:property value="issue/string('summary')" /></title>
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
            <div class="content intform">
                <page:applyDecorator name="jiraform">
                    <page:param name="title"><webwork:text name="'deleteissue.title'"/></page:param>
                    <page:param name="description">
                        <p><webwork:text name="'deleteissue.desc.line1'"/></p>
                        <p><webwork:text name="'deleteissue.desc.line2'"/></p>
                        <p><webwork:text name="'deleteissue.desc.line3'"/></p>
                        <p>
                        <webwork:if test="/numberOfSubTasks > 0 ">
                            <webwork:text name="'deleteissue.subtask.warning'">
                                <webwork:param name="'value0'"><span class="warning"></webwork:param>
                                <webwork:param name="'value1'"></span></webwork:param>
                                <webwork:param name="'value2'"><webwork:property value="/numberOfSubTasks"/></webwork:param>
                            </webwork:text>
                        </webwork:if>
                        <p>
                    </page:param>
                    <page:param name="width">100%</page:param>
                    <page:param name="autoSelectFirst">false</page:param>
                    <page:param name="action"><%=request.getContextPath()%>/secure/DeleteIssue.jspa</page:param>
                    <page:param name="submitId">deleteissue_submit</page:param>
                    <page:param name="submitName"><webwork:property value="text('deleteissue.submitname')"/></page:param>
                    <page:param name="cancelURI"><webwork:property value="issuePath" /></page:param>
                    <ui:component name="'id'" template="hidden.jsp" theme="'single'"  />
                    <ui:component name="'viewIssueKey'" template="hidden.jsp" theme="'single'"  />
                    <ui:component name="'confirm'" value="'true'" template="hidden.jsp" theme="'single'"  />
                </page:applyDecorator>
            </div>
        </div>
    </div>
</div>
</body>
</html>
