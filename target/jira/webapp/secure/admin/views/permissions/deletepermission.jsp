
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.projects.editpermissions.delete.permission'"/></title>
</head>

<body>

    <p>
    <table width=100% cellpadding=10 cellspacing=0 border=0>
    <page:applyDecorator name="jiraform">
        <page:param name="action">DeletePermission.jspa</page:param>
        <page:param name="submitId">delete_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
    	<page:param name="cancelURI"><webwork:url page="EditPermissions!default.jspa"><webwork:param name="'schemeId'" value="schemeId"/></webwork:url></page:param>
        <page:param name="title"><webwork:text name="'admin.projects.editpermissions.delete.permission'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="autoSelectFirst">false</page:param>
	    <page:param name="description">
        <input type="hidden" name="schemeId" value="<webwork:property value="schemeId" />">
        <input type="hidden" name="id" value="<webwork:property value="id" />">
        <input type="hidden" name="confirmed" value="true">
            <webwork:text name="'admin.permissions.deleting.confirmation'">
                <webwork:param name="'value0'">
                    <b>
                    <webwork:if test="permissionDisplayName == 'Group' && permissionParameter == null">
                        <webwork:text name="'common.words.anonymous'"/>
                    </webwork:if>
                    <webwork:else>
                        <webwork:property value="permissionDisplayName"/>
                    </webwork:else>
                    </b>
                </webwork:param>
                <webwork:param name="'value1'">
                    <webwork:if test="permissionParameter != null">
                        &nbsp;(<webwork:property value="permissionParameter"/>)
                    </webwork:if>
                    <webwork:else>
                        &nbsp;
                    </webwork:else>
                </webwork:param>
                <webwork:param name="'value2'"><b><webwork:text name="permissionName"/></b><br></webwork:param>
            </webwork:text>
        </page:param>
    </page:applyDecorator>
    </table>
    </p>

</body>
</html>
