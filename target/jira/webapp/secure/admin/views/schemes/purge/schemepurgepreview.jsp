<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.scheme.purge.preview.title'"/></title>
</head>

<body>


<p>
    <page:applyDecorator name="jiraform">
        <page:param name="width">100%</page:param>
        <page:param name="title"><webwork:text name="'admin.scheme.purge.preview.title'"/></page:param>
        <page:param name="helpURL">scheme_tools</page:param>
        <page:param name="description">
            <webwork:if test="/systemAdministrator == true">
                <webwork:text name="'admin.scheme.purge.preview.desc'">
                    <webwork:param name="'value0'"><p/></webwork:param>
                    <webwork:param name="'value1'"><span class="redText"></webwork:param>
                    <webwork:param name="'value2'"></span></webwork:param>
                    <webwork:param name="'value3'"><a href="<%=request.getContextPath()%>secure/admin/XmlBackup!default.jspa"></webwork:param>
                    <webwork:param name="'value4'"></a></webwork:param>
                </webwork:text>
            </webwork:if>
            <webwork:else>
                <webwork:text name="'admin.scheme.purge.preview.desc.admin'">
                    <webwork:param name="'value0'"><p/></webwork:param>
                    <webwork:param name="'value1'"><span class="redText"></webwork:param>
                    <webwork:param name="'value2'"></span></webwork:param>
                    <webwork:param name="'value3'"><a href="<%=request.getContextPath()%>/secure/Administrators.jspa#sysadmins"></webwork:param>
                    <webwork:param name="'value4'"></a></webwork:param>
                </webwork:text>
            </webwork:else>
        </page:param>
        <page:param name="action">SchemePurgeToolResults.jspa</page:param>
        <page:param name="columns">1</page:param>
        <page:param name="submitId">deleteschemes_submit</page:param>
        <page:param name="submitName"><webwork:text name="'admin.scheme.purge.preview.delete.schemes'"/></page:param>
        <page:param name="cancelURI"><webwork:url page="SchemePurgeTypePicker!return.jspa"><webwork:param name="'selectedSchemeType'" value="/selectedSchemeType"/></webwork:url></page:param>
        <page:param name="autoSelectFirst">false</page:param>


        <tr>
            <td>
                <webwork:text name="'admin.scheme.purge.preview.chosen.delete.schemes'"/>:
                <ul class="square_blue" style="padding-left:20px">
                    <webwork:iterator value="/selectedSchemes" status="'status'">
                        <li><webwork:property value="./name"/></li>
                    </webwork:iterator>
                </ul>
            </td>
        </tr>
        <ui:component name="'selectedSchemeType'" value="/selectedSchemeType" template="hidden.jsp" theme="'single'"/>
    </page:applyDecorator>
</p>
</body>
</html>
