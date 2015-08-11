<%@ taglib uri="webwork" prefix="webwork" %>
<div class="tabwrap filter-menu">
<ul id="filterFormHeader"  class="tabs horizontal">
    <li class="tab-title">
        <webwork:text name="'navigator.tabs.filter'"/>:
    </li>
    <webwork:if test="actionName == 'IssueNavigator' && mode == 'hide'">
        <li class="active">
            <strong><webwork:text name="'navigator.tabs.view'"/></strong>
        </li>
    </webwork:if>
    <webwork:else>
        <li>
            <a href="IssueNavigator.jspa?mode=hide" id="viewfilter" class="item" title="<webwork:text name="'navigator.tabs.view.linktitle'"/>" accesskey="V"><strong><webwork:text name="'navigator.tabs.view'"/></strong></a>
        </li>
    </webwork:else>

    <webwork:if test="searchRequest">
        <webwork:if test="actionName == 'IssueNavigator' && mode == 'show' && $createNew != true">
            <li class="active">
                <strong><webwork:text name="'navigator.tabs.edit'"/></strong>
            </li>
        </webwork:if>
        <webwork:else>
            <li>
                <a href="IssueNavigator.jspa?mode=show" id="editfilter" class="item" title="<webwork:text name="'navigator.tabs.edit.linktitle'"/>" accesskey="E"><strong><webwork:text name="'navigator.tabs.edit'"/></strong></a>
            </li>
        </webwork:else>
    </webwork:if>

    <webwork:if test="actionName == 'IssueNavigator' && mode == 'show' && searchRequest == null">
        <li class="active">
            <strong><webwork:text name="'navigator.tabs.new'"/></strong>
        </li>
    </webwork:if>
    <webwork:else>
        <li>
            <a id="new_filter" href="IssueNavigator.jspa?mode=show&createNew=true" class="item" title="<webwork:text name="'navigator.tabs.new.linktitle'"/>" accesskey="N"><strong><webwork:text name="'navigator.tabs.new'"/></strong></a>
        </li>
    </webwork:else>

    <%-- note: everyone has access to Manage Filters - even anonymous users --%>
    <webwork:if test="actionName == 'ManageFilters'">
        <li class="active">
            <strong><webwork:text name="'navigator.tabs.manage'"/></strong>
        </li>
    </webwork:if>
    <webwork:else>
        <li>
            <a id="managefilters" href="ManageFilters.jspa" class="item" title="<webwork:text name="'navigator.tabs.manage.linktitle'"/>" accesskey="M"><strong><webwork:text name="'navigator.tabs.manage'"/></strong></a>
        </li>
    </webwork:else>

    <webwork:if test="searchRequest/modified == true">
        <li class="modified" title="<webwork:text name="'navigator.filter.modified'"/>">
            <strong><webwork:text name="'navigator.filter.modified'"/></strong>
        </li>
    </webwork:if>
</ul>
</div>