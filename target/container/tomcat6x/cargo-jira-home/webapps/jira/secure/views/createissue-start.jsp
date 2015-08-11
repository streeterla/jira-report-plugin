<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="webwork" prefix="iterator" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'createissue.title'" /></title>
    <content tag="section">find_link</content>
</head>
<body>
<div id="create-issue-hint" class="notify info dismissable-hint">
    <webwork:text name="'createissue.hint'">
        <webwork:param name="'value0'"><strong></webwork:param>
        <webwork:param name="'value1'"></strong></webwork:param>
    </webwork:text>
    <a class="lnk hide" href="#"><webwork:text name="'createissue.hint.close'"/></a>
</div>
<div class="intform">
<webwork:if test="allowedProjects/size > 0">
    <page:applyDecorator name="jiraform">
        <page:param name="title"><webwork:text name="'createissue.title'" /></page:param>
        <page:param name="description"><webwork:text name="'createissue.step1.desc'" /></page:param>
        <page:param name="action">CreateIssue.jspa</page:param>
        <page:param name="cancelURI">default.jsp</page:param>
        <page:param name="submitId">next_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.next'" />&gt;&gt;</page:param>

        <webwork:property value="/field('project')/createHtml(null, /, /, /issueObject)" escape="'false'" />

        <webwork:property value="/field('issuetype')/createHtml(null, /, /, /issueObject)" escape="'false'" />
    </page:applyDecorator>
</webwork:if>
<webwork:else>
	<page:applyDecorator name="jiraform">
        <page:param name="title"><webwork:text name="'createissue.title'"/></page:param>
		<%@ include file="/includes/createissue-notloggedin.jsp" %>
	</page:applyDecorator>
</webwork:else>
</div>
</body>
</html>
