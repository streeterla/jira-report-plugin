<%@ page import="com.atlassian.jira.web.action.issue.bulkedit.BulkWorkflowTransition,
                 com.atlassian.jira.web.component.IssueTableWebComponent,
                 java.util.List"%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<!-- Step 4 - Bulk Operation: Confirmation for EDIT -->


<html>
<head>
    <title><webwork:text name="'bulkworkflowtransition.title'"/></title>
</head>
<body>

<page:applyDecorator name="bulkpanel" >
    <page:param name="title"><webwork:text name="'bulkworkflowtransition.title'"/>: <webwork:text name="'bulkworkflowtransition.confirmation'"/></page:param>
    <page:param name="action">BulkWorkflowTransitionPerform.jspa</page:param>
    <webwork:property value="'true'" id="hideSubMenu" />
    <page:param name="instructions">
    <p>
        <webwork:text name="'bulkworkflowtransition.confirmation.instructions'"/>
    </p>
    </page:param>

<html>
<head>
	<title><webwork:text name="'bulkedit.title'"/></title>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#ffffff">
<tr><td>
<table class="grid bordered centered defaultWidth" >
    <tr><td>
        <b><webwork:text name="'bulkworkflowtransition.issue.workflow'"/></b>: <webwork:property value="/bulkEditBean/selectedWFTransitionKey/workflowName" />
    </td></tr>
    <tr><td>
        <b><webwork:text name="'bulkworkflowtransition.selected.transition'"/></b>: <webwork:property value="/bulkWorkflowTransitionOperation/actionDescriptor(/bulkEditBean/selectedWFTransitionKey)/name" />
    </td></tr>
    <tr><td>
        <b><webwork:text name="'bulkworkflowtransition.status.transition'"/></b>:
        <webwork:property value="/originStatus(/bulkEditBean/selectedWFTransitionKey)">
                <webwork:component name="'status'" template="constanticon.jsp">
                    <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                    <webwork:param name="'iconurl'" value="./string('iconurl')" />
                    <webwork:param name="'alt'"><webwork:property value="/nameTranslation(.)" /></webwork:param>
                </webwork:component>
                <webwork:property value="/nameTranslation(.)" />
            </webwork:property>
        <img src="<%= request.getContextPath() %>/images/icons/arrow_right_small.gif" height=16 width=16 border=0 align=absmiddle>
        <webwork:property value="/destinationStatus(/bulkEditBean/selectedWFTransitionKey)">
                <webwork:component name="'status'" template="constanticon.jsp">
                    <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                    <webwork:param name="'iconurl'" value="./string('iconurl')" />
                    <webwork:param name="'alt'"><webwork:property value="/nameTranslation(.)" /></webwork:param>
                </webwork:component>
                <webwork:property value="/nameTranslation(.)" />
            </webwork:property>
    </td></tr>
    <tr><td>
        <webwork:text name="'bulkworkflowtransition.number.affected.issues'">
            <webwork:param name="'value0'"><strong><webwork:property value="/bulkEditBean/selectedIssues/size()" /></strong></webwork:param>
        </webwork:text>
    </td></tr>
</table>
</td></tr>
<tr><td>
    <webwork:property value="/bulkEditBean/actions">
        <webwork:if test=". != null && ./empty() == false">
            <table class="centered defaultWidth" cellpadding="0" cellspacing="0" border="0" bgcolor="#bbbbbb">
            <tr><td>
                <table id="updatedfields" cellpadding=2 cellspacing=1 border=0 width=100%>
                    <tr bgcolor=#f0f0f0><th colspan=2><webwork:text name="'bulkedit.confirm.updatedfields'"/></th></tr>
                    <webwork:iterator value="./values">
                        <tr>
                            <td bgcolor=#ffffff width="40%"><b><webwork:property value="./fieldName"/></b></td>
                            <td bgcolor=#ffffff><webwork:property value="/fieldViewHtml(./field)" escape="false" /></td>
                        </tr>
                    </webwork:iterator>
                </table>
            </td></tr>
            </table>

            <!-- Send Mail confirmation -->
            <webwork:if test="/canDisableMailNotifications() == true && /bulkEditBean/hasMailServer == true">
                <p>
                <table class="centered defaultWidth" cellpadding="0" cellspacing="0">
                    <tr><td>
                        <jsp:include page="/includes/bulkedit/bulkedit-sendnotifications-confirmation.jsp"/>
                    </td></tr>
                </table>
                </p>
            </webwork:if>
            
            <p>
                <webwork:text name="'bulkedit.confirm.msg'">
                    <webwork:param name="'value0'"><b><webwork:property value="/bulkEditBean/selectedIssues/size"/></b></webwork:param>
                </webwork:text><br>
                <webwork:text name="'bulkedit.confirm.warning.about.blanks'"/>
            </p>
        </webwork:if>
    </webwork:property>

    <%-- Set this so that it can be used further down --%>
    <webwork:property value="/" id="bulkWorkflowTransition" />
    <%
        BulkWorkflowTransition bulkWorkflowTransition = (BulkWorkflowTransition) request.getAttribute("bulkWorkflowTransition");
        List issues = bulkWorkflowTransition.getBulkEditBean().getSelectedIssues();
    %>
    <%= new IssueTableWebComponent().getHtml(bulkWorkflowTransition.getIssueTableLayoutBean(), issues, null) %>

</td></tr>
</table>
<!-- Add a breakline between issue table and confirmation buttons.
&nbsp;
</page:applyDecorator>
</body>
</html>
