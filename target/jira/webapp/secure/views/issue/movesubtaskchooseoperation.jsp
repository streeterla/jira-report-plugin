<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<!-- STEP 1 - Move Sub Task: Choose Operation-->

<html>
<head>
	<title><webwork:text name="'movesubtask.title'"/></title>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#ffffff">
<tr>
    <td width="200" valign="top" bgcolor="#f0f0f0">
        <jsp:include page="/secure/views/issue/movetaskpane.jsp" flush="false" />
    </td>
    <td valign="top" style="padding:10px">
        <page:applyDecorator name="jiraform">
        <page:param name="title"><webwork:text name="'movesubtask.title'"/>: <webwork:text name="'move.chooseoperation.title'"/></page:param>
        <page:param name="description">
            <webwork:text name="'move.subtask.step1.desc'">
               <webwork:param name="'value0'"><webwork:property value="/issue/string('key')"/></webwork:param>
           </webwork:text>
        </page:param>
        <page:param name="action"><webwork:url page="MoveSubTaskChooseOperation.jspa"><webwork:param name="'id'" value="/issue/string('id')"/></webwork:url></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="name">movesubtask</page:param>
        <page:param name="cancelURI"><webwork:property value="issuePath" /></page:param>
        <page:param name="submitId">next_submit</page:param>
        <page:param name="submitName"><webwork:property value="text('common.forms.next')"/> &gt;&gt;</page:param>
            <tr><td bgcolor="#ffffff" colspan="2">
                <table width="85%" align="absmiddle" class="centred" bgcolor="#bbbbbb" cellspacing="1px">
                    <webwork:iterator value="moveSubTaskOperations" status="'status'">
                         <%-- if the operation is available draw the radio button --%>
                         <webwork:if test="/canPerform(.) == true">
                             <tr class="<webwork:if test="@status/even == true">rowAlternate</webwork:if><webwork:else>rowNormal</webwork:else>"
                                 id="cell<webwork:property value="./nameKey"/>">
                             <td align="center">
                                 <input type="radio" name="operation" id="<webwork:property value="./nameKey"/>_id" value="<webwork:property value="./nameKey"/>">
                             </td>
                             <td>
                                 <label for="<webwork:property value="./nameKey"/>_id"><webwork:text name="./nameKey"/></label>
                             </td>
                             <td>
                                 <label for="<webwork:property value="./nameKey"/>_id"><webwork:text name="./descriptionKey"/></label>
                             </td>
                             </tr>
                         </webwork:if>
                         <webwork:else>
                            <tr>
                             <td valign="top" bgcolor="#f0f0f0" align="center"><webwork:text name="'bulkedit.constants.na'"/></td>
                             <td  bgcolor="#f0f0f0">
                                 <webwork:text name="./nameKey"/>
                             </td>
                             <td  bgcolor="#f0f0f0">
                                 <webwork:text name="/cannotPerformMessageKey(.)">
                                     <webwork:param name="'value0'"><b><font color="#bb0000"></webwork:param>
                                     <webwork:param name="'value1'"></font></b></webwork:param>
                                 </webwork:text>
                             </td>
                             </tr>
                         </webwork:else>
                     </webwork:iterator>
                </table>
            </td></tr>
        </page:applyDecorator>
    </td>
</tr>
</table>
</body>
</html>
