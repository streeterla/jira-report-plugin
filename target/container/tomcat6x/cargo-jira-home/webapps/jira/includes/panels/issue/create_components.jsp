<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>

<webwork:if test="id == 'components'">
    <webwork:if test="/projectManager/components(project)/size > 0">
        <ui:select label="text(./nameKey)" name="id" template="selectmultiple.jsp"
            list="projectManager/components(project)" listKey="'long('id')'" listValue="'string('name')'">
            <ui:param name="'size'" value="'5'" />
            <ui:param name="'headerrow'" value="text('common.words.unknown')" />
            <ui:param name="'headervalue'" value="'-1'" />
            <ui:param name="'description'"><webwork:property value="fieldDescription" escape="false" /></ui:param>
            <ui:param name="'mandatory'" value="../required"/>
        </ui:select>
    </webwork:if>
    <webwork:else>
        <tr>
            <td class="fieldLabelArea"><webwork:text name="'issue.field.components'"/>:</td>
            <td class="fieldValueArea">
            <webwork:text name="'common.words.unknown'"/>
            </td>
        </tr>
    </webwork:else>
</webwork:if>
