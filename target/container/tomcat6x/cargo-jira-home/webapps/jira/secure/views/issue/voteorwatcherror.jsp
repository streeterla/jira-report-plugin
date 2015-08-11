<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<html>
<head>
    <meta content="general" name="decorator" />
    <title>[#<webwork:property value="/issueObject/key" />] <webwork:property value="/issueObject/summary" /></title>
    <content tag="section">find_link</content>
</head>
<body class="type-a">

<div id="stalker">
    <div class="item-header">
    <webwork:property value="issue">
        <jsp:include page="/includes/panels/issue_headertable.jsp" />
    </webwork:property>
    </div>
</div>
<div id="main-content">
    <div class="active-area">
        <div class="column" id="primary">
            <div class="content">
                <%@ include file="/includes/errormessages.jsp" %>
            </div><%--content--%>
        </div><%-- //.column#secondary --%>
    </div><%-- //.active-area --%>
</div><%-- //#main-content --%>
</body>
</html>
