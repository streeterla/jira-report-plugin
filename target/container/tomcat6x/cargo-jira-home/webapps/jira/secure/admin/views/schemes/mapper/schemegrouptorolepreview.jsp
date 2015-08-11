<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.scheme.group.role.preview.title'"/></title>
</head>

<body>

<script type="text/javascript">
function toggle(mode, elementId)
{
    var hideElement;
    var showElement;

    if (mode == "hide")
    {
        hideElement = document.getElementById('long_' + elementId);
        showElement = document.getElementById('short_' + elementId);
    }
    else
    {
        hideElement = document.getElementById('short_' + elementId);
        showElement = document.getElementById('long_' + elementId);
    }

    if (hideElement && showElement)
    {
        hideElement.style.display = 'none';
        showElement.style.display = '';
    }
}
</script>

<p>
    <page:applyDecorator name="jiraform">
        <page:param name="action">SchemeGroupToRoleTransformer.jspa</page:param>
        <page:param name="columns">1</page:param>
        <webwork:if test="/hasSelectedSchemeIds == true && /groupToRoleMappings != null && /groupToRoleMappings/size != 0">
            <page:param name="submitId">save_submit</page:param>
            <page:param name="submitName"><webwork:text name="'common.words.save'"/></page:param>
        </webwork:if>
        <page:param name="width">100%</page:param>
        <page:param name="cancelURI">SchemePicker!default.jspa</page:param>
        <page:param name="helpURL">scheme_tools</page:param>
        <page:param name="title"><webwork:text name="'admin.scheme.group.role.preview.title'"/></page:param>
        <page:param name="autoSelectFirst">false</page:param>

        <webwork:if test="/hasSelectedSchemeIds == true ">

        <tr>
            <td>
                <webwork:text name="'admin.scheme.group.role.preview.instructions.1'">
                   <webwork:param name="'value0'"><strong></webwork:param>
                   <webwork:param name="'value1'"><webwork:property value="/schemeTransformResults/all/size"/></webwork:param>
                   <webwork:param name="'value2'"></strong></webwork:param>
                </webwork:text>
            </td>
        </tr>
        </webwork:if>

<webwork:if test="/hasSelectedSchemeIds == true && /groupToRoleMappings != null && /groupToRoleMappings/size != 0">
    <tr>
        <td>
            <table class="centered" id="group_to_role_mappings">
                <webwork:if test="/mappingsWithoutGlobalUsePermission/size != 0" >
                    <webwork:iterator value="/mappingsWithoutGlobalUsePermission">
                        <tr >
                            <td valign="middle" align="right" width="45%"><webwork:property value="./groupName"/></td>
                            <td valign="bottom" align="center" width="10%"><img src="<%=request.getContextPath()%>/images/icons/arrow_right_small.gif" alt="to --->" /></td>
                            <td valign="middle" align="left" width="45%"><webwork:property value="./projectRole/name"/></td>
                        </tr>
                    </webwork:iterator>
                </webwork:if>
                <webwork:if test="/anyGroupGrantedGlobalUsePermission == true">
                    <tr>
                        <td colspan="3">
                        <p class="noteBox"><webwork:text name="'admin.scheme.group.role.preview.warning.use.permission'"/></p>
                        </td>
                    </tr>
                    <webwork:iterator value="/mappingsWithGlobalUsePermission">
                        <tr >
                            <td valign="middle" align="right"><webwork:property value="./groupName"/></td>
                            <td valign="bottom" align="center"><img src="<%=request.getContextPath()%>/images/icons/arrow_right_yellow.gif" alt="to --->" /></td>
                            <td valign="middle" align="left"><webwork:property value="./projectRole/name"/></td>
                        </tr>
                    </webwork:iterator>
                </webwork:if>
            </table>
            <br/>
        </td>
    </tr>
    <tr>
        <webwork:if test="/schemeTransformResults/associatedProjectsCount != 0">
        <td>
            <webwork:text name="'admin.scheme.group.role.preview.instructions.2'">
                <webwork:param name="'value0'"><strong></webwork:param>
                <webwork:param name="'value1'"><webwork:property value="/schemeTransformResults/associatedProjectsCount"/></webwork:param>
                <webwork:param name="'value2'"></strong></webwork:param>
            </webwork:text>
        </td>
        </webwork:if>
        <webwork:else>
            <td><webwork:text name="'admin.scheme.group.role.preview.no.project.roles'"/></td>
        </webwork:else>
    </tr>

    <tr>
        <td>
            <table class="defaultwidth centered">
                <webwork:iterator value="/schemeTransformResults/associatedTransformedResults">
                    <webwork:iterator value="./associatedProjects">
                        <tr>
                            <td><webwork:text name="'common.words.project'"/> <strong><webwork:property value="./name"/></strong> <span class="smallgrey">(<webwork:text name="'common.concepts.scheme'"/>:
                                <webwork:property value="../originalScheme/name"/>)</span></td>
                        </tr>
                        <tr>
                            <td>
                                <table id="<webwork:property value="./name"/>_summary" class="grid defaultwidth centered">
                                    <tr>
                                        <th width="20%"><webwork:text name="'common.words.role'"/></th>
                                        <th width="80%"><webwork:text name="'admin.scheme.group.role.preview.users.being.added'"/></th>
                                    </tr>
                                    <webwork:iterator value="../roleToGroupsMappings">
                                        <tr>
                                            <td><webwork:property value="./projectRole/name"/></td>
                                            <td>
                                <span id="short_<webwork:property value="../name"/>_<webwork:property value="./projectRole/name"/>"
                                        <webwork:if test="./unpackedUsersLimited(21)/size == 21">onclick="toggle('expand', '<webwork:property value="../name"/>_<webwork:property value="./projectRole/name"/>');"</webwork:if>>
                                    <webwork:iterator value="./unpackedUsersLimited(20)" status="'status'"><webwork:property value="/fullNameForUser(.)"/><webwork:if test="@status/last == false">, </webwork:if></webwork:iterator>
                                    <webwork:if test="./unpackedUsersLimited(21)/size == 21"><span style="cursor:pointer;" class="smallgrey" >[<webwork:text name="'common.concepts.more'" />]</span></webwork:if>
                                </span>
                                <span style="display:none; cursor:pointer;"
                                      id="long_<webwork:property value="../name"/>_<webwork:property value="./projectRole/name"/>"
                                      onclick="toggle('hide', '<webwork:property value="../name"/>_<webwork:property value="./projectRole/name"/>');">
                                    <webwork:iterator value="./unpackedUsers" status="'status'"><webwork:property value="/fullNameForUser(.)"/><webwork:if test="@status/last == false">, </webwork:if></webwork:iterator>

                                    <span class="smallgrey">[<webwork:text name="'admin.deleteuser.hide'"/>]</span>
                                </span>
                                            </td>
                                        </tr>
                                    </webwork:iterator>
                                </table>
                            </td>
                        </tr>
                    </webwork:iterator>
                </webwork:iterator>
            </table>
        </td>
    </tr>

</webwork:if>
<webwork:elseIf test="/hasSelectedSchemeIds == false && hasAnyErrors == false">
    <tr>
        <td>
            <webwork:text name="'admin.scheme.group.role.preview.no.schemes.selected'"/>
        </td>
    </tr>
</webwork:elseIf>
<webwork:elseIf test="hasAnyErrors == false">
    <tr>
        <td>
            <webwork:text name="'admin.scheme.group.role.preview.no.groups.selected'"/>
        </td>
    </tr>
</webwork:elseIf>

</page:applyDecorator>
</p>
</body>
</html>
