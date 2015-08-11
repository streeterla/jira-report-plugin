<%@ page import="com.atlassian.jira.util.BrowserUtils,
                 com.atlassian.jira.web.action.issue.bulkedit.BulkDelete,
                 com.atlassian.jira.web.component.IssueTableWebComponent"%>
<%@ page import="java.util.List"%>
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
                <page:param name="title"><webwork:text name="'bulkedit.title'"/>: <webwork:text name="'bulkedit.step4.title'"/></page:param>
                <page:param name="description">
                    <webwork:text name="'bulkedit.step4'"/>
                </page:param>
                <page:param name="width">100%</page:param>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td colspan="2">
                            <webwork:text name="'bulk.delete.confirmation.line1'">
                                <webwork:param name="'value0'"><b><webwork:property value="/bulkEditBean/selectedIssuesIncludingSubTasks/size"/></b></webwork:param>
                            </webwork:text>
                            <br>
                            <webwork:text name="'bulk.delete.confirmation.line2'"/>
                            <br>
                            <webwork:text name="'bulk.delete.confirmation.line3'"/>
                        </td>
                    </tr>
                </table>
            </page:applyDecorator>

            <form name="bulkdelete" method="POST" action="<%= request.getContextPath() %>/secure/BulkDeletePerform.jspa">
            <webwork:component name="'atl_token'" value="/xsrfToken" template="hidden.jsp"/>
            <input name="<webwork:text name="'common.forms.confirm'"/>" type=submit value="<webwork:text name="'common.forms.confirm'"/>"
                   title="<webwork:text name="'common.forms.submit.tooltip'">
                   <webwork:param name="'value0'"><webwork:text name="'common.forms.submit.accesskey'"/></webwork:param>
                   <webwork:param name="'value1'"><%=BrowserUtils.getModifierKey()%></webwork:param>
                   </webwork:text>"
            >&nbsp;
            <input type=button id="<webwork:text name="'common.forms.cancel'"/>" name="<webwork:text name="'common.forms.cancel'"/>" value="<webwork:text name="'common.forms.cancel'"/>" onclick="location.href='BulkCancelWizard.jspa'">

            <!-- Send Mail confirmation -->
            <webwork:if test="/canDisableMailNotifications() == true && /bulkEditBean/hasMailServer == true">
                <p>
                <jsp:include page="/includes/bulkedit/bulkedit-sendnotifications-confirmation.jsp"/>
                </p>
            </webwork:if>

            <p>
            <%-- Set this so that it can be used further down --%>
            <webwork:property value="/" id="bulkEdit" />
            <%
                BulkDelete bulkEdit = (BulkDelete) request.getAttribute("bulkEdit");
                List issues = bulkEdit.getBulkEditBean().getSelectedIssuesIncludingSubTasks();
            %>
            <%= new IssueTableWebComponent().getHtml(bulkEdit.getIssueTableLayoutBean(), issues, null) %>

            <p>
            <input name="<webwork:text name="'common.forms.confirm'"/>" type=submit value="<webwork:text name="'common.forms.confirm'"/>"
                   accesskey="<webwork:text name="'common.forms.submit.accesskey'"/>"
                   title="<webwork:text name="'common.forms.submit.tooltip'">
                   <webwork:param name="'value0'"><webwork:text name="'common.forms.submit.accesskey'"/></webwork:param>
                   <webwork:param name="'value1'"><%=BrowserUtils.getModifierKey()%></webwork:param>
                   </webwork:text>"
            >&nbsp;
            <input type=button id="<webwork:text name="'common.forms.cancel'"/>" name="<webwork:text name="'common.forms.cancel'"/>" value="<webwork:text name="'common.forms.cancel'"/>" onclick="location.href='BulkCancelWizard.jspa'">
            </form>
        </td></tr></table>
    </td>
</tr>
</table>
</body>
</html>
