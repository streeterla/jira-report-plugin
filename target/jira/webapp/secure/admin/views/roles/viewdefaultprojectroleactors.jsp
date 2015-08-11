<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.roles.view.roles'"/></title>
</head>

<body>

<page:applyDecorator name="jirapanel">
    <page:param name="helpURL">project_roles</page:param>
    <page:param name="helpURLFragment">#Specifying+%27default+members%27+for+a+project+role</page:param>
    <page:param name="title">
        <webwork:text name="'admin.roles.default.project.roles.title'">
            <webwork:param name="'value0'">
                <webwork:property value="/projectRole/name"/>
            </webwork:param>
        </webwork:text>
    </page:param>
    <page:param name="width">100%</page:param>
    <p>
        <webwork:text name="'admin.roles.default.project.roles.desc.1'"/>
    </p>
    <p>
        <webwork:text name="'admin.roles.default.project.roles.desc.2'">
           <webwork:param name="'value0'"><span class="note"></webwork:param>
           <webwork:param name="'value1'"></span></webwork:param>
           <webwork:param name="'value2'"><webwork:property value="/projectRole/name"/></webwork:param>
        </webwork:text>
    </p>

</page:applyDecorator>

<p>

    <table class="defaultWidth centered">
    <tr>
        <td class="fullyCentered jiraformfooter">
            <b><a id="return_link" href="ViewProjectRoles.jspa">&lt;&lt; <webwork:text name="'admin.projectroles.returnlink'"/></a></b>
        </td>
    </tr>
    </table>

    <table class="grid defaultWidth centered">
        <tr>
            <webwork:iterator value="/roleActorTypes">
                <th width="<webwork:property value="/tableWidthForRoleActorTypes(80)" />%">
                    <b><webwork:text name="'admin.common.words.default'"/> <webwork:property value="./prettyName" /></b>
                </th>
            </webwork:iterator>
        </tr>

        <webwork:property value="/projectRole" id="role">
        <tr>
            <jsp:include page="displayroleactors.jsp"/>
        </tr>
        </webwork:property>
    </table>

</p>

</body>
</html>
