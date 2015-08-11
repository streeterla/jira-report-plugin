<%@ taglib uri="webwork" prefix="webwork" %>
<webwork:bean name="'com.atlassian.core.util.StringUtils'" id="stringUtils" /> <%-- this is used by issuedisplayer --%>
<%@ include file="/includes/js/multipickerutils.jsp" %>
<table>
<webwork:if test="/singleSelectOnly == 'false'">
    <webwork:if test="/selectMode == 'multiple'">
        <tr><td colspan=5><b><a href="#" onClick="javascript:populateFormMultiple(this)"><webwork:text name="'issuedisplayer.select.issues'" /></a></b></td></tr>
    </webwork:if>
    <webwork:else>
        <tr><td colspan=5><b><a href="<webwork:url ><webwork:param name="'mode'" value="/mode" /><webwork:param name="'selectMode'" value="'multiple'" /><webwork:param name="'searchRequestId'" value="/searchRequestId" /><webwork:param name="'defaultSelectMode'" value="/defaultSelectMode" /><webwork:param name="'currentIssue'" value="/currentIssue"/><webwork:param name="'formName'" value="/formName"/><webwork:param name="'linkFieldName'" value="/linkFieldName"/></webwork:url>" ><webwork:text name="'issuedisplayer.select.multiple.issues'" /></a></b></td></tr>
    </webwork:else>
</webwork:if>
<webwork:subset count="50" >
    <webwork:iterator value="." >
        <webwork:if test="/selectMode == 'multiple'">
            <tr onmouseover="rowHover(this)" ><td width="1%"><input type="checkbox" name="issuekey" value="<webwork:property value="key" />" onclick="processCBClick(event, this);"></td>
        </webwork:if>
        <webwork:else>
            <tr onmouseover="rowHover(this)"  onClick="javascript:populateForm('<webwork:property value="key" />')">
        </webwork:else>
            <td width="1%" nowrap><a href="#" title="<webwork:property value="summary" />" onClick="javascript:populateForm('<webwork:property value="key" />')"><webwork:property value="key" /></a> &nbsp;</td>
            <td><a href="#" title="<webwork:property value="summary" />" onClick="javascript:populateForm('<webwork:property value="key" />')"><webwork:property value="@stringUtils/crop(summary, 80, ' ...')" /> </td>
            <td nowrap width=1%><%@ include file="/includes/icons/priority.jsp" %></td>
            <td nowrap width=1%><%@ include file="/includes/icons/status.jsp" %></td>
        </tr>
    </webwork:iterator>
</webwork:subset>
<webwork:if test="/singleSelectOnly == 'false'">
    <webwork:if test="/selectMode == 'multiple'">
        <tr><td colspan=5><b><a href="#" onClick="javascript:populateFormMultiple(this)"><webwork:text name="'issuedisplayer.select.issues'" /></a></b></td></tr>
    </webwork:if>
</webwork:if>
</table>
