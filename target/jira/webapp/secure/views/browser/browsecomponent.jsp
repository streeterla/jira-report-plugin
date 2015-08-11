<%@ taglib uri="webwork" prefix="webwork" %>
<html>
<head>
    <title><webwork:property value="/project/name" />: <webwork:property value="/component/name" /></title>
    <meta name="decorator" content="general" />
    <content tag="section">browse_link</content>
</head>
<body class="type-aa">
<script type="text/javascript">window.dhtmlHistory.create();</script>

<div class="item-header" id="content-top">

<webwork:if test="/hasCreateIssuePermissionForProject == true">
    <div id="create-issue">
        <h2><webwork:text name="'common.words.create'" />:</h2>
        <ul class="operations">
        <webwork:iterator value="/popularIssueTypes">
            <li>
                <a class="lnk" title="<webwork:property value="./descTranslation"/>" href="<%= request.getContextPath() %>/secure/CreateIssue.jspa?pid=<webwork:property value="/project/id" />&issuetype=<webwork:property value="./id" />"><img src="<%= request.getContextPath() %><webwork:property value="./iconUrl"/>" alt=""/><span><webwork:property value="./nameTranslation"/></span></a>
            </li>
        </webwork:iterator>
        <webwork:if test="/otherIssueTypes/empty == false">
            <li class="aui-dd-parent">
                <a id="more" class="lnk aui-dd-link standard no-icon" href="#" title="<webwork:text name="'browseproject.create.other.issue.type'" />"><span><webwork:text name="'common.words.other.no.dots'" /></span></a>
                <div class="aui-dropdown standard hidden">
                    <ul id="more-dropdown" class="last">
                        <webwork:iterator value="/otherIssueTypes">
                            <li class="dropdown-item">
                                <a title="<webwork:property value="./descTranslation"/>" href="<%= request.getContextPath() %>/secure/CreateIssue.jspa?pid=<webwork:property value="/project/id" />&issuetype=<webwork:property value="./id" />"><img src="<%= request.getContextPath() %><webwork:property value="./iconUrl"/>" alt=""/><span><webwork:property value="./nameTranslation"/></span></a>
                            </li>
                        </webwork:iterator>
                    </ul>
                </div>
            </li>
        </webwork:if>
        </ul>
    </div>
</webwork:if>
    
    <h1 class="item-name avatar">
        <a href="<%= request.getContextPath() %>/browse/<webwork:property value="/project/key"/>#selectedTab=com.atlassian.jira.plugin.system.project:summary-panel" title="<webwork:property value="text('browsecomponent.back.to.desc', /browseProjectTabLabel, /project/name)" />">
            <webwork:if test="/project/avatar != null">
                <img id="project-avatar" alt="" class="project-avatar-48" height="48" src="<%= request.getContextPath() %>/secure/projectavatar?pid=<webwork:property value="/project/id"/>&avatarId=<webwork:property value="/project/avatar/id"/>&size=large" width="48">
            </webwork:if>
            <span><webwork:property value="text('browsecomponent.back.to.desc', /browseProjectTabLabel, /project/name)" /></span>
        </a>
    </h1>
    <ul class="breadcrumbs">
        <li>
            <a href="<%= request.getContextPath() %>/browse/<webwork:property value="/project/key"/>#selectedTab=com.atlassian.jira.plugin.system.project:summary-panel" title="<webwork:property value="text('browsecomponent.back.to.desc', /browseProjectTabLabel, /project/name)" />"><webwork:property value="/project/name" />:</a>
        </li>
    </ul>
    <h2 class="item-summary"><webwork:property value="/component/name" /></h2>
</div>

<div id="main-content">
    <ul class="vertical tabs">
        <webwork:iterator value="/componentTabPanels" status="'status'">
            <li class="<webwork:if test="/selected == completeKey">active</webwork:if> <webwork:if test="@status/first == true"> first</webwork:if>">
                <a class="browse-tab" id="<webwork:if test="./completeKey/startsWith('com.atlassian.jira.plugin.system.')"><webwork:property value="./key"/></webwork:if><webwork:else><webwork:property value="./completeKey"/></webwork:else>-panel" href="<webwork:url value="'/browse/' + /project/key + '/component/' + /component/id"><webwork:param name="'selectedTab'" value="completeKey"/></webwork:url>"><strong><webwork:property value="label" /></strong></a>
            </li>
        </webwork:iterator>
    </ul>
    <div class="active-area" id="project-tab">
        <webwork:property value="/tabHtml" escape="false" />
    </div>
</div>

</body>
</html>
