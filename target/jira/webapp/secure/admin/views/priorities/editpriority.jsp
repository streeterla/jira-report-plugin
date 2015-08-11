<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><webwork:text name="'admin.issuesettings.priorities.edit.priority'"/></title>
</head>
<body>
<script language="JavaScript">
    function openWindow()
    {
        var vWinUsers = window.open('<%= request.getContextPath() %>/secure/popups/IconPicker.jspa?fieldType=priority&formName=jiraform','IconPicker', 'status=no,resizable=yes,top=100,left=200,width=580,height=650,scrollbars=yes');
        vWinUsers.opener = self;
	    vWinUsers.focus();
    }
</script>
    <p>
    <page:applyDecorator name="jiraform">
        <page:param name="action">EditPriority.jspa</page:param>
        <page:param name="submitId">update_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="cancelURI">ViewPriorities.jspa</page:param>
        <page:param name="title"><webwork:text name="'admin.issuesettings.priorities.edit.priority'"/>: <webwork:property value="constant/string('name')" /></page:param>

        <ui:textfield label="text('common.words.name')" name="'name'" size="'30'" />

        <ui:textfield label="text('common.words.description')" name="'description'" size="'60'" />

        <ui:component label="text('admin.common.phrases.icon.url')" name="'iconurl'" template="textimagedisabling.jsp">
    	    <ui:param name="'imagefunction'">openWindow()</ui:param>
    	    <ui:param name="'size'">60</ui:param>
    	    <ui:param name="'mandatory'">true</ui:param>
    	    <ui:param name="'description'"><webwork:text name="'admin.common.phrases.relative.to.jira'"/></ui:param>
        </ui:component>

        <ui:component label="text('admin.issuesettings.priorities.status.color')" name="'statusColor'" template="colorpicker.jsp">
            <ui:param name="'size'">40</ui:param>
        </ui:component>

        <ui:component name="'id'" template="hidden.jsp" />
        <input type="hidden" name="preview" value="false" />
    </page:applyDecorator>
    </p>
</body>
</html>
