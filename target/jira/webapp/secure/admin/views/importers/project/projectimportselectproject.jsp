
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title>
        <webwork:text name="'admin.project.import.select.project.title'"/>
    </title>
</head>
<body>

<style type="text/css">
    .grayBox {
        border: 1px solid #bbbbbb;
        margin-left: auto;
        margin-right: auto;
        width: 100%;
        background-color: #f0f0f0;
        padding: 10px;
    }
</style>

<page:applyDecorator name="jiraform">
    <page:param name="action">ProjectImportSelectProject.jspa</page:param>
    <page:param name="cancelURI">ProjectImportSelectBackup!cancel.jspa</page:param>
    <page:param name="autoSelectFirst">true</page:param>
    <page:param name="title"><webwork:text name="'admin.project.import.select.project.title'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">restore_project</page:param>
    <page:param name="description"><webwork:text name="'admin.project.import.select.project.desc'">
        <webwork:param name="'value0'"><p></webwork:param>
        <webwork:param name="'value1'"></p></webwork:param>
    </webwork:text></page:param>
    <webwork:if test="/noBackupOverview == false">
        <page:param name="submitId">next_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.next'"/></page:param>

    <tr>
        <td width="20%" class="fieldLabelArea"><webwork:text name="'admin.project.import.select.project.label'"/>:</td>
        <td width="80%" class="fieldValueArea" bgcolor="#ffffff">
            <select name="projectKey" id="project_select" onchange="populateProjectInfo(); return false;" onkeyup="populateProjectInfo(); return false;">
                <webwork:iterator value="/backupOverview/projects">
                    <option value="<webwork:property value="./project/key"/>" <webwork:if test="./project/key/equals(/projectKey) == true">SELECTED</webwork:if>><webwork:property value="./project/name"/></option>
                </webwork:iterator>
            </select>
            <span class="selectDescription" id="project_summary"></span>
            <p>
            <div id="errorBox" class="warningBox" style="display:none">
            </div>
            <div id="warningBox" class="infoBox" style="display:none">
            </div>
            <p>
            <div id="projectDetails" style="display:none;">
            <table id="projectDetailsTable" class="grayBox" cellpadding="0" cellspacing="0">
                <tbody><tr>
                    <th width="10%" valign="top" nowrap="nowrap"><webwork:text name="'admin.project.import.select.project.proj.name'"/>:</th>
                    <td width="90%" id="prj_name"></td>
                </tr>
                    <tr>
                        <th nowrap="nowrap"><webwork:text name="'admin.project.import.select.project.proj.key'"/>:</th>
                    <td id="prj_key"></td>
                    </tr>
                    <tr>
                        <th nowrap="nowrap"><webwork:text name="'admin.project.import.select.project.proj.desc'"/>:</th>
                    <td id="prj_desc"></td>
                    </tr>
                    <tr>
                        <th nowrap="nowrap"><webwork:text name="'admin.project.import.select.project.proj.lead'"/>:</th>
                        <td id="prj_lead"></td>
                    </tr>
                    <tr>
                        <th nowrap="nowrap"><webwork:text name="'admin.project.import.select.project.proj.url'"/>:</th>
                        <td id="prj_url"></td>
                    </tr>
                    <tr>
                        <th nowrap="nowrap"><webwork:text name="'admin.project.import.select.project.proj.sender.address'"/>:</th>
                        <td id="prj_send"></td>
                    </tr>
                    <tr>
                        <th nowrap="nowrap"><webwork:text name="'admin.project.import.select.project.proj.default.assignee'"/>:</th>
                        <td id="prj_ass"></td>
                    </tr>
                    <tr>
                        <th nowrap="nowrap"><webwork:text name="'admin.project.import.select.project.proj.isssues'"/>:</th>
                        <td id="prj_iss"></td>
                    </tr>
                    <tr>
                        <th nowrap="nowrap"><webwork:text name="'admin.project.import.select.project.proj.components'"/>:</th>
                        <td id="prj_comp"></td>
                    </tr>
                    <tr>
                        <th nowrap="nowrap"><webwork:text name="'admin.project.import.select.project.proj.versions'"/>:</th>
                        <td id="prj_ver"></td>
                    </tr>
                </tbody>
            </table>
            </div>
        </td>
    </tr>

        <ui:checkbox label="text('admin.project.import.select.project.overwrite.label')" name="'overwrite'" fieldValue="'true'">
            <ui:param name="'description'"><webwork:text name="'admin.project.import.select.project.overwrite.desc'"/></ui:param>
            <ui:param name="'checked'">true</ui:param>
            <ui:param name="'id'">overwrite</ui:param>
            <ui:param name="'rowId'">overwriteelements</ui:param>
        </ui:checkbox>
    </webwork:if>
</page:applyDecorator>

<script type="text/javascript">
    // build an array of all the project values to fill the info box
    var projectInfo = new Array();
    <webwork:iterator value="/backupOverview/projects" status="'status'">
    projectInfo[<webwork:property value="@status/count" /> - 1] = <webwork:property value="jsonProject(.)" escape="false" />;
    </webwork:iterator>

    function populateProjectInfo()
    {
        // Always make sure we show the project details div
        document.getElementById("projectDetails").style.display = "";

        var index = document.getElementById("project_select").selectedIndex;
        var project = projectInfo[index];
        document.getElementById("prj_name").innerHTML = project.prj_name;
        if (project.prj_name == "")
        {
            document.getElementById("prj_name").innerHTML = "&nbsp;";
        }
        document.getElementById("prj_key").innerHTML = project.prj_key;
        if (project.prj_key == "")
        {
            document.getElementById("prj_key").innerHTML = "&nbsp;";
        }
        document.getElementById("prj_desc").innerHTML = project.prj_desc;
        if (project.prj_desc == "")
        {
            document.getElementById("prj_desc").innerHTML = "&nbsp;";
        }
        document.getElementById("prj_lead").innerHTML = project.prj_lead;
        if (project.prj_lead == "")
        {
            document.getElementById("prj_lead").innerHTML = "&nbsp;";
        }
        document.getElementById("prj_url").innerHTML = project.prj_url;
        if (project.prj_url == "")
        {
            document.getElementById("prj_url").innerHTML = "&nbsp;";
        }
        document.getElementById("prj_send").innerHTML = project.prj_send;
        if (project.prj_send == "")
        {
            document.getElementById("prj_send").innerHTML = "&nbsp;";
        }
        document.getElementById("prj_ass").innerHTML = project.prj_ass;
        if (project.prj_ass == "")
        {
            document.getElementById("prj_ass").innerHTML = "&nbsp;";
        }
        document.getElementById("prj_iss").innerHTML = project.prj_iss;
        if (project.prj_iss == "")
        {
            document.getElementById("prj_iss").innerHTML = "&nbsp;";
        }
        document.getElementById("prj_comp").innerHTML = project.prj_comp;
        if (project.prj_comp == "")
        {
            document.getElementById("prj_comp").innerHTML = "&nbsp;";
        }
        document.getElementById("prj_ver").innerHTML = project.prj_ver;
        if (project.prj_ver == "")
        {
            document.getElementById("prj_ver").innerHTML = "&nbsp;";
        }
        // Make the import submit disabled if the project is not importable
        document.getElementById("next_submit").disabled = !project.prj_imp;
        if (project.prj_imp)
        {
            document.getElementById("overwriteelements").style.display = "";
        }
        else
        {
            document.getElementById("overwriteelements").style.display = "none";
        }
        // Check the error array
        var errorBox = document.getElementById("errorBox");
        if (project.errors.length > 0)
        {
            errorBox.innerHTML = createList(project.errors);
            errorBox.style.display = "";
        }
        else
        {
            errorBox.style.display = "none";
            errorBox.innerHTML = "";
        }
        // Check the warning array
        var warningBox = document.getElementById("warningBox");
        if (project.warnings.length > 0)
        {
            warningBox.innerHTML = createList(project.warnings);
            warningBox.style.display = "";
            document.getElementById("overwriteelements").style.display = "none";
        }
        else
        {
            warningBox.style.display = "none";
            warningBox.innerHTML = "";
        }
    }

    function createList(items)
    {
        var listHtml ="";
        for (var i = 0; i < items.length; i++)
        {
            listHtml += "<p>" + items[i] + "</p>";
        }
        return listHtml;
    }

    populateProjectInfo();
</script>


</body>
</html>
