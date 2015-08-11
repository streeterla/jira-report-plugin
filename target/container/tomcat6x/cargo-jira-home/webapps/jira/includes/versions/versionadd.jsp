<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'admin.manageversions.add.version'"/></page:param>
    <page:param name="action"><webwork:url page="AddVersion.jspa"><webwork:param name="'pid'" value="project/long('id')" /></webwork:url></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="submitId">add_version_submit</page:param>
    <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>

        <ui:textfield label="text('admin.manageversions.version.name')" name="'name'" size="'40'">
            <ui:param name="'mandatory'" value="true" />
        </ui:textfield>

        <ui:textfield label="text('common.words.description')" name="'description'" size="'60'">
        </ui:textfield>

        <ui:component label="text('version.releasedate')" name="'releaseDate'" template="datepicker2.jsp">
            <ui:param name="'formname'" value="'jiraform'" />
            <ui:param name="'style'">width: 20%;</ui:param>
        </ui:component>

        <webwork:if test="/versionManager/versions(/project) != null && /versionManager/versions(/project)/empty == false">
            <ui:select name="'scheduleAfterVersion'" list="/versionManager/versions(/project)"
                    label="text('admin.manageversions.schedule.before')" listKey="'id'" listValue="'name'" >
             <%--       label="'Schedule After'" listKey="'id'" listValue="'name'" >    --%>
                <ui:param name="'style'">width: 20%;</ui:param>
                <ui:param name="'headerrow'" value="'-- Before First Version --'" />
                <ui:param name="'headervalue'" value="-1" />
                <ui:param name="'description'"><webwork:text name="'admin.manageversions.schedule.before.description'">
                    <webwork:param name="'value0'"><strong></webwork:param>
                    <webwork:param name="'value1'"></strong></webwork:param>
                    <webwork:param name="'value2'"><br /></webwork:param>
                </webwork:text></ui:param>
                <webwork:if test="scheduleAfterVersion == null">
                    <ui:param name="'selectedValue'"><webwork:property value="/lastVersion/id"/></ui:param>
                </webwork:if>
            </ui:select>
        </webwork:if>

        <ui:component name="'scheduleAfterVersion'" template="hidden.jsp"/>
</page:applyDecorator>

