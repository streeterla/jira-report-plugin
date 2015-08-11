<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="jiratags" prefix="jira" %>

<webwork:if test="/filterOperationsBean/hasOperation == true">
    <h3 id="filteroperations" class="queryBoxHeader"><webwork:text name="'common.words.operations'"/></h3>
    <div class="items" id="filteroperations">
        <webwork:if test="/filterOperationsBean/showInvalid == true">
            <img src="<%= request.getContextPath() %>/images/icons/bullet_red.gif" height="8" width="8" border="0" align="absmiddle"/>
            <webwork:text name="'navigator.hidden.operation.invalid'">
                <webwork:param name="'value0'"><a id="editinvalid" href="<webwork:url value="'IssueNavigator.jspa?mode=show'"/>"><b></webwork:param>
                <webwork:param name="'value1'"></b></a></webwork:param>
            </webwork:text><br/>
        </webwork:if>
        <webwork:if test="/filterOperationsBean/showEdit == true">
            <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle"/>
            <webwork:text name="'navigator.hidden.operation.edit'">
                <webwork:param name="'value0'"><a id="filtereditshares" href="<webwork:url value="'EditFilter!default.jspa'"><webwork:param name="'returnUrl'" value="/returnUrl"/></webwork:url>"><b></webwork:param>
                <webwork:param name="'value1'"></b></a></webwork:param>
            </webwork:text><br/>
        </webwork:if>
        <webwork:if test="/filterOperationsBean/showSave == true">
            <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle"/>
            <webwork:text name="'navigator.hidden.operation.save'">
                <webwork:param name="'value0'"><a id="filtersave" href="<webwork:url value="'SaveFilter!default.jspa'"><webwork:param name="'returnUrl'" value="/returnUrl"/></webwork:url>"><b></webwork:param>
                <webwork:param name="'value1'"></b></a></webwork:param>
            </webwork:text><br/>
        </webwork:if>
        <webwork:if test="/filterOperationsBean/showSaveAs == true">
            <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle"/>
            <webwork:text name="'navigator.hidden.operation.saveasnew'">
                <webwork:param name="'value0'"><a id="filtersaveas" href="<webwork:url value="'SaveAsFilter!default.jspa'"><webwork:param name="'returnUrl'" value="/returnUrl"/></webwork:url>"><b></webwork:param>
                <webwork:param name="'value1'"></b></a></webwork:param>
            </webwork:text><br/>
        </webwork:if>
        <webwork:if test="/filterOperationsBean/showReload == true">
            <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle"/>
            <webwork:text name="'navigator.filter.reloadfilter'">
                <webwork:param name="'value0'"><a id="reload" href="<webwork:url value="'IssueNavigator.jspa?mode=show'"><webwork:param name="'requestId'" value="searchRequest/id"/><webwork:param name="'returnUrl'" value="/returnUrl"/></webwork:url>"><b></webwork:param>
                <webwork:param name="'value1'"></b></a></webwork:param>
            </webwork:text><br/>
        </webwork:if>
        <webwork:if test="/filterOperationsBean/showSaveNew == true">
            <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle"/>
            <webwork:text name="'navigator.hidden.operation.saveasfilter'">
                <webwork:param name="'value0'"><a id="filtersavenew" href="<webwork:url value="'SaveAsFilter!default.jspa'"><webwork:param name="'returnUrl'" value="/returnUrl"/></webwork:url>"><b></webwork:param>
                <webwork:param name="'value1'"></b></a></webwork:param>
            </webwork:text><br>
        </webwork:if>
        <webwork:if test="/filterOperationsBean/showViewSubscriptions == true">
            <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle"/>
            <webwork:text name="'navigator.hidden.operation.subscription'">
                <webwork:param name="'value0'"><a id="filterviewsubscriptions" href="<webwork:url value="'ViewSubscriptions.jspa'"><webwork:param name="'filterId'" value="searchRequest/id" /><webwork:param name="'returnUrl'" value="/returnUrl"/></webwork:url>"><b></webwork:param>
                <webwork:param name="'value1'"></b></a></webwork:param>
            </webwork:text><br/>
        </webwork:if>
    </div>
</webwork:if>
