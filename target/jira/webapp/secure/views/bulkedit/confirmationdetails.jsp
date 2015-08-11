<%--
    The root context of this include must be a BulkEditBean.
    Also require the action to have:
    * getStatusName(GV)
    * getFieldName(field)
    * getNewViewHtml(field)
--%>
<style type="text/css">
    .fieldLabelAreaTop
    {
        width: 20%;
    }

</style>

<!-- Issue Targets Table - Target Project and Issue Type -->
<table id="move_confirm_table" class="grid centered defaultWidth" >
    <tr>
        <th colspan="2"><webwork:text name="'bulk.move.issuetargets'" /></th>
    </tr>
        <tr>
            <td class="fieldLabelAreaTop" ><webwork:text name="'bulk.move.targetproject'" /></td>
            <td>
                <webwork:property value="./targetProjectGV/string('name')" />
            </td>
        </tr>
    <webwork:if test="./targetIssueTypeGV">
        <tr>
            <td class="fieldLabelAreaTop" ><webwork:text name="'bulk.move.targetissuetype'" /></td>
            <td>
                <webwork:component name="'issuetype'" template="constanticon.jsp">
                  <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                  <webwork:param name="'iconurl'" value="./targetIssueTypeGV/string('iconurl')" />
                  <webwork:param name="'alt'"><webwork:property value="./targetIssueTypeGV/string('name')" /></webwork:param>
                </webwork:component>
                <webwork:property value="/nameTranslation(./targetIssueTypeGV)" />
            </td>
        </tr>
    </webwork:if>
</table>

<p>

<!-- Workflow/Status Table - Target Workflow and Status Mappings -->
<webwork:property value="./statusMapHolder">
    <webwork:if test=". != null && ./empty == false">
        <table id="status_map_table" class="grid centered defaultWidth">
            <tr>
                <th colspan="2"><webwork:text name="'bulk.move.workflow'"/></th>
            </tr>
            <tr>
                <td class="fieldLabelAreaTop"><webwork:text name="'bulk.move.targetworkflow'" /></td>
                <td><webwork:property value="../targetWorkflow/name" /></td>
            </tr>
            <tr>
                <td class="fieldLabelAreaTop"><webwork:text name="'bulk.move.status.mapping.confirm'" /></td>
                <td>
                    <table class="bordered" >
                        <tr>
                            <th nowrap><webwork:text name="'bulk.move.status.original'" /></th>
                            <th>&nbsp;</th>
                            <th nowrap><webwork:text name="'bulk.move.targetstatus'" /></th>
                        </tr>
                        <webwork:iterator value=".">
                            <tr>
                                <td width="1%"  nowrap><webwork:property value="/statusName(./key)" /></td>
                                <td width="1%"><img src="<%= request.getContextPath() %>/images/icons/arrow_right_small.gif" height=16 width=16 border=0 align=absmiddle></td>
                                <td nowrap><webwork:property value="/statusName(./value)" /></td>
                            </tr>
                        </webwork:iterator>
                    </table>
                </td>
            </tr>
        </table>
    </webwork:if>
</webwork:property>

<p>

<!-- Updated Fields Table -->
<webwork:property value="./moveFieldLayoutItems">
    <webwork:if test=". != null && . /empty == false">
        <table class="grid centered defaultWidth">
            <tr>
                <th ><webwork:text name="'bulk.move.updatedfields'" /></th>
                <th><webwork:text name="'bulk.move.newvalue'"/></th>
            </tr>

            <webwork:iterator value=".">
                <tr>
                    <td class="fieldLabelAreaTop"  ><webwork:property value="/fieldName(./orderableField)" /></td>
                    <td>
                        <webwork:if test="/fieldUsingSubstitutions(../.., ./orderableField) == true" >
                            <table class="blank" id="<webwork:property value="../../key" /><webwork:property value="./orderableField/id" />">
                                <webwork:iterator value="/substitutionsForField(../.., ./orderableField)/entrySet">
                                    <tr>
                                        <td width="1%" nowrap><webwork:property value="/mappingViewHtml(../../.., ../orderableField, ./key, 'true')" escape="'false'" /></td>
                                        <td width="1%"><img src="<%= request.getContextPath() %>/images/icons/arrow_right_small.gif" height=16 width=16 border=0 align=absmiddle></td>
                                        <td nowrap><webwork:property value="/mappingViewHtml(../../.., ../orderableField, ./value, 'false')" escape="'false'" /></td>
                                    </tr>
                                </webwork:iterator>
                            </table>
                        </webwork:if>
                        <webwork:else>
                            <webwork:property value="/newViewHtml(../.., ./orderableField)" escape="'false'" />
                        </webwork:else>
                    </td>
                </tr>
            </webwork:iterator>
        </table>
    </webwork:if>
</webwork:property>

<p>

<!-- Removed Fields Table -->
<webwork:property value="./removedFields">
    <webwork:if test=". != null && . /empty == false">
        <table id="removed_fields_table" class="grid centered defaultWidth">
            <tr>
                <th><webwork:text name="'bulk.move.removedfields'" /></th>
            </tr>
                        <%-- Show all the fields that will be removed --%>
            <webwork:iterator value=".">
                <tr>
                    <td ><webwork:property value="/fieldName(.)" /></td>
                </tr>
            </webwork:iterator>
        </table>
    </webwork:if>
</webwork:property>
