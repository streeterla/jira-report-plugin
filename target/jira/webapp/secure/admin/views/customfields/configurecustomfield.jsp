<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.issuefields.customfields.configure.custom.field'">
	    <webwork:param name="'value0'"><webwork:property value="/customField/name" /></webwork:param>
	</webwork:text></title>
</head>
<body>
<style type="text/css">
<!--
.fieldLabelArea
{
    width: 30%;
}
-->
</style>
	<page:applyDecorator name="jirapanel">
		<page:param name="title"><webwork:text name="'admin.issuefields.customfields.configure.custom.field'">
	    <webwork:param name="'value0'"><webwork:property value="/customField/name" /></webwork:param>
	</webwork:text></page:param>
		<page:param name="instructions">
        <p>
            <webwork:text name="'admin.issuefields.customfields.configure.description'"/>
        </p>
        <ul class="square">
            <li><a title="<webwork:text name="'admin.issuefields.customfields.add.new.context'"/>" href="<webwork:url value="'ManageConfigurationScheme!default.jspa'"><webwork:param name="'customFieldId'" value="/customFieldId" /><webwork:param name="'returnUrl'">ConfigureCustomField!default.jspa?customFieldId=<webwork:property value="/customFieldId" /></webwork:param></webwork:url>"><webwork:text name="'admin.issuefields.customfields.add.new.context'"/></a></li>
            <li><a title="<webwork:text name="'admin.issuefields.customfields.view.custom.fields'"/>" href="<webwork:url value="'ViewCustomFields.jspa'"></webwork:url>"><webwork:text name="'admin.issuefields.customfields.view.custom.fields'"/></a></li>
        </ul>
        </page:param>
        <page:param name="helpURL">configcustomfield</page:param>
		<page:param name="width">100%</page:param>
        <webwork:iterator value="/configs" status="'status'">
        <webwork:if test="id == /fieldConfigSchemeId">
            <div class="highlighted">
        </webwork:if>
        <page:applyDecorator name="jiraform">
            <page:param name="width">100%</page:param>
            <page:param name="pretitle">
            <div class="toolbar">
            <a href="ManageConfigurationScheme!default.jspa?customFieldId=<webwork:property value="customFieldId" />&fieldConfigSchemeId=<webwork:property value="id" />" title="<webwork:text name="'admin.issuefields.customfields.edit.scheme'"/>"><img src="<%= request.getContextPath() %>/images/icons/confg_16.gif" /></a>
            <a href="ManageConfigurationScheme!remove.jspa?customFieldId=<webwork:property value="customFieldId" />&fieldConfigSchemeId=<webwork:property value="id" />" title="<webwork:text name="'admin.issuefields.customfields.delete.scheme'"/>"><img src="<%= request.getContextPath() %>/images/icons/trash_16.gif" /></a>
            </div>
            </page:param>
            <page:param name="title"><webwork:property value="name" /></page:param>
            <page:param name="jiraformId">configscheme<webwork:property value="id" /></page:param>
            <page:param name="instructions"><webwork:property value="description" ><webwork:if test="."><webwork:property value="." /></webwork:if></webwork:property></page:param>

            <tr>
                <td class="fieldLabelArea">
                    <webwork:text name="'admin.issuefields.customfields.applicable.contexts'"/>
                </td>
                <td class="fieldValueArea">
                   <a class="config actionLinks subText" href="<webwork:url value="'ManageConfigurationScheme!default.jspa'"><webwork:param name="'fieldConfigSchemeId'" value="id" /><webwork:param name="'customFieldId'" value="/customFieldId" /><webwork:param name="'returnUrl'">ConfigureCustomField!default.jspa?customFieldId=<webwork:property value="/customFieldId" /></webwork:param></webwork:url>" title="<webwork:text name="'common.words.edit'"/>"><webwork:text name="'admin.common.phrases.edit.configuration'"/></a>

                   <jsp:include page="contexts.jsp" flush="true" ></jsp:include>
                </td>
            </tr>

            <webwork:if test="./basicMode == true">
                <webwork:iterator value="./configsByConfig" status="'status'">

                <webwork:iterator value="./key/configItems" status="'rowStatus'">
                <tr>
                    <td class="fieldLabelArea"><webwork:text name="displayNameKey" />:</td>
                    <td class="fieldValueArea">
                        <webwork:if test="baseEditUrl"><a class="actionLinks subText" title="<webwork:text name="'admin.issuefields.customfields.edit'">
                            <webwork:param name="'value0'"><webwork:text name="displayNameKey" /></webwork:param>
                        </webwork:text>" href="<webwork:url value="baseEditUrl"><webwork:param name="'fieldConfigSchemeId'" value="../id" /><webwork:param name="'fieldConfigId'" value="../key/id" /><webwork:param name="'customFieldId'" value="/customFieldId" /><webwork:param name="'returnUrl'">ConfigureCustomField!default.jspa?customFieldId=<webwork:property value="/customFieldId" /></webwork:param></webwork:url>"><webwork:text name="'admin.customfields.edit.value'">
                            <webwork:param name="'value0'"><webwork:text name="displayNameKey" /></webwork:param>
                        </webwork:text></a></webwork:if>
                        <webwork:property value="viewHtml(null)" escape="false" />
                    </td>
                </tr>
                </webwork:iterator>
                </webwork:iterator>

            </webwork:if>
        </page:applyDecorator>
        <webwork:if test="id == /fieldConfigSchemeId">
            </div>
        </webwork:if>
        </webwork:iterator>
    </page:applyDecorator>
</body>
</html>
