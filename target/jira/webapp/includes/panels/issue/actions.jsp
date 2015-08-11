<%@ page import="com.atlassian.util.profiling.UtilTimerStack"%>
<%@ taglib uri="webwork" prefix="webwork" %>

<webwork:if test="/issueTabPanels && /issueTabPanels/empty == false" >
    <div class="tabwrap tabs2">
        <webwork:if test="/activeTabPanelSortable == true">
            <div class="sortwrap">
                <webwork:if test="/actionOrder == 'asc'">
                    <a class="icon icon-sort-down" rel="nofollow" href="<webwork:url value="'/browse/' + issue/string('key')" atltoken="false"><webwork:param name="'actionOrder'" value="'desc'"/></webwork:url>#issue-tabs" title="<webwork:text name="'navigator.ascending.order'"/>"><span><webwork:text name="'navigator.ascending.order'"/></span></a>
                </webwork:if>
                <webwork:else>
                    <a class="icon icon-sort-up" rel="nofollow" href="<webwork:url value="'/browse/' + issue/string('key')" atltoken="false"><webwork:param name="'actionOrder'" value="'asc'"/></webwork:url>#issue-tabs" title="<webwork:text name="'navigator.descending.order'"/>"><span><webwork:text name="'navigator.descending.order'"/></span></a>
                </webwork:else>
            </div>
        </webwork:if>
        <ul id="issue-tabs" class="tabs horizontal">
        <webwork:iterator value="/issueTabPanels">
            <webwork:if test="/page == completeKey">
                <li id="<webwork:property value="key" />" class="active"><strong><webwork:property value="label" /></strong></li>
            </webwork:if>
            <webwork:else>
                <li><a id="<webwork:property value="key" />" href="<webwork:url value="'/browse/' + issue/string('key')" atltoken="false"><webwork:param name="'page'" value="completeKey"/></webwork:url>#issue-tabs"><strong><webwork:property value="label" /></strong></a></li>
            </webwork:else>
        </webwork:iterator>
        </ul>
    </div>
    <webwork:property value="actions">
        <div class="issuePanelContainer" id="issue_actions_container">
        <webwork:if test=". != null && ./size > 0">
            <webwork:iterator value=".">
                <% UtilTimerStack.push("Getting action HTML"); %>
                <webwork:property value="./html()" escape="false"/>
                <% UtilTimerStack.pop("Getting action HTML"); %>
            </webwork:iterator>
        </webwork:if>
        <webwork:elseIf test=". == null">
            <div class="notify warn">
                <webwork:text name="'viewissue.tabs.actions.error'"/>
            </div>
        </webwork:elseIf>
        </div>
    </webwork:property>
</webwork:if>