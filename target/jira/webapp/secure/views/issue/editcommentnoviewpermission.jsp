


<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'viewissue.commentedit.title'"/></title>
    <meta content="issuesummary" name="decorator" />
</head>
<body class="lp">
<webwork:if test="/issueValid == true">
    <div class="item-header">
        <webwork:property value="issue">
            <jsp:include page="/includes/panels/issue_headertable.jsp" />
        </webwork:property>
    </div>
    <div id="main-content">
        <div class="active-area">
            <h2 class="formtitle"><webwork:text name="'viewissue.commentedit.title'"/></h2>
            <p class="notify error"><webwork:text name="'comment.service.error.no.comment.visibility.no.user'"/></p>
        </div>
    </div>
</webwork:if>
</body>
</html>
