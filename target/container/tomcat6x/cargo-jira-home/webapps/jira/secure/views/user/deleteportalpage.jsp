<%@ taglib uri="jiratags" prefix="jira" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <webwork:if test="canDelete == true">
        <title><webwork:text name="'portal.deletepage.title'"><webwork:param name="'value0'"><webwork:property value="pageName" /></webwork:param></webwork:text></title>
    </webwork:if>
    <webwork:else>
        <title><webwork:text name="'portal.deletepage.title.no.filter'"/></title>
    </webwork:else>
</head>

<body>
<webwork:if test="canDelete == true">
    <h2><webwork:text name="'portal.deletepage.title'"><webwork:param name="'value0'"><webwork:property value="pageName" /></webwork:param></webwork:text></h2>
</webwork:if>
<webwork:else>
    <h2><webwork:text name="'portal.deletepage.title.no.filter'"/></h2>
</webwork:else>
<webwork:if test="canDelete == true">
        <form name="jiraform" action="DeletePortalPage.jspa">
            <div class="content">
                <p><webwork:text name="'portal.deletepage.confirm.desc'"/></p>
                <ul>
                <webwork:if test="otherFavouriteCount == 1">
                    <li><span id="otherFavouriteCount"><webwork:text name="'deletefilter.other.favourite.filter.one'"/></span></li>
                </webwork:if>
                <webwork:elseIf test="otherFavouriteCount > 1">
                    <li><span id="otherFavouriteCount"><webwork:text name="'deletefilter.other.favourite.filter.many'"><webwork:param name="'value0'"><webwork:property value="otherFavouriteCount"/></webwork:param></webwork:text></span></li>
                </webwork:elseIf>
                </ul>
                <ui:component name="'pageId'" template="hidden.jsp" />
            </div>
            <div class="button-panel">
                <input type="submit" name="Delete" value="<webwork:text name="'common.words.delete'"/>">
                <a class="close-button" href="<%= request.getContextPath() %>/secure/ConfigurePortalPages!default.jspa" ><webwork:text name="'common.words.cancel'"/></a>
            </div>
        </form>
</webwork:if>
<webwork:else>
    <div class="content">
        <div class="notify error">
            <webwork:text name="'portal.deletepage.can.not.delete'"/>
        </div>
    </div>
</webwork:else>
</body>
</html>
