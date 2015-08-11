<%@ page import="com.atlassian.jira.util.BrowserUtils,
                 com.atlassian.jira.web.action.issue.bulkedit.BulkEdit,
                 com.atlassian.jira.web.component.IssueTableWebComponent"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<!-- Step 4 - Bulk Operation: Confirmation for EDIT -->

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
                        <webwork:text name="'bulkedit.step3.desc'"/>
                        </td>
                    </tr>
                </table>
            </page:applyDecorator>

            <!-- Send Mail confirmation -->
            <webwork:if test="/canDisableMailNotifications() == true && /bulkEditBean/hasMailServer == true">
                <p>
                <table width=60%><tr><td>
                <jsp:include page="/includes/bulkedit/bulkedit-sendnotifications-confirmation.jsp"/>
                </td></tr></table>
                </p>
            </webwork:if>

            <p>
            <form name="bulkedit_confirmation" action="BulkEditPerform.jspa" method="POST">
            <table cellpadding=0 cellspacing=0 border=0 width=60% bgcolor=#bbbbbb><tr><td>
            <table id="updatedfields" cellpadding=2 cellspacing=1 border=0 width=100%>
                <tr bgcolor=#f0f0f0><th colspan=2><webwork:text name="'bulkedit.confirm.updatedfields'"/></th></tr>
                <webwork:iterator value="/bulkEditBean/actions/values">
                    <tr>
                        <td bgcolor=#ffffff width="40%"><b><webwork:property value="./fieldName"/></b></td>
                        <td bgcolor=#ffffff><webwork:property value="/fieldViewHtml(./field)" escape="false" /></td>
                    </tr>
                </webwork:iterator>
            </table>
            </td></tr></table>
            <p>
            <webwork:text name="'bulkedit.confirm.msg'">
                <webwork:param name="'value0'"><b><webwork:property value="/bulkEditBean/selectedIssues/size"/></b></webwork:param>
            </webwork:text><br>
            <webwork:text name="'bulkedit.confirm.warning.about.blanks'"/></p>
            <p>
            <input type=submit name="<webwork:text name="'common.forms.confirm'"/>" value="<webwork:text name="'common.forms.confirm'"/>"
                   title="<webwork:text name="'common.forms.submit.tooltip'">
                   <webwork:param name="'value0'"><webwork:text name="'common.forms.submit.accesskey'"/></webwork:param>
                   <webwork:param name="'value1'"><%=BrowserUtils.getModifierKey()%></webwork:param>
                   </webwork:text>"
            >&nbsp;
            <input type=button id="<webwork:text name="'common.forms.cancel'"/>" name="<webwork:text name="'common.forms.cancel'"/>" value="<webwork:text name="'common.forms.cancel'"/>" onclick="location.href='BulkCancelWizard.jspa'">
            <p>

            <%-- Set this so that it can be used further down --%>
            <webwork:property value="/" id="bulkEdit" />
            <%
                BulkEdit bulkEdit = (BulkEdit) request.getAttribute("bulkEdit");
                List issues = bulkEdit.getBulkEditBean().getSelectedIssues();
            %>
            <%= new IssueTableWebComponent().getHtml(bulkEdit.getIssueTableLayoutBean(), issues, null) %>

            <p>
            <input type=submit name="<webwork:text name="'common.forms.confirm'"/>" value="<webwork:text name="'common.forms.confirm'"/>"
                   accessKey="<webwork:text name="'common.forms.submit.accesskey'"/>"
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
