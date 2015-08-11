<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.externalimport.bugzilla.select.projects'"/></title>
</head>

<body>
<page:applyDecorator name="jiraform">
    <page:param name="width">100%</page:param>
    <page:param name="title"><webwork:text name="'admin.externalimport.bugzilla.import.log'"/></page:param>

    <webwork:if test="/issueKeysWithTruncatedSummaries/empty == false">
        <tr>
            <td bgcolor="#ffffff" colspan="2" class="errLabel">
                <strong><webwork:text name="'admin.externalimport.bugzilla.trunc.summaries.exist'"/></strong> <webwork:text name="'admin.externalimport.bugzilla.trunc.summaries.count'"/>:
                <strong><webwork:property value="/issueKeysWithTruncatedSummaries/size" /></strong>
            </td>
        </tr>
    </webwork:if>
    
    <ui:textarea label="text('admin.externalimport.log')" name="'importLog'" cols="100" rows="20" >
        <ui:param name="'description'"><webwork:text name="'admin.externalimport.log.of.events'"/></ui:param>
        <ui:param name="'readonly'" value="true"/>
    </ui:textarea>

    <webwork:if test="/issueKeysWithTruncatedSummaries/empty == false">
        <webwork:if test="/issueKeysWithTruncatedSummaries/size > /shortListMaxCount">
            <tr>
                <td class="fieldLabelArea"><webwork:text name="'admin.externalimport.bugzilla.trunc.issues.list'">
                    <webwork:param name="'value0'" value="/summaryMaxLength" />
                </webwork:text>:</td>
                <td class="fieldValueArea">
                    <script language="JavaScript" type="text/javascript">
                        function showAllIssues(visible)
                        {
                            var shortDiv = document.getElementById("short_trunc_sum");
                            shortDiv.style.display = visible ? "none" : "";
                            var longDiv = document.getElementById("long_trunc_sum");
                            longDiv.style.display = visible ? "" : "none";
                        }
                    </script>
                    <div id="short_trunc_sum">
                        <webwork:iterator value="/firstIssueKeysWithTruncatedSummaries" status="'status'">
                            <a href="<%= request.getContextPath() %>/browse/<webwork:property value="." />"><webwork:property value="." /></a><webwork:if test="@status/last == false">,</webwork:if>
                        </webwork:iterator>
                        <span style="cursor:pointer;" class="smallgrey" onclick="showAllIssues(true)">[<webwork:text name="'common.concepts.more'" />]</span>
                    </div>
                    <div id="long_trunc_sum" style="display:none;">
                        <webwork:iterator value="/issueKeysWithTruncatedSummaries" status="'status'">
                            <a href="<%= request.getContextPath() %>/browse/<webwork:property value="." />"><webwork:property value="." /></a><webwork:if test="@status/last == false">,</webwork:if>
                        </webwork:iterator>
                        <span style="cursor:pointer;" class="smallgrey" onclick="showAllIssues(false)">[<webwork:text name="'common.concepts.hide'" />]</span>
                    </div>
                </td>
            </tr>
        </webwork:if>
        <webwork:else>
            <tr>
                <td class="fieldLabelArea"><webwork:text name="'admin.externalimport.bugzilla.trunc.issues.list'"/>:</td>
                <td class="fieldValueArea"><webwork:iterator value="/issueKeysWithTruncatedSummaries" status="'status'">
                        <a href="<%= request.getContextPath() %>/browse/<webwork:property value="." />"><webwork:property value="." /></a><webwork:if test="@status/last == false">,</webwork:if>
                    </webwork:iterator>
                </td>
            </tr>
        </webwork:else>
    </webwork:if>
</page:applyDecorator>

</body>
</html>
