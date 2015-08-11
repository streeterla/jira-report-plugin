<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<webwork:bean id="fieldVisibility" name="'com.atlassian.jira.web.bean.FieldVisibilityBean'" />
<html>
<head>
    <meta content="general" name="decorator" />
    <title>[#<webwork:property value="/issueObject/key" />] <webwork:property value="/issueObject/summary" /></title>
    <content tag="section">find_link</content>
</head>
<body class="type-ab stalker">
<fieldset class="hidden parameters">
    <input type="hidden" id="viewMoreMsg" value="<webwork:property value="text('viewissue.shorten.view.more')" />">
    <input type="hidden" id="hideMsg" value="<webwork:property value="text('viewissue.shorten.hide')" />" >
    <input type="hidden" id="errorVoting" value="<webwork:text name="'issue.operations.error.voting'"/>" >
    <input type="hidden" id="errorWatching" value="<webwork:text name="'issue.operations.error.watching'"/>" >
    <input type="hidden" id="issueOpTitleUnvote" value="<webwork:text name="'issue.operations.simple.voting.alreadyvoted'"/>" >
    <input type="hidden" id="issueOpTitleVote" value="<webwork:text name="'issue.operations.simple.voting.notvoted'"/>" >
    <input type="hidden" id="issueOpTitleWatch" value="<webwork:text name="'issue.operations.simple.startwatching'"/>" >
    <input type="hidden" id="issueOpTitleUnwatch" value="<webwork:text name="'issue.operations.simple.stopwatching'"/>" >
    <input type="hidden" id="issueOpUnvote" value="<webwork:text name="'issue.operations.simple.unvote'"/>" >
    <input type="hidden" id="issueOpVote" value="<webwork:text name="'issue.operations.simple.vote'"/>" >
    <input type="hidden" id="issueOpWatch" value="<webwork:text name="'issue.operations.watch'"/>" >
    <input type="hidden" id="issueOpUnwatch" value="<webwork:text name="'issue.operations.unwatch'"/>" >
</fieldset>

<div id="stalker" <webwork:if test="/enableStalkerBar() == true"> class="stalker"</webwork:if>>
    <div class="item-header">
    <webwork:property value="issue">
        <jsp:include page="/includes/panels/issue_headertable.jsp" />
    </webwork:property>
    </div>
    <jsp:include page="/includes/panels/issue/viewissue-opsbar.jsp"/>
    <div class="btm"></div>
</div>
<div id="main-content">
    <div class="active-area">
        <div class="column" id="primary">
            <div class="content">
                <%@ include file="/includes/errormessages.jsp" %>
                <%-- Make the Issue object referenceable via '@issue' (eg. from issue_descriptiontable.jsp) --%>
                <webwork:property value="/issueObject" id="issue" />
                <%-- Put the issue GV on the stack --%>
                <webwork:property value="issue">

                    <webwork:property value="/summaryHtml" escape="false"/>

                    <webwork:if test="/fieldScreenRenderTabs/empty == false">
                        <jsp:include page="/includes/panels/issue/view_customfields.jsp" />
                    </webwork:if>

                    <%@ include file="/includes/panels/issue_descriptiontable.jsp" %>

                    <webwork:property value="./long('project')">
                        <webwork:if test="showIssueDetails(., ..) == true">
                            <webwork:if test="@fieldVisibility/fieldHidden(., 'environment', ../string('type')) == false && ../string('environment') != null && ../string('environment')/length > 0">
                                <div id="environmentmodule" class="module">
                                    <div id="environment-val" class="mod-content">
                                        <ul class="item-details">
                                            <li>
                                                <dl>
                                                    <dt><webwork:text name="'issue.field.environment'" />:</dt>
                                                    <dd <webwork:if test="../string('environment')/length > 255">class="twixified"</webwork:if>>
                                                        <webwork:property value="/renderedEnvironmentFieldValue" escape="'false'" />
                                                    </dd>
                                                </dl>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </webwork:if>
                            <jsp:include page="/includes/panels/issue/view_attachments.jsp" />
                            <jsp:include page="/includes/panels/issue/view_linking.jsp" />
                            <jsp:include page="/includes/panels/issue/view_trackbacks.jsp" />
                        </webwork:if>
                    </webwork:property>

                    <jsp:include page="/includes/panels/issue/view_subtaskissues.jsp" />

                    <%@ include file="/includes/trackback_rdf.jsp"%>

                </webwork:property>


                <div id="activitymodule" class="module">
                    <div class="mod-header">
                        <h3><webwork:text name="'common.concepts.activity'" /></h3>
                    </div>
                    <div class="mod-content">
                        <jsp:include page="/includes/panels/issue/actions.jsp" />
                    </div>
                </div>

                <webwork:if test="hasIssuePermission('comment', issue) == true">
                 <div id="addcomment" class="module">
                    <div class="mod-content">
                            <page:applyDecorator name="auiform">
                                <page:param name="id">add_comment</page:param>
                                <page:param name="action"><webwork:url value="'/secure/AddComment.jspa'" /></page:param>
                                <page:param name="cancelURI">#</page:param>
                                <page:param name="submitId">add_comment_submit</page:param>
                                <page:param name="submitName"><webwork:property value="text('common.forms.add')"/> </page:param>
                                <page:param name="theme">top-label add_comment</page:param>
                                <page:param name="autoSelectFirst">false</page:param>
                                    <webwork:property value="/commentBoxHTML()" escape="false" />
                                    <input type="hidden" name="id" value="<webwork:property value="/id"/>"/>
                            </page:applyDecorator>
                    </div>
                    <div class="mod-footer">
                        <ul class="ops">
                            <li><a href="#" id="footer-comment-button" class="first last button"><webwork:text name="'comment.update.title'" /></a></li>
                        </ul>
                    </div>
                 </div>
                </webwork:if>
                
            </div><%-- //.content --%>
        </div><%-- //.column#primary --%>
        <div class="column" id="secondary">
            <div class="content">
                <webwork:property value="issue">
                   <webwork:property value="./long('project')">
                       <webwork:property value="/peopleHtml" escape="false"/>
                       <jsp:include page="/includes/panels/issue/view_dates.jsp" />
                       <jsp:include page="/includes/panels/issue/view_timetracking.jsp" />
                   </webwork:property>
                </webwork:property>
            </div><%--content--%>
        </div><%-- //.column#secondary --%>
    </div><%-- //.active-area --%>
</div><%-- //#main-content --%>
</body>
</html>
