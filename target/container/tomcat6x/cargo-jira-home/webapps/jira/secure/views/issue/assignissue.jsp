<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <meta content="issuesummary" name="decorator" />
    <title><webwork:text name="'assign.title'"/></title>
</head>
<body class="type-a">
<webwork:if test="/issueValid == true">
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
                        <page:param name="title"><webwork:text name="'assign.title'"/></page:param>
                        <page:param name="description">
                            <webwork:text name="'assign.desc'"/>
                        </page:param>
                        <page:param name="width">100%</page:param>
                        <page:param name="action">AssignIssue.jspa</page:param>
                        <page:param name="cancelURI"><webwork:property value="issuePath" /></page:param>
                        <page:param name="submitId">assign_submit</page:param>
                        <page:param name="submitName"><webwork:text name="'common.words.assign'"/></page:param>

                        <jsp:include page="/includes/panels/issue/assignee.jsp" />
                        <%@ include file="/includes/panels/updateissue_comment.jsp" %>

                        <tr class="hidden"><td>
                            <input type="hidden" name="action" value="<webwork:property value="action"/>">
                        </td></tr>
                        <webwork:component name="'id'" template="hidden.jsp" theme="'single'"  />
                    </page:applyDecorator>
                </div>
            </div>
        </div>
    </div>
</webwork:if>
<webwork:else>
    <div class="padded">
        <div class="notify error"><webwork:text name="'issue.wasdeleted'"/></div>
    </div>
</webwork:else>
</body>
</html>
