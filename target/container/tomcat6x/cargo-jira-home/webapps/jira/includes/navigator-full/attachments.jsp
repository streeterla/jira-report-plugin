<%@ taglib uri="webwork" prefix="webwork" %>
<webwork:property value="/attachmentManager/attachments(@issueGv)">
    <webwork:if test=". != null && size > 0">
        <tr>
            <td bgcolor="#f0f0f0" width="20%" valign="top" style="font-weight:bold;">
                <webwork:text name="'common.concepts.attachments.files'"/>:
            </td>
            <td bgcolor="#ffffff" valign="top">
                <%-- Iterate over the attachments of the issue stored in . --%>
                <webwork:iterator value="." status="'attachmentstatus'">
                    <%@ include file="/includes/icons/attachment.jsp" %>
                    <webwork:property value="string('filename')"/> &nbsp;&nbsp;&nbsp;
                </webwork:iterator>
            </td>
        </tr>
    </webwork:if>
</webwork:property>
