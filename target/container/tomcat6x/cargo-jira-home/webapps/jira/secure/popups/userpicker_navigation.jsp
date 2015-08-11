<%@ taglib uri="webwork" prefix="webwork" %>
<%@ include file="/includes/js/multipickerutils.jsp" %>
<p align=center>
    <webwork:if test="filter/start > 0">
        <a href="javascript:moveToPage(<webwork:property value="filter/previousStart" />)">&lt&lt; <webwork:text name="'common.words.previous'" /></a>
    </webwork:if>
    <webwork:else>
        &lt&lt; <webwork:text name="'common.words.previous'" />
    </webwork:else>
    <webwork:property value = "pager/pages(/browsableItems)">
    <webwork:if test="size > 1">
        <webwork:iterator value="." status="'pagerStatus'">
            <webwork:if test="currentPage == true"><b><webwork:property value="pageNumber" /></b></webwork:if>
            <webwork:else>
                <a href="javascript:moveToPage(<webwork:property value="start" />)"><webwork:property value="pageNumber" /></a>
            </webwork:else>
            <webwork:if test="@pagerStatus/last == false"> | </webwork:if>
        </webwork:iterator>
    </webwork:if>
    </webwork:property>
    <webwork:if test="filter/end < /browsableItems/size">
        <a href="javascript:moveToPage(<webwork:property value="filter/nextStart" />)"><webwork:text name="'common.words.next'" /> &gt;&gt;</a>
    </webwork:if>
    <webwork:else>
        <webwork:text name="'common.words.next'" /> &gt;&gt;
    </webwork:else>
</p>
