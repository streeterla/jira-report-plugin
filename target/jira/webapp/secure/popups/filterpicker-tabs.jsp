<%@ taglib uri="webwork" prefix="webwork" %>
<div class="tabwrap">
<ul id="filter_type_table" class="tabs horizontal">
    <webwork:if test="tabShowing('favourites') == true">
        <webwork:if test="filterView == 'favourites'">
            <li class="active">
                <strong><webwork:text name="'common.favourites.favourites'"/></strong>
            </li>
        </webwork:if>
        <webwork:else>
            <li><a href="<%= request.getContextPath() %>/secure/FilterPickerPopup.jspa?filterView=favourites&field=<webwork:property value="/field"/>&showProjects=<webwork:property value="/showProjects"/>"><strong><webwork:text name="'common.favourites.favourites'"/></strong></a></li>
        </webwork:else>
    </webwork:if>
    <!--// Popular and Search is not available on Standard JIRA and only if some one is logged in -->
    <webwork:if test="tabShowing('popular') == true">
        <webwork:if test="filterView == 'popular'">
            <li class="active">
                <strong><webwork:text name="'common.concepts.popular'"/></strong>
            </li>
        </webwork:if>
        <webwork:else>
            <li><a href="<%= request.getContextPath() %>/secure/FilterPickerPopup.jspa?filterView=popular&field=<webwork:property value="/field"/>&showProjects=<webwork:property value="/showProjects"/>"><strong><webwork:text name="'common.concepts.popular'"/></strong></a></li>
        </webwork:else>
    </webwork:if>
    <webwork:if test="tabShowing('search') == true">
        <webwork:if test="filterView == 'search'">
            <li class="active">
                <strong><webwork:text name="'common.concepts.search'"/></strong>
            </li>
        </webwork:if>
        <webwork:else>
            <li><a href="<%= request.getContextPath() %>/secure/FilterPickerPopup.jspa?filterView=search&field=<webwork:property value="/field"/>&showProjects=<webwork:property value="/showProjects"/>"><strong><webwork:text name="'common.concepts.search'"/></strong></a></li>
        </webwork:else>
    </webwork:if>
    <webwork:if test="tabShowing('projects') == true">
        <webwork:if test="/filterView == 'projects'">
            <li class="active">
                <strong><webwork:text name="'common.concepts.projects'"/></strong>
            </li>
        </webwork:if>
        <webwork:else>
            <li><a href="<%= request.getContextPath() %>/secure/FilterPickerPopup.jspa?showProjects=true&filterView=projects&field=<webwork:property value="/field"/>"><strong><webwork:text name="'common.concepts.projects'"/></strong></a></li>
        </webwork:else>
    </webwork:if>
    </ul>
</div>