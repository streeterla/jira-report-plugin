<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<table class="grid centered" id="summary_table">
    <tr>
        <th><webwork:text name="'bulk.migrate.overview.project'"/></th>
        <th><webwork:text name="'bulk.migrate.overview.issuetype'"/></th>
        <th><webwork:text name="'bulk.migrate.overview.affected'"/></th>
    </tr>
<webwork:iterator value="/multiBulkMoveBean/issuesInContext" status="'status'">
<tr>
    <td>
        <webwork:property value="./key/project/string('name')" /><br />
        <span class="smallGrey"><webwork:property value="./key/project/string('description')" /></span>
    </td>
    <td>
        <ul class="imagebacked"><li style="background-image: url('<webwork:url value="./key/issueTypeObject/iconUrl" />')"><webwork:property value="./key/issueTypeObject/nameTranslation" /><br />
        <span class="smallGrey"><webwork:property value="./key/issueTypeObject/descTranslation" /></span></li>
        </ul>
    </td>
    <td>
        <webwork:property value="./value/size()" />
    </td>
</tr>
</webwork:iterator>
</table>
