<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<!-- Step 3 - Bulk Operation: Operation Details -->

<html>
<head>
	<title><webwork:text name="'bulkworkflowtransition.title'"/> </title>
</head>
<body>
<jsp:include page="/includes/js/date_picker.jsp" flush="true" />
<script language="javascript">
    function check(id)
    {
        eval("document.jiraform." + id + ".checked = true");
    }
</script>
<table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#ffffff">
<tr>
    <td nowrap width="200" valign="top" bgcolor="#f0f0f0">
        <jsp:include page="/secure/views/bulkedit/bulkedit_leftpane.jsp" flush="false" />
    </td>
    <td valign="top">
        <table cellspacing="0" cellpadding="10" border="0" width="100%"><tr><td>
            <page:applyDecorator name="jirapanel">
                <page:param name="title"><webwork:text name="'bulkedit.title'"/>: <webwork:text name="'bulkedit.step3.title'"/></page:param>
                <page:param name="description">
                    <webwork:text name="'bulkedit.step3'"/>
                </page:param>
                <page:param name="width">100%</page:param>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td colspan="2">
                        <webwork:text name="'bulkworkflowtransition.select.action'" /><br>
                        </td>
                    </tr>
                </table>
            </page:applyDecorator>
            <p>
            <form name="jiraform" action="BulkWorkflowTransitionDetailsValidation.jspa" method="POST">
                <%@include file="bulkchooseaction_submit_buttons.jsp"%>
                <%@include file="/secure/views/bulkedit/includes/bulkworkflowtransition_transitionmapping.jsp"%>
                <%@include file="bulkchooseaction_submit_buttons.jsp"%>
            </form>
        </td></tr></table>
    </td>
</tr>
</table>
</body>
</html>
