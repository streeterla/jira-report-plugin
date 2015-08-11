<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><webwork:text name="'admin.view.user.projectroles.title'" /></title>
</head>

<body>

<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'admin.view.user.projectroles.title'" />: <webwork:property value="/projectRoleEditUser/fullName"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">users</page:param>
    <page:param name="helpURLFragment">#Assigning+a+User+to+a+Project+Role</page:param>
    <page:param name="description">
        <webwork:text name="'admin.view.user.projectroles.description.1'">
           <webwork:param name="'value0'"><b></webwork:param>
           <webwork:param name="'value1'"><webwork:property value="/projectRoleEditUser/fullName"/></webwork:param>
           <webwork:param name="'value2'"></b></webwork:param>
        </webwork:text>
        <p/>
        <span id="username" class="hidden"><webwork:property value="/projectRoleEditUser/name"/></span>
        <img src="<%= request.getContextPath() %>/images/icons/emoticons/user_16.gif" alt="On" title="<webwork:text name="'admin.view.user.projectroles.user.direct.member'"/>"/> -
        <webwork:text name="'admin.view.user.projectroles.description.2'"/><br/>
        <img src="<%= request.getContextPath() %>/images/icons/emoticons/user_bw_16.gif" alt="Off" title="<webwork:text name="'admin.view.user.projectroles.user.not.member'"/>"/> -
        <webwork:text name="'admin.view.user.projectroles.description.3'"/><br/>
        <img src="<%= request.getContextPath() %>/images/icons/emoticons/group_16.gif" alt="On" title="<webwork:text name="'admin.view.user.projectroles.user.group.member'"/>"/> -
        <webwork:text name="'admin.view.user.projectroles.description.4'"/><br/>
        <img src="<%= request.getContextPath() %>/images/icons/emoticons/user_16.gif" alt="On" title="<webwork:text name="'admin.view.user.projectroles.user.direct.and.group.member'"/>"/>
        <img src="<%= request.getContextPath() %>/images/icons/emoticons/group_16.gif" alt="On" title="<webwork:text name="'admin.view.user.projectroles.user.direct.and.group.member'"/>"/> -
        <webwork:text name="'admin.view.user.projectroles.description.5'"/>
        <p/>
        <ul class="square">
            <li>
                <a href="<webwork:url page="EditUserProjectRoles!default.jspa"><webwork:param name="'name'" value="name" /></webwork:url>"><webwork:text name="'admin.viewuser.edit.project.roles'"/></a>
            </li>
        </ul>
    </page:param>
</page:applyDecorator>

<table class="defaultWidth centered">
    <tr>
        <td align="center">
            <a id="return_link" href="<webwork:url value="returnUrl"><webwork:param name="'name'" value="name"/></webwork:url>">&lt;&lt; <webwork:text name="'admin.editusergroups.return.to.viewing.user'">
                <webwork:param name="'value0'">'<webwork:property value="/projectRoleEditUser/fullName" />'</webwork:param>
            </webwork:text></a>
            <p/>&nbsp;
        </td>
    </tr>
</table>

<webwork:if test="/visibleProjectsByCategory/size != 0">
<table id="projecttable" class="defaultWidth centered" style="border-collapse:collapse;">
    <!-- This is a row for the category which is kinda like a header-->
    <tr class="formtitle grid">
        <th style="font-size:13px; width:25%;"><webwork:text name="'common.words.project'"/></th>
        <webwork:iterator value="allProjectRoles">
            <th style="font-size:13px;width:<webwork:property value="/projectRoleColumnWidth"/>%;"><webwork:property
                    value="./name"/>
            </th>
        </webwork:iterator>
    </tr>

<webwork:iterator value="/visibleProjectsByCategory">

    <tr style="border:none;"><td colspan="<webwork:property value="allProjectRoles/size + 1"/>">&nbsp;</td></tr>
        <tr class="grid">
            <th style="font-size:13px; width:25%;"><webwork:if test="key != null"><webwork:text name="'admin.view.user.projectroles.project.category'"/> : <webwork:property
                    value="key/string('name')"/></webwork:if>
                <webwork:else><webwork:text name="'admin.view.user.projectroles.project.category.uncategorised'"/></webwork:else>
            </th>
            <webwork:iterator value="allProjectRoles">
                <th style="font-size:13px;width:<webwork:property value="/projectRoleColumnWidth"/>%;"/>
            </webwork:iterator>
        </tr>

        <webwork:iterator value="value">
            <tr name="project" class="grid">
                <td nowrap="true">&nbsp;&nbsp;<webwork:property value="./name"/>
                </td>
                <webwork:iterator value="allProjectRoles">
                    <td>
                        <webwork:if test="/roleForProjectSelected(., ..) == true && /userInProjectRoleOtherType(., ..) != null"><img src="<%= request.getContextPath() %>/images/icons/emoticons/user_16.gif" alt="On" title="<webwork:text name="'admin.view.user.projectroles.user.direct.and.group.member'"/>"/><img src="<%= request.getContextPath() %>/images/icons/emoticons/group_16.gif" alt="On" title="<webwork:text name="'admin.view.user.projectroles.user.direct.and.group.member'"/>"/></webwork:if>
                        <webwork:elseIf test="/roleForProjectSelected(., ..) == true"><img src="<%= request.getContextPath() %>/images/icons/emoticons/user_16.gif" alt="On" title="<webwork:text name="'admin.view.user.projectroles.user.direct.member'"/>"/></webwork:elseIf>
                        <webwork:elseIf test="/userInProjectRoleOtherType(., ..) != null"><img src="<%= request.getContextPath() %>/images/icons/emoticons/group_16.gif" alt="On" title="<webwork:text name="'admin.view.user.projectroles.user.group.member'"/>"/></webwork:elseIf>
                        <webwork:else><img src="<%= request.getContextPath() %>/images/icons/emoticons/user_bw_16.gif" alt="Off" title="<webwork:text name="'admin.view.user.projectroles.user.not.member'"/>"/></webwork:else>
                        <webwork:if test="/userInProjectRoleOtherType(., ..) != null">
                            <span title="<webwork:text name="'admin.view.user.projectroles.group.association'"/>: <webwork:property
                                    value="/userInProjectRoleOtherType(., ..)"/>" style="color:dimgray;">(<webwork:property
                                    value="/userInProjectRoleOtherType(., ..)"/>)</span>
                        </webwork:if>
                    </td>
                </webwork:iterator>
            </tr>
        </webwork:iterator>    
</webwork:iterator>
</table>
<p/>
</webwork:if>
<webwork:else>
    <table class="defaultWidth centered">
        <tr>
            <td>
                <p/>
                <span>
                    <webwork:text name="'admin.view.user.projectroles.noprojects.found'"/>
                </span>
            </td>
        </tr>
        </table>
</webwork:else>

</body>
</html>
