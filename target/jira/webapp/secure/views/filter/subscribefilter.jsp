<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'filtersubscription.title'"/></title>
    <content tag="section">find_link</content>
</head>

<body>

<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr>
<td class="filterSummaryCell">
    <jsp:include page="/includes/navigator/summary-pane.jsp" />
</td>
<td bgcolor="#ffffff" valign="top">

<table width="100%" cellpadding="10" cellspacing="0" border="0"><tr><td>

<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'filtersubscription.title'"/></page:param>
    <page:param name="action">FilterSubscription.jspa</page:param>
    <page:param name="width">100%</page:param>
    <webwork:property value="subscribed" />
    <page:param name="submitId">filter_subscription_submit</page:param>
    <page:param name="submitName"><webwork:property value="submitName" /></page:param>
    <page:param name="cancelURI"><webwork:property value="cancelStr"/></page:param>
    <webwork:if test="hasGroupPermission == true">
        <ui:select label="text('filtersubscription.field.recipients')" name="'groupName'" list="groups" listKey="'.'" listValue="'.'" >
            <ui:param name="'headerrow'" value="text('filtersubscription.personal.sub')" />
            <ui:param name="'headervalue'" value="''" />
        </ui:select>
    </webwork:if>

    <ui:checkbox label="text('filtersubscription.field.emailZeroResults')" name="'emailOnEmpty'" fieldValue="true" >
        <ui:param name="'description'" >
            <webwork:text name="'filtersubscription.emailEmptyResults'"/>
        </ui:param>
    </ui:checkbox>
    <webwork:if test="lastRunStr" >
        <ui:component label="'Last sent'" value="lastRunStr" template="textlabel.jsp" />
    </webwork:if>
    <webwork:if test="nextRunStr" >
        <ui:component label="'Next send'" value="nextRunStr" template="textlabel.jsp"/>
    </webwork:if>
    <ui:component name="'lastRun'" template="hidden.jsp"/>
    <ui:component name="'nextRun'" template="hidden.jsp"/>
    <ui:component name="'subId'" template="hidden.jsp"/>
    <ui:component name="'filterId'" template="hidden.jsp"/>

    <ui:component name="'cron.editor.name'" label="text('filtersubscription.field.schedule')" template="croneditor.jsp">
        <ui:param name="'cronEditorBean'" value="/cronEditorBean"/>
        <ui:param name="'parameterPrefix'">filter.subscription.prefix</ui:param>
    </ui:component>

</page:applyDecorator>

</td></tr></table>
</td></tr></table>

</body>
</html>

