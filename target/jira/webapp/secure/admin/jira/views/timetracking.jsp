<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><webwork:text name="'admin.globalsettings.timetracking.jira.time.tracking'"/></title>
</head>
<body>
<webwork:if test="timeTracking == true">
    <page:applyDecorator name="jiraform">
        <page:param name="action">TimeTrackingDeActivate.jspa</page:param>
        <page:param name="submitId">deactivate_submit</page:param>
        <page:param name="submitName"><webwork:text name="'admin.common.words.deactivate'"/></page:param>
        <page:param name="title"><webwork:text name="'admin.menu.globalsettings.time.tracking'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="helpURL">timetracking</page:param>
        <page:param name="description">
            <p>
            <webwork:text name="'admin.globalsettings.timetracking.status'">
                <webwork:param name="'value0'"><font color="#009900"><b></webwork:param>
                <webwork:param name="'value1'"><webwork:text name="'admin.common.words.on'"/></webwork:param>
                <webwork:param name="'value2'"></b></font></webwork:param>
            </webwork:text><br>
            <webwork:text name="'admin.globalsettings.timetracking.current.hours.per.day'">
                <webwork:param name="'value0'"><b></webwork:param>
                <webwork:param name="'value1'"><webwork:property value="hoursPerDay"/></webwork:param>
                <webwork:param name="'value2'"></b></webwork:param>
            </webwork:text><br>
            <webwork:text name="'admin.globalsettings.timetracking.current.days.per.week'">
                <webwork:param name="'value0'"><b></webwork:param>
                <webwork:param name="'value1'"><webwork:property value="daysPerWeek"/></webwork:param>
                <webwork:param name="'value2'"></b></webwork:param>
            </webwork:text><br>
            <webwork:text name="'admin.globalsettings.timetracking.format'">
                <webwork:param name="'value0'"><b></webwork:param>
                <webwork:param name="'value1'"><webwork:property value="timeTrackingFormatSample"/></webwork:param>
                <webwork:param name="'value2'"></b></webwork:param>
            </webwork:text><br>
            <webwork:text name="'admin.globalsettings.timetracking.default.unit.current'">
                <webwork:param name="'value0'"><b></webwork:param>
                <webwork:param name="'value1'"><webwork:property value="defaultUnitText"/></webwork:param>
                <webwork:param name="'value2'"></b></webwork:param>
            </webwork:text><br>
            <webwork:text name="'admin.globalsettings.timetracking.instruction'">
                <webwork:param name="'value0'"><b></webwork:param>
                <webwork:param name="'value1'"></b></webwork:param>
            </webwork:text>
            </p>
            <webwork:if test="/issueOperationsPluginEnabled == false">
                <p><webwork:text name="'admin.globalsettings.timetracking.issue.operations.plugin.disabled.active'">
                    <webwork:param name="'value0'"><font color="#bb0000"><b></webwork:param>
                    <webwork:param name="'value1'"></b></font></webwork:param>
                    <webwork:param name="'value2'"><a href="<%=request.getContextPath()%>/secure/admin/jira/ViewPlugins!default.jspa?pluginKey=com.atlassian.jira.plugin.system.issueoperations"></webwork:param>
                    <webwork:param name="'value3'"></a></webwork:param>
                </webwork:text></p>
            </webwork:if>
            <webwork:elseIf test="/logWorkModuleEnabled == false"><p>
                <p><webwork:text name="'admin.globalsettings.timetracking.log.work.module.disabled.active'">
                    <webwork:param name="'value0'"><font color="#bb0000"><b></webwork:param>
                    <webwork:param name="'value1'"></b></font></webwork:param>
                    <webwork:param name="'value2'"><a href="<%=request.getContextPath()%>/secure/admin/jira/ViewPlugins!default.jspa?pluginKey=com.atlassian.jira.plugin.system.issueoperations"></webwork:param>
                    <webwork:param name="'value3'"></a></webwork:param>
                </webwork:text></p>
            </webwork:elseIf>
            <p><webwork:text name="'admin.globalsettings.timetracking.instruction2'">
                <webwork:param name="'value0'"><b></webwork:param>
                <webwork:param name="'value1'"></b></webwork:param>
                <webwork:param name="'value2'"><a href="ViewPermissionSchemes.jspa"></webwork:param>
                <webwork:param name="'value3'"></a></webwork:param>
            </webwork:text></p>
            <p><webwork:text name="'admin.globalsettings.timetracking.deactivate.time.tracking.below'"/></p>
        </page:param>
    </page:applyDecorator>
