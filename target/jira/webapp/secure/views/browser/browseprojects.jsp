<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><webwork:text name="'browseprojects.title'" /></title>
    <meta name="decorator" content="general" />
    <content tag="section">browse_link</content>
</head>


<webwork:if test="/categories/size > 0">
<body class="type-a">
<script type="text/javascript">window.dhtmlHistory.create();</script>
    <div class="item-header no-avatar" id="content-top">
        <h2 class="item-summary"><webwork:text name="'browseprojects.title'"/></h2>
    </div>
    <div id="main-content" class="bp">
    <webwork:if test="/showTabs() == true">
        <ul class="vertical tabs">
            <webwork:iterator value="tabs" status="'status'">
                <li id="<webwork:property value="./id" />-panel-tab" class="<webwork:if test="@status/first == true">first </webwork:if><webwork:if test="/selectedCategory == ./id">active</webwork:if>">
                   <a id="<webwork:property value="./id" />-panel-tab-lnk" rel="<webwork:property value="./id" />" title="<webwork:property value="./description" />" href="<%= request.getContextPath() %>/secure/BrowseProjects.jspa?selectedCategory=<webwork:property value="./id" />"><strong><webwork:property value="./name" /></strong></a>
                </li>
            </webwork:iterator>
            <li id="all-panel-tab" class="<webwork:if test="/selectedCategory == 'all'">active</webwork:if>">
               <a id="all-panel-tab-lnk" rel="all" title="<webwork:text name="'browse.projects.all.desc'"/>" href="<%= request.getContextPath() %>/secure/BrowseProjects.jspa?selectedCategory=all"><strong><webwork:text name="'browse.projects.all'"/></strong></a>
            </li>
        </ul>
    </webwork:if>
        <div class="active-area category-list" id="project-tab">
            <div id="primary" class="column">
                <div class="content">
                <webwork:iterator value="categories" status="'status'">
                    <div class="module<webwork:if test="./all == true"> inall</webwork:if> <webwork:if test="/selectedCategory == ./id || (/selectedCategory == 'all' && ./all == true)">active</webwork:if><webwork:else>hidden</webwork:else>" id="<webwork:property value="./id" />-panel">
                        <div class="mod-header plain">
                            <h3><webwork:property value="./name" /></h3>
                        </div>
                        <div class="mod-content">
                        <webwork:property value="./projects">
                            <%@ include file="/includes/project/projectstable.jsp" %>
                        </webwork:property>
                        </div>
                    </div>
                </webwork:iterator>
                </div>
            </div>
        </div>
    </div>
</webwork:if>

<webwork:else>
<body class="lp">
<script type="text/javascript">window.dhtmlHistory.create();</script>
    <div id="main-content">
        <div class="active-area">
            <div id="primary" class="column">
                <div class="content">
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <%@ include file="/includes/noprojects.jsp" %>
                    </table>
                </div>
            </div>
        </div>
    </div>
</webwork:else>

</body>
</html>
