<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<html>
<head>
    <meta content="issuesummary" name="decorator" />
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
        <webwork:if test="/canAddLink == true">
            <div class="command-bar">
                <div class="ops-cont">
                    <ul class="ops">
                        <li id="back-lnk-section" class="last">
                            <a id="back-lnk" class="button first last" href="<%= request.getContextPath() %>/browse/<webwork:property value="/issueObject/key" />"><span class="icon icon-back"><span><webwork:text name="'opsbar.back.to.issue'"/></span></span><webwork:text name="'opsbar.back.to.issue'"/></a>
                        </li>
                    </ul>
                    <ul class="ops">
                        <li><a class="button first last" href="<%= request.getContextPath() %>/secure/LinkExistingIssue!default.jspa?id=<webwork:property value="/issueObject/id" />"><webwork:text name="'issue.operations.linkexistingissue'" /></a></li>                        
                    </ul>
                </div>
            </div>
        </webwork:if>
        <h2><webwork:text name="'managelinks.title'"/></h2>
        <div class="content">
            <jsp:include page="/includes/errormessages.jsp" />
            <div class="module">
                <div class="mod-content">
                    <jsp:include page="managelinkstable.jsp" />
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
