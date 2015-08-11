<%@ taglib prefix="webwork" uri="webwork" %>
<script type="text/javascript">window.dhtmlHistory.create();</script>
<div class="item-header" id="content-top">
    <jsp:include page="viewprofile-tools.jsp" />
    <h1 class="item-name avatar">
        <img id="project-avatar" alt="" class="project-avatar-48" height="48" src="<%= request.getContextPath() %>/images/icons/userprofile_silhouette_48.png" width="48">
        <span><webwork:text name="'common.concepts.profile'"/>: <webwork:property value="user/fullName"/></span>
    </h1>
    <h2 class="item-summary" id="up-user-title"><webwork:text name="'common.concepts.profile'"/>: <span id="up-user-title-name"><webwork:property value="user/fullName"/></span></h2>
</div>

<div id="main-content">
    <jsp:include page="viewprofile-tabs.jsp" />
    <div class="active-area">
        <h2 id="up-tab-title"><webwork:property value="/labelForSelectedTab"/></h2>
        <jsp:include page="viewprofile-content.jsp" />
    </div>
</div>