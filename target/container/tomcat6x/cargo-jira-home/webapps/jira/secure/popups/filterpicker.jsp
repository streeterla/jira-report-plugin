<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head><title>
<webwork:if test="/showProjects == 'true'">
    <webwork:if test="/showFilters == 'false'">
        <webwork:text name="'popups.projectpicker.title'"/>
    </webwork:if>
    <webwork:else>
        <webwork:text name="'popups.filterprojectpicker.title'"/>
    </webwork:else>
</webwork:if>
<webwork:else>
    <webwork:text name="'popups.filterpicker.title'"/>
</webwork:else>
</title></head>
<body>
<webwork:if test="remoteUser == null">
    <p><webwork:text name="'popups.notloggedin'"/></p>
</webwork:if>
<webwork:else>

<script type="text/javascript">

function submitFilter(id, element) {
    if (window.opener && window.opener.document) {
        var wod = window.opener.document;
        <%-- go get the field name so we know who we have picked for --%>
        var ff = document.getElementById("picker_field").innerHTML;
        AJS.$("#filter_" + ff + "_name", wod).text(AJS.$(element).text()).addClass("success");
        if (wod.getElementById("filter_" + ff + "_button")){
            wod.getElementById("filter_" + ff + "_button").innerHTML = "<webwork:text name="'popups.filterpicker.changefilter'"/>";
            wod.getElementById("filter_" + ff + "_id").setAttribute("value", id);
        } else {
            wod.getElementById("filter_" + ff + "_id").setAttribute("value", "filter-" + id);            
        }
        window.close();
    }
}

/**
 * Submits the selected value back to the opener window.
 * @param id the numeric id of the project or filter
 * @param element the element in the page containing the name of the picked thing
 * @param type "project" or "filter" designating what we're picking.
 */
function submitFilterOrProject(id, element, type) {
    if (window.opener && window.opener.document) {
        if (type != "project") {
            type = "filter"; // don't trust
        }
        var wod = window.opener.document;
        <%-- go get the field name so we know who we have picked for --%>
        var ff = document.getElementById("picker_field").innerHTML;
        AJS.$("#filter_" + ff + "_name", wod).text(AJS.$(element).text()).addClass("success");
        wod.getElementById("filter_" + ff + "_id").setAttribute("value", type + "-" + id);
        if (wod.getElementById("filter_" + ff + "_button")){
            wod.getElementById("filter_" + ff + "_button").innerHTML = "<webwork:text name="'popups.filterpicker.changefilterproject'"/>";
        }
        window.close();
    }
}

/**
 * Submits the selected value back to the opener window.
 * @param id the numeric id of the project
 * @param element the element in the page containing the name of the picked thing
 */
function submitProject(id, element) {
    if (window.opener && window.opener.document) {
        var wod = window.opener.document;
        <%-- go get the field name so we know who we have picked for --%>
        var ff = document.getElementById("picker_field").innerHTML;
        wod.getElementById("filter_" + ff + "_id").setAttribute("value", id);
        wod.getElementById("filter_" + ff + "_name").innerHTML = element.innerHTML;
        if (wod.getElementById("filter_" + ff + "_button")){
            wod.getElementById("filter_" + ff + "_button").innerHTML = "<webwork:text name="'popups.filterpicker.changeproject'"/>";
        }
        window.close();
    }
}

</script>
<%--
Warning XSS Magic

This invisible tag exists in the page to hold possibly javascript-hostile values for fields which have originally
come from the url. If an evil hacker passed some concat-escaping script fragment as the field parameter and
submitFilter() used this value to concat to produce the id of the field in the opener window, they would be able
to execute arbitrary javascript in the client.
--%>
<span style="display:none;" id="picker_field"><webwork:property value="/field"/></span>

<h3>
<webwork:if test="/showProjects == 'true'">
    <webwork:if test="/showFilters == 'false'">
        <webwork:text name="'popups.projectpicker.title'"/>
    </webwork:if>
    <webwork:else>
        <webwork:text name="'popups.filterprojectpicker.title'"/>
    </webwork:else>
</webwork:if>
<webwork:else>
    <webwork:text name="'popups.filterpicker.title'"/>
</webwork:else>
</h3>

<table width="100%" cellpadding=10 cellspacing=0 border=0 align="center"><tr><td>
<webwork:if test="/showProjects == 'true'">
    <webwork:if test="/showFilters == 'false'">
        <p><webwork:text name="'popups.projectpicker.description'"/></p>
    </webwork:if>
    <webwork:else>
        <p><webwork:text name="'popups.filterprojectpicker.description'"/></p>
    </webwork:else>
</webwork:if>
<webwork:else>
    <p><webwork:text name="'popups.filterpicker.description'"/></p>
</webwork:else>

    <jsp:include page="filterpicker-tabs.jsp" />
    <webwork:if test="filterView == 'search' && tabShowing('search') == true">
        <form action="FilterPickerPopup.jspa" method="get" style="margin:0;" name="filterSearchForm">
            <input type="hidden" name="filterView" value="<webwork:property value="/filterView"/>"/>
            <input type="hidden" name="field" value="<webwork:property value="/field"/>"/>
            <input type="hidden" name="showProjects" value="<webwork:property value="/showProjects"/>"/>
            <table class="filterSearchInput" cellpadding="0" cellspacing="0">
                <%-- component includes its own row --%>
                <ui:textfield label="text('common.concepts.search')" name="'searchName'" theme="'standard'">
                    <ui:param name="'formname'" value="'filterSearchForm'"/>
                    <ui:param name="'valueColSpan'" value="2"/>
                    <ui:param name="'mandatory'" value="false"/>
                    <ui:param name="'size'" value="50"/>
                    <ui:param name="'maxlength'" value="50"/>
                    <ui:param name="'description'" value="text('filters.search.text.desc')"/>
                </ui:textfield>
                <tr>
                    <td class="fieldLabelArea" width="10%"><webwork:text name="'common.concepts.author'"/>:</td>
                    <%--Already has a TD--%>
                    <ui:component label="text('admin.common.words.owner')" name="'searchOwnerUserName'" template="userselect.jsp" theme="'single'">
                        <ui:param name="'formname'" value="'filterSearchForm'"/>
                        <ui:param name="'mandatory'" value="false"/>
                    </ui:component>

                    <td>
                        <webwork:component template="help.jsp" name="'issue_filters.finding'" >
                            <webwork:param name="'helpURLFragment'">#finding_filters</webwork:param>
                        </webwork:component>
                    </td>
                </tr>
                <%-- component includes its own row --%>
                <webwork:component name="'shares'" label="text('common.concepts.shared.with')" template="select-share-types.jsp" >
                    <webwork:param name="'class'" value="'filterSearchInputRightAligned fieldLabelArea'"/>
                    <webwork:param name="'noJavaScriptMessage'">
                        <webwork:text name="'common.sharing.no.share.javascript'"/>
                    </webwork:param>
                    <webwork:param name="'shareTypeList'" value="/filtersViewHelper/shareTypeRendererBeans"/>
                    <webwork:param name="'dataString'" value="/filtersViewHelper/searchShareTypeJSON"/>
                    <webwork:param name="'valueColSpan'" value="2"/>
                    <webwork:param name="'anyDescription'"><webwork:text name="'common.sharing.search.template.any.desc.SearchRequest'"/></webwork:param>
                </webwork:component>
                <tr>
                    <td colspan="3" align="center" style="padding-top:0;">
                        <input name="Search" type="submit" value="<webwork:text name="'common.concepts.search'"/>"/>
                    </td>
                </tr>
            </table>
        </form>
            <webwork:if test="/searchRequested == true && /filters/empty == false">
                <webwork:component name="text('common.concepts.search')" template="filter-list.jsp">
                    <webwork:param name="'id'" value="'mf_browse'"/>
                    <webwork:param name="'filterList'" value="/filters"/>
                    <webwork:param name="'operations'">false</webwork:param>
                    <webwork:param name="'shares'" value="/canShowShares"/>
                    <webwork:param name="'issuecount'" value="true"/>
                    <webwork:param name="'linkissuecount'" value="false"/>

                    <webwork:param name="'favourite'" value="false"/>
                    <webwork:param name="'subscriptions'" value="false"/>

                    <webwork:param name="'sort'" value="true"/>
                    <webwork:param name="'sortColumn'" value="/sortColumn"/>

                    <webwork:param name="'paging'" value="true"/>
                    <webwork:param name="'pagingMessage'">
                        <webwork:text name="'common.sharing.searching.results.message'">
                            <webwork:param name="'value0'"><webwork:property value="/startPosition"/></webwork:param>
                            <webwork:param name="'value1'"><webwork:property value="/endPosition"/></webwork:param>
                            <webwork:param name="'value2'"><webwork:property value="/totalResultCount"/></webwork:param>
                        </webwork:text>
                    </webwork:param>
                    <webwork:param name="'pagingPrevUrl'" value="/previousUrl"/>
                    <webwork:param name="'pagingNextUrl'" value="/nextUrl"/>
                    <webwork:param name="'emptyMessage'"><webwork:text name="/searchEmptyMessageKey"/></webwork:param>

                    <webwork:param name="'viewHelper'" value="/filtersViewHelper"/>
                    <webwork:param name="'linkRenderer'" value="/filterLinkRenderer"/>
                </webwork:component>
            </webwork:if>
            <webwork:else>
                <div class="jiraCenteredContent"><div style="margin-top:1em;border:1px solid #bbb; padding:5px;">
                <webwork:if test="/searchRequested == true">
                    <webwork:text name="/searchEmptyMessageKey"/>
                </webwork:if>
                <webwork:else>
                    <webwork:text name="'common.sharing.searching.no.search.performed'"/>
                </webwork:else>
                </div></div>
            </webwork:else>
        </webwork:if>
        <%--//--%>
        <%--// POPULAR RESULTS SECTION HERE--%>
        <%--//--%>
        <webwork:elseIf test="filterView == 'popular' && tabShowing('popular') == true">
            <webwork:component name="text('common.concepts.popular')" template="filter-list.jsp">
                <webwork:param name="'id'" value="'mf_popular'"/>
                <webwork:param name="'filterList'" value="/filters"/>
                <webwork:param name="'operations'">false</webwork:param>
                <webwork:param name="'shares'" value="/canShowShares"/>
                <webwork:param name="'favourite'" value="false"/>
                <webwork:param name="'issuecount'" value="true"/>
                <webwork:param name="'linkissuecount'" value="false"/>

                <webwork:param name="'subscriptions'" value="false"/>

                <webwork:param name="'sort'" value="false"/>
                <webwork:param name="'sortColumn'" value="/sortColumn"/>

                <webwork:param name="'emptyMessage'"><webwork:text name="'filters.no.search.results'"/></webwork:param>
                <webwork:param name="'viewHelper'" value="/filtersViewHelper"/>
                <webwork:param name="'linkRenderer'" value="/filterLinkRenderer"/>
            </webwork:component>
        </webwork:elseIf>
        <%--// --%>
        <%--// FAVOURITE RESULTS SECTION HERE--%>
        <%--//--%>
        <webwork:elseIf test="filterView == 'favourites' && tabShowing('favourites') == true">
            <webwork:component name="text('common.favourites.favourite')" template="filter-list.jsp">
                <webwork:param name="'id'" value="'mf_favourites'"/>
                <webwork:param name="'filterList'" value="/filters"/>
                <webwork:param name="'favcount'">false</webwork:param>
                <webwork:param name="'remove'">true</webwork:param>
                <webwork:param name="'shares'" value="false"/>
                <webwork:param name="'favourite'" value="false"/>
                <webwork:param name="'issuecount'" value="true"/>
                <webwork:param name="'linkissuecount'" value="false"/>
                <webwork:param name="'subscriptions'" value="false"/>
                <webwork:param name="'operations'">false</webwork:param>
                <webwork:param name="'emptyMessage'"><webwork:text name="'filters.no.favourite'"/></webwork:param>
                <webwork:param name="'returnUrl'" value="/returnUrl"/>
                <webwork:param name="'viewHelper'" value="/filtersViewHelper"/>
                <webwork:param name="'linkRenderer'" value="/filterLinkRenderer"/>
            </webwork:component>
        </webwork:elseIf>
        <%--// --%>
        <%--// PROJECTS SECTION HERE--%>
        <%--//--%>
        <webwork:elseIf test="filterView == 'projects' && tabShowing('projects') == true">
            <webwork:component name="text('common.concepts.projects')" template="projectcategory-list.jsp">
                <webwork:param name="'projectFetcher'" value="/"/>
                <webwork:param name="'showCategories'" value="/showCategories"/>
                <webwork:param name="'categories'" value="/categories"/>
                <webwork:param name="'id'" value="'filterpicker_projects'"/>
                <webwork:param name="'projectList'" value="/projects"/>
                <webwork:param name="'viewHelper'" value="/filtersViewHelper"/>
                <webwork:param name="'linkRenderer'" value="/filterLinkRenderer"/>
            </webwork:component>
        </webwork:elseIf>
        <webwork:else>
            <div class="noteBox"><webwork:text name="'filters.no.tab.permssion'"/><webwork:property value="filterView"/>:<webwork:property value="showProjects"/></div>
        </webwork:else>
</webwork:else>
<p align="center"><button onclick="window.close();"><webwork:text name="'common.words.cancel'"/></button></p>
</table>
</body>
</html>
