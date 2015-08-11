<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ include file="/includes/js/multipickerutils.jsp" %>

<html>
<head>
    <meta content="issuesummary" name="decorator" />
	<title><webwork:text name="'watcher.manage.title'"/></title>
</head>
<body>
<webwork:if test="/issueValid == true">
    <div class="item-header">
        <webwork:property value="issue">
            <jsp:include page="/includes/panels/issue_headertable.jsp" />
        </webwork:property>
    </div>
    <div id="main-content">
        <div class="active-area">
            <div class="command-bar">
                <div class="ops-cont">
                    <ul class="ops">
                        <li id="back-lnk-section" class="last">
                            <a id="back-lnk" class="button first last" href="<%= request.getContextPath() %>/browse/<webwork:property value="/issueObject/key" />"><span class="icon icon-back"><span><webwork:text name="'opsbar.back.to.issue'"/></span></span><webwork:text name="'opsbar.back.to.issue'"/></a>
                        </li>
                    </ul>
                    <webwork:if test="/watchingEnabled == true">
                    <ul class="ops">
                        <li>
                            <webwork:if test="watching == true">
                                <a class="button first last" href="ManageWatchers!stopWatching.jspa?key=<webwork:property value="/issue/string('key')"/>"><webwork:text name="'watcher.manage.stop.watch'" /></a>
                            </webwork:if>
                            <webwork:else>
                                <a class="button first last" href="ManageWatchers!startWatching.jspa?key=<webwork:property value="/issue/string('key')"/>"><webwork:text name="'watcher.manage.start.watch'" /></a>
                            </webwork:else>
                        </li>
                    </ul>
                    </webwork:if>
                </div>
            </div>
            <h2><webwork:text name="'watcher.manage.title'"/></h2>
            <div class="content">
                <div class="module">
                    <div class="mod-content">
                        <webwork:if test="hasErrorMessages == 'true'">
                            <div class="notify error">
                                <ul>
                                    <webwork:iterator value="flushedErrorMessages">
                                        <li><webwork:property /></li>
                                    </webwork:iterator>
                                </ul>
                            </div>
                        </webwork:if>
                        <webwork:if test="/watchingEnabled == false">
                            <p><span class="warning"><webwork:text name="'watcher.disabled'"/>.</span></p>
                        </webwork:if>
                        <webwork:elseIf test="/issueValid == true">
                            <%-- Renders the list of watchers and the picker --%>
                            <webwork:property value="/userPickerHtml" escape="false"/>
                        </webwork:elseIf>
                    </div>
                </div>
            </div>
        </div>
    </div>
</webwork:if>
<webwork:else>
    <div class="padded">
        <div class="notify error"><webwork:text name="'issue.wasdeleted'"/></div>
    </div>
</webwork:else>
</body>
</html>
