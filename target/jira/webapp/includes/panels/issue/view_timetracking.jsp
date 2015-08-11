<%@ taglib uri="webwork" prefix="webwork" %>
<webwork:if test="/timeTrackingShown == true">
<div class="module" id="timetrackingmodule">
    <div id="tt_heading" class="mod-header">
        <webwork:if test="/workable == true && /workflowAllowsEdit == true">
            <ul class="ops">
                <li><a id="log-work-link" href="<webwork:url page="/secure/CreateWorklog!default.jspa"><webwork:param name="'id'" value="../long('id')" /></webwork:url>" class="icon icon-add16" title="<webwork:text name="'logwork.title.desc'"/>"><span><webwork:text name="'logwork.title'"/></span></a></li>
            </ul>            
        </webwork:if>
        <h3><webwork:text name="'timetracking.title'"/></h3>
    </div>
    <div class="mod-content">
    <webwork:if test="/aggregateTimeTrackingBean/subTaskCount != 0">
        <div id="tt_info_aggregate">
            <webwork:component template="timetrackinginfo.jsp" name="'tt_aggregate'" value="/aggregateTimeTrackingGraphBean" />
        </div>
        <div id="tt_info_single" style="display:none;">
            <webwork:component template="timetrackinginfo.jsp" name="'tt_single'" value="/timeTrackingGraphBean" />
        </div>
        <div id="tt_include_subtasks" title="<webwork:text name="'timetracking.include.subtasks.tooltip'"/>">
            <input id="cb_include_subtasks" type="checkbox" checked="CHECKED"/><label for="cb_include_subtasks"><webwork:text name="'timetracking.include.subtasks'"/></label>
        </div>
    </webwork:if>
    <webwork:else>
        <webwork:component template="timetrackinginfo.jsp" name="'tt_single'" value="/timeTrackingGraphBean" />
    </webwork:else>
   </div>
</div>
</webwork:if>