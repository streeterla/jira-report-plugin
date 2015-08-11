<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <meta content="issuesummary" name="decorator" />
	<title><webwork:text name="'viewissue.delete.link.title'"/> <webwork:property value="del" /></title>
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
                    <page:param name="title"><webwork:text name="'viewissue.delete.link.title'"/>: <webwork:property value="/issue/string('key')"/> <webwork:property value="directionName"/> <webwork:property value="targetIssueKey"/></page:param>
                    <page:param name="autoSelectFirst">false</page:param>
                    <page:param name="description">
                        <p><webwork:text name="'viewissue.delete.link.msg'"/></p>
                    </page:param>
                    <page:param name="width">100%</page:param>
                    <page:param name="action"><webwork:url page="DeleteLink.jspa"><webwork:param name="'id'" value="id"/><webwork:param name="'destId'" value="destId"/><webwork:param name="'sourceId'" value="sourceId"/><webwork:param name="'linkType'" value="linkType"/></webwork:url></page:param>
                    <page:param name="submitId">delete_submit</page:param>
                    <page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
                    <page:param name="cancelURI"><webwork:url page="ManageLinks.jspa"><webwork:param name="'id'" value="/id" /></webwork:url></page:param>
                    <input type="hidden" name="confirm" value="true">
                </page:applyDecorator>
            </div>
        </div>
    </div>
</div>
</body>
</html>
