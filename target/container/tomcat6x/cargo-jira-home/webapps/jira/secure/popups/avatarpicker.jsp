<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<dl id="avatar-prefs" class="js-prefs">
    <dt>pickerFieldID</dt>
    <dd><webwork:property value="/avatarField"/></dd>
    <dt>avatarImageID</dt>
    <dd><webwork:property value="/avatarImage"/></dd>
    <dt>title</dt>
    <dd><webwork:text name="'avatarpicker.title'"/></dd>
    <dt>pid</dt>
    <dd><webwork:property value="/pid"/></dd>
    <dt>noCustom</dt>
    <dd><webwork:text name="'avatarpicker.nocustom'"/></dd>
    <dt>uploadAction</dt>
    <dd><%= request.getContextPath() %>/secure/project/AvatarPicker!upload.jspa</dd>
</dl>

<div id="avatar-panel">

    <div class="panel" id="avatar-all">
        <h2><webwork:text name="'avatarpicker.all'"/></h2>
    </div>

    <!-- first the built-in palette -->
    <div class="panel" id="avatar-builtin">
        <h2><webwork:text name="'avatarpicker.builtin'"/></h2>
        <ul class="avatars" id="">
            <webwork:iterator value="/systemAvatars">
                <li class="avatar" <webwork:if test="./id == /avatar/id">id="selected-avatar"</webwork:if>>
                <img id="<webwork:property value="./id"/>" src="<webwork:property value="/url(.)"/>" width="48" height="48"
                     alt="<webwork:text name="'avatarpicker.tooltip'"/>"/></li>
            </webwork:iterator>
        </ul>
    </div>

    <!--  then the icons uploaded for the project if any -->
    <div class="panel" id="avatar-uploaded">
        <h2><webwork:text name="'avatarpicker.custom'"/></h2>
        <ul class="avatars">
            <webwork:iterator value="/uploadedAvatars">
                <li class="avatar custom" <webwork:if test="./id == /avatar/id">id="selected-avatar"</webwork:if>>
                <img id="<webwork:property value="./id"/>" src="<webwork:property value="/url(.)"/>" width="48" height="48"
                                                   alt="<webwork:text name="'avatarpicker.tooltip'"/>"/><a class="del" href="<%= request.getContextPath()%>/secure/project/DeleteProjectAvatar!default.jspa?avatarId=<webwork:property value="./id"/>&pid=<webwork:property value="/pid"/>">x</a>
                </li>
            </webwork:iterator>
            <webwork:if test="/temporaryAvatarExistent == true">
                <li id="selected-avatar" class="avatar custom"><img src="<webwork:property value="/temporaryAvatarUrl"/>" width="48" height="48"/></li>
            </webwork:if>
    </div>

    <div class="module error message">
        <p class="retryprogress"><webwork:text name="'avatarpicker.error'"/> <strong class="retry">(<webwork:text name="'avatarpicker.retry'"/>)</strong></p>
        <p class="retrycomplete"><webwork:text name="'avatarpicker.retrycomplete'"/></p>
        <button class="tryagain"><webwork:text name="'avatarpicker.tryagain'"/></button>
        <button type="button" class="cancel"><webwork:text name="'admin.common.words.cancel'"/></button>
    </div>

</div>

