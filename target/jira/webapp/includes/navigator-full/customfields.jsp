<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<webwork:iterator value="/validCustomFields(.)">
    <webwork:if test="./value(@issue) != null">
        <tr>
            <td bgcolor="#f0f0f0" width="20%" valign="top"><b><webwork:property value="./name" />:</b></td>
            <td bgcolor="#ffffff" width="80%">
                <webwork:property value="/customFieldHtml(., @issueGv)" escape="false" />
            </td>
        </tr>
    </webwork:if>
</webwork:iterator>

