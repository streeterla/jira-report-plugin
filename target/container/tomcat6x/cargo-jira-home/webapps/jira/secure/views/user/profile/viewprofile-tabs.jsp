<%@ taglib prefix="webwork" uri="webwork" %>
<webwork:if test="/hasMoreThanOneProfileTabs == true">
    <ul id="user_profile_tabs" class="vertical tabs">
    <webwork:iterator value="/tabDescriptors" status="'status'">
        <li id="up_<webwork:property value="./key"/>_li" class="<webwork:if test="/selectedTab/equals(./completeKey) == true">active</webwork:if><webwork:if test="@status/first == true"> first</webwork:if>"><a id="up_<webwork:property value="./key"/>_a" href='<%= request.getContextPath() %>/secure/ViewProfile.jspa?<webwork:if test="/user != /remoteUser">name=<webwork:property value="user/name"/>&</webwork:if>selectedTab=<webwork:property value="./completeKey"/>' title="<webwork:text name="./name"/>"><strong><webwork:text name="./name"/></strong></a></li>
    </webwork:iterator>
    </ul>
</webwork:if>
