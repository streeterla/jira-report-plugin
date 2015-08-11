<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="sitemesh-decorator" prefix="decorator" %>

<decorator:usePage id="p" />


<table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#ffffff">
<tr>
    <td width=200 valign=top bgcolor=#f0f0f0>
        <jsp:include page="/secure/views/bulkedit/bulkedit_leftpane.jsp" flush="false" />
    </td>
    <td valign=top>
        <div style="margin: 10px">
            <page:applyDecorator name="jirapanel">
                <page:param name="title"><decorator:getProperty property="title" /></page:param>
                <page:param name="description">
                    <webwork:if test="/rootBulkEditBean/currentStep == 1">
                        <webwork:text name="'bulkedit.step1'"/>
                    </webwork:if>
                    <webwork:if test="/rootBulkEditBean/currentStep == 2">
                        <webwork:text name="'bulkedit.step2'"/>
                    </webwork:if>
                    <webwork:if test="/rootBulkEditBean/currentStep == 3">
                        <webwork:text name="'bulkedit.step3'"/>
                    </webwork:if>
                    <webwork:else>
                        <webwork:text name="'bulkedit.step4'"/>
                    </webwork:else>
                </page:param>
                <page:param name="width">100%</page:param>
                <page:param name="helpURL">bulkoperations</page:param>
                <page:param name="helpURLFragment">#Bulk+Move</page:param>
                
                <decorator:getProperty property="instructions" />
            </page:applyDecorator>

            <form name="jiraform" action="<decorator:getProperty property="action" />" method="POST" >
            <div class="maxWidth" style="margin-top: 10px">
            <%@include file="/secure/views/bulkedit/bulkchooseaction_submit_buttons.jsp"%>
                <div style="margin: 5px 0 5px 0;">
                <decorator:body />
                </div>
            <%@include file="/secure/views/bulkedit/bulkchooseaction_submit_buttons.jsp"%>
                <!-- Hidden field placed here so as not affect the buttons -->
                <webwork:if test="/canDisableMailNotifications() == false">
                    <ui:component name="'sendBulkNotification'" template="hidden.jsp" theme="'single'" value="'true'" />
                </webwork:if>
            </div>
            </form>
        </div>
    </td>
</tr>
</table>
