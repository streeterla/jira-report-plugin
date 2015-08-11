
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.services.edit.service'"/></title>
</head>

<body>

<webwork:if test="/unsafeService == true">
    <jsp:include page="/secure/admin/fixes/pathwarnings.jsp"/>
</webwork:if>

<!-- Include date picker JS for services that use the date picker -->
<jsp:include page="/includes/js/date_picker.jsp" flush="true" />

<page:applyDecorator name="jiraform">
	<page:param name="action">EditService.jspa</page:param>
	<page:param name="submitId">update_submit</page:param>
	<page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
	<page:param name="cancelURI">ViewServices!default.jspa</page:param>
	<page:param name="width">100%</page:param>
	<page:param name="title"><webwork:text name="'admin.services.edit.service'"/>: <webwork:property value="service/name" /></page:param>
    <page:param name="helpURL">services</page:param>
    <page:param name="helpURLFragment">#messagehandlers</page:param>
	<page:param name="description">
        <webwork:if test="description != ''"><b><webwork:text name="'common.words.description'"/>:</b><br><webwork:property value="text(description)" escape="false" /><br></webwork:if>
        <b><webwork:text name="'admin.common.words.instructions'"/>:</b><br><webwork:text name="'admin.services.edit.instructions'"/>
    </page:param>
    <webwork:if test="/validMailParameters == false">
        <page:param name="instructions" >
            <%@include file="/includes/admin/email/badmailprops.jsp"%>
        </page:param>
    </webwork:if>
    <webwork:iterator value="objectConfiguration/fieldKeys" >
    <%@ include file="/includes/panels/objectconfiguration_form.jsp"  %>
    </webwork:iterator>

    <tr><td colspan=2 bgcolor=#f0f0f0>
        <webwork:text name="'admin.services.edit.delay'"/>
    </td></tr>

	<ui:textfield label="text('admin.services.delay')" name="'delay'" size="'30'">
        <ui:param name="'description'"><webwork:text name="'admin.services.edit.delay.description'"/></ui:param>
    </ui:textfield>

	<ui:component name="'id'" template="hidden.jsp" />

</page:applyDecorator>

</body>
</html>
