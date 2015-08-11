<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<html>
<head>
    <meta content="general" name="decorator" />
    <title>[#<webwork:property value="/issueObject/key" />] <webwork:property value="/issueObject/summary" /></title>
</head>
<body>
<div class="item-header">
    <webwork:property value="issue">
        <jsp:include page="/includes/panels/issue_headertable.jsp" />
    </webwork:property>
</div>
<div id="main-content">
    <div class="active-area">
        <div class="content">
            <webwork:bean id="fieldVisibility" name="'com.atlassian.jira.web.bean.FieldVisibilityBean'" />
            <webwork:property value="/issueObject">
                <page:applyDecorator name="jirapanel">
                    <page:param name="title">Update fields for issue '<webwork:property value="summary" />' failed</page:param>
                    <page:param name="cancelURI"><%=request.getContextPath()%>/secure/Dashboard.jspa</page:param>
                    <page:param name="instructions">
                    <p>Unable to update fields. Return to your form and fix up the problem.</p>
                    </page:param>
                    <webwork:if test="/errors && /errors/size() > 0">
                    <div class="warningBox">
                            <span class="errMsg">Validation failed for the fields below:</span>
                            <ul class="square">
                            <webwork:iterator value="/errors" status="'status'">
                                <li>For field <span class="errMsg"><webwork:property value="/field(./key)/name" /></span>: <webwork:property value="./value" /><li>
                            </webwork:iterator>
                            </ul>
                    </div>
                    </webwork:if>
                </page:applyDecorator>
            </webwork:property>
        </div>
    </div>
</div>
</body>
</html>
