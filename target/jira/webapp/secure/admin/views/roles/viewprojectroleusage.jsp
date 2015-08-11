<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>


<html>
<head>
	<title>
        <webwork:text name="'admin.projectroles.usage.title'">
            <webwork:param value="/htmlEncode(/role/name)" />
        </webwork:text>
    </title>
</head>
<body>

<page:applyDecorator name="jirapanel">
	<page:param name="title"><webwork:text name="'admin.projectroles.usage.title'">
                <webwork:param value="/htmlEncode(/role/name)" />
            </webwork:text>
    </page:param>
    <page:param name="helpURL">project_roles</page:param>
    <page:param name="helpURLFragment">#project_role_browser</page:param>
    <page:param name="description">
        <p>
        <webwork:text name="'admin.projectroles.usage.desc'">
           <webwork:param name="'value0'"><b></webwork:param>
           <webwork:param name="'value1'"><webwork:param value="/htmlEncode(/role/name)" /></webwork:param>
           <webwork:param name="'value2'"></b></webwork:param>
        </webwork:text>
        </p>
    </page:param>

    <page:param name="width">100%</page:param>

    <table class="defaultWidth centered">
    <tr>
        <td class="fullyCentered ">
            <b><a id="return_link" href="ViewProjectRoles.jspa">&lt;&lt; <webwork:text name="'admin.projectroles.returnlink'"/></a></b>
        </td>
    </tr>
    </table>

    <jsp:include page="associatedschemestables.jsp"/>

</page:applyDecorator>

</body>
</html>
