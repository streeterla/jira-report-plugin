<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<!-- Step 2 - Bulk Operation: Choose Operation -->

<html>
<head>
	<title><webwork:text name="'bulkedit.title'"/></title>
</head>
<script language="javascript">
    function cellHover(cell)
    {
        cell.oldClassName = cell.className;
        cell.className = 'rowHover';
        cell.onmouseout = function()
        {
            this.className = this.oldClassName;
        }
    }

    function selectCellRadioBox(cell)
    {
        var id = cell.id.substring(4, cell.id.length);
        document.forms['bulkedit_chooseoperation'].elements[id + '_id'].checked = true;
    }
</script>
<body>

<table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#ffffff">
<tr>
    <td width=200 valign=top bgcolor=#f0f0f0>
        <jsp:include page="/secure/views/bulkedit/bulkedit_leftpane.jsp" flush="false" />
    </td>
    <td valign=top>
        <table cellspacing=0 cellpadding=10 border=0 width="100%"><tr><td>
            <page:applyDecorator name="jirapanel">
                <page:param name="title"><webwork:text name="'bulkedit.title'"/>: <webwork:text name="'bulkedit.chooseoperation.title'"/></page:param>
                <page:param name="description">
                    <webwork:text name="'bulkedit.step2'"/>
                </page:param>
                <page:param name="width">100%</page:param>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td colspan="2">
                        <webwork:if test="/hasAvailableOperations == true">
                                <webwork:text name="'bulkedit.chooseoperation.desc'">
                                    <webwork:param name="'value0'"><strong><webwork:property value="/bulkEditBean/selectedIssues/size"/></strong></webwork:param>
                                </webwork:text><br>
                        </webwork:if>
                        <webwork:else>
                               <webwork:text name="'bulkedit.chooseoperation.unavailable'">
                                    <webwork:param name="'value0'"><strong><webwork:property value="/bulkEditBean/selectedIssues/size"/></strong></webwork:param>
                               </webwork:text><br>
                        </webwork:else>
                        </td>
                    </tr>
                </table>
            </page:applyDecorator>
            <p>
            <form name="bulkedit_chooseoperation" action="BulkChooseOperation.jspa" method="POST">
            <%@include file="bulkchooseoperation_submit_buttons.jsp"%>
            <p>
                <table bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr><td>
                   <table border="0" cellpadding="3" cellspacing="1" width="100%">
                   <webwork:iterator value="bulkOperations" status="'status'">
                        <tr <webwork:if test="@status/even == true">class="rowAlternate"</webwork:if><webwork:else>class="rowNormal"</webwork:else>
                            onmouseover="cellHover(this)" onclick="selectCellRadioBox(this)" id="cell<webwork:property value="./nameKey"/>">
                                <%-- if the operation is available draw the radio button --%>
                                <webwork:if test="/canPerform(.) == true">
                                    <td align="center">
                                        <input type="radio" name="operation" id="<webwork:property value="./nameKey"/>_id" value="<webwork:property value="./nameKey"/>">
                                    </td>
                                    <td>
                                        <label for="<webwork:property value="./nameKey"/>_id"><webwork:text name="./nameKey"/></label>
                                    </td>
                                    <td>
                                        <label for="<webwork:property value="./nameKey"/>_id"><webwork:text name="./descriptionKey"/></label>
                                    </td>
                                </webwork:if>
                                <webwork:else>
                                    <td valign="top" bgcolor="#f0f0f0" align="center"><webwork:text name="'bulkedit.constants.na'"/></td>
                                    <td  bgcolor="#f0f0f0">
                                        <webwork:text name="./nameKey"/>
                                    </td>
                                    <td  bgcolor="#f0f0f0">
                                        <webwork:text name="./cannotPerformMessageKey">
                                            <webwork:param name="'value0'"><strong><font color="#bb0000"></webwork:param>
                                            <webwork:param name="'value1'"></font></strong></webwork:param>
                                            <webwork:param name="'value2'"><webwork:property value="/bulkEditBean/selectedIssues/size"/></webwork:param>
                                        </webwork:text>
                                    </td>
                                </webwork:else>
                        </tr>
                    </webwork:iterator>
                </table>
                </td></tr></table>
                <br>
                <%@include file="bulkchooseoperation_submit_buttons.jsp"%>
                </form>
        </td></tr></table>
    </td>
</tr>
</table>
</body>
</html>
