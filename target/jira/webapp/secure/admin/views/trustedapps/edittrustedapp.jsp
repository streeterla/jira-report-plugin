<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title>
        <webwork:if test="/request == true">
            <webwork:text name="'admin.trustedapps.add.trusted.application'"/>
        </webwork:if>
        <webwork:else>
            <webwork:text name="'admin.trustedapps.edit.trusted.application'"/>
        </webwork:else>
    </title>
</head>
<body>
	<page:applyDecorator name="jiraform">
        <page:param name="title">
            <webwork:if test="/request == true">
                <webwork:text name="'admin.trustedapps.add.trusted.application'"/>
            </webwork:if>
            <webwork:else>
                <webwork:text name="'admin.trustedapps.edit.trusted.application'"/>
            </webwork:else>
        </page:param>
        <page:param name="helpURL">trustedapps.edit</page:param>

		<page:param name="action">EditTrustedApplication.jspa</page:param>
		<page:param name="description"><p><webwork:text name="'admin.trustedapps.edit.description'"/></p>
            <p class="warningText"><webwork:text name="'admin.trustedapps.edit.warning'">
                <webwork:param name="value0"><strong></webwork:param>
                <webwork:param name="value1"></strong></webwork:param>
            </webwork:text></p></page:param>
		<page:param name="width">100%</page:param>
		<page:param name="cancelURI">ViewTrustedApplications.jspa</page:param>

        <webwork:if test="/editable == true">
            <%-- only put submit in if we have an editable form --%>
            <webwork:if test="/request == true">
                <page:param name="submitId">add_submit</page:param>
                <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
            </webwork:if>
            <webwork:else>
                <page:param name="submitId">update_submit</page:param>
                <page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
            </webwork:else>

            <ui:textfield label="text('admin.trustedapps.field.application.name')" name="'name'" size="100" />

            <ui:textfield label="text('admin.trustedapps.field.application.id')" name="'applicationId'" size="100" readonly="true" />

            <ui:component name="'publicKey'" template="hidden.jsp" theme="'single'"  />

            <ui:textfield label="text('admin.trustedapps.field.timeout')" name="'timeout'">
                <ui:param name="'description'">
                    <webwork:text name="'admin.trustedapps.field.timeout.description'" />
                </ui:param>
            </ui:textfield>

            <ui:textarea label="text('admin.trustedapps.field.ip.matches')" name="'ipMatch'" rows="5" cols="40">
                <ui:param name="'description'">
                    <webwork:text name="'admin.trustedapps.field.ip.matches.description'" />
                </ui:param>
            </ui:textarea>

            <ui:textarea label="text('admin.trustedapps.field.url.matches')" name="'urlMatch'" rows="5" cols="40">
                <ui:param name="'description'">
                    <webwork:text name="'admin.trustedapps.field.url.matches.description'" />
                </ui:param>
            </ui:textarea>
        </webwork:if>

        <ui:component name="'id'" template="hidden.jsp" theme="'single'"  />
        <%-- record what page to redirect after success --%>
        <ui:component name="'redirectURI'" template="hidden.jsp" theme="'single'"  />
	</page:applyDecorator>

</body>
</html>
