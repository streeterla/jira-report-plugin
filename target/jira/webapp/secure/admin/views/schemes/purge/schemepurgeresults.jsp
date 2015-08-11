<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.scheme.purge.result.title'"/></title>
</head>

<body>


<p>
    <page:applyDecorator name="jiraform">
        <page:param name="columns">1</page:param>
        <page:param name="width">100%</page:param>
        <page:param name="title"><webwork:text name="'admin.scheme.purge.result.title'"/></page:param>
        <page:param name="helpURL">scheme_tools</page:param>
        <page:param name="description">
            <webwork:text name="'admin.scheme.purge.result.desc'">
               <webwork:param name="'value0'"><a href="<%=request.getContextPath()%>/secure/admin/SchemePurgeTypePicker!default.jspa"></webwork:param>
               <webwork:param name="'value1'"></a></webwork:param>
               <webwork:param name="'value2'"><a href="<%=request.getContextPath()%>/secure/admin/SchemeTools.jspa"></webwork:param>
            </webwork:text>
        </page:param>
        <page:param name="autoSelectFirst">false</page:param>

        <webwork:iterator value="/deletionErrors/errorMessages">
            <tr>
                <td>
                    <table class="defaultWidth centered">
                        <tr><td>
                            <div class="warningBox">
                                <webwork:property value="." escape="false"/>
                            </div>
                        </td></tr>
                    </table>
                </td>
            </tr>
        </webwork:iterator>

        <tr>
            <td>
                <webwork:text name="'admin.scheme.purge.result.succes'"/>:
                <ul class="square_blue" style="padding-left:20px">
                    <webwork:iterator value="/successfullyDeletedSchemes">
                        <li><webwork:property value="./name"/></li>
                    </webwork:iterator>
                </ul>

            </td>
        </tr>

    </page:applyDecorator>
</p>
</body>
</html>
