<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<webwork:if test="(/hasAnyErrors == false && /searchResults) || /mode == 'hide'">    
    <jsp:include page="/includes/navigator/table/header.jsp"/>
</webwork:if>
<webwork:else>
    <h2>
        <webwork:property value="text('navigator.title')"/><webwork:if test="searchRequest/name"> &mdash; <webwork:property value="searchRequest/name"/></webwork:if>
    </h2>
    <p><webwork:text name="'navigator.desc1'"/></p>
    <p><webwork:text name="'navigator.desc2'"/></p>

    <webwork:if test="/hasErrors == true">
        <div class="warningBox">
            <webwork:text name="'navigator.warning'"/>
        </div>
    </webwork:if>
</webwork:else>

<jsp:include page="/includes/navigator/quick-search-reverse.jsp"/>

<webwork:if test="(/hasErrorMessages == false && /hasErrors == false) || /mode == 'hide'" >
    <%-- Set this so that it can be used further down --%>
    <div class="results-wrap">
        <webwork:if test="/searchResults/total > 0">
            <div class="results-count">
            <webwork:text name="'navigator.results.displayissues'">
                <webwork:param name="'value0'"><strong><webwork:property value="/searchResults/niceStart" /></strong></webwork:param>
                <webwork:param name="'value1'"><strong><webwork:property value="/searchResults/end" /></strong></webwork:param>
                <webwork:param name="'value2'"><strong><webwork:property value="/searchResults/total" /></strong></webwork:param>
            </webwork:text>
            </div>
        </webwork:if>


        <jsp:include page="/includes/navigator/results.jsp"/>
    </div>
</webwork:if>
