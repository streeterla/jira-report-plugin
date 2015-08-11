<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.scheme.group.role.result.title'"/></title>
</head>

<body>
<p>
    <page:applyDecorator name="jirapanel">
        <page:param name="width">100%</page:param>
        <page:param name="helpURL">scheme_tools</page:param>
        <page:param name="title"><webwork:text name="'admin.scheme.group.role.result.title'"/></page:param>

        <tr>
            <td>
                <webwork:text name="'admin.scheme.group.role.result.instruction.1'">
                   <webwork:param name="'value0'"><strong></webwork:param>
                   <webwork:param name="'value1'"><webwork:property value="/schemeTransformResults/allSchemeTransformResults/size"/></webwork:param>
                   <webwork:param name="'value2'"></strong></webwork:param>
                </webwork:text>
                <ul class="square_blue">
                    <webwork:iterator value="/schemeTransformResults/allSchemeTransformResults">
                        <li><webwork:property value="./transformedScheme/name"/></li>
                    </webwork:iterator>
                </ul>
            </td>
        </tr>
        <tr>
            <td>
                <webwork:text name="'admin.scheme.group.role.result.instruction.2'"/>
                <ul class="square_blue">
                    <webwork:iterator value="/schemeTransformResults/allSchemeTransformResults">
                        <li><webwork:property value="./originalScheme/name"/></li>
                    </webwork:iterator>
                </ul>
            </td>
        </tr>
        <tr>
            <td>
                <webwork:text name="'admin.scheme.group.role.result.instruction.3'">
                   <webwork:param name="'value0'"><a id="merge_tool" href="<%=request.getContextPath()%>/secure/admin/SchemeTypePicker!default.jspa"></webwork:param>
                    <webwork:param name="'value1'"></a></webwork:param>
                   <webwork:param name="'value2'"><a id="delete_tool" href="<%=request.getContextPath()%>/secure/admin/SchemePurgeTypePicker!default.jspa"></webwork:param>
                </webwork:text>
            </td>
        </tr>

</page:applyDecorator>
</p>
</body>
</html>
