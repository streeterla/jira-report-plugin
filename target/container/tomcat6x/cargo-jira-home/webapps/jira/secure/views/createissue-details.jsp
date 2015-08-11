<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'createissue.title'"/></title>
    <content tag="section">find_link</content>
</head>
<body>
<webwork:if test="ableToCreateIssueInSelectedProject == 'true'">
<div class="intform">
    <page:applyDecorator name="jiraform">
        <page:param name="title"><webwork:text name="'createissue.title'"/></page:param>
        <page:param name="description"><webwork:text name="'createissue.step2.desc'"/></page:param>
        <page:param name="action">CreateIssueDetails.jspa</page:param>
        <page:param name="cancelURI">default.jsp</page:param>
        <page:param name="submitId">create_submit</page:param>
        <page:param name="submitName"><webwork:property value="submitButtonName"/></page:param>
        <page:param name="multipart">true</page:param>

        <ui:component label="text('issue.field.project')" name="'project/string('name')'" template="textlabel.jsp" />
        <tr>
            <td class="fieldLabelArea"><webwork:text name="'issue.field.issuetype'"/>:</td>
            <td class="fieldValueArea">
                <webwork:property value="/constantsManager/issueType(issuetype)" >
                    <webwork:component name="'issuetype'" template="constanticon.jsp">
                        <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                        <webwork:param name="'iconurl'" value="./string('iconurl')" />
                        <webwork:param name="'alt'"><webwork:property value="/nameTranslation(.)" /></webwork:param>
                        <webwork:param name="'title'"><webwork:property value="/nameTranslation(.)" /> - <webwork:property value="/descTranslation(.)" /></webwork:param>
                    </webwork:component>
                    <webwork:property value="/nameTranslation(.)" />
                </webwork:property>
            </td>
        </tr>

        <webwork:component template="issuefields.jsp" name="'createissue'">
            <webwork:param name="'issue'" value="/issueObject"/>
            <webwork:param name="'tabs'" value="/fieldScreenRenderTabs"/>
            <webwork:param name="'errortabs'" value="/tabsWithErrors"/>
            <webwork:param name="'selectedtab'" value="/selectedTab"/>
            <webwork:param name="'ignorefields'" value="/ignoreFieldIds"/>
            <webwork:param name="'create'" value="'true'"/>
        </webwork:component>

        <ui:component name="'pid'" template="hidden.jsp" theme="'single'" />
        <ui:component name="'issuetype'" template="hidden.jsp" theme="'single'" />

    </page:applyDecorator>
</div>
</webwork:if>
<webwork:else>
	<page:applyDecorator name="jiraform">
        <page:param name="title"><webwork:text name="'createissue.title'"/></page:param>
		<page:param name="description"><webwork:text name="'createissue.step2.desc'" /></page:param>
		<%@ include file="/includes/createissue-notloggedin.jsp" %>
	</page:applyDecorator>
</webwork:else>
</body>
</html>
