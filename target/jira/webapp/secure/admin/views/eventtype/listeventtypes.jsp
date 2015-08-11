<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.event.types.view'"/></title>
</head>
<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.event.types.view'"/></page:param>
    <page:param name="width">100%</page:param>
        <p><webwork:text name="'admin.event.types.table.desc'"/><br>
           <webwork:text name="'admin.event.types.table.columns.desc'" />
        </p>
        <p>
            <webwork:text name="'admin.event.types.type'" />
            <ul>
                <li>
                    <webwork:text name="'admin.event.types.system.desc'">
                        <webwork:param name="'value0'"><b></webwork:param>
                        <webwork:param name="'value1'"></b></webwork:param>
                    </webwork:text>
                </li>
                <li>
                    <webwork:text name="'admin.event.types.custsom.desc'">
                        <webwork:param name="'value0'"><b></webwork:param>
                        <webwork:param name="'value1'"></b></webwork:param>
                    </webwork:text>
                </li>
            </ul>
        </p>
        <p>
            <webwork:text name="'admin.event.types.state.desc'" />
            <ul>
                <li><webwork:text name="'admin.event.types.active.desc'">
                        <webwork:param name="'value0'"><span class="green-highlight"></webwork:param>
                        <webwork:param name="'value1'"></span></webwork:param>
                    </webwork:text>
                </li>
                <li><webwork:text name="'admin.event.types.inactive.desc'">
                        <webwork:param name="'value0'"><span class="red-highlight"></webwork:param>
                        <webwork:param name="'value1'"></span></webwork:param>
                    </webwork:text>
                </li>
            </ul>
            <webwork:text name="'admin.event.types.delete.inactive'" />
        </p>
</page:applyDecorator>

    <webwork:property value="/eventTypeManager/eventTypes">
        <jsp:include page="/includes/admin/eventtype/event-type-details.jsp"/>
    </webwork:property>

    <page:applyDecorator name="jiraform">
        <page:param name="action">AddEventType.jspa</page:param>
        <page:param name="submitId">add_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
        <page:param name="title"><webwork:text name="'admin.event.types.addnew'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="autoSelectFirst">false</page:param>
        <page:param name="description"><webwork:text name="'admin.event.types.addnew.desc'"/></page:param>

        <ui:textfield label="text('common.words.name')" name="'name'" size="'30'">
            <ui:param name="'description'"></ui:param>
        </ui:textfield>
        <ui:textfield label="text('common.words.description')" name="'description'" size="'60'" />
        <ui:select label="text('admin.notifications.template')" name="'templateId'" template="selectmap.jsp"
            list="/templateManager/templatesMap('issueevent')" listKey="'key'" listValue="'value/name'">
            <ui:param name="'headerrow'" value="text('admin.event.types.select.template')" />
            <ui:param name="'headervalue'" value="'-1'" />
            <ui:param name="'description'">
                <webwork:text name="'admin.event.types.template.desc'"/>
            </ui:param>
        </ui:select>
    </page:applyDecorator>

</body>
</html>
