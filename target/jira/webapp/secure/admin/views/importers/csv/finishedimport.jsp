<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.csvimport.import.data.from'">
        <webwork:param name="'value0'"><webwork:property value="/title" /></webwork:param>
    </webwork:text></title>
</head>
<body>

<page:applyDecorator name="jiraform">
    <page:param name="action"><webwork:property value="actionName" />!default.jspa</page:param>
    <page:param name="submitId">csv_import_submit</page:param>
    <page:param name="submitName"><webwork:text name="'admin.csvimport.return.to.importer'">
        <webwork:param name="'value0'"><webwork:property value="/title" /></webwork:param>
    </webwork:text></page:param>
    <page:param name="title"><webwork:text name="'admin.csvimport.import.data.from'">
        <webwork:param name="'value0'"><webwork:property value="/title" /></webwork:param>
    </webwork:text></page:param>

    <ui:component name="'importLocation'" template="hidden.jsp" theme="'single'"/>
    <ui:component name="'configFileLocation'" template="hidden.jsp" theme="'single'"/>

    <tr>
    <td colspan="2">

    <webwork:if test="importer/aborted == true">
    <div class="informationBox">
        <webwork:text name="'admin.csvimport.import.cancelled'">
            <webwork:param name="'value0'"><div class="error"></webwork:param>
            <webwork:param name="'value1'"><webwork:property value="/title" /></webwork:param>
            <webwork:param name="'value2'"></div></webwork:param>
        </webwork:text>
    </div>
    </webwork:if>
    <webwork:elseIf test="importer/stats/failures > 0">
    <div class="informationBox" style="border-color: #c00; background-color: #fcc;">
        <webwork:text name="'admin.csvimport.import.completed.with.errors'">
            <webwork:param name="'value0'"><div class="error"></webwork:param>
            <webwork:param name="'value1'"><webwork:property value="/title" /></webwork:param>
            <webwork:param name="'value2'"></div></webwork:param>
        </webwork:text>
    </div>
    </webwork:elseIf>
    <webwork:else>
    <div class="informationBox">
        <webwork:text name="'admin.csvimport.import.success'">
            <webwork:param name="'value0'"><div class="success"></webwork:param>
            <webwork:param name="'value1'"><webwork:property value="/title" /></webwork:param>
            <webwork:param name="'value2'"></div></webwork:param>
        </webwork:text>
    </div>
    </webwork:else>
    <%@include file="../importlogs.jsp" %>
    </td>
    </tr>
</page:applyDecorator>

</body>
</html>
