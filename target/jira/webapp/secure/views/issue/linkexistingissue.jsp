<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <meta content="issuesummary" name="decorator" />
	<title><webwork:text name="'linkissue.title'"/></title>
</head>
<body class="type-a">
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
                    <page:param name="title"><webwork:text name="'linkissue.title'"/></page:param>
                    <page:param name="description">
                        <webwork:text name="'linkissue.desc'"/>
                    </page:param>
                    <page:param name="width">100%</page:param>
                    <page:param name="action">LinkExistingIssue.jspa</page:param>
                    <page:param name="cancelURI"><webwork:property value="issuePath" /></page:param>
                    <page:param name="submitId">linkissue_submit</page:param>
                    <page:param name="submitName"><webwork:property value="text('linkissue.submitname')"/></page:param>
                    <webwork:if test="/issueExists == true">
                    <ui:select label="text('linkissue.this')" name="'linkDesc'" list="linkDescs" listKey="'.'" listValue="'.'">
                        <ui:param name="'description'"><webwork:text name="'linkissue.this.desc'"/></ui:param>
                    </ui:select>
                    <ui:component label="text('common.concepts.issues')" name="'linkKey'" template="issuepicker.jsp">
                        <ui:param name="'size'" value="18"/>
                        <ui:param name="'formname'" value="'jiraform'"/>
                        <ui:param name="'currentissue'" value="issue/string('key')" />
                        <ui:param name="'currentJQL'" value="/currentJQL" />
                    </ui:component>
                    <%@ include file="/includes/panels/updateissue_comment.jsp" %>
                    <ui:component name="'id'" template="hidden.jsp" theme="'single'"  />
                    </webwork:if>
                </page:applyDecorator>
            </div>
        </div>
    </div>
</div>
</body>
</html>
