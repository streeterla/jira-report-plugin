<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<!-- Step 4 - Bulk Operation: Confirmation for DELETE -->

<html>
<head>
	<title><webwork:text name="'bulkedit.title'"/></title>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#ffffff">
<tr>
    <td width=200 valign=top bgcolor=#f0f0f0>
        <jsp:include page="/secure/views/bulkedit/bulkedit_leftpane.jsp" flush="false" />
    </td>
    <td valign=top>
        <table cellspacing=0 cellpadding=10 border=0 width="100%"><tr><td>
            <page:applyDecorator name="jirapanel">
                <page:param name="title"><webwork:text name="'bulkedit.title'"/>: <webwork:text name="'bulkedit.step3.title'"/></page:param>
                <page:param name="description">
                    <webwork:text name="'bulkedit.step3'"/>
                </page:param>
                <page:param name="width">100%</page:param>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td colspan="2">
                            <webwork:text name="'bulk.delete.send.mail.option'"/>
                        </td>
                    </tr>
                </table>
            </page:applyDecorator>

            <form name="jirform" method="POST" action="<%= request.getContextPath() %>/secure/BulkDeleteDetailsValidation.jspa">
                <p>
                <%@include file="bulkchooseaction_submit_buttons.jsp"%>
                <table class="centered defaultWidth"><tr><td>
                    <jsp:include page="/includes/bulkedit/bulkedit-sendnotifications.jsp"/>
                </td></tr></table>
                <%@include file="bulkchooseaction_submit_buttons.jsp"%>

                <!-- Hidden field placed here so as not affect the buttons -->
                <webwork:if test="/canDisableMailNotifications() == false">
                    <ui:component name="'sendBulkNotification'" template="hidden.jsp" theme="'single'" value="'true'" />
                </webwork:if>
                </p>
            </form>
        </td></tr></table>
    </td>
</tr>
</table>
</body>
</html>
