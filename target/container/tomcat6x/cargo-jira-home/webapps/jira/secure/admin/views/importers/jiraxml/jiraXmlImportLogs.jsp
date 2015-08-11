<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.csvimport.import.data.from'">
        <webwork:param name="'value0'"><webwork:property value="/title" /></webwork:param>
    </webwork:text> </title>
</head>
<body>

<page:applyDecorator name="jiraform">
    <page:param name="action"><webwork:property value="/actionName" />!viewLogs.jspa</page:param>
    <page:param name="onsubmit">document.getElementById('importLogs').value='';return true;</page:param>
    <page:param name="submitId">refresh_submit</page:param>
    <page:param name="submitName"><webwork:text name="'admin.common.words.refresh'"/></page:param>
    <page:param name="title"><webwork:text name="'admin.csvimport.import.data.from'">
        <webwork:param name="'value0'"><webwork:property value="/title" /></webwork:param>
    </webwork:text></page:param>
    <page:param name="buttons">
        <webwork:if test="importer/aborted == false">
           <input type="submit" name="abortButton" value="<webwork:text name="'admin.csvimport.abort.import'"/>" />
        </webwork:if>
	</page:param>

    <tr>
    <td colspan="2">

    <div class="informationBox">
        <webwork:if test="importer/aborted == false">
          <div class="info"><webwork:text name="'admin.csvimport.import.in.progress'">
              <webwork:param name="'value0'"><webwork:property value="/title" /></webwork:param>
          </webwork:text></div>
        </webwork:if>
        <webwork:else>
            <div class="error"><webwork:text name="'admin.csvimport.cancelling.import'">
                <webwork:param name="'value0'"><webwork:property value="/title" /></webwork:param>
            </webwork:text></div>
        </webwork:else>

        <webwork:text name="'admin.csvimport.logs.refreshed'">
            <webwork:param name="'value0'"><b><webwork:property value="refreshInterval" /></b></webwork:param>
            <webwork:param name="'value1'"><a href="#bottom"></webwork:param>
            <webwork:param name="'value2'"></a></webwork:param>
        </webwork:text> <br />

        <webwork:if test="importer/aborted == false">
            <webwork:text name="'admin.csvimport.abort.instruction'">
                <webwork:param name="'value0'"><strong></webwork:param>
                <webwork:param name="'value1'"></strong></webwork:param>
                <webwork:param name="'value2'"><strong><webwork:text name="'admin.csvimport.abort.import'"/></strong></webwork:param>
            </webwork:text>
        </webwork:if>
        <webwork:else>
            <webwork:text name="'admin.csvimport.you.have.chosen.to.abort'">
                <webwork:param name="'value0'"><strong></webwork:param>
                <webwork:param name="'value1'"></strong></webwork:param>
            </webwork:text>
            <webwork:if test="/importer/stats/issuesImported > 0">
                <webwork:text name="'admin.csvimport.you.have.imported'">
                    <webwork:param name="'value0'"><webwork:property value="/importer/stats/issuesImported" /></webwork:param>
                </webwork:text>
            </webwork:if>
            </webwork:else>
        </div>

    <%@include file="../importlogs.jsp" %>
    </td>
    </tr>

    <ui:textfield label="text('admin.csvimport.page.refresh.interval')" name="'refreshInterval'" value="refreshInterval"  >
        <ui:param name="'description'" value="text('admin.csvimport.page.refresh.interval.description')" />
        <ui:param name="'extrahtml'" ><a name="bottom">&nbsp;</a></ui:param>
    </ui:textfield>

    <ui:component name="'importLocation'" template="hidden.jsp" theme="'single'"/>
    <ui:component name="'configFileLocation'" template="hidden.jsp" theme="'single'"/>


</page:applyDecorator>

<script language="JavaScript">
<!--
    setTimeout("document.getElementById('importLogs').value='';document.jiraform.submit();", (<webwork:property value="refreshInterval" /> * 1000));
//-->
</script>

</body>
</html>
