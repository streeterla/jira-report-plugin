<%@ page import="java.util.*"%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<html>
<head>
    <meta content="issuesummary" name="decorator" />
    <title>[#<webwork:property value="/issueObject/key" />] <webwork:property value="/issueObject/summary" /></title>
</head>
<body>
<jsp:include page="/includes/errormessages.jsp" />
<div class="item-header">
    <webwork:property value="issue">
        <jsp:include page="/includes/panels/issue_headertable.jsp" />
    </webwork:property>
</div>
<div id="main-content">
    <div class="active-area">
        <h2><webwork:text name="'trackback.manage.title'"/></h2>
        <div class="content">
            <div class="module" id="issue-attachments-table">
                <div class="mod-content">
                    <p><webwork:text name="'trackback.manage.desc'"/></p>
                    <webwork:if test="applicationProperties/option('jira.option.trackback.receive') == true && trackbacks/size > 0">
                        <jsp:include page="managetrackbackstable.jsp" />
                    </webwork:if>
                    <webwork:else>
                        <div class="notify info"><webwork:text name="'trackback.no.links'"/></div>
                    </webwork:else>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
