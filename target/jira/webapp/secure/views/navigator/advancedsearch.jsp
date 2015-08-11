<%@ page import="com.atlassian.jira.ComponentManager" %>
<%@ page import="com.atlassian.jira.config.properties.ApplicationProperties" %>
<%@ page import="com.atlassian.jira.user.preferences.PreferenceKeys" %>
<%@ page import="com.atlassian.jira.user.preferences.UserPreferencesManager" %>
<%@ page import="com.atlassian.jira.util.BrowserUtils" %>
<%@ page import="com.atlassian.plugin.webresource.WebResourceManager" %>
<%@ page import="com.atlassian.seraph.auth.DefaultAuthenticator" %>
<%@ page import="com.opensymphony.user.User" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib prefix="ui" uri="webwork" %>
<%@ taglib prefix="page" uri="sitemesh-page" %>
<html>
<head>
	<title><webwork:if test="searchRequest/name">[<webwork:property value="searchRequest/name"/>] </webwork:if><webwork:text name="'navigator.title'"/></title>
    <webwork:if test="/hasAnyErrors == false && /searchResults/total > 0">
        <LINK REL="alternate" TITLE="<webwork:property value="searchRequest/name"/>" HREF="<%= request.getContextPath() %>/secure/IssueNavigator.jspa?view=rss&<webwork:property value="jqlQueryString" />&tempMax=100&reset=true&decorator=none" TYPE="application/rss+xml">
    </webwork:if>
    <content tag="section">find_link</content>
    
<%
    WebResourceManager webResourceManager = ComponentManager.getInstance().getWebResourceManager();

    final ApplicationProperties applicationProperties = ComponentManager.getInstance().getApplicationProperties();
    final HttpSession httpSession = request.getSession(false); //dont create the session if there isnt one
    final User remoteUser = httpSession != null ? (User) httpSession.getAttribute(DefaultAuthenticator.LOGGED_IN_KEY) : null;
    boolean userAutocompleteDisabled = false;
    if (remoteUser != null)
    {
        final UserPreferencesManager userPreferencesManager = ComponentManager.getInstance().getUserPreferencesManager();
        userAutocompleteDisabled = userPreferencesManager.getPreferences(remoteUser).getBoolean(PreferenceKeys.USER_JQL_AUTOCOMPLETE_DISABLED);
    }
    if (!applicationProperties.getOption("jira.jql.autocomplete.disabled") && !userAutocompleteDisabled)
    {
        webResourceManager.requireResource("jira.webresources:jqlautocomplete");
    }
%>
</head>
<body>
    <div id="jqlFieldz" style="display:none;"><webwork:property value="/visibleFieldNamesJson"/></div>
    <div id="jqlFunctionNamez" style="display:none;"><webwork:property value="/visibleFunctionNamesJson"/></div>
    <div id="jqlReservedWordz" style="display:none;"><webwork:property value="/jqlReservedWordsJson"/></div>

    <table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#ffffff" class="ie-f">
        <tr>
            <td class="filterFormCell">
                <!--[if lte IE 7]>
                <table cellspacing="0" cellpadding="0" border="0" width="285"><tr><td>
                <![endif]-->
                <jsp:include page="/includes/navigator/filter-form/tabs.jsp" />
                <jsp:include page="/includes/navigator/filter-form/filter_description.jsp" />
                <jsp:include page="/includes/navigator/filter-form/navigator_type_links.jsp" />
                <jsp:include page="/includes/navigator/filter-operations.jsp" flush="false" />

                <div id="queryBoxTable" class="queryBoxTable">
 					<h3 id="jqlHistoryheader" class="queryBoxHeader headerOpened" title="<webwork:text name="'filter.title.prefix'"/> <webwork:text name="'navigator.advanced.helper.history'"/>" onclick="GuiPrefs.toggleVisibility('jqlHistory');">
                         <webwork:text name="'navigator.advanced.helper.history'"/>
                    </h3>
					<div id="jqlHistory">
						<div class="queryBox" id="jqlHistoryFieldArea">
							<ul class="queryBox" id="queryBox">
                            <webwork:iterator value="/savedJqlQueryHistoryItems" status="'status'">
                                <li <webwork:if test="@status/first == true">class="first"</webwork:if>><a id="historyItem<webwork:property value="@status/index"/>" class="jqlQuickLink" title="<webwork:property value="."/>" href="<webwork:url page="/secure/IssueNavigator!executeAdvanced.jspa" atltoken="false"><webwork:param name="'jqlQuery'" value="."/><webwork:param name="'runQuery'" value="'true'"/><webwork:param name="'clear'" value="'true'"/></webwork:url>"><webwork:property value="."/></a></li>
                            </webwork:iterator>
							</ul>
						</div>
					</div>
               	</div>
                <!--[if lte IE 7]>
                </td></tr></table>
                <![endif]-->
            </td>

            <td valign="top">
                <div id="jqlcomponent" class="issue-nav-wrap">
                    <webwork:if test="/hasAnyErrors == false && /searchResults">
                        <jsp:include page="/includes/navigator/table/header.jsp"/>
                    </webwork:if>
                    <webwork:else>
                        <h2>
                            <webwork:property value="text('navigator.title')"/>
                        </h2>
                    </webwork:else>

                    <webwork:if test="/hasErrorMessages == true">
                        <div id="jqlerror" class="notify error">
                            <webwork:iterator value="/errorMessages" status="'warningStatus'">
                                <p><webwork:property value="."/></p>
                            </webwork:iterator>
                        </div>
                    </webwork:if>
                    <webwork:if test="/warningMessages != null && /warningMessages/empty == false">
                        <div id="jqlwarning" class="notify warn">
                            <h4><webwork:text name="'navigator.advanced.warning.heading'"/></h4>
                            <ul>
                                <webwork:iterator value="/warningMessages" status="'warningStatus'">
                                    <li><webwork:property value="."/></li>
                                </webwork:iterator>
                            </ul>
                        </div>
                    </webwork:if>

                    <jsp:include page="/includes/navigator/quick-search-reverse.jsp"/>

                    <form id="jqlform" action="IssueNavigator!executeAdvanced.jspa" method="post" >
                        <div class="page-help">
                            <webwork:component name="'advanced_search'" template="help.jsp">
                                <webwork:param name="'align'" value="'absmiddle'"/>
                                <webwork:param name="'linktext'"><webwork:text name="'navigator.advanced.query.syntax'"/></webwork:param>
                            </webwork:component>
                        </div>
                        <label for="jqltext">
                            <webwork:if test="/autocompleteEnabledForThisRequest == true">
                                <webwork:text name="'navigator.advanced.query.label'"/> <span id="jqlerrormsg" class="jqlgood">parse</span> <span id="jqlcolrowcount"><webwork:text name="'navigator.advanced.query.line'"/>:<span id="jqlrownum">0</span><webwork:text name="'navigator.advanced.query.character'"/>:<span id="jqlcolumnnum">0</span></span>
                            </webwork:if>
                        </label>
                        <webwork:if test="/autocompleteEnabledForThisRequest == true">
                            <div class="atlassian-autocomplete" >
                        </webwork:if>
                        <webwork:else>
                            <div>
                        </webwork:else>
                            <textarea id="jqltext" rows="3" cols="80" name="jqlQuery" tabindex="1"><webwork:property value="/jqlQuery"/></textarea>
                        </div>
                        <div class="jqlundertext">
                        <webwork:if test="/remoteUser != null && /autocompleteDisabled == false">
                            <span class="jql-hints small"><webwork:if test="/autocompleteDisabledForUser == true">
                                    <webwork:text name="'navigator.advanced.autocomplete.user.pref.turn.on'">
                                        <webwork:param name="'value0'"><a id="toggleAutocompletePref" href="IssueNavigator!toggleAutocompletePref.jspa?autocomplete=false<webwork:if test="$createNew == true">&createNew=true</webwork:if>"></webwork:param>
                                        <webwork:param name="'value1'"></a></webwork:param>
                                    </webwork:text>
                                </webwork:if>
                                <webwork:else>
                                    <webwork:text name="'navigator.advanced.autocomplete.user.pref.turn.off'">
                                        <webwork:param name="'value0'"><a id="toggleAutocompletePref" href="IssueNavigator!toggleAutocompletePref.jspa?autocomplete=true<webwork:if test="$createNew == true">&createNew=true</webwork:if>"></webwork:param>
                                        <webwork:param name="'value1'"></a></webwork:param>
                                    </webwork:text>
                                </webwork:else></span>
                        </webwork:if>
                            <input id="jqlrunquery" tabindex="2" type="submit" value="<webwork:text name="'navigator.advanced.execute.query'"/>" accesskey="<webwork:text name="'common.forms.submit.accesskey'"/>"
                               title="<webwork:text name="'common.forms.submit.tooltip'">
                               <webwork:param name="'value0'"><webwork:text name="'common.forms.submit.accesskey'"/></webwork:param>
                               <webwork:param name="'value1'"><%=BrowserUtils.getModifierKey()%></webwork:param>
                               </webwork:text>" />
                            <input type="hidden" name="runQuery" value="true"/>
                        </div>
                    </form>

                    <webwork:if test="/hasAnyErrors == false && /searchResults">
                        <div class="results-wrap">
                            <webwork:if test="/searchResults/total > 0">
                                <div class="results-count">
                                <webwork:text name="'navigator.results.displayissues'">
                                    <webwork:param name="'value0'"><strong><webwork:property value="/searchResults/niceStart" /></strong></webwork:param>
                                    <webwork:param name="'value1'"><strong><webwork:property value="/searchResults/end" /></strong></webwork:param>
                                    <webwork:param name="'value2'"><strong><webwork:property value="/searchResults/total" /></strong></webwork:param>
                                </webwork:text>
                                </div>
                                <jsp:include page="/includes/navigator/results.jsp"/>
                            </webwork:if>
                        </div>
                    </webwork:if>
                </div>
            </td>
        </tr>
    </table>

<fieldset class="jql-autocomplete-params hidden" >
</fieldset>
</body>
</html>
