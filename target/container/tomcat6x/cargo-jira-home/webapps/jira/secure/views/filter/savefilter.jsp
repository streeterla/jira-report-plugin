
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'savefilter.title'"/></title>
    <content tag="section">find_link</content>
</head>

<body>

<table cellpadding=0 cellspacing=0 border=0 width=100%>
<tr>
<td class="filterSummaryCell">
    <jsp:include page="/includes/navigator/summary-pane.jsp" />
</td>
<td bgcolor=#ffffff valign=top>

<table width=100% cellpadding=10 cellspacing=0 border=0><tr><td>

    <page:applyDecorator name="jiraform">
        <page:param name="action">SaveFilter.jspa</page:param>
        <page:param name="cancelURI">IssueNavigator.jspa</page:param>
        <page:param name="submitId">save_submit</page:param>
        <page:param name="submitName"><webwork:text name="'savefilter.save'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="title"><webwork:text name="'savefilter.title'"/></page:param>
        <tr>
        <td colspan="2">
        <table class="grid maxWidth">
        <tr>
            <th width="50%"><webwork:text name="'savefilter.old.request'"/></th>
            <th width="50%"><webwork:text name="'savefilter.updated.request'"/></th>
        </tr>
        <tr>
        <td>
            <webwork:if test="/advancedQuery == true">
                <div class="searcherValue"><label class="fieldLabel" for="dbJqlQuery"><webwork:text name="'jira.jql.query'"/>:</label> <span id="dbJqlQuery" class="fieldValue"><webwork:property value="/diffedDbSearchRequestJql" escape="false"/></span></div>
            </webwork:if>
            <webwork:else>
                <webwork:iterator value="/searcherGroups" >
                <webwork:iterator value="./searchers" >
                    <webwork:property value="/oldSearcherViewHtml(.)" escape="false" />
                </webwork:iterator>
                </webwork:iterator>
            </webwork:else>

            <webwork:if test="/searchSorts(/dbSearchRequest)/size != 0" >
            <img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height=8 width=8 border=0 align=absmiddle>
            <webwork:if test="/searchSortsEqual == false"><font color="#990000"></webwork:if><b><webwork:text name="'savefilter.sorted.by'"/></b>
                <webwork:iterator value="/searchSortDescriptions(dbSearchRequest)" status="'status'">
                    <webwork:property value="."/>
                </webwork:iterator>
            <webwork:if test="/searchSortsEqual == false"></font></webwork:if>
            <br>
            </webwork:if>

        </td>
        <td>
            <webwork:if test="/advancedQuery == true">
                <div class="searcherValue"><label class="fieldLabel" for="currentJqlQuery"><webwork:text name="'jira.jql.query'"/>:</label> <span id="currentJqlQuery" class="fieldValue"><webwork:property value="/diffedCurrentSearchRequestJql" escape="false"/></span></div>
             </webwork:if>
             <webwork:else>
                 <webwork:iterator value="/searcherGroups" >
                 <webwork:iterator value="./searchers" >
                     <webwork:property value="/newSearcherViewHtml(.)" escape="false" />
                 </webwork:iterator>
                 </webwork:iterator>
             </webwork:else>

            <webwork:if test="/searchSorts(/searchRequest)/size != 0" >
            <img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height=8 width=8 border=0 align=absmiddle>
            <webwork:if test="/searchSortsEqual == false"><font color="#009900"></webwork:if><b><webwork:text name="'savefilter.sorted.by'"/></b>
                <webwork:iterator value="/searchSortDescriptions(searchRequest)" status="'status'">
                    <webwork:property value="."/>
                </webwork:iterator>
            <webwork:if test="/searchSortsEqual == false"></font></webwork:if>
            <br>
            </webwork:if>
        </td>
        </tr>
        </table>
        </td>
        </tr>
    </page:applyDecorator>

</td></tr></table>
</td></tr></table>

</body>
</html>
