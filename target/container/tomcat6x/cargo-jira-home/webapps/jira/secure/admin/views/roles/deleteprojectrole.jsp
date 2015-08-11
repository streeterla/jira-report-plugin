
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>


<html>
<head>
	<title><webwork:text name="'admin.projectroles.delete.name'"/>: <webwork:property value="/role/name" /></title>
</head>
<body>

<page:applyDecorator name="jiraform">
	<page:param name="title"><webwork:text name="'admin.projectroles.delete.name'"/>: <webwork:property value="/role/name" /></page:param>
	<page:param name="description">
        <p><webwork:text name="'admin.projectroles.delete.confirm'">
           <webwork:param name="'value0'"><webwork:property value="/role/name"/></webwork:param>
        </webwork:text>
        </p>
        <span class="warning" ><webwork:text name="'admin.projectroles.delete.warning'"/></span>
    </page:param>

	<page:param name="autoSelectFirst">false</page:param>
	<page:param name="columns">1</page:param>
    <page:param name="width">100%</page:param>
    <page:param name="action">DeleteProjectRole.jspa</page:param>
	<page:param name="submitId">delete_submit</page:param>
	<page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
	<page:param name="cancelURI">ViewProjectRoles.jspa</page:param>
    <page:param name="helpURL">project_roles</page:param>
    <page:param name="helpURLFragment">#Deleting+a+project+role</page:param>
    <input type="hidden" value="<webwork:property value="/role/id"/>" name="id"/>

    <tr><td>
        <p/>
        <jsp:include page="associatedschemestables.jsp"/>
    </td></tr>

</page:applyDecorator>



</body>
</html>
