<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="jiratags" prefix="jira" %>

<html>
<head>
    <title><webwork:text name="'portal.configure'"/></title>
    <meta name="decorator" content="general" />
    <content tag="section">home_link</content>
</head>
<body>
<script type="text/javascript">window.dhtmlHistory.create();</script>
<div class="item-header" id="content-top">
    <div class="operations-container">
        <ul class="operations">
            <li><a class="lnk no-icon" id="create_page" href="<webwork:url page="AddPortalPage!default.jspa"></webwork:url>"><webwork:text name="'addportalpage.clone.blank'"/></a>
            <li><a class="lnk no-icon" id="restore_defaults" href="<webwork:url page="RestoreDefaultDashboard!default.jspa"><webwork:param name="'destination'" value="'manageportal'"/></webwork:url>"><webwork:text name="'restoredefaultdashboard.restoredefaults'"/></a>
        </ul>
    </div>
    <h1 class="item-name avatar">
        <img id="project-avatar" alt="" class="project-avatar-48" height="48" src="<%= request.getContextPath() %>/images/icons/dashboards_manage_48.png" width="48">
        <span><webwork:text name="'configureportalpages.title'"/></span>
    </h1>
    <h2 class="item-summary"><webwork:text name="'configureportalpages.title'"/></h2>
</div>
<div id="main-content">
    <jsp:include page="configureportalpages-tabs.jsp" />
    <div class="active-area">
        <jsp:include page="configureportalpages-content.jsp" />
    </div>
</div>
</body>
</html>