</webwork:if>
<webwork:else>
    <page:applyDecorator name="jiraform">
        <page:param name="action">TimeTrackingActivate.jspa</page:param>
        <page:param name="submitId">activate_submit</page:param>
        <page:param name="submitName"><webwork:text name="'admin.common.words.activate'"/></page:param>
        <page:param name="title"><webwork:text name="'admin.menu.globalsettings.time.tracking'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="helpURL">timetracking</page:param>
        <page:param name="description">
            <webwork:text name="'admin.globalsettings.timetracking.status'">
                <webwork:param name="'value0'"><font color="#990000"><b></webwork:param>
                <webwork:param name="'value1'"><webwork:text name="'admin.common.words.off'"/></webwork:param>
                <webwork:param name="'value2'"></b></font></webwork:param>
            </webwork:text>
            <webwork:if test="/issueOperationsPluginEnabled == false">
                <p><webwork:text name="'admin.globalsettings.timetracking.issue.operations.plugin.disabled.inactive'">
                    <webwork:param name="'value0'"><font color="#bb0000"><b></webwork:param>
                    <webwork:param name="'value1'"></b></font></webwork:param>
                    <webwork:param name="'value2'"><a href="<%=request.getContextPath()%>/secure/admin/jira/ViewPlugins!default.jspa?pluginKey=com.atlassian.jira.plugin.system.issueoperations"></webwork:param>
                    <webwork:param name="'value3'"></a></webwork:param>
                </webwork:text></p>
            </webwork:if>
            <webwork:elseIf test="/logWorkModuleEnabled == false"><p>
                <p><webwork:text name="'admin.globalsettings.timetracking.log.work.module.disabled.inactive'">
                    <webwork:param name="'value0'"><font color="#bb0000"><b></webwork:param>
                    <webwork:param name="'value1'"></b></font></webwork:param>
                    <webwork:param name="'value2'"><a href="<%=request.getContextPath()%>/secure/admin/jira/ViewPlugins!default.jspa?pluginKey=com.atlassian.jira.plugin.system.issueoperations"></webwork:param>
                    <webwork:param name="'value3'"></a></webwork:param>
                </webwork:text></p>
            </webwork:elseIf>
            <p>
            <webwork:text name="'admin.globalsettings.timetracking.activate.time.tracking.below'"/>
        </page:param>
        <ui:textfield label="text('admin.globalsettings.timetracking.hours.per.day')" name="'hoursPerDay'" size="'10'">
            <ui:param name="'description'"><webwork:text name="'admin.globalsettings.timetracking.specify.working.hours'"/></ui:param>
        </ui:textfield>
        <ui:textfield label="text('admin.globalsettings.timetracking.days.per.week')" name="'daysPerWeek'" size="'10'">
            <ui:param name="'description'"><webwork:text name="'admin.globalsettings.timetracking.specify.working.days'"/></ui:param>
        </ui:textfield>
        <ui:radio label="text('admin.globalsettings.timetracking.format.label')" name="'timeTrackingFormat'" list="timeTrackingFormats" listKey="'id'" listValue="'name'"/>
        <ui:select label="text('admin.globalsettings.timetracking.default.unit.label')" name="'defaultUnit'" list="units" listKey="'key'" listValue="'value'">
             <webwork:param name="'description'"><webwork:text name="'admin.globalsettings.timetracking.default.unit.description'"/></webwork:param>
         </ui:select>
    </page:applyDecorator>
</webwork:else>
</body>
</html>