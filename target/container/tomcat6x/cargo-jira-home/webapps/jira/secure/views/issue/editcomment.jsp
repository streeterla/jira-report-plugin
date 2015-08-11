<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<html>
<head>
    <meta content="issuesummary" name="decorator" />
    <title><webwork:text name="'viewissue.comment.edit.title'"/></title>
</head>
<body>
<div class="item-header">
    <webwork:property value="issue">
        <jsp:include page="/includes/panels/issue_headertable.jsp" />
    </webwork:property>
</div>
<div id="main-content">
    <div class="active-area">
        <div class="content">
            <div class="intform">
                <page:applyDecorator name="jiraform">
                    <page:param name="action">EditComment.jspa</page:param>
                    <page:param name="cancelURI"><webwork:if test="/issueValid == true"><webwork:property value="issuePath"/></webwork:if></page:param>
                    <webwork:if test="/errorMessages/size == 0">
                        <page:param name="submitId">save_submit</page:param>
                        <page:param name="submitName"> <webwork:text name="'common.words.save'"/> </page:param>
                    </webwork:if>
                    <page:param name="title"><webwork:text name="'viewissue.comment.edit.title'"/></page:param>
                    <page:param name="width">100%</page:param>
                    <page:param name="description">
                        <webwork:text name="'viewissue.comment.edit.description'"/>
                    </page:param>
                    <%-- display only if not general errors --%>
                    <webwork:if test="/errorMessages/size == 0">
                        <tr class="fieldArea">
                            <td class="fieldLabelArea"><webwork:text name="'viewissue.comment.author'" />:</td>
                            <td class="fieldValueArea"><jira:formatuser user="/commentObject/author" type="'profileLink'" id="'comment_summary'"/></td>
                        </tr>
                        <tr class="fieldArea">
                            <td class="fieldLabelArea"><webwork:text name="'viewissue.comment.created'" />:</td>
                            <td class="fieldValueArea"><webwork:property value="/outlookDate/formatDMY(/commentObject/created)"/></td>
                        </tr>
                        <webwork:if test="/commentObject/created/equals(/commentObject/updated) == false">
                            <tr class="fieldArea">
                                <td class="fieldLabelArea"><webwork:text name="'viewissue.comment.update.author'" />:</td>
                                <td class="fieldValueArea"><jira:formatuser user="/commentObject/updateAuthor" type="'profileLink'" id="'comment_summary_updated'"/></td>
                            </tr>
                            <tr class="fieldArea">
                                <td class="fieldLabelArea"><webwork:text name="'viewissue.comment.updated'" />:</td>
                                <td class="fieldValueArea"><webwork:property value="/outlookDate/formatDMY(/commentObject/updated)"/></td>
                            </tr>
                        </webwork:if>
                        <webwork:if test="/commentObject/level != null">
                            <tr class="fieldArea">
                                <td class="fieldLabelArea"><webwork:text name="'viewissue.comment.visibleby'"/>:</td>
                                <td class="fieldValueArea"><webwork:property value="/commentObject/level" /></td>
                            </tr>
                        </webwork:if>
                        <webwork:property
                            value="/fieldScreenRendererLayoutItemForField(/field('comment'))/fieldLayoutItem/orderableField/editHtml(/fieldScreenRendererLayoutItemForField(/field('comment'))/fieldLayoutItem, /, /, /issueObject, null)"
                            escape="'false'"/>
                    </webwork:if>
                    <ui:component name="'commentId'" template="hidden.jsp" theme="'single'"/>
                    <ui:component name="'id'" template="hidden.jsp" theme="'single'"/>
                </page:applyDecorator>
            </div>
        </div>
    </div>
</div>
</body>
</html>
