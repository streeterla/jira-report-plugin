<%@ page import="com.atlassian.jira.issue.Issue" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="webwork.util.TextUtil" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="jiratags" prefix="jira" %>

<webwork:bean id="fieldVisibility" name="'com.atlassian.jira.web.bean.FieldVisibilityBean'"/>
<webwork:bean id="permissionCheck" name="'com.atlassian.jira.web.bean.PermissionCheckBean'"/>
<webwork:property value="/issueObject/projectObject">
<h1 class="item-name avatar" <webwork:if test="./avatar != null">style="background-image:url(<%= request.getContextPath() %>/secure/projectavatar?pid=<webwork:property value="./id"/>&avatarId=<webwork:property value="./avatar/id"/>&size=large)"</webwork:if>>
        <webwork:if test="./avatar != null">
            <img id="project-avatar" alt="" class="project-avatar-48" height="48" src="<%= request.getContextPath() %>/secure/projectavatar?pid=<webwork:property value="./id"/>&avatarId=<webwork:property value="./avatar/id"/>&size=large" width="48">
        </webwork:if>
        <span><webwork:property value="./name"/></span>
</h1>
</webwork:property>

<webwork:if test="searchRequest != null">
    <webwork:property value="/nextPreviousPager">
            <webwork:if test="nextPreviousPager/hasCurrentKey == true">
                <ul class="ops page-navigation">
                <webwork:if test="nextPreviousPager/previousKey != null">
                    <li class="previous">
                        <a id="previous-issue" href="<%= request.getContextPath() %>/browse/<webwork:property value="./previousKey" />" title="<webwork:text name="'navigator.previous.title'"/> '<webwork:property value="./previousKey" />'">
                            <span class="icon icon-page-prev"><span><webwork:text name="'navigator.previous.title'"/> '<webwork:property value="./previousKey" />'</span></span>
                        </a>
                    </li>
                </webwork:if>
                <webwork:else>
                    <li class="previous">
                        <span id="previous-issue">
                            <span class="icon icon-page-prev-deactivated"></span>
                        </span>
                    </li>
                </webwork:else>
                    <li class="showing">
                        <webwork:text name="'pager.results.displayissues.short'">
                            <webwork:param name="'value0'"><webwork:property value="./currentPosition"/></webwork:param>
                                <webwork:param name="'value1'"><webwork:property value="./currentSize"/>
                                    <a id="return-to-search" href="<%=request.getContextPath()%>/secure/IssueNavigator.jspa" title="<webwork:text name="'navigator.return.search'"/>"><webwork:text name="'navigator.return.search'"/></a>
                                </webwork:param>
                        </webwork:text>
                    </li>
                <webwork:if test="nextPreviousPager/nextKey != null">
                    <li class="next">
                        <a id="next-issue" href="<%= request.getContextPath() %>/browse/<webwork:property value="./nextKey" />" title="<webwork:text name="'navigator.next.title'"/> '<webwork:property value="./nextKey" />'">
                            <span class="icon icon-page-next"><span><webwork:text name="'navigator.next.title'"/> '<webwork:property value="./nextKey" />'</span></span>
                        </a>
                    </li>
                </webwork:if>
                <webwork:else>
                    <li class="next">
                        <span id="next-issue">
                            <span class="icon icon-page-next-deactivated"></span>
                        </span>
                    </li>
                </webwork:else>
                </ul>
            </webwork:if>
    </webwork:property>
</webwork:if>

<ul class="breadcrumbs">
    <li>
        <a id="project-name-val" href="<%= request.getContextPath() %>/browse/<webwork:property value="/project/string('key')" />">
            <webwork:property value="/project/string('name')"/></a>
    </li>
    <webwork:if test="/subTask == true">
        <webwork:property value="/parentIssueObject" id="parentIssueObject">
            <webwork:if test="@permissionCheck/issueVisible(.) == true">
                <li class="section"><a title="<webwork:property value="./summary" escape="true"/>" id="parent_issue_summary" href="<%= request.getContextPath() %>/browse/<webwork:property value="./key"/>"><webwork:property value="./key"/> <%= TextUtil.escapeHTML(StringUtils.abbreviate(((Issue)pageContext.getAttribute("parentIssueObject")).getSummary(), 40)) %></a></li>
            </webwork:if>
            <webwork:else>
                <li class="section"><webwork:property value="./key"/></li>
            </webwork:else>
        </webwork:property>
    </webwork:if>
    <li class="section"><a id="key-val" href="<%= request.getContextPath() %>/browse/<webwork:property value="string('key')"/>"><webwork:property value="string('key')"/></a></li>
</ul>

<h2 id="issue_header_summary" class="item-summary"><a href="<%= request.getContextPath() %>/browse/<webwork:property value="string('key')"/>"><webwork:property value="string('summary')"/></a></h2>