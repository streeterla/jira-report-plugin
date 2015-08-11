<%@ taglib uri="webwork" prefix="webwork" %>

<webwork:if test="/json == true">
    <%-- if they ask for the JSON version then give it to them --%>
    <% response.setContentType("application/json"); %>
    [
    <webwork:iterator value="/historyItems" status="'status'">
        {
            "text" : "<webwork:property value="./issueKey"/> - <webwork:property value="/jsonEscape(./shortSummary)" escape="false"/>",
            "url" : "<%= request.getContextPath()%>/browse/<webwork:property value="./issueKey"/>"
        }<webwork:if test="@status/last == false">,</webwork:if>
    </webwork:iterator>
    ]
</webwork:if>
<webwork:else>
    <%-- In the spirit of progressive enhancement (what a crock! ;p), give them a landing page  --%>
    <webwork:if test="/historyItems/empty == true">
        <p><webwork:text name="'popups.recenthistory.noissues'"/></p>
    </webwork:if>
    <webwork:else>
        <table id="recent_history_list" class="grid" width="100%">
            <webwork:iterator value="/historyItems" status="'status'">
                <tr class="<webwork:if test="@status/odd == true">rowNormal</webwork:if><webwork:else>rowAlternate</webwork:else> rowSelectable">
                    <td width="1%" nowrap>
                        <a href="<%= request.getContextPath()%>/browse/<webwork:property value="./issueKey"/>" title="<webwork:property value="./shortSummary"/>"><webwork:property value="./issueKey"/></a>
                    </td>
                    <td>
                        <a href="<%= request.getContextPath()%>/browse/<webwork:property value="./issueKey"/>" title="<webwork:property value="./shortSummary"/>"><webwork:property value="./shortSummary"/></a>
                    </td>
                </tr>
            </webwork:iterator>
        </table>
    </webwork:else>
</webwork:else>
