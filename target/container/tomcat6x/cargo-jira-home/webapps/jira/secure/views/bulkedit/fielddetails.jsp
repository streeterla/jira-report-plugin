<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<ui:component name="'subTaskPhase'" template="hidden.jsp"  />

<webwork:property value="/bulkEditBean/moveFieldLayoutItems">
    <webwork:if test=". != null && ./empty == false">
        <table class="grid centered defaultWidth" >
            <tr>
                <th><webwork:text name="'bulk.move.fieldname'" /></th>
                <th><webwork:text name="'bulk.move.fieldvalue'" /></th>
                <th><webwork:text name="'bulk.move.retain'" /></th>
            </tr>
            <webwork:iterator value=".">
                <tr>
                    <td class="fieldLabelAreaTop">
                        <label for="cb<webwork:property value="."/>" class="required">
                        *<webwork:text name="./orderableField/name"/>:
                        </label>
                    </td>
                    <webwork:property value="/fieldHtml(.)">
                        <webwork:if test="./length > 0">
                            <webwork:property value="." escape="'false'"/>
                            <td align="center" width="10%">
                                <input type="checkbox" name="retain_<webwork:property value="../orderableField/id"/>" value=""
                                        <webwork:if test="/bulkEditBean/retainChecked(../orderableField/id) == true || /retainMandatory(../orderableField) == true">checked</webwork:if>
                                        <webwork:if test="/retainMandatory(../orderableField) == true">disabled="true"</webwork:if>
                                        />
                                <webwork:if test="/retainMandatory(../orderableField) == true"><input type="hidden" name="retain_<webwork:property value="../orderableField/id"/>" value="true"/></webwork:if>
                            </td>
                        </webwork:if>
                        <webwork:else>
                            <td colspan="2"><div class="noteBox"><webwork:text name="'bulk.move.error.message'"/></div></td>
                        </webwork:else>
                    </webwork:property>
                </tr>
            </webwork:iterator>
        </table>
    </webwork:if>
    <webwork:else>
        <div class="noteBox">
            <webwork:text name="'bulk.move.fields.noupdate'" />.
        </div>
    </webwork:else>
</webwork:property>
