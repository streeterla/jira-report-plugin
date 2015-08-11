<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <meta content="issuesummary" name="decorator" />
	<title><webwork:text name="'viewissue.remove.attachment.title'"/> <webwork:property value="deleteAttachmentId" /></title>
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
                <page:param name="title"><webwork:text name="'viewissue.remove.attachment.title'"/>:
                    <webwork:property value="/attachment/filename" />
                </page:param>
                <page:param name="autoSelectFirst">false</page:param>
                <page:param name="description">
                    <p><webwork:text name="'viewissue.remove.attachment.msg'"/></p>
                </page:param>
                <page:param name="width">100%</page:param>
                <page:param name="action">DeleteAttachment.jspa</page:param>
                <page:param name="submitId">delete_submit</page:param>
                <page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
                <page:param name="cancelURI"><webwork:url page="ManageAttachments.jspa"><webwork:param name="'id'" value="/issueId" /></webwork:url></page:param>
                <ui:component name="'id'" template="hidden.jsp" theme="'single'" value="/issueId" />
                <ui:component name="'deleteAttachmentId'" template="hidden.jsp" theme="'single'" value="/deleteAttachmentId" />
            </page:applyDecorator>
            </div>
        </div>
    </div>
</div>
</body>
</html>
