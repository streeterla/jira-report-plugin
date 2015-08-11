<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'bulk.migrate.title'"/></title>
</head>
<body>

<page:applyDecorator name="bulkpanel">
    <page:param name="action">BulkMigratePerform.jspa</page:param>
    <page:param name="title"><webwork:text name="'bulk.migrate.title'"/>: <webwork:text name="'bulk.migrate.confirm.title'"/></page:param>
    <page:param name="instructions">
        <p><webwork:text name="'bulk.migrate.confirm.instructions'"/></p>
        <ul class="square_blue">
        <webwork:iterator value="/multiBulkMoveBean/bulkEditBeans" status="'status'">
           <li>
            <a href="#<webwork:property value="./key/project/string('id')" /><webwork:property value="./key/issueTypeObject/id" />"><webwork:property value="./key/project/string('name')" /> - <webwork:property value="./key/issueTypeObject/name" /></a>
            <webwork:property value="./value/relatedMultiBulkMoveBean/bulkEditBeans">
                <webwork:if test=".">
                 <ul>
                   <webwork:iterator value="." status="'status'">
                       <li><a href="#<webwork:property value="./key/project/string('id')" /><webwork:property value="./key/issueTypeObject/id" />"><webwork:property value="./key/project/string('name')" /> - <webwork:property value="./key/issueTypeObject/name" /></a></li>
                  </webwork:iterator>
                   </ul>
                </webwork:if>
            </webwork:property>

            </li>
        </webwork:iterator>
        </ul>
    </page:param>
    <style>
        table.jiraform
        {
            margin-bottom: 10px;
        }
    </style>
    <ui:component name="'subTaskPhase'" template="hidden.jsp"  />

    <!-- Send Mail confirmation -->
    <webwork:if test="/canDisableMailNotifications() == true && /bulkEditBean/hasMailServer == true">
        <table class="centered" width="80%"><tr><td>
            <jsp:include page="/includes/bulkedit/bulkedit-sendnotifications-confirmation.jsp"/>
        </td></tr></table>
    </webwork:if>

    <webwork:iterator value="/multiBulkMoveBean/bulkEditBeans" status="'status'">
        <%@include file="confirm.jsp"%>
        <webwork:if test="./value/relatedMultiBulkMoveBean/bulkEditBeans != null">
            <webwork:iterator value="./value/relatedMultiBulkMoveBean/bulkEditBeans" status="'status'">
                <%@include file="confirm.jsp"%>
            </webwork:iterator>
        </webwork:if>
    </webwork:iterator>
</page:applyDecorator>
</body>
</html>
