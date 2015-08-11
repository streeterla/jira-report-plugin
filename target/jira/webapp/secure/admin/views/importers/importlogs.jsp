<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<webwork:property value="importer" >

<table class="grid" style="width: 80%; margin: 10px auto;">
    <tr>
        <th><webwork:text name="'admin.importlogs.statistic'"/></th>
        <th><webwork:text name="'admin.importlogs.data'"/></th>
    </tr>
    <tr>
        <td><webwork:text name="'admin.importlogs.elapsed.time'"/></td>
        <td><webwork:property value="./stats/formattedTime" /> <webwork:property value="./stats/estimateRemaining" /></td>
    </tr>
    <tr>
        <td><webwork:text name="'admin.importlogs.import.rate'"/></td>
        <td><webwork:property value="./stats/importRate" /></td>
    </tr>
    <webwork:property value="./stats/failures" >
    <tr <webwork:if test=". > 0">class="red-highlight"</webwork:if>>
        <td><webwork:text name="'admin.importlogs.failures'"/></td>
        <td><webwork:property value="." /></td>
    </tr>
    </webwork:property>
    <webwork:if test="./stats/usersImported > 0">
    <tr>
        <td><webwork:text name="'admin.importlogs.users.imported'"/></td>
        <td><webwork:property value="./stats/usersImported" /></td>
    </tr>
    </webwork:if>
    <webwork:if test="./stats/projectsImported > 0">
    <tr>
        <td><webwork:text name="'admin.importlogs.projects.imported'"/></td>
        <td><webwork:property value="./stats/projectsImported" /></td>
    </tr>
    </webwork:if>
    <webwork:if test="./stats/versionsImported > 0">
    <tr>
        <td><webwork:text name="'admin.importlogs.versions.imported'"/></td>
        <td><webwork:property value="./stats/versionsImported" /></td>
    </tr>
    </webwork:if>
    <webwork:if test="./stats/componentsImported > 0">
    <tr>
        <td><webwork:text name="'admin.importlogs.components.imported'"/></td>
        <td><webwork:property value="./stats/componentsImported" /></td>
    </tr>
    </webwork:if>

    <tr>
        <td><webwork:text name="'admin.importlogs.issues.imported'"/></td>
        <td><webwork:property value="./stats/issuesImported" /></td>
    </tr>
    <webwork:if test="./stats/customfieldsImported > 0">
    <tr>
        <td><webwork:text name="'admin.importlogs.new.custom.fields'"/></td>
        <td><webwork:property value="./stats/customfieldsImported" /></td>
    </tr>
    </webwork:if>

    <webwork:if test="./stats/issuetypesImported > 0">
    <tr>
        <td><webwork:text name="'admin.importlogs.new.issue.types'"/></td>
        <td><webwork:property value="./stats/issuetypesImported" /></td>
    </tr>
    </webwork:if>
    <webwork:if test="./stats/resolutionsImported > 0">
    <tr>
        <td><webwork:text name="'admin.importlogs.new.resolutions'"/></td>
        <td><webwork:property value="./stats/resolutionsImported" /></td>
    </tr>
    </webwork:if>
    <webwork:if test="./stats/prioritiesImported > 0">
    <tr>
        <td><webwork:text name="'admin.importlogs.new.priorities'"/></td>
        <td><webwork:property value="./stats/prioritiesImported" /></td>
    </tr>
    </webwork:if>



</table>


<pre class="codearea">
<h4><webwork:text name="'admin.importlogs.import.logs'"/></h4>
<webwork:if test="./finished == true"><webwork:property value="./log/importLog" /></webwork:if><webwork:else><textarea readonly="readonly" id="importLogs" name="importLogs"><webwork:property value="./log/shortenedLog" /></textarea></webwork:else>
</pre>
    <webwork:if test="./log/logShortened == true && ./finished == false">
    <div class="informationbox">
        <webwork:text name="'admin.importlogs.please.note'"/>
    </div>
</webwork:if>
<script language="JavaScript" type="text/javascript">
<!--
    function scrollDown()
    {
        try
        {
            var importLogs = document.getElementById("importLogs");
            if (importLogs.scrollHeight)
                importLogs.scrollTop = importLogs.scrollHeight;
        }
        catch (e)
        {
            // do nothing;
        }
    }

    setTimeout('scrollDown();', 1);
//-->
</script>

</webwork:property>


