<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <webwork:if test="canDelete == true">
        <title><webwork:text name="'deletefilter.title'"><webwork:param name="'value0'"><webwork:property value="filterName" /></webwork:param></webwork:text></title>
    </webwork:if>
    <webwork:else>
        <title><webwork:text name="'deletefilter.title.no.filter'"/></title>
    </webwork:else>
</head>
<body>
    <webwork:if test="canDelete == true">
        <h2><webwork:text name="'deletefilter.title'"><webwork:param name="'value0'"><webwork:property value="filterName" /></webwork:param></webwork:text></h2>
    </webwork:if>
    <webwork:else>
        <h2><webwork:text name="'deletefilter.title.no.filter'"/></h2>
    </webwork:else>

    <webwork:if test="canDelete == true">
        <form name="jiraform" action="DeleteFilter.jspa">
            <div class="content">
                <p><webwork:text name="'deletefilter.confirm'"/></p>
                <ul>
                <webwork:if test="otherFavouriteCount == 1">
                    <li><webwork:text name="'deletefilter.other.favourite.filter.one'"/></li>
                </webwork:if>
                <webwork:elseIf test="otherFavouriteCount > 1">
                    <li><webwork:text name="'deletefilter.other.favourite.filter.many'"><webwork:param name="'value0'"><webwork:property value="otherFavouriteCount"/></webwork:param></webwork:text></li>
                </webwork:elseIf>
                <webwork:if test="subscriptionCount == 1">
                    <li><webwork:text name="'deletefilter.view.subscriptions.one'">
                            <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/ViewSubscriptions.jspa?filterId=<webwork:property value="filterId" />"></webwork:param>
                            <webwork:param name="'value1'"></a></webwork:param>
                        </webwork:text>
                    </li>
                </webwork:if>
                <webwork:elseIf test="subscriptionCount > 0">
                    <li>
                        <webwork:text name="'deletefilter.view.subscriptions.many'">
                            <webwork:param name="'value0'"><webwork:property value="subscriptionCount"/></webwork:param>
                            <webwork:param name="'value1'"><a href="<%= request.getContextPath() %>/secure/ViewSubscriptions.jspa?filterId=<webwork:property value="filterId" />"></webwork:param>
                            <webwork:param name="'value2'"></a></webwork:param>
                        </webwork:text>
                    </li>
                </webwork:elseIf>
                <webwork:else>
                    <li><webwork:text name="'deletefilter.noSubs'"/></li>
                </webwork:else>
                </ul>
                <ui:component name="'filterId'" template="hidden.jsp" />
            </div>
            <div class="button-panel">
                <input type="submit" name="Delete" value="<webwork:text name="'common.words.delete'"/>">
                <a class="close-button" href="<%= request.getContextPath() %>/secure/ManageFilters.jspa" ><webwork:text name="'common.words.cancel'"/></a>
            </div>
        </form>
    </webwork:if>
    <webwork:else>
        <div class="content">
            <div class="notify error">
                <webwork:text name="'deletefilter.can.not.delete'"/>
            </div>            
        </div>
    </webwork:else>

</body>
</html>

