<%@ taglib uri="webwork" prefix="webwork" %>
<webwork:if test="/json == true">
    <%-- if they ask for JSON give it to them  --%>
    <% response.setContentType("application/json"); %>
    [
    <webwork:if test="/favouriteFilters/empty() == true">
        {
            "text" : "<webwork:text name="'common.filters.no.favourite.filters'"/>",
            "url" : ""
        },
    </webwork:if>
    <webwork:else>
        <webwork:iterator value="/favouriteFilters">
        {
            "text" : "<webwork:property value="/jsonEscape(./name)" escape="false"/>",
            "url" : "<%= request.getContextPath()%>/secure/IssueNavigator.jspa?mode=hide&requestId=<webwork:property value="./id"/>"
        },
        </webwork:iterator>
    </webwork:else>
    <%-- we always have a link to manage filters in the list --%>
        {
            "groupmarker" : true,
            "text" : "<webwork:text name="'portlet.savedfilters.manage'"/>",
            "url" : "<%= request.getContextPath()%>/secure/ManageFilters.jspa"
        }
    ]
</webwork:if>
<webwork:else>
    <%-- In the spirit of progressive enhancement (what a crock! ;p), give them a landing page  --%>
    <webwork:if test="/favouriteFilters/empty == true">
        <p><webwork:text name="'popups.savedfilters.nosavedfilters'"/>
            <a href="<%= request.getContextPath()%>/secure/ManageFilters.jspa"><webwork:text name="'portlet.savedfilters.manage'"/></a>
        </p>
    </webwork:if>
    <webwork:else>
        <p><webwork:text name="'popups.savedfilters.choose'">
            <webwork:param name="'value0'"><a href="<%= request.getContextPath()%>/secure/ManageFilters.jspa"></webwork:param>
            <webwork:param name="'value1'"></a></webwork:param>
        </webwork:text></p>

        <table id="filter_list" class="grid" width="100%">
            <tr>
                <th nowrap><webwork:text name="'popups.savedfilters.filtername'"/></th>
                <th nowrap><webwork:text name="'popups.savedfilters.filterdesc'"/></th>
            </tr>
            <webwork:iterator value="/favouriteFilters" status="'status'">
                <tr class="<webwork:if test="@status/odd == true">rowNormal</webwork:if><webwork:else>rowAlternate</webwork:else> rowSelectable">
                    <td nowrap width="1%">
                        <a href="<%= request.getContextPath()%>/secure/IssueNavigator.jspa?mode=hide&requestId=<webwork:property value="./id"/>" title="<webwork:property value="./name"/>"><webwork:property value="./name"/></a> &nbsp;
                    </td>
                    <td>
                        <a href="<%= request.getContextPath()%>/secure/IssueNavigator.jspa?mode=hide&requestId=<webwork:property value="./id"/>" title="<webwork:property value="./name"/>"><webwork:property value="./description"/></a> &nbsp;
                    </td>
                </tr>
            </webwork:iterator>
        </table>
    </webwork:else>
</webwork:else>
