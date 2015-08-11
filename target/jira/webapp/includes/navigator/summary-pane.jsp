<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<div id="filterForm">
<jsp:include page="/includes/navigator/filter-form/tabs.jsp" />
<jsp:include page="/includes/navigator/filter-form/filter_description.jsp" />

<webwork:if test="searchRequest">

    <h3 class="queryBoxHeader"><webwork:text name="'navigator.hidden.summary'"/></h3>
    <div class="items" id="filter-summary">
         <jsp:include page="/includes/navigator/search-request_description.jsp" />
    </div>

    <jsp:include page="/includes/navigator/filter-operations.jsp" />
</webwork:if>

</div>
