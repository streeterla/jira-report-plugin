<%@ taglib prefix="webwork" uri="webwork" %>
<webwork:if test="/pager/startPageURL">
    <a href="<webwork:property value="/pager/startPageURL"/>" id="gotoStart"><img src="<%= request.getContextPath() %>/images/icons/arrow_first.gif" title="<webwork:text name="'common.words.start'"/>"/></a>
</webwork:if>
<webwork:else>
    <img src="<%= request.getContextPath() %>/images/icons/first_faded.gif"/>
</webwork:else>

<webwork:if test="/pager/prevPageURL">
    <a href="<webwork:property value="/pager/prevPageURL"/>"  id="gotoPrev"><img src="<%= request.getContextPath() %>/images/icons/arrow_left_small.gif" title="<webwork:text name="'common.forms.previous'"/>"/></a>
</webwork:if>
<webwork:else>
    <img src="<%= request.getContextPath() %>/images/icons/arrow_left_faded.gif"/>
</webwork:else>

<webwork:if test="/pager/nextPageURL">
    <a href="<webwork:property value="/pager/nextPageURL"/>"  id="gotoNext"><img src="<%= request.getContextPath() %>/images/icons/arrow_right_small.gif" title="<webwork:text name="'common.forms.next'"/>"/></a>
</webwork:if>
<webwork:else>
    <img src="<%= request.getContextPath() %>/images/icons/arrow_right_faded.gif"/>
</webwork:else>

<webwork:if test="/pager/endPageURL">
    <a href="<webwork:property value="/pager/endPageURL"/>"  id="gotoEnd"><img src="<%= request.getContextPath() %>/images/icons/arrow_last.gif" title="<webwork:text name="'common.words.end'"/>"/></a>
</webwork:if>
<webwork:else>
    <img src="<%= request.getContextPath() %>/images/icons/last_faded.gif"/>
</webwork:else>
<br/>
<webwork:text name="'admin.currentusers.data.results'">
    <webwork:param name="'value0'"><webwork:property value="/fromIndex"/></webwork:param>
    <webwork:param name="'value1'"><webwork:property value="/toIndex"/></webwork:param>
    <webwork:param name="'value2'"><webwork:property value="/pager/fullListSize"/></webwork:param>
</webwork:text>