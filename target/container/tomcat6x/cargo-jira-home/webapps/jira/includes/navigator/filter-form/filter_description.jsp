<%@ taglib uri="webwork" prefix="webwork" %>

<%-- Shows the details about the current filter --%>
<webwork:property value="searchRequest">
<webwork:if test=". && loaded == true && remoteUser && actionName == 'IssueNavigator'">
    <div class="favourite-me" id="filter-favourite">
        <webwork:component name="'favourite'" template="favourite.jsp">
            <webwork:param name="'enabled'"><webwork:property value="/filterFavourite" /></webwork:param>
            <webwork:param name="'entityType'">SearchRequest</webwork:param>
            <webwork:param name="'entityId'"><webwork:property value="./id" /></webwork:param>
            <webwork:param name="'tableId'">nav</webwork:param>
            <webwork:param name="'entityName'"><webwork:property value="./name"/></webwork:param>
            <webwork:param name="'relatedDropdown'">find_link</webwork:param>
        </webwork:component>
    </div>
</webwork:if>
</webwork:property>

<div class="filter-description" id="filter-description">
    <webwork:property value="searchRequest">
    <webwork:if test=". && loaded == true">
        <p title="<webwork:property value="name" />">
            <strong><webwork:text name="'common.words.name'"/>:</strong> <webwork:property value="name" />
        </p>
        <webwork:if test="description && description/length > 0">
            <p>
                <strong><webwork:text name="'common.words.description'"/>:</strong> <webwork:property value="description" />
            </p>
        </webwork:if>
        <webwork:if test="searchRequest/ownerUserName != remoteUser/name">
            <p>
            <webwork:if test="modified == true">
                <em>
                    <webwork:if test="/mode != 'show'">
                        <span class="warning"><webwork:text name="'navigator.filter.modifiedsinceloading'"/></span>
                    </webwork:if>
                    <webwork:else>
                        <webwork:if test="/navigatorTypeAdvanced == true">
                            <span class="warning"><webwork:text name="'navigator.filter.modifiedsinceloading'"/></span>
                        </webwork:if>
                        <webwork:else>
                            <webwork:text name="'navigator.filter.modifiedsinceloading.view.hide.operations'">
                                <webwork:param name="'value0'">
                                    <span class="warning"></webwork:param><webwork:param name="'value1'"></span>
                                </webwork:param>
                            </webwork:text>
                        </webwork:else>
                    </webwork:else>
                </em>
                <br>
            </webwork:if>            
            <webwork:if test="/filterValid == true">
                <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle">
                <webwork:text name="'navigator.filter.createnewfromcurrent'">
                    <webwork:param name="'value0'"><a id="copyasnewfilter" href="SaveAsFilter!default.jspa"><strong></webwork:param>
                    <webwork:param name="'value1'"></strong></a></webwork:param>
                </webwork:text>
            </webwork:if>
            </p>
        </webwork:if>
        <webwork:elseIf test="modified == true && /filterValid == true">
            <p>
            <em>
            <webwork:if test="/mode != 'show'">
                <span class="warning"><webwork:text name="'navigator.filter.modifiedsinceloading'"/></span>
            </webwork:if>
            <webwork:else>
                <webwork:if test="/navigatorTypeAdvanced == true">
                    <span class="warning"><webwork:text name="'navigator.filter.modifiedsinceloading'"/></span>
                </webwork:if>
                <webwork:else>
                    <webwork:text name="'navigator.filter.modifiedsinceloading.view.hide.operations'">
                        <webwork:param name="'value0'">
                            <span class="warning"></webwork:param><webwork:param name="'value1'"></span>
                        </webwork:param>
                    </webwork:text>
                </webwork:else>
            </webwork:else>
            </em>
            </p>
        </webwork:elseIf>
    </webwork:if>    
    <webwork:elseIf test="!.">
        <p>
            <webwork:text name="'navigator.filter.nofilterselected'"/>
            <webwork:if test="$createNew != true && $refreshFilter">
                <%-- Only project ahas been selected - do not show "Save Filter" link --%>
            </webwork:if>
            <webwork:elseIf test="$createNew != true && /mode != 'show'">
                <br>
                <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle">
                <webwork:text name="'navigator.filter.createnewsearch'">
                    <webwork:param name="'value0'"><strong><a href="IssueNavigator.jspa?mode=show&createNew=true"></webwork:param>
                    <webwork:param name="'value1'"></a></strong></webwork:param>
                </webwork:text>
            </webwork:elseIf>
        </p>
    </webwork:elseIf>
    </webwork:property>
</div>
