<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<page:applyDecorator name="auiform">
    <page:param name="title"><webwork:text name="'common.concepts.changepassword'"/></page:param>
    <page:param name="id">change_password</page:param>
    <page:param name="description">
        <webwork:text name="'changepassword.success.desc'"/>
    </page:param>
    <page:param name="action">ChangePassword.jspa</page:param>
    <page:param name="cancelURI">ViewProfile.jspa</page:param>
</page:applyDecorator>
