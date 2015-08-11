<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<webwork:if test="/remoteUser == null">
    <page:applyDecorator name="auiform">
        <page:param name="title"><webwork:text name="'editprofile.title'"/></page:param>
        <page:param name="id">edit_profile</page:param>
        <page:param name="description">
            <p><webwork:text name="'session.timeout.message.title'"/></p>
            <p><webwork:text name="'editprofile.must.log.in'">
                <webwork:param name="param0"><a href="<%=request.getContextPath()%>/login.jsp?os_destination=%2Fsecure%2FViewProfile.jspa"></webwork:param>
                <webwork:param name="param1"></a></webwork:param></webwork:text></p>
        </page:param>
        <page:param name="action">EditProfile.jspa</page:param>
        <page:param name="cancelURI">ViewProfile.jspa</page:param>
    </page:applyDecorator>
</webwork:if>
<webwork:elseIf test="/remoteUser/name != /username">
    <page:applyDecorator name="auiform">
        <page:param name="title"><webwork:text name="'editprofile.title'"/></page:param>
        <page:param name="id">edit_profile</page:param>
        <page:param name="description">
            <p><webwork:text name="'editprofile.own.profile'"/></p>
            <p><webwork:text name="'editprofile.logged.in.as'">
                 <webwork:param name="param0"><a href="<%=request.getContextPath()%>/secure/ViewProfile.jspa"><webwork:property value="/remoteUser/fullName"/></a></webwork:param>
            </webwork:text></p>
         </page:param>
        <page:param name="action">EditProfile.jspa</page:param>
        <page:param name="cancelURI">ViewProfile.jspa</page:param>
    </page:applyDecorator>
</webwork:elseIf>
<webwork:else>
    <page:applyDecorator name="auiform">
        <page:param name="title"><webwork:text name="'editprofile.title'"/></page:param>
        <page:param name="id">edit_profile</page:param>
        <page:param name="action">EditProfile.jspa</page:param>
        <page:param name="submitId">update_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
        <page:param name="cancelURI">ViewProfile.jspa</page:param>
        <fieldset>
            <webwork:component name="'username'" value="/username" template="hidden.jsp"/>
            <webwork:textfield label="text('common.words.fullname')" name="'fullName'" size="40" theme="'aui'" maxlength="255"><webwork:param name="'id'">fullname</webwork:param><webwork:param name="'mandatory'">true</webwork:param></webwork:textfield>
            <webwork:textfield label="text('common.words.email')" name="'email'" size="40" theme="'aui'" maxlength="255"><webwork:param name="'id'">email</webwork:param><webwork:param name="'mandatory'">true</webwork:param></webwork:textfield>
        </fieldset>
    </page:applyDecorator>
</webwork:else>