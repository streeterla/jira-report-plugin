<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>

<%-- This include puts the reporter FieldConfiguration on the stack as it is needed there --%>
<webwork:property value="/field('reporter')">
<webwork:if test="/hasProjectPermission('modifyreporter', /project) == true">
    <script language="javascript">
    function openWindow(element)
    {
        var vWinUsers = window.open('<%= request.getContextPath() %>/secure/popups/UserPickerBrowser.jspa?formName=jiraform&element=' + element, 'UserPicker', 'status=yes,resizable=yes,top=100,left=200,width=580,height=750,scrollbars=yes');
        vWinUsers.opener = self;
    	vWinUsers.focus();
    }
    </script>

    <ui:component label="text(./nameKey)" name="id" template="textimagedisabling.jsp">
    	<ui:param name="'formname'" value="'jiraform'" />
    	<ui:param name="'imagename'" value="'reporterImage'"/>
        <webwork:if test="hasPermission('pickusers') == true">
            <ui:param name="'imagesrc'"><%=request.getContextPath()%>/images/icons/filter_public.gif</ui:param>
        	<ui:param name="'imagefunction'">openWindow('reporter')</ui:param>
        </webwork:if>
        <webwork:else>
        	<ui:param name="'imagesrc'"><%=request.getContextPath()%>/images/icons/userpicker_disabled.gif</ui:param>
        </webwork:else>
    	<ui:param name="'style'">width: 30%;</ui:param>
        <ui:param name="'description'"><webwork:property value="fieldDescription" escape="false" /></ui:param>
    </ui:component>
</webwork:if>
</webwork:property>
