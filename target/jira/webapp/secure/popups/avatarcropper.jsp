<%@ page import="com.atlassian.jira.ComponentManager" %>
<%@ page import="com.atlassian.plugin.webresource.WebResourceManager" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<div class="module message">
    <p><webwork:text name="'avatarpicker.cropper.instructions'"/></p>
    <form id="avataror" action="<%= request.getContextPath() %>/secure/project/AvatarPicker.jspa">
            <input type="hidden" value="<webwork:property value="/pid"/>" name="pid"/>
        <input type="hidden" value="true" name="close"/>
        <input type="hidden" value="<webwork:property value="/avatarField"/>" name="avatarField"/>
        <input type="hidden" value="<webwork:property value="/avatarImage"/>" name="avatarImage"/>
        <input type="hidden" value="<webwork:property value="/remove"/>" name="remove"/>

        <%-- crop instructions --%>
        <input type="hidden" name="offsetX" id="avatar-offsetX" value="<webwork:property value="/offsetX"/>"/>
        <input type="hidden" name="offsetY" id="avatar-offsetY"value="<webwork:property value="/offsetY"/>"/>
        <input type="hidden" name="width" id="avatar-width" value="<webwork:property value="/width"/>"/>


        <input type="submit" value="<webwork:text name="'avatarpicker.choose.avatar'"/>" />
        <input type="button" value="<webwork:text name="'common.forms.cancel'"/>" />
    </form>
</div>

<div class="avataror">
    <img src="<%= request.getContextPath() %>/secure/temporaryavatar" alt="" title="" /> <%-- TODO width and height --%>
</div>


