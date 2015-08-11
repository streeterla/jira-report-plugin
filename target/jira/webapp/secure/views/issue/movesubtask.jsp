<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="webwork" prefix="iterator" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'movesubtask.title'"/>: <webwork:property value="issue/string('key')" /></title>
</head>

<body>

<table cellpadding=0 cellspacing=0 border=0 width=100%>
<tr>
<td width=200 bgcolor="#f0f0f0" valign=top>
    <jsp:include page="/secure/views/issue/movetaskpane.jsp" flush="false" />
</td>
<td bgcolor=#ffffff valign=top>
<table width=100% cellpadding=10 cellspacing=0 border=0><tr><td>

<webwork:if test="subTaskTypes/size > 1">
        <page:applyDecorator name="jiraform">
            <page:param name="title"><webwork:text name="'movesubtask.title'"/>: <webwork:property value="issue/string('key')" /></page:param>
            <page:param name="description">
                <webwork:text name="'movesubtask.step1.desc'"/>
            </page:param>
            <page:param name="width">100%</page:param>
            <page:param name="action">MoveSubTaskType.jspa</page:param>
            <page:param name="autoSelectFirst">false</page:param>
            <page:param name="cancelURI"><webwork:property value="issuePath" /></page:param>
            <page:param name="submitId">next_submit</page:param>
            <page:param name="submitName"><webwork:property value="text('common.forms.next')"/> &gt;&gt;</page:param>

            <webwork:property value="/fieldHtml('issuetype')" escape="'false'" />

            <ui:component name="'id'" template="hidden.jsp" />
        </page:applyDecorator>
</webwork:if>
<webwork:else>
	<page:applyDecorator name="jiraform">
        <page:param name="title"><webwork:text name="'movesubtask.title'"/></page:param>
		<page:param name="description"><span class="warning"><webwork:text name="'common.words.note'"/></span>: <webwork:text name="'movesubtask.nosubtasktypes'"/></page:param>
		<page:param name="cancelURI"><webwork:property value="issuePath" /></page:param>
	</page:applyDecorator>
</webwork:else>

</td></tr></table>
</td></tr></table>

</body>
</html>
