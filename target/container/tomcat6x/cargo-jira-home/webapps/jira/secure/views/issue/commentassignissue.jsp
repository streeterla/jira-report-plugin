<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title>
        <meta content="issuesummary" name="decorator" />
        <webwork:if test="/issueValid == 'true'">
            <webwork:property value="/i18nTextViaMetaAttr('jira.i18n.title',actionDescriptor/name)"/>
            [<webwork:property value="issue/string('key')" />]
        </webwork:if>
    </title>
</head>
<body class="type-a">
<webwork:if test="/issueValid == true">
    <div class="item-header">
        <webwork:property value="issue">
            <jsp:include page="/includes/panels/issue_headertable.jsp" />
        </webwork:property>
    </div>
    <div id="main-content">
        <div class="active-area">
            <div id="primary" class="column">
                <div class="content intform">
                    <page:applyDecorator name="jiraform">
                        <page:param name="title">
                            <webwork:property value="/i18nTextViaMetaAttr('jira.i18n.title',actionDescriptor/name)"/>
                        </page:param>
                        <page:param name="description">
                            <webwork:property value="/i18nTextViaMetaAttr('jira.i18n.description',actionDescriptor/metaAttributes/('description'))"/>
                            <webwork:if test="actionDescriptor/metaAttributes/('jira.i18n.description')">
                                <webwork:if test="actionDescriptor/metaAttributes/('jira.i18n.description.2')">
                                    <p><webwork:text name="actionDescriptor/metaAttributes/('jira.i18n.description.2')"/></p>
                                </webwork:if>
                                <webwork:if test="actionDescriptor/metaAttributes/('jira.i18n.description.3')">
                                    <p><webwork:text name="actionDescriptor/metaAttributes/('jira.i18n.description.3')"/></p>
                                </webwork:if>
                             </webwork:if>
                        </page:param>
                        <page:param name="width">100%</page:param>
                        <page:param name="multipart">true</page:param>
                        <page:param name="action">CommentAssignIssue.jspa</page:param>
                        <page:param name="cancelURI"><webwork:property value="issuePath" /></page:param>
                        <page:param name="submitId">comment_assign_submit</page:param>
                        <page:param name="submitName"><webwork:property value="/i18nTextViaMetaAttr('jira.i18n.submit',actionDescriptor/name)"/></page:param>
                        <webwork:if test="/issueExists == true">
                            <webwork:component template="issuefields.jsp" name="'createissue'">
                                <webwork:param name="'issue'" value="/issueObject"/>
                                <webwork:param name="'tabs'" value="/fieldScreenRenderTabs"/>
                                <webwork:param name="'errortabs'" value="/tabsWithErrors"/>
                                <webwork:param name="'selectedtab'" value="/selectedTab"/>
                                <webwork:param name="'ignorefields'" value="/ignoreFieldIds"/>
                                <webwork:param name="'create'" value="'false'"/>
                            </webwork:component>
                            <%-- COMMENT --%>
                            <jsp:include page="/includes/panels/updateissue_comment.jsp" />
                            <ui:component name="'action'" template="hidden.jsp" theme="'single'" />
                            <ui:component name="'id'" template="hidden.jsp" theme="'single'" />
                            <ui:component name="'viewIssueKey'" template="hidden.jsp" theme="'single'" />
                        </webwork:if>
                    </page:applyDecorator>
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
