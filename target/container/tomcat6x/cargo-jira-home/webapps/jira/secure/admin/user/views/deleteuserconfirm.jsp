<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.deleteuser.delete.user'"/>: <webwork:property value="name" /></title>
</head>

<body>

<webwork:if test="user">
    <webwork:if test="deleteable == 'true'">
        <page:applyDecorator name="jiraform">
            <page:param name="description">
                <p><webwork:text name="'admin.deleteuser.users.may.only.be.delete'"/></p>
                <p class="warning"><webwork:text name="'admin.deleteuser.components.lead.desc'"/></p>
            </page:param>
            <page:param name="jiraformId">delete_user_confirm</page:param>
            <page:param name="title"><webwork:text name="'admin.deleteuser.delete.user'"/>: <webwork:property value="name" /></page:param>
            <page:param name="labelWidth">50%</page:param>
            <page:param name="width">100%</page:param>
            <page:param name="action">DeleteUser.jspa</page:param>
            <page:param name="submitId">delete_submit</page:param>
            <page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
            <page:param name="cancelURI">UserBrowser.jspa</page:param>
            <page:param name="autoSelectFirst">false</page:param>

            <ui:component name="'name'" template="hidden.jsp" theme="'single'"  />
            <ui:component name="'confirm'" value="'true'" template="hidden.jsp" theme="'single'"  />
            <jsp:include page="/secure/admin/user/views/assignedreported.jsp"/>
        </page:applyDecorator>
    </webwork:if>
    <webwork:else>
        <page:applyDecorator name="jiraform">
            <page:param name="title"><webwork:text name="'admin.deleteuser.delete.user'"/>: <webwork:property value="name" /></page:param>
            <page:param name="jiraformId">delete_user_confirm</page:param>
            <page:param name="labelWidth">50%</page:param>
            <page:param name="width">100%</page:param>
            <page:param name="description">
                <span class="warning">
                <webwork:text name="'admin.deleteuser.cannot.be.deleted'"/>
                </span>
                <webwork:if test="/nonSysAdminAttemptingToDeleteSysAdmin == true">
                    <p class="warning"><webwork:text name="'admin.errors.users.cannot.delete.due.to.sysadmin'"/></p>
                </webwork:if>
                <p class="warning"><webwork:text name="'admin.deleteuser.components.lead.desc'"/></p>
            </page:param>
            <jsp:include page="/secure/admin/user/views/assignedreported.jsp"/>
        </page:applyDecorator>
    </webwork:else>
</webwork:if>
<webwork:else>
	<page:applyDecorator name="jiraform">
		<page:param name="title"><webwork:text name="'admin.deleteuser.delete.user'"/>: <webwork:property value="name" /></page:param>
		<page:param name="width">100%</page:param>
		<page:param name="description">
			<p><webwork:text name="'admin.deleteuser.user.does.not.exist'">
			    <webwork:param name="'value0'"><b><webwork:property value="name" /></b></webwork:param>
			    <webwork:param name="'value1'"><a href="<webwork:url page="UserBrowser.jspa"/>"></webwork:param>
			    <webwork:param name="'value2'"></a></webwork:param>
			</webwork:text></p>
		</page:param>
	</page:applyDecorator>
</webwork:else>
</body>
</html>
