<%@ page import="com.atlassian.jira.ComponentManager"%>
<%@ page import="com.atlassian.plugin.webresource.WebResourceManager"%>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="webwork" prefix="webwork" %>


<page:param name="title"></page:param>
<webwork:if test="/navigatorTypeAdvanced == true">
   <page:param name="helpURL">advanced_search</page:param>
</webwork:if>
<page:param name="description">

<%-- Test if we have any issues that were found --%>

</page:param>
<page:param name="width">100%</page:param>

<div class="navigator-header">
<%-- Only show the views if there are issues that match the search criteria--%>
<webwork:if test="/searchResults/total > 0">
    <div id="navigator-options">
    <ul class="operations">
        <li class="aui-dd-parent">
            <a href="#" id="viewOptions" class="lnk aui-dd-link standard icon-views"><span>Views</span></a>
            <div class="aui-dropdown standard hidden">
                <ul id="viewOptions-dropdown" class="first">
                    <webwork:if test="'bulk' != $view">
                        <%-- is this needed <li><webwork:text name="'navigator.results.currentview.browser'"/></li>--%>
                    </webwork:if>
                    <webwork:else>
                        <li class="dropdown-item"><a rel="nofollow" href="<webwork:url><webwork:param name="'view'" value="''" /><webwork:param name="'tempMax'" value="'-1'" /><webwork:param name="'decorator'" value="''" /></webwork:url>"><webwork:text name="'navigator.results.currentview.browser'"/></a></li>
                    </webwork:else>
                    <%-- all views for the issue navigator --%>

                    <webwork:if test="/printable != null">
                        <li class="dropdown-item"><a id="printable" rel="nofollow" href="<%= request.getContextPath() %><webwork:property value="/restricted(/printable/URLWithoutContextPath(/searchRequest))"/>"><webwork:text name="'navigator.results.currentview.browser.printable'"/></a></li>
                    </webwork:if>

                    <webwork:if test="/fullContent != null">
                        <li class="dropdown-item"><a id="fullContent" rel="nofollow" href="<%= request.getContextPath() %><webwork:property value="/restricted(/fullContent/URLWithoutContextPath(/searchRequest))"/>"><webwork:text name="'navigator.results.currentview.browser.full'"/></a></li>
                    </webwork:if>

                    <webwork:if test="/xml != null">
                        <li class="dropdown-item"><a id="xml" rel="nofollow" href="<%= request.getContextPath() %><webwork:property value="/restricted(/xml/URLWithoutContextPath(/searchRequest))"/>"><webwork:text name="'navigator.results.currentview.xml'"/></a></li>
                    </webwork:if>
                </ul>
                <webwork:if test="/rssIssues != null || /rssComments !=null">
                    <ul>
                    <webwork:if test="/rssIssues != null">
                        <li class="dropdown-item"><a id="rssIssues" rel="nofollow" href="<%= request.getContextPath() %><webwork:property value="/restricted(/rssIssues/URLWithoutContextPath(/searchRequest))"/>"><webwork:text name="'navigator.results.currentview.rss'"/> (<webwork:text name="'navigator.results.currentview.rss.issues'"/>)</a></li>
                    </webwork:if>

                    <webwork:if test="/rssComments != null">
                        <li class="dropdown-item"><a id="rssComments" rel="nofollow" href="<%= request.getContextPath() %><webwork:property value="/restricted(/rssComments/URLWithoutContextPath(/searchRequest))"/>"><webwork:text name="'navigator.results.currentview.rss'"/> (<webwork:text name="'navigator.results.currentview.rss.comments'"/>)</a></li>
                    </webwork:if>
                    </ul>
                </webwork:if>

                <webwork:if test="/word !=null">
                    <ul>
                        <li class="dropdown-item"><a id="word" rel="nofollow" href="<%= request.getContextPath() %><webwork:property value="/restricted(/word/URLWithoutContextPath(/searchRequest))"/>"><webwork:text name="'navigator.results.currentview.word'"/></a></li>
                    </ul>
                </webwork:if>

                <webwork:if test="/allExcelFields !=null || /currentExcelFields !=null">
                    <ul <webwork:if test="/chart == null || /remoteUser == null">class="last"</webwork:if>>
                    <webwork:if test="/allExcelFields != null">
                        <li class="dropdown-item"><a id="allExcelFields" rel="nofollow" href="<%= request.getContextPath() %><webwork:property value="/restricted(/allExcelFields/URLWithoutContextPath(/searchRequest))"/>"><webwork:text name="'navigator.results.currentview.excel'"/> (<webwork:text name="'navigator.results.currentview.excel.full'"/>)</a></li>
                    </webwork:if>

                    <webwork:if test="/currentExcelFields != null">
                        <li class="dropdown-item"><a id="currentExcelFields" rel="nofollow" href="<%= request.getContextPath() %><webwork:property value="/restricted(/currentExcelFields/URLWithoutContextPath(/searchRequest))" />"><webwork:text name="'navigator.results.currentview.excel'"/> (<webwork:text name="'navigator.results.currentview.excel.current'"/>)</a></li>
                    </webwork:if>
                    </ul>
                </webwork:if>
                <webwork:property value="/nonSystemSearchRequestViews">
                    <!-- We don't want to show this link if you are not logged in since the charting plugin portlets do not show to non-->
                    <webwork:if test="/chart != null && /remoteUser != null" >
                        <div class="hidden">
                            <%
                                // The links for search request views are pulled from an XML file, so the charting plugin does not have access
                                // to call this method.  We should fix this...
                                WebResourceManager webResourceManager = ComponentManager.getInstance().getWebResourceManager();
                                webResourceManager.requireResource("com.atlassian.jira.gadgets:searchrequestview-charts");
                            %>
                            <fieldset class="hidden parameters">
                                <input type="hidden" id="title" value="<webwork:text name="'navigator.results.currentview.charts'"/>">
                                <webwork:if test="/searchRequest/name != null && /searchRequest/modified == false" >
                                    <input type="hidden" id="filterId" value="<webwork:property value="/searchRequest/id"/>">
                                </webwork:if>
                                <webwork:else>
                                    <input type="hidden" id="jql" value="<webwork:property value="/searchRequestJqlString"/>">
                                </webwork:else>
                                <input type="hidden" id="saveTitle" value="<webwork:text name="'portletSearchRequestView.save.to.dashboard.title'"/>">
                                <input type="hidden" id="saveButtonLabel" value="<webwork:text name="'portletSearchRequestView.save.to.dashboard'"/>">
                                <input type="hidden" id="backButtonLabel" value="<webwork:text name="'admin.common.words.back'"/>">
                                <input type="hidden" id="closeButtonLabel" value="<webwork:text name="'admin.common.words.close'"/>">
                            </fieldset>
                        </div>
                        <ul <webwork:if test="./empty == true">class="last"</webwork:if>>
                            <li class="dropdown-item"><a id="charts" rel="nofollow" class="lbOn" href="#"><webwork:text name="'navigator.results.currentview.charts'"/></a></li>
                        </ul>
                    </webwork:if>

                    <webwork:if test="./empty == false">
                        <ul class="last">
                        <webwork:iterator value="." >
                           <li class="dropdown-item"><a rel="nofollow" href="<%= request.getContextPath() %><webwork:property value="URLWithoutContextPath(/searchRequest)" />" ><webwork:property value="name" /></a></li>
                        </webwork:iterator>
                        </ul>
                    </webwork:if>
                </webwork:property>
            </div>
        </li>

        <webwork:property value="./toolOptions" id="toolOptions" />
        
        <webwork:if test="@toolOptions/empty == false">
            <li class="aui-dd-parent">
                <a href="#" id="toolOptions" class="lnk aui-dd-link standard icon-tools"><span><webwork:text name="'common.concepts.tools'"/></span></a>
                <div id="toolOptions-dropdown" class="aui-dropdown standard hidden">
                    <webwork:property value="@toolOptions/size - 1" id="lastIndex"/>
                    <webwork:iterator value="@toolOptions">
                        <webwork:if test="./label != null">
                            <h5><webwork:property value="./label"/></h5>
                        </webwork:if>
                        <ul
                            <webwork:if test="@toolOptions/indexOf(.) == 0">
                                class="first"
                            </webwork:if>
                            <webwork:if test="/maxIndex(@toolOptions) == @toolOptions/indexOf(.)">
                                class="last"
                            </webwork:if>
                        >
                            <webwork:iterator value="./items" >
                            <li class="dropdown-item">
                                <a id="<webwork:property value="./id"/>" href="<%= request.getContextPath() %><webwork:property value="./link"/>" title="<webwork:property value="./title"/>"><webwork:property value="./label"/></a>
                            </li>
                            </webwork:iterator>
                        </ul>
                    </webwork:iterator>
                </div>
            </li>
        </webwork:if>
    </ul>
</div>

</webwork:if>


<div class="perm-link">
   <a id="permlink" class="icon-permalink" href="<%= request.getContextPath() %>/secure/IssueNavigator.jspa?reset=true<webwork:property value="jqlQueryString" />" title="<webwork:text name="'viewissue.permlink.title.navigator'"/>"><webwork:text name="'viewissue.permlink'"/></a>
</div>

<div id="throbber-space">&nbsp;</div>

<h2 class="formtitle2">
    <webwork:property value="text('navigator.title')"/><webwork:if test="searchRequest/name"> &mdash; <webwork:property value="searchRequest/name"/></webwork:if>
</h2>
</div>

<webwork:if test="/searchResults/total == 0">
    <div class="notify info">
        <webwork:text name="'navigator.results.nomatchingissues'"/>
    </div>
</webwork:if>