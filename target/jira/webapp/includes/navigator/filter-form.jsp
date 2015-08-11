<%@ page import="com.atlassian.jira.util.BrowserUtils"%>
<%@ page import="com.atlassian.util.profiling.UtilTimerStack" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<webwork:bean id="fieldVisibility" name="'com.atlassian.jira.web.bean.FieldVisibilityBean'" />
<!-- JRA-4345 - need to statically include the javascript to address IE6 refresh issue -->
<%@ include file="/includes/js/date_picker.jsp" %>
<script language="JavaScript" type="text/javascript" src="<%=request.getContextPath()%>/includes/js/cascadingUtil.js"></script>

<form action="IssueNavigator.jspa?" name="filterform" method="post">

<%-- Used to determine whether to refresh the filter due to project selection --%>
<input type="hidden" name="refreshFilter" id="refreshFilter" value="false" />
<input type="hidden" name="reset" id="reset" value="update" />
<input type="hidden" name="usercreated" id="usercreated" value="true"/>

<jsp:include page="/includes/navigator/filter-form/tabs.jsp" />
<jsp:include page="/includes/navigator/filter-form/filter_description.jsp" />
<jsp:include page="/includes/navigator/filter-form/navigator_type_links.jsp" />

<webwork:if test="/searchRequest != null && /searchRequest/loaded == false && /filterValid == true">
    <div class="filter-description">    
    <p>
        <webwork:text name="'navigator.filter.newsearch'"/><br>
        <webwork:if test="remoteUser && actionName != 'SaveAsFilter' && $refreshFilter != true">
            <br>
            <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle">
            <webwork:text name="'navigator.hidden.operation.saveasfilter'">
                <webwork:param name="'value0'"><a id="filtersavenew" href="SaveAsFilter!default.jspa"><strong></webwork:param>
                <webwork:param name="'value1'"></strong></a></webwork:param>
            </webwork:text>
        </webwork:if>
    </p>
    </div>
</webwork:if>

<table id="filterForm">
<%-- if there are no projects, show message and login details --%>
<webwork:if test="browseableProjects == null || browseableProjects/size <= 0">
    <jsp:include page="/includes/noprojects.jsp" />
</webwork:if>
<webwork:else>
	<tr>
	<td class="rowHeader fullyCentered" colspan="2">
        <input type="submit" name="show" value="<webwork:property value="text('common.words.view')"/> &gt;&gt;" class="hiddenButton"/>
		<input type="submit" name="hide" value="&lt;&lt; <webwork:property value="text('common.words.view')"/> &amp; <webwork:property value="text('common.words.hide')"/>" id="searchAndHide" />
		<input type="submit" name="show" value="<webwork:property value="text('common.words.view')"/> &gt;&gt;" id="searchButton" accesskey="<webwork:text name="'common.forms.submit.accesskey'"/>"
                       title="<webwork:text name="'common.forms.submit.tooltip'">
                       <webwork:param name="'value0'"><webwork:text name="'common.forms.submit.accesskey'"/></webwork:param>
                       <webwork:param name="'value1'"><%=BrowserUtils.getModifierKey()%></webwork:param>
                       </webwork:text>" />
	</td>
	</tr>
    <webwork:iterator value="/searcherGroups" status="'status'">
    <%
         UtilTimerStack.push("filter-form.jsp - searchergroup");
    %>
    <webwork:if test="/shown(.) == true">
        <webwork:if test="printHeader == true">
        <webwork:if test="@status/first == false">
            <tr class="spacer">
                <td class="fieldLabelArea">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            </tbody>
        </webwork:if>


            <webwork:if test="@lastTitleKey">
            <script language="JavaScript" type="text/javascript">
            <!--
                restore('<webwork:property value="@lastTitleKey" />');
            //-->
            </script>
            </webwork:if>


            <tr>
                <th id="<webwork:property value="titleKey" />header" class="rowHeader" colspan="2" onclick="GuiPrefs.toggleVisibility('<webwork:property value="titleKey" />');" title="<webwork:text name="'filter.title.prefix'"/> <webwork:text name="titleKey"/>">
                    <webwork:text name="titleKey"/>
                </th>
            </tr>
            <tbody id="<webwork:property value="titleKey" />">
            <webwork:property value="titleKey" id="lastTitleKey" />
        </webwork:if>
        <webwork:iterator value="./searchers" status="'status'">

            <webwork:property value="./name" id="searcherName" />

            <%
                final String searcherName = UtilTimerStack.isActive() ? "filter-form.jsp - searcher - " + request.getAttribute("searcherName") : "";
                UtilTimerStack.push(searcherName);
            %>
            <webwork:property value="/searcherEditHtml(.)" escape="false" />
            <%
                UtilTimerStack.pop(searcherName);
            %>
        </webwork:iterator>
    </webwork:if>
    <%
        UtilTimerStack.pop("filter-form.jsp - searchergroup");
    %>
    </webwork:iterator>
</tbody>
<webwork:if test="@lastTitleKey">
<script language="JavaScript" type="text/javascript">
<!--
    restore('<webwork:property value="@lastTitleKey" />');
//-->
</script>
</webwork:if>

	<tr>
	<td class="rowHeader fullyCentered" colspan="2">
		<input type="submit" name="hide" value="&lt;&lt; <webwork:property value="text('common.words.view')"/> &amp; <webwork:property value="text('common.words.hide')"/>">
		<input type="submit" name="show" value="<webwork:property value="text('common.words.view')"/> &gt;&gt;">
	</td>
	</tr>
</webwork:else>
</table>
</form>
