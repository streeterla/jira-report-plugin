<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title>
        <webwork:text name="'admin.projectroles.view.roles'" >
            <webwork:param><webwork:property value="/project/name"/></webwork:param>
        </webwork:text>
    </title>
</head>

<body>

<page:applyDecorator name="jirapanel">
    <page:param name="title">
        <webwork:text name="'admin.projectroles.view.roles'" >
            <webwork:param><webwork:property value="/project/name"/></webwork:param>
        </webwork:text>
    </page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">project_role_membership</page:param>

    <p>
    <webwork:text name="'admin.projectroles.the.table.below'">
        <webwork:param name="'value0'">
            <a href="ViewProject.jspa?pid=<webwork:property value="projectId" />"><b><webwork:property value="/project/name"/></b></a>
        </webwork:param>
    </webwork:text>
    </p>
    <webwork:if test="/roles/size == 0">
        <strong><webwork:text name="'admin.projectroles.view.noroles'"/></strong>
    </webwork:if>
</page:applyDecorator>

<p>

    <webwork:if test="/roles/size > 0">

    <table align=center bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width=90%><tr><td>
    <table border="0" cellpadding="3" cellspacing="1" width="100%" id="project_role_actors">
        <tr bgcolor=#f0f0f0>
            <td class="colHeaderLink" width="20%">
                <b><webwork:text name="'common.words.role'"/></b>
            </td>
            <webwork:iterator value="roleActorTypes">
                <td class="colHeaderLink" width="<webwork:property value="/tableWidthForRoleActorTypes(80)" />%">
                    <b><webwork:property value="./prettyName" /></b>
                </td>
            </webwork:iterator>

        </tr>

        <webwork:iterator value="/roles" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/odd == true">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
            <td valign=top>
                <b><webwork:property value="name"/></b><br/><webwork:property value="description"/>
                <webwork:if test="roleType/description/length > 1">
                    <br>
                    <webwork:property value="roleType/description"/>
                </webwork:if>
            </td>
            <jsp:include page="displayroleactors.jsp"/>
        </tr>
        </webwork:iterator>
    </table>
    </td></tr></table>
    </webwork:if>
</p>
</body>
</html>
