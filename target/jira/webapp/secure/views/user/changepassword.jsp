<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<webwork:if test="/remoteUser == null">
    <page:applyDecorator name="auiform">
        <page:param name="title"><webwork:text name="'common.concepts.changepassword'"/></page:param>
        <page:param name="id">change_password</page:param>
        <page:param name="description">
            <p><webwork:text name="'changepassword.must.log.in'">
                <webwork:param name="param0"><a href="<%=request.getContextPath()%>/login.jsp?os_destination=%2Fsecure%2FViewProfile.jspa"></webwork:param>
                <webwork:param name="param1"></a></webwork:param></webwork:text></p>
        </page:param>
        <page:param name="action">ChangePassword.jspa</page:param>
        <page:param name="cancelURI">ViewProfile.jspa</page:param>
    </page:applyDecorator>
</webwork:if>
<webwork:elseIf test="/remoteUser/name != /username">
    <page:applyDecorator name="auiform">
        <page:param name="title"><webwork:text name="'common.concepts.changepassword'"/></page:param>
        <page:param name="id">change_password</page:param>
        <page:param name="description">
            <p><webwork:text name="'changepassword.own.profile'"/></p>
            <p><webwork:text name="'changepassword.logged.in.as'">
                 <webwork:param name="param0"><a href="<%=request.getContextPath()%>/secure/ViewProfile.jspa"><webwork:property value="/remoteUser/fullName"/></a></webwork:param>
            </webwork:text></p>
         </page:param>
        <page:param name="action">ChangePassword.jspa</page:param>
        <page:param name="cancelURI">ViewProfile.jspa</page:param>
    </page:applyDecorator>
</webwork:elseIf>
<webwork:else>
    <page:applyDecorator name="auiform">
        <page:param name="title"><webwork:text name="'common.concepts.changepassword'"/></page:param>
        <page:param name="id">change_password</page:param>
        <page:param name="action">ChangePassword.jspa</page:param>
        <page:param name="submitId">update_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
        <page:param name="cancelURI">ViewProfile.jspa</page:param>
        <fieldset>
            <webwork:component name="'username'" value="/username" template="hidden.jsp"/>
            <webwork:password label="text('changepassword.current')" name="'current'"  theme="'aui'"><webwork:param name="'id'">current-password</webwork:param><webwork:param name="'mandatory'">true</webwork:param></webwork:password>
            <webwork:password label="text('changepassword.new')" name="'password'"  theme="'aui'"><webwork:param name="'id'">new-password</webwork:param><webwork:param name="'mandatory'">true</webwork:param></webwork:password>
            <webwork:password label="text('changepassword.confirm')" name="'confirm'"  theme="'aui'"><webwork:param name="'id'">confirm-password</webwork:param><webwork:param name="'mandatory'">true</webwork:param></webwork:password>
        </fieldset>
    </page:applyDecorator>
</webwork:else>