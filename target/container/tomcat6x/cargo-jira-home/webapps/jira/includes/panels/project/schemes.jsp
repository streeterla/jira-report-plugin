<%@ taglib uri="webwork" prefix="webwork" %>

<strong><webwork:text name="'admin.projects.issue.type.scheme'"/>: </strong> <webwork:property value="/issueTypeScheme/name" />
<webwork:if test="/hasAdminPermission == true">
(
<a id="selectIssueTypeScheme"
   href="<webwork:url page="SelectIssueTypeSchemeForProject!default.jspa">
            <webwork:param name="'projectId'" value="long('id')" />
            <webwork:param name="'returnUrl'" >/secure/project/ViewProject.jspa?pid=<webwork:property value="long('id')" /></webwork:param>
         </webwork:url>"><webwork:text name="'common.words.select'"/></a> |
<a id="editCurrentIssueTypeScheme"
   href="<webwork:url page="/secure/admin/ConfigureOptionSchemes!default.jspa">
            <webwork:param name="'fieldId'" value="'issuetype'" />
            <webwork:param name="'schemeId'" value="/issueTypeScheme/id" />
            <webwork:param name="'projectId'" value="long('id')" />
            <webwork:param name="'returnUrl'" >/secure/project/ViewProject.jspa?pid=<webwork:property value="long('id')" /></webwork:param>
         </webwork:url>"><webwork:text name="'common.words.edit'"/></a> |
<a id="manageIssueTypeSchemes"
   href="<webwork:url page="/secure/admin/ManageIssueTypeSchemes!default.jspa">
         </webwork:url>"><webwork:text name="'admin.projects.manage.issue.type.scheme'"/></a>
)
</webwork:if>

<br />
<%-- Notification Schemes --%>
<b><webwork:text name="'admin.projects.notification.scheme'"/>:</b>
<webwork:if test="schemes != null && schemes/size > 0">
	<webwork:iterator value="schemes" status="'liststatus'">
		<webwork:property value="string('name')" />
		<webwork:if test="@liststatus/last == false">, </webwork:if>
	</webwork:iterator>
	<webwork:if test="/hasAdminPermission == true">
		(
		<a id="select_notification_scheme" href="<webwork:url page="SelectProjectScheme!default.jspa"><webwork:param name="'projectId'" value="long('id')" /></webwork:url>"><webwork:text name="'common.words.select'"/></a>
		|
		<a id="edit_notification_scheme" href="<webwork:url page="EditNotifications!default.jspa"><webwork:param name="'schemeId'" value="schemes/(0)/long('id')"/></webwork:url>"><webwork:text name="'common.words.edit'"/></a>
		)
	</webwork:if>
</webwork:if>
<webwork:else>
	<webwork:text name="'common.words.none'"/>
	<webwork:if test="/hasAdminPermission == true">
		(
		<a id="select_notification_scheme" href="<webwork:url page="SelectProjectScheme!default.jspa"><webwork:param name="'projectId'" value="long('id')" /></webwork:url>"><webwork:text name="'common.words.select'"/></a>
		)
	</webwork:if>
</webwork:else>

<%-- Permission Scheme has been added to the project --%>
<br>
<b><webwork:text name="'admin.projects.permission.scheme'"/>:</b>
<webwork:if test="permissionSchemes != null && permissionSchemes/size > 0">
	<webwork:iterator value="permissionSchemes" status="'liststatus'">
		<webwork:property value="string('name')" />
		<webwork:if test="@liststatus/last == false">, </webwork:if>
	</webwork:iterator>
	<webwork:if test="/hasAdminPermission == true">
		(
		<a id="select_permission_scheme" href="<webwork:url page="SelectProjectPermissionScheme!default.jspa"><webwork:param name="'projectId'" value="long('id')" /></webwork:url>"><webwork:text name="'common.words.select'"/></a>
		|
		<a id="edit_permission_scheme" href="<webwork:url page="EditPermissions!default.jspa"><webwork:param name="'schemeId'" value="permissionSchemes/(0)/long('id')"/></webwork:url>"><webwork:text name="'common.words.edit'"/></a>
		)
	</webwork:if>
</webwork:if>
<webwork:else>
	<webwork:text name="'common.words.none'"/>
	<webwork:if test="/hasAdminPermission == true">
		(
		<a id="select_permission_scheme" href="<webwork:url page="SelectProjectPermissionScheme!default.jspa"><webwork:param name="'projectId'" value="long('id')" /></webwork:url>"><webwork:text name="'common.words.select'"/></a>
		)
	</webwork:if>
</webwork:else>

	<%-- Issue Security Scheme has been added to the project --%>
	<br>
	<b><webwork:text name="'admin.projects.issue.security.scheme'"/>:</b>
	<webwork:property value="issueSecuritySchemes" >
		<webwork:if test=". != null && size > 0">
			<webwork:iterator value="." status="'liststatus'">
				<webwork:property value="string('name')" />
				<webwork:if test="@liststatus/last == false">, </webwork:if>
			</webwork:iterator>
			<webwork:if test="/hasAdminPermission == true">
				(
				<a id="select_security_scheme" href="<webwork:url page="SelectProjectIssueSecurityScheme!default.jspa"><webwork:param name="'projectId'" value="long('id')" /><webwork:param name="'schemeId'" value="./(0)/long('id')"/></webwork:url>"><webwork:text name="'common.words.select'"/></a>
				|

				<a id="edit_security_scheme" href="<webwork:url page="EditIssueSecurities!default.jspa"><webwork:param name="'schemeId'" value="./(0)/long('id')"/></webwork:url>"><webwork:text name="'common.words.edit'"/></a>
				)
			</webwork:if>
		</webwork:if>
		<webwork:else>
			<webwork:text name="'common.words.none'"/>
			<webwork:if test="/hasAdminPermission == true">
				(
				<a id="select_security_scheme" href="<webwork:url page="SelectProjectIssueSecurityScheme!default.jspa"><webwork:param name="'projectId'" value="long('id')" /></webwork:url>"><webwork:text name="'common.words.select'"/></a>
				)
			</webwork:if>
		</webwork:else>
	</webwork:property>
    <webwork:if test="/enterprise == true">
        <br>
        <b><webwork:text name="'admin.projects.field.configuration.scheme'"/>:</b>
        <webwork:if test="/fieldLayoutSchemes == null || /fieldLayoutSchemes/empty == true">
            <webwork:if test="/hasAdminPermission == true">
                <a id="view_issuefields" href="ViewIssueFields.jspa"><webwork:text name="'admin.projects.system.default.field.config'"/></a>
            </webwork:if>
            <webwork:else>
                <webwork:text name="'admin.projects.system.default.field.config'"/>
            </webwork:else>
        </webwork:if>
        <webwork:else>
            <webwork:if test="/fieldLayoutScheme == null">
                <webwork:text name="'admin.projects.system.default.field.config'"/> <webwork:if test="/hasAdminPermission == true">( <a id="select_fieldlayoutscheme" href="<webwork:url page="SelectFieldLayoutScheme!default.jspa"><webwork:param name="'projectId'" value="long('id')" /></webwork:url>"><webwork:text name="'common.words.select'"/></a> )</webwork:if>
            </webwork:if>
            <webwork:else>
                <webwork:property value="/fieldLayoutScheme/name" />
                <webwork:if test="/hasAdminPermission == true">
                ( <a id="select_fieldlayoutscheme" href="<webwork:url page="SelectFieldLayoutScheme!default.jspa"><webwork:param name="'projectId'" value="long('id')" /></webwork:url>"><webwork:text name="'common.words.select'"/></a>
                  | <a id="edit_fieldlayoutscheme" href="<webwork:url page="ConfigureFieldLayoutScheme.jspa"><webwork:param name="'id'" value="/fieldLayoutScheme/id" /></webwork:url>"><webwork:text name="'common.words.edit'"/></a> )
                </webwork:if>
            </webwork:else>
        </webwork:else>
        <!-- Issue Type Screen Scheme -->
        <br>
        <b><webwork:text name="'admin.projects.issue.type.screen.scheme'"/>:</b>
        <webwork:property value="/issueTypeScreenScheme/name" />
        <webwork:if test="/hasAdminPermission == true">
        ( <a id="select_issuetypescreenscheme" href="<webwork:url page="SelectIssueTypeScreenScheme!default.jspa"><webwork:param name="'projectId'" value="long('id')" /></webwork:url>"><webwork:text name="'common.words.select'"/></a>
          | <a id="edit_issuetypescreenscheme" href="<webwork:url page="ConfigureIssueTypeScreenScheme.jspa"><webwork:param name="'id'" value="/issueTypeScreenScheme/id" /></webwork:url>"><webwork:text name="'common.words.edit'"/></a> )
        </webwork:if>
    </webwork:if>

    <br>
    <b><webwork:text name="'admin.projects.workflow.scheme'"/>:</b>
    <webwork:property value="/workflowScheme">
        <webwork:if test=". != null">
            <webwork:property value="./string('name')" />
            <webwork:if test="/hasAdminPermission == true">
                (
                <a id="select_workflow_scheme" href="<webwork:url page="SelectProjectWorkflowScheme!default.jspa"><webwork:param name="'projectId'" value="../long('id')" /><webwork:param name="'schemeId'" value="./long('id')"/></webwork:url>"><webwork:text name="'common.words.select'"/></a>
                )
            </webwork:if>
        </webwork:if>
        <webwork:else>
            <webwork:text name="'common.words.none'"/>
            <webwork:if test="/hasAdminPermission == true">
                (
                <a id="select_workflow_scheme" href="<webwork:url page="SelectProjectWorkflowScheme!default.jspa"><webwork:param name="'projectId'" value="long('id')" /></webwork:url>"><webwork:text name="'common.words.select'"/></a>
                )
            </webwork:if>
        </webwork:else>
    </webwork:property>

