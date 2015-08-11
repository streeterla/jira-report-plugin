<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.scheme.tools.title'"/></title>
</head>

<body>

<p>
    <page:applyDecorator name="jirapanel">
        <page:param name="width">100%</page:param>
        <page:param name="title"><webwork:text name="'admin.scheme.tools.title'"/></page:param>
        <page:param name="helpURL">scheme_tools</page:param>
        <page:param name="description">
            <webwork:if test="/systemAdministrator == true">
                <webwork:text name="'admin.scheme.tools.desc'">
                    <webwork:param name="'value0'"><p/></webwork:param>
                    <webwork:param name="'value1'"><a href="<%=request.getContextPath()%>/secure/admin/XmlBackup!default.jspa"></webwork:param>
                    <webwork:param name="'value2'"></a></webwork:param>
                    <webwork:param name="'value3'"><span class="redText"></webwork:param>
                    <webwork:param name="'value4'"></span></webwork:param>
                </webwork:text>
            </webwork:if>
            <webwork:else>
                <webwork:text name="'admin.scheme.tools.desc.admin'">
                    <webwork:param name="'value0'"><p/></webwork:param>
                    <webwork:param name="'value1'"><a href="<%=request.getContextPath()%>/secure/Administrators.jspa#sysadmins"></webwork:param>
                    <webwork:param name="'value2'"></a></webwork:param>
                    <webwork:param name="'value3'"><span class="redText"></webwork:param>
                    <webwork:param name="'value4'"></span></webwork:param>
                </webwork:text>
            </webwork:else>
        </page:param>
        <table class="grid  centered">
            <tr>
                <td valign="top" nowrap="true">
                    <a id="compare_tool" href="<%=request.getContextPath()%>/secure/admin/SchemeComparisonPicker!default.jspa"><webwork:text name="'admin.scheme.tools.compare.tool.title'"/></a></td>
                <td valign="top">
                    <webwork:text name="'admin.scheme.tools.compare.tool.desc'">
                       <webwork:param name="'value0'"><p/></webwork:param>
                       <webwork:param name="'value1'"><a href="<%=request.getContextPath()%>/secure/admin/SchemeTypePicker!default.jspa"></webwork:param>
                       <webwork:param name="'value2'"></a></webwork:param>
                    </webwork:text>
                </td>
            </tr>
            <tr>
                <td valign="top" nowrap="true">
                    <a id="mapping_tool" href="<%=request.getContextPath()%>/secure/admin/SchemePicker!default.jspa"><webwork:text name="'admin.scheme.tools.mapping.tool.title'"/></a>
                </td>
                <td valign="top">
                    <webwork:text name="'admin.scheme.tools.mapping.tool.desc'"/>
                </td>
            </tr>
            <tr>
                <td valign="top" nowrap="true">
                    <a id="merge_tool" href="<%=request.getContextPath()%>/secure/admin/SchemeTypePicker!default.jspa"><webwork:text name="'admin.scheme.tools.merge.tool.title'"/></a>
                </td>
                <td valign="top">
                    <webwork:text name="'admin.scheme.tools.merge.tool.desc'">
                       <webwork:param name="'value0'"><p/></webwork:param>
                       <webwork:param name="'value1'"><a href="<%=request.getContextPath()%>/secure/admin/SchemePicker!default.jspa"></webwork:param>
                       <webwork:param name="'value2'"></a></webwork:param>
                       <webwork:param name="'value3'"><a href="<%=request.getContextPath()%>/secure/admin/SchemeComparisonPicker!default.jspa"></webwork:param>
                    </webwork:text>
                </td>
            </tr>
            <tr>
                <td valign="top" nowrap="true">
                    <a id="delete_tool" href="<%=request.getContextPath()%>/secure/admin/SchemePurgeTypePicker!default.jspa"><webwork:text name="'admin.scheme.tools.delete.tool.title'"/></a>
                </td>
                <td valign="top">
                    <webwork:text name="'admin.scheme.tools.delete.tool.desc'">
                       <webwork:param name="'value0'"><p/></webwork:param>
                       <webwork:param name="'value1'"><a href="<%=request.getContextPath()%>/secure/admin/SchemeTypePicker!default.jspa"></webwork:param>
                       <webwork:param name="'value2'"></a></webwork:param>
                       <webwork:param name="'value3'"><a href="<%=request.getContextPath()%>/secure/admin/SchemePicker!default.jspa"></webwork:param>
                    </webwork:text>
                </td>
            </tr>
        </table>
    </page:applyDecorator>
</p>


</body>
</html>
