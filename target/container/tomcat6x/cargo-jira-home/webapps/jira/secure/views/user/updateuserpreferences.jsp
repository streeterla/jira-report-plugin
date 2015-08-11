<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<body>
<webwork:if test="/remoteUser == null">
    <page:applyDecorator name="auiform">
        <page:param name="title"><webwork:text name="'preferences.update.title'"/></page:param>
        <page:param name="id">edit_user_preferences</page:param>
        <page:param name="description">
            <p><webwork:text name="'session.timeout.message.title'"/></p>
            <p><webwork:text name="'preferences.must.log.in'">
                <webwork:param name="param0"><a href="<%=request.getContextPath()%>/login.jsp?os_destination=%2Fsecure%2FViewProfile.jspa"></webwork:param>
                <webwork:param name="param1"></a></webwork:param></webwork:text></p>
        </page:param>
        <page:param name="action">UpdateUserPreferences.jspa</page:param>
        <page:param name="cancelURI">ViewProfile.jspa</page:param>
    </page:applyDecorator>
</webwork:if>
<webwork:elseIf test="/remoteUser/name != /username">
    <page:applyDecorator name="auiform">
        <page:param name="title"><webwork:text name="'preferences.update.title'"/></page:param>
        <page:param name="id">edit_user_preferences</page:param>
        <page:param name="description">
            <p><webwork:text name="'preferences.own.profile'"/></p>
            <p><webwork:text name="'editprofile.logged.in.as'">
                 <webwork:param name="param0"><a href="<%=request.getContextPath()%>/secure/ViewProfile.jspa"><webwork:property value="/remoteUser/fullName"/></a></webwork:param>
            </webwork:text></p>
         </page:param>
        <page:param name="action">UpdateUserPreferences.jspa</page:param>
        <page:param name="cancelURI">ViewProfile.jspa</page:param>
    </page:applyDecorator>
</webwork:elseIf>
<webwork:else>
    <page:applyDecorator name="auiform">
        <page:param name="id">edit_user_preferences</page:param>
        <page:param name="title"><webwork:text name="'preferences.update.title'"/></page:param>
        <page:param name="action">UpdateUserPreferences.jspa</page:param>
        <page:param name="submitId">update_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
        <page:param name="cancelURI">ViewProfile.jspa</page:param>
        <fieldset>
            <webwork:component name="'username'" value="/username" template="hidden.jsp"/>

            <webwork:textfield label="text('preferences.issuesPerPage.label')" name="'userIssuesPerPage'" theme="'aui'">
                <webwork:param name="'id'">pagesize</webwork:param>
                <webwork:param name="'mandatory'">true</webwork:param>
                <webwork:param name="'description'" value="text('preferences.issuesPerPage')"/>
            </webwork:textfield>

            <ui:select label="text('preferences.mailType.label')" name="'userNotificationsMimeType'" list="mimeTypes" listKey="'key'" listValue="'value'" theme="'aui'">
                <webwork:param name="'id'">maletype</webwork:param>
                <webwork:param name="'description'" value="text('preferences.mailType')"/>
            </ui:select>

            <ui:select label="text('preferences.locale')" name="'userLocale'" list="/installedLocales" listKey="'key'" listValue="'value'" theme="'aui'">
                <webwork:param name="'id'">locale</webwork:param>
            </ui:select>

            <ui:select label="text('preferences.notification.label')" name="'notifyOwnChanges'" list="/ownChangesList" listKey="'id'" listValue="'name'" value="notifyOwnChanges" theme="'aui'">
                <webwork:param name="'id'">ownnotifications</webwork:param>
                <webwork:param name="'description'" value="text('preferences.notification.desc')"/>
            </ui:select>

            <ui:select label="text('preferences.default.share.title')" name="'shareDefault'" list="/shareList" listKey="'id'" listValue="'name'" value="shareValue" theme="'aui'">
                <webwork:param name="'id'">sharing</webwork:param>
                <webwork:param name="'description'" value="text('preferences.default.share.desc')"/>
            </ui:select>
        </fieldset>
    </page:applyDecorator>
</webwork:else>
</body>
</html>
