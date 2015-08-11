
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<%
// don't show ANYTHING to the user if they come here looking for trouble
if (com.atlassian.jira.util.JiraUtils.isSetup()) {
%>
<%--
Leave this as a raw HTML. Do not use response.getWriter() or response.getOutputStream() here as this will fail
on Orion. Let the application server figure out how it want to output this text.
--%>
JIRA has already been set up.
<%
} else {
%>
<html>
<head>
	<title><webwork:text name="'setup.title'"/></title>
</head>

<body>

<page:applyDecorator name="jiraform">
	<page:param name="title"><webwork:text name="'setup.import.title'"/></page:param>
	<page:param name="action">SetupImport.jspa</page:param>
	<page:param name="description">
        <webwork:text name="'setup.import.desc.line1'"/>
        <p>
        <webwork:text name="'setup.import.desc.line2'">
            <webwork:param name="'value0'"><a href="Setup!default.jspa"></webwork:param>
            <webwork:param name="'value1'"></a></webwork:param>
        </webwork:text>
        </p>
        <p>
        <webwork:text name="'setup.import.desc.line3'"/> <webwork:text name="'setup.import.desc.bullet1'"/>
        </p>
        <webwork:text name="'setup.import.desc.lastline'">
            <webwork:param name="'value0'"><font color=#990000></webwork:param>
            <webwork:param name="'value1'"></font></webwork:param>
        </webwork:text>

        <p>
        <div class="noteBox">
            <p>
            <webwork:text name="'setup.error.invalidlicensekey.v1.possible.warning'"/>
        </div>

        <webwork:if test="/licenseProblem != null">
            <p>
            <div class="noteBox">
                <p>
                <webwork:text name="'setup.error.invalidlicensekey.importall.problem.title'"/>
                <p>
                <webwork:property value="/licenseProblem" escape="false"/>
            </div>
        </webwork:if>

	</page:param>
	<page:param name="submitId">import_submit</page:param>
	<page:param name="submitName"><webwork:property value="text('common.forms.import')"/></page:param>

	<ui:textfield label="text('setup.filename.label')" name="'filename'">
		<ui:param name="'size'">100</ui:param>
		<ui:param name="'description'"><webwork:text name="'setup.filename.desc'"/></ui:param>
	</ui:textfield>

    <ui:component template="radio-indexing-config.jsp" label="text('setup.indexpath.label')" name="'indexPath'"/>

    <script language="javascript" type="text/javascript">
        window.onload = function()
        {
            jQuery("#indexPathOption_CUSTOM").toggleField("#indexPath")
        }
    </script>

    <ui:textarea label="text('admin.import.license.if.required')" name="'license'" cols="50" rows="6">
		<ui:param name="'description'">
            <webwork:text name="'admin.import.enter.a.license'"/>
            <br/>
            <webwork:text name="'setup.license.description.generate.eval'">
                <webwork:param name="'value0'"><a target="_blank" href="<webwork:component name="'external.link.jira.license.view'" template="externallink.jsp" >
                    <webwork:param name="'value0'"><webwork:property value="/buildUtilsInfo/version"/></webwork:param>
                    <webwork:param name="'value1'"><webwork:property value="/buildUtilsInfo/currentBuildNumber"/></webwork:param>
                    <webwork:param name="'value2'">enterprise</webwork:param>
                    <webwork:param name="'value3'"><webwork:property value="/serverId"/></webwork:param>
                </webwork:component>"></webwork:param>
                <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>
            <br/>
            <webwork:text name="'setup.license.description.retrieve'">
                <webwork:param name="'value0'"><a target="_blank" href="<webwork:component name="'external.link.jira.licenses'" template="externallink.jsp"/>"></webwork:param>
                <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>
		</ui:param>
    </ui:textarea>
</page:applyDecorator>

</body>
</html>
<% } %>
