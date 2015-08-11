<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>


<div class="module message">
    <img src="<webwork:property value="/avatarUrl"/>" alt="<webwork:text name="'admin.project.avatar.delete.confirmation'"/>" width="48" height="48"/>
    <p><webwork:text name="'admin.project.avatar.delete.confirmation'"/></p>
    <form action="<%= request.getContextPath() %>/secure/project/DeleteProjectAvatar.jspa">
        <input type="hidden" name="avatarId" value="<webwork:property value="/avatarId"/>" />
        <input type="hidden" name="pid" value="<webwork:property value="/pid"/>" />
        <input type="hidden" name="confirm" value="true" />
        <input type="submit" value="<webwork:text name="'common.words.delete'"/>" />
        <button class="cancel"><webwork:text name="'admin.common.words.cancel'"/></button>
    </form>
</div>

