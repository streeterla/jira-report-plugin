<%@ taglib uri="webwork" prefix="webwork" %>

<webwork:if test="searchRequest/query/whereClause == null">
    <div class="searcherValue">
        <webwork:text name="'navigator.hidden.allissues'"/>
    </div>
</webwork:if>
<webwork:elseIf test="searchRequestFitsNavigator == true">
    <webwork:iterator value="/searcherGroups" >
        <webwork:iterator value="./searchers" >
            <webwork:property value="/searcherViewHtml(.)" escape="false" />
        </webwork:iterator>
    </webwork:iterator>
</webwork:elseIf>
<webwork:else>
    <div class="searcherValue">
        <label class="fieldLabel" for="fieldJqlQuery"><webwork:text name="'jira.jql.query'"/>:</label> 
        <span id="fieldJqlQuery" class="fieldValue"><webwork:property value="/searchRequestJqlString"/></span>
    </div>
</webwork:else>

<webwork:if test="/searchSorts != null && /searchSorts/size != 0" >
    <div class="searcherValue">
        <strong><webwork:text name="'navigator.hidden.sortedby'"/>:</strong>
        <webwork:iterator value="/searchSortDescriptions(searchRequest)"><webwork:property value="."/> </webwork:iterator><br>
    </div>
</webwork:if>