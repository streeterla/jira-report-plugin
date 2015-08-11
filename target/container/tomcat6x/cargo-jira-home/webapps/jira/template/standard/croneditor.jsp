<%@ page import="com.atlassian.jira.web.component.cron.CronEditorWebComponent" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%--
    Renders the cron editor within a jira form. The cronEditorBean is a reference to a CronEditorBean
    that the component will use the renderer the editor.
    <webwork:component name="'cron.editor.name'" template="croneditor.jsp" >
        <webwork:param name="'cronEditorBean'">/cronEditorBean</webwork:param>
        <webwork:param name="'parameterPrefix'">filter.subscriptions.prefix</webwork:param>
    </webwork:component>">
--%>

<%@ include file="/template/standard/controlheader.jsp" %>

<%
    CronEditorWebComponent cronEditorWebComponent = new CronEditorWebComponent();
    request.setAttribute("cronEditorWebComponent", cronEditorWebComponent);
%>
<webwork:if test="parameters['cronEditorBean'] != true">
    <webwork:if test="parameters['parameterPrefix'] != true">
        <webwork:property
                value="@cronEditorWebComponent/html(parameters['cronEditorBean'], parameters['parameterPrefix'])"
                escape="false"/>
    </webwork:if>
    <webwork:else>
        <webwork:property value="@cronEditorWebComponent/html(parameters['cronEditorBean'], null)" escape="false"/>
    </webwork:else>
</webwork:if>
<webwork:else>
    You can not display the cron editor without the cron editor bean.
</webwork:else>

<%@ include file="/template/standard/controlfooter.jsp" %>
