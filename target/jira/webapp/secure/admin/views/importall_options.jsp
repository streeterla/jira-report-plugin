
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.import.restore.jira.data'"/></title>
</head>

<body>

<jsp:include page="/secure/admin/fixes/pathwarnings.jsp"/>


<page:applyDecorator name="jiraform">
	<page:param name="action">XmlRestore.jspa</page:param>
	<page:param name="title"><webwork:text name="'admin.import.restore.jira.data.from.backup'"/></page:param>
	<page:param name="width">100%</page:param>
	<page:param name="instructions">
		<webwork:text name="'admin.import.instruction'"/>
		<ol>
			<li> <webwork:text name="'admin.import.restore.from.file'"/></li>
            <li> <webwork:text name="'admin.import.specify.unique.index'"/></li>
		</ol>
        <br>
		<p>
		<webwork:text name="'admin.import.warning'">
		    <webwork:param name="'value0'"><span class="warning"></webwork:param>
		    <webwork:param name="'value1'"></span></webwork:param>
		    <webwork:param name="'value2'"><a href="XmlBackup!default.jspa"><b></webwork:param>
		    <webwork:param name="'value3'"></b></a></webwork:param>
		</webwork:text>
		</p>

		<webwork:text name="'admin.import.note1'">
		    <webwork:param name="'value0'"><span class="note"></webwork:param>
		    <webwork:param name="'value1'"></span></webwork:param>
		</webwork:text><br>
        <webwork:text name="'admin.import.note2'">
            <webwork:param name="'value0'"><span class="note"></webwork:param>
            <webwork:param name="'value1'"></span></webwork:param>
        </webwork:text><br>
		<webwork:text name="'admin.import.note3'">
		    <webwork:param name="'value0'"><span class="note"></webwork:param>
		    <webwork:param name="'value1'"></span></webwork:param>
		</webwork:text>

        <webwork:if test="/licenseProblem != null">
            <p>
            <div class="noteBox">
                <p>
                <webwork:text name="'setup.error.invalidlicensekey.importall.problem.title'"/>
                <p>
                <webwork:property value="/licenseProblem" escape="false"/>
            </div>
        </webwork:if>
        <webwork:else>
            <p>
            <div class="noteBox">
                <p>
                <webwork:text name="'setup.error.invalidlicensekey.v1.possible.warning'"/>
            </div>
        </webwork:else>
        <%--This is here for our functests so we can do a quick import where we just clear the cache--%>
        <input id="quickImport" type="checkbox" name="quickImport" value="true" style="display:none;"/>

	</page:param>
	<page:param name="submitId">restore_submit</page:param>
	<page:param name="submitName"><webwork:text name="'admin.import.restore'"/></page:param>
	<page:param name="cancelURI">default.jsp</page:param>
    <page:param name="helpURL">restore_data</page:param>

	<ui:textfield label="text('admin.export.file.name')" name="'filename'">
		<ui:param name="'size'">100</ui:param>
		<ui:param name="'description'"><webwork:text name="'admin.import.file.name.description'"/></ui:param>
	</ui:textfield>

    <ui:component template="radio-indexing-config.jsp" label="text('setup.indexpath.label')" name="'indexPath'"/>

    <script language="javascript" type="text/javascript">
        window.onload = function()
        {
            jQuery("#indexPathOption_CUSTOM").toggleField("#indexPath")
        }
    </script>

    <ui:textarea label="text('admin.import.license.if.required')" name="'license'" cols="50" rows="5">
        <ui:param name="'description'">
			<webwork:text name="'admin.import.enter.a.license'"/>
		</ui:param>
    </ui:textarea>

    <ui:component name="'saxParser'" template="hidden.jsp" theme="'single'"  />
</page:applyDecorator>

</body>
</html>
