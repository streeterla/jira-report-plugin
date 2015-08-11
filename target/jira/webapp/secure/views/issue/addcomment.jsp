<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <webwork:if test="issueValid == 'true' && ableToComment == 'true'">
        <meta content="issuesummary" name="decorator" />
    </webwork:if>
    <webwork:else>
        <meta content="notitle" name="decorator" />
    </webwork:else>
    <title><webwork:text name="'comment.add.title'"/>: <webwork:property value="summary" /> [<webwork:if test="issueValid == 'true'"><webwork:property value="issue/string('key')" /></webwork:if>]</title>
</head>
<body class="type-a">
<style>
<!--
.fieldLabelArea { width: 10%; }
-->
</style>
<webwork:if test="issueValid == true && ableToComment == true">
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
                        <page:param name="action">AddComment.jspa</page:param>
                        <page:param name="cancelURI"><webwork:property value="issuePath" /></page:param>
                        <page:param name="submitId">add_comment_submit</page:param>
                        <page:param name="submitName"> <webwork:property value="text('comment.add.submitname')"/> </page:param>
                        <page:param name="title"><webwork:text name="'comment.add.title'"/></page:param>
                        <page:param name="width">100%</page:param>
                        <page:param name="description"><webwork:text name="'comment.add.desc'"/></page:param>

                        <webwork:property value="/fieldScreenRendererLayoutItemForField(/field('comment'))/fieldLayoutItem/orderableField/createHtml(/fieldScreenRendererLayoutItemForField(/field('comment'))/fieldLayoutItem, /, /, /issueObject, null)" escape="'false'" />

                        <ui:component name="'id'" template="hidden.jsp" theme="'single'"  />
                    </page:applyDecorator>
                </div>
            </div>
        </div>
    </div>
</webwork:if>
<webwork:else>
    <page:applyDecorator name="jiraform">
        <page:param name="title"><webwork:text name="'comment.add.title'"/></page:param>
		<page:param name="description"><webwork:text name="'comment.add.desc'" /></page:param>
		<%@ include file="/includes/addcomment-notloggedin.jsp" %>
	</page:applyDecorator>
</webwork:else>
</body>
</html>
