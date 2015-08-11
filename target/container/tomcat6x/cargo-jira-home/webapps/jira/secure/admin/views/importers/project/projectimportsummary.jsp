<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title>
        <webwork:text name="'admin.project.import.summary.title'">
            <webwork:param name="'value0'"><webwork:property value="/projectName"/></webwork:param>
        </webwork:text>
    </title>
</head>
<body>

<page:applyDecorator name="jiraform">
    <page:param name="action">ProjectImportSummary.jspa</page:param>
    <page:param name="columns">1</page:param>
    <page:param name="cancelURI">ProjectImportSelectBackup!cancel.jspa</page:param>
    <page:param name="title"><webwork:text name="'admin.project.import.summary.title'"><webwork:param name="'value0'"><webwork:property value="/projectName"/></webwork:param></webwork:text></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="autoSelectFirst">false</page:param>
    <page:param name="helpURL">restore_project</page:param>
    <page:param name="description">
        <webwork:text name="'admin.project.import.summary.desc'"/>

        <webwork:if test="/mappingResult != null && /canImport == true">
            <p/>
            <webwork:text name="'admin.project.import.summary.johnson.desc'"/>
        </webwork:if>
        <p/>
        <webwork:if test="/mappingResult != null">
            <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height=8 width=8 border=0 align=absmiddle> <webwork:text name="'admin.project.import.summary.refresh.validation'">
            <webwork:param name="'value0'"><a href="<%=request.getContextPath()%>/secure/admin/ProjectImportSummary!reMapAndValidate.jspa"></webwork:param>
            <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>
        </webwork:if>
    </page:param>
    <webwork:if test="/mappingResult != null">

        <page:param name="leftButtons">
            <input id="prevButton" name="prevButton" title="<webwork:property value="text('common.forms.previous')"/>" type="submit"
                   value="<webwork:property value="text('common.forms.previous')"/>"/>
        </page:param>

        <webwork:if test="/canImport == true">
            <page:param name="submitId">import_submit</page:param>
            <page:param name="submitName"><webwork:text name="'common.forms.import'"/></page:param>
        </webwork:if>
        <webwork:else>
            <page:param name="buttons">
                <input id="refreshValidationButton" name="refreshValidationButton" title="<webwork:property value="text('admin.project.import.summary.refresh.validation.button')"/>" type="submit"
                       value="<webwork:property value="text('admin.project.import.summary.refresh.validation.button')"/>"/>
            </page:param>
        </webwork:else>

    </webwork:if>
    <tr>
        <td class="jiraformbody" id="projectimport">

            <div id="summary">

                <div id="systemfields">
                    <h3><webwork:text name="'admin.project.import.summary.system.fields'"/></h3>
                    <webwork:if test="/mappingResult != null">
                        <webwork:property value="/systemFieldsValidateMessages" id="fieldlist"/>
                        <jsp:include page="/includes/admin/importers/projectimportsummary_field_list.jsp" />
                    </webwork:if>
                </div>

                <div id="customfields">
                    <h3><webwork:text name="'admin.project.import.summary.custom.fields'"/></h3>
                    <webwork:if test="/mappingResult != null && /customFieldsValidateMessages/size() == 0">
                        <ul>
                            <li class="unprocessed">
                                <webwork:text name="'admin.project.import.summary.no.custom.fields'"/>
                            </li>
                        </ul>
                    </webwork:if>
                    <webwork:elseIf test="/mappingResult != null">
                        <webwork:property value="/customFieldsValidateMessages" id="fieldlist"/>
                        <jsp:include page="/includes/admin/importers/projectimportsummary_field_list.jsp" />
                    </webwork:elseIf>
                </div>

            </div>

        </td>
    </tr>
</page:applyDecorator>


</body>
</html>
