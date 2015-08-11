<%@ page import="com.atlassian.jira.util.BrowserUtils,
                 com.atlassian.jira.web.action.issue.bulkedit.BulkEdit1,
                 com.atlassian.jira.web.component.IssueTableWebComponent"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<!-- STEP 1 - Bulk Operation: Choose Issues-->

<html>
<head>
	<title><webwork:text name="'bulkedit.title'"/></title>
</head>
<body>
<script language="javascript">
    function setCheckboxes()
    {
        var value = document.bulkedit.all.checked;
        var numelements = document.bulkedit.elements.length;
        var item;
        for (var i=0 ; i<numelements ; i++)
        {
            item = document.bulkedit.elements[i];
            item.checked = value;
        }
    }
</script>
<table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#ffffff">
<tr>
    <td width=200 valign=top bgcolor=#f0f0f0>
        <jsp:include page="/secure/views/bulkedit/bulkedit_leftpane.jsp" flush="false" />
    </td>
    <td valign=top>
        <table cellspacing=0 cellpadding=10 border=0 width="100%"><tr><td>
            <page:applyDecorator name="jirapanel">
                <page:param name="title"><webwork:text name="'bulkedit.title'"/>: <webwork:text name="'bulkedit.step1.title'"/></page:param>
                <page:param name="description">
                    <webwork:text name="'bulkedit.step1'"/>
                </page:param>
                <page:param name="width">100%</page:param>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td colspan="2">
                        <webwork:text name="'bulkedit.step1.desc'"/>
                        <webwork:if test="/bulkLimited == true">
                            <webwork:text name="'bulk.edit.limited'"><webwork:param name="'value0'" value="/tempMax"/></webwork:text>
                        </webwork:if>
                        </td>
                    </tr>
                </table>
            </page:applyDecorator>

        <form class="bulk-edit-form" name="bulkedit" method="POST" action="BulkEdit1.jspa">
            <input type="hidden" name="tempMax" value="<webwork:property value="/tempMax"/>"/>
            <div class="bulk-buttons">
                <input type=submit name="<webwork:text name="'common.forms.next'"/>" id="<webwork:text name="'common.forms.next'"/>" value="<webwork:text name="'common.forms.next'"/> >>"
                       title="<webwork:text name="'common.forms.submit.tooltip'">
                       <webwork:param name="'value0'"><webwork:text name="'common.forms.submit.accesskey'"/></webwork:param>
                       <webwork:param name="'value1'"><%=BrowserUtils.getModifierKey()%></webwork:param>
                       </webwork:text>"
                >&nbsp;
                <input type="button" id="<webwork:text name="'common.forms.cancel'"/>" name="<webwork:text name="'common.forms.cancel'"/>" value="<webwork:text name="'common.forms.cancel'"/>" onclick="location.href='BulkCancelWizard.jspa'">
            </div>

            <%-- Set this so that it can be used further down --%>
            <webwork:property value="/" id="bulkEdit" />
            <%
                BulkEdit1 bulkEdit1 = (BulkEdit1) request.getAttribute("bulkEdit");
                List issues = bulkEdit1.getBulkEditBean().getIssuesFromSearchRequest();
            %>
            <%= new IssueTableWebComponent().getHtml(bulkEdit1.getIssueTableLayoutBean(), issues, null) %>

            <div class="bulk-buttons">
                <input type=submit name="<webwork:text name="'common.forms.next'"/>" id="<webwork:text name="'common.forms.next'"/>" value="<webwork:text name="'common.forms.next'"/> >>"
                       accesskey="<webwork:text name="'common.forms.submit.accesskey'"/>"
                       title="<webwork:text name="'common.forms.submit.tooltip'">
                       <webwork:param name="'value0'"><webwork:text name="'common.forms.submit.accesskey'"/></webwork:param>
                       <webwork:param name="'value1'"><%=BrowserUtils.getModifierKey()%></webwork:param>
                       </webwork:text>"
                >&nbsp;
                <input type=button id="<webwork:text name="'common.forms.cancel'"/>" name="<webwork:text name="'common.forms.cancel'"/>" value="<webwork:text name="'common.forms.cancel'"/>" onclick="location.href='BulkCancelWizard.jspa'">
            </div>
        </form>
        </td></tr></table>
    </td>
</tr>
</table>
</body>
</html>
