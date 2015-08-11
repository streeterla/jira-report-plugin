<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'invalid.workflow.action.title'"/></title>
</head>
<body class="lp">
    <div class="item-header">
        <webwork:property value="issue">
            <jsp:include page="/includes/panels/issue_headertable.jsp" />
        </webwork:property>
    </div>
    <div id="main-content">
        <div class="active-area">
            <h2><webwork:text name="'invalid.workflow.action.title'"/></h2>
            <div class="notify info" >
                <webwork:text name="'invalid.workflow.action.desc'" >
                    <webwork:param><a id="refreshIssue" href="<%=request.getContextPath()%>/browse/<webwork:property value="issueObject/key" />"><webwork:text name="'invalid.workflow.action.link.text'"/></a></webwork:param>
                    <webwork:param><webwork:property value="issueObject/statusObject/nameTranslation" /></webwork:param>
                    <webwork:param><webwork:property value="workflowTransitionDisplayName" /></webwork:param>
                </webwork:text>
            </div>
        </div>
    </div>
</body>
</html>
