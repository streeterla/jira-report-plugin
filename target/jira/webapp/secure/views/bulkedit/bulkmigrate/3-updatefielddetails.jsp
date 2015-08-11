<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'bulk.migrate.title'"/></title>
</head>
<body>

<page:applyDecorator name="bulkpanel">
    <page:param name="action">BulkMigrateSetFields.jspa</page:param>
    <page:param name="title"><webwork:text name="'bulk.migrate.title'"/>:
        <webwork:text name="'bulk.migrate.fields.title'">
            <webwork:param name="'value0'"><webwork:property value="/bulkEditBean/targetProjectGV/string('name')" /></webwork:param>
            <webwork:param name="'value1'"><webwork:property value="/bulkEditBean/targetIssueTypeObject/name" /></webwork:param>
        </webwork:text>
    </page:param>
    <page:param name="instructions">
        <webwork:text name="'bulk.migrate.fields.instructions'">
           <webwork:param name="'value0'">
                <webwork:iterator value="./bulkEditBean/issueTypeObjects" status="'status'">
                    <webwork:component name="'issuetype'" template="constanticon.jsp">
                      <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                      <webwork:param name="'iconurl'" value="./iconUrl" />
                      <webwork:param name="'alt'"><webwork:property value="./name" /></webwork:param>
                    </webwork:component> <strong><webwork:property value="./name" /></strong><webwork:if test="@status/last == false">, </webwork:if>
                </webwork:iterator>
            </webwork:param>
            <webwork:param name="'value1'">
                <webwork:iterator value="./bulkEditBean/projects" status="'status'">
                    <strong><webwork:property value="./string('name')" /></strong><webwork:if test="@status/last == false">, </webwork:if>
                </webwork:iterator>
            </webwork:param>
        </webwork:text>

        <%--<%@ include file="/secure/views/bulkedit/updatefieldsinstruction.jsp"%>--%>

        <webwork:if test="hasAvailableActions == true">
            <webwork:text name="'bulk.move.update.fields'" />.
            <%@ include file="/secure/views/bulkedit/updatefieldsinstruction.jsp"%>
        </webwork:if>
        <webwork:else>
            <p><webwork:text name="'bulk.move.cannotperform'" /></p>
        </webwork:else>

        <webwork:property value="/bulkEditBean/messagedFieldLayoutItems">
            <webwork:if test=". != null && ./empty == false">
            <div class="noteBox">
                <table class="maxWidth blank">
                    <tr>
                        <td><b><webwork:text name="'bulk.move.fieldname'" /></b></td>
                        <td><b><webwork:text name="'bulk.move.message'" /></b></td>
                    </tr>
                    <webwork:iterator value="./keySet()">
                        <tr>
                            <td align="left" valign="top">
                                <i><webwork:text name="."/></i>:
                            </td>
                                <webwork:if test="/bulkEditBean/messagedFieldLayoutItems/(.)/warning == true">
                                    <td><span id="warning-<webwork:text name="."/>" class="warning"><webwork:property value="/bulkEditBean/messagedFieldLayoutItems/(.)/message" escape="'false'"/></span></td>
                                </webwork:if>
                                <webwork:elseIf test="/bulkEditBean/messagedFieldLayoutItems/(.)/fatal == true">
                                    <td><span id="error-<webwork:text name="."/>" class="errMsg"><webwork:property value="/bulkEditBean/messagedFieldLayoutItems/(.)/message" escape="'false'"/></span></td>
                                </webwork:elseIf>
                        </tr>
                    </webwork:iterator>
                </table>
            </div>
            </webwork:if>
        </webwork:property>
    </page:param>

    <%@include file="/secure/views/bulkedit/fielddetails.jsp"%>

    <jsp:include page="/includes/bulkedit/bulkedit-sendnotifications.jsp"/>
</page:applyDecorator>
</body>
</html>
