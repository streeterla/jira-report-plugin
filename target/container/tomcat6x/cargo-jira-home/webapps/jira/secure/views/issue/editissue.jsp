<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <meta content="issuesummary" name="decorator" />
    <title><webwork:text name="'editissue.title'"/>: <webwork:property value="summary" />
        <webwork:if test="/issueValid == 'true'">
          [<webwork:property value="issue/string('key')" />]
        </webwork:if>
    </title>
</head>
<body class="type-a">
<webwork:if test="/issueValid == 'true' && editable == 'true'">
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
                        <page:param name="action"><%= request.getContextPath() %>/secure/EditIssue.jspa</page:param>
                        <page:param name="cancelURI"><webwork:property value="issuePath" /></page:param>
                        <page:param name="submitId">update_submit</page:param>
                        <page:param name="submitName"><webwork:text name="'common.forms.update'" /></page:param>
                        <page:param name="title"><webwork:text name="'editissue.title'"/></page:param>
                        <page:param name="width">100%</page:param>
                        <page:param name="multipart">true</page:param>
                        <page:param name="description"><webwork:text name="'editissue.desc'"/></page:param>

                        <webwork:if test="/issueExists == true">

                            <webwork:component template="issuefields.jsp" name="'createissue'">
                                <webwork:param name="'issue'" value="/issueObject"/>
                                <webwork:param name="'tabs'" value="/fieldScreenRenderTabs"/>
                                <webwork:param name="'errortabs'" value="/tabsWithErrors"/>
                                <webwork:param name="'selectedtab'" value="/selectedTab"/>
                                <webwork:param name="'ignorefields'" value="/ignoreFieldIds"/>
                                <webwork:param name="'create'" value="'false'"/>
                            </webwork:component>

                            <jsp:include page="/includes/panels/updateissue_comment.jsp" />

                            <ui:component name="'id'" template="hidden.jsp"  theme="'single'" />

                        </webwork:if>
                    </page:applyDecorator>
                </div>
            </div>
        </div>
    </div>
</webwork:if>
<webwork:elseIf test="/issueValid == 'true'">
    <page:applyDecorator name="jiraform">
        <webwork:include page="/includes/editissue-notloggedin.jsp">
            <webwork:if test="hasEditIssuePermission(/issueObject) == 'true'">
                <webwork:param name="'errormessage'" value="'editissue.error.no.edit.workflow'" />
            </webwork:if>
            <webwork:else>
                <webwork:param name="'errormessage'" value="'editissue.error.no.edit.permission'" />
            </webwork:else>
        </webwork:include>
	</page:applyDecorator>
</webwork:elseIf>
<webwork:else>
    <div class="padded">
        <div class="notify error"><webwork:text name="'issue.wasdeleted'"/></div>
    </div>
</webwork:else>
</body>
</html>
