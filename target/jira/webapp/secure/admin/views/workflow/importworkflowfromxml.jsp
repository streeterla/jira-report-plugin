<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.workflows.importworkflow.title'"/></title>
</head>
<body>
<page:applyDecorator name="jiraform">
        <page:param name="action">ImportWorkflowFromXml.jspa</page:param>
        <page:param name="submitId">import_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.import'"/></page:param>
        <page:param name="title"><webwork:text name="'admin.workflows.importworkflow.import.workflow'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="cancelURI">ListWorkflows.jspa</page:param>
        <page:param name="description">
            <p>
            <webwork:text name="'admin.workflows.importworkflow.description'"/>
            </p>
            <p>
            <webwork:text name="'admin.workflows.importworkflow.instruction'">
                <webwork:param name="'value0'"><br></webwork:param>
            </webwork:text>
        </page:param>

        <ui:textfield label="text('common.words.name')" name="'name'" size="'30'">
            <ui:param name="'description'"><webwork:text name="'admin.workflows.importworkflow.name.description'"/></ui:param>
            <ui:param name="'mandatory'">true</ui:param>
	    </ui:textfield>


        <ui:textfield label="text('common.words.description')" name="'description'" size="'60'">
            <ui:param name="'description'"><webwork:text name="'admin.workflows.importworkflow.optional.description'"/></ui:param>
	    </ui:textfield>

        <tr>
            <td bgcolor=#fffff0>&nbsp;</td><td bgcolor=#ffffff>&nbsp;</td>
        </tr>

        <ui:textfield label="text('admin.workflows.importworkflow.file.path')" name="'filePath'" size="'60'">
		    <ui:param name="'description'"><webwork:text name="'admin.workflows.importworkflow.filepath.description'"/></ui:param>
	    </ui:textfield>

        <tr>
            <td bgcolor=#fffff0>&nbsp;</td><td bgcolor=#ffffff><span class="red-highlight"><webwork:text name="'common.words.or'"/></span></td>
        </tr>
        <tr>
            <td bgcolor=#fffff0 valign=top width=10%>
                <webwork:text name="'admin.workflows.importworkflow.workflow.definition.xml'"/>:
            </td>
            <td bgcolor=#ffffff>
                <textarea name="workflowXML" rows=20 cols=80><webwork:property value="/workflowXML" /></textarea>
            </td>
        </tr>
</page:applyDecorator>
