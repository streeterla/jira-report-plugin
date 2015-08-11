<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.scheme.group.role.mapper.title'"/></title>
</head>

<body>

<script type="text/javascript">
    function submitForm(typeOfSchemesToDisplay)
    {
        document.forms['jiraform'].action = "SchemePicker.jspa?typeOfSchemesToDisplay=" + typeOfSchemesToDisplay + "&selectedSchemeType=" + document.getElementById("selectedSchemeType").value;
        document.forms['jiraform'].submit();
        return false;
    }
</script>

<p>
    <page:applyDecorator name="jiraform">
    <page:param name="action">SchemeGroupToRoleMapper.jspa</page:param>
    <page:param name="columns">1</page:param>
    <page:param name="helpURL">scheme_tools</page:param>
    <webwork:if test="/hasSelectedSchemeIds == true && /uniqueGroupsForSelectedSchemes/size != 0">
        <page:param name="submitId">mapper_submit</page:param>
        <page:param name="submitName"><webwork:text name="'admin.scheme.group.role.mapper.submit'"/></page:param>
    </webwork:if>
    <page:param name="cancelURI">SchemePicker!default.jspa</page:param>
    <page:param name="width">100%</page:param>
    <page:param name="title"><webwork:text name="'admin.scheme.group.role.mapper.title'"/></page:param>
        <page:param name="description"><webwork:text name="'admin.scheme.group.role.mapper.desc'">
            <webwork:param name="'value0'"><p/></webwork:param>
            <webwork:param name="'value1'"><a href="<%=request.getContextPath()%>/secure/project/ViewProjectRoles.jspa"></webwork:param>
            <webwork:param name="'value2'"></a></webwork:param>
        </webwork:text>
    </page:param>
        <!-- error cases first -->
        <webwork:if test="/hasSelectedSchemeIds == false && hasAnyErrors == false">
            <tr>
                <td><webwork:text name="'admin.scheme.group.role.mapper.no.selected.schemes'"/></td>
            </tr>
        </webwork:if>
        <webwork:elseIf test="/uniqueGroupsForSelectedSchemes/size == 0 && hasAnyErrors == false">
            <tr>
                <td><webwork:text name="'admin.scheme.group.role.mapper.no.groups'"/></td>
            </tr>
        </webwork:elseIf>
        <!-- happy path -->
        <webwork:elseIf test="/hasSelectedSchemeIds == true">
        <tr>
            <td>
                <webwork:if test="/groupsWithoutGlobalUsePermission/size != 0">
                <table class="grid centered" id="group_to_role_mappings_no_use_permission" style="width: 40%">
                    <tr>
                        <th>
                            <webwork:text name="'common.words.groups'"/>
                        </th>
                        <th>
                            <webwork:text name="'common.words.project.roles'"/>
                        </th>
                    </tr>
                    <webwork:iterator value="/groupsWithoutGlobalUsePermission">
                        <tr>
                            <td width="50%">
                                <webwork:property value="."/>
                            </td>
                            <td valign="middle">
                                <select id="<webwork:property value="."/>_project_role" name="<webwork:property value="."/>_project_role">
                                    <option value="-1"><webwork:text name="'admin.scheme.group.role.mapper.do.not.map.group'"/></option>
                                    <webwork:iterator value="/availableRoles">
                                        <option value="<webwork:property value="./id"/>" id="<webwork:property value="./id"/>"><webwork:property value="./name"/></option>
                                    </webwork:iterator>
                                </select>
                            </td>
                        </tr>
                    </webwork:iterator>
                </table>
                </webwork:if>

                <webwork:if test="/existsGroupsWithGlobalUsePermission == true">
                <p>
                <webwork:text name="'admin.scheme.group.role.mapper.warning.use.permission'"/>
                </p>
                <table class="grid centered" id="group_to_role_mappings_use_permission" style="width: 40%">
                    <tr>
                        <th>
                            <webwork:text name="'common.words.groups'"/><br />
                        <th>
                            <webwork:text name="'common.words.project.roles'"/>
                        </th>
                    </tr>
                    <webwork:iterator value="/groupsWithGlobalUsePermission">
                        <tr>
                            <td width="50%">
                                <webwork:property value="."/>
                            </td>
                            <td valign="middle">
                                <select id="<webwork:property value="."/>_project_role" name="<webwork:property value="."/>_project_role">
                                    <option value="-1"><webwork:text name="'admin.scheme.group.role.mapper.do.not.map.group'"/></option>
                                    <webwork:iterator value="/availableRoles">
                                        <option value="<webwork:property value="./id"/>" id="<webwork:property value="./id"/>"><webwork:property value="./name"/></option>
                                    </webwork:iterator>
                                </select>
                            </td>
                        </tr>
                    </webwork:iterator>
                </table>
                </webwork:if>
                <webwork:iterator value="/selectedSchemeIds">
                    <input type="hidden" name="selectedSchemeIds" id="selectedSchemeIds" value="<webwork:property value='.'/>"/>
                </webwork:iterator>
                <input type="hidden" name="selectedSchemeType" id="selectedSchemeType" value="<webwork:property value="/selectedSchemeType"/>"/>
            </td>
        </tr>
        </webwork:elseIf>
    </page:applyDecorator>
</p>


</body>
</html>