<br>
    <b><webwork:text name="'admin.projects.cvs.modules'"/>:</b>
    <%-- see if the project has any repositories --%>
    <webwork:if test="/repositories != null && /repositories/empty == false">
        <webwork:iterator value="/repositories" status="'repostatus'">
            <webwork:property value="./name"/><webwork:if test="@repostatus/last == false">, </webwork:if>
        </webwork:iterator>
    </webwork:if>
    <webwork:else>
        <webwork:text name="'common.words.none'"/>
    </webwork:else>
    <webwork:if test="/hasAdminPermission == true">
        (
        <a id="select_cvs_modules" href="<webwork:url page="EnterpriseSelectProjectRepository!default.jspa"><webwork:param name="'projectId'" value="long('id')" /></webwork:url>"><webwork:text name="'admin.projects.select.modules'"/></a>
        )
    </webwork:if>

<%-- Mail Configuration per project - sender email address --%>
<webwork:if test="/hasDefaultSMTPMailServer == true">
<br>
<b><webwork:text name="'admin.projects.mail.configuration'"/>:</b>
    <webwork:property value="projectEmail" >
    <webwork:text name="'admin.projects.mail.notitifications.from'"/>
    <webwork:if test=". == null">
        <webwork:text name="'admin.projects.mail.notifications.from.default'"/>
    </webwork:if>
    <webwork:else>
        '<webwork:property />'
    </webwork:else>

    </webwork:property>
	<webwork:if test="/hasAdminPermission == true">
    (
    <a href="<webwork:url page="ProjectEmail!default.jspa"><webwork:param name="'projectId'" value="long('id')" /></webwork:url>"><webwork:text name="'admin.projects.edit.mail.configuration'"/></a>
    )
    </webwork:if>
</webwork:if>
