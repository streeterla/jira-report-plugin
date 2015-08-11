<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'bulk.migrate.title'"/></title>
</head>
<body>

<page:applyDecorator name="bulkpanel" >
    <page:param name="title"><webwork:text name="'bulk.migrate.title'"/>: <webwork:text name="'bulk.migrate.overview.title'"/></page:param>
    <page:param name="action">BulkMigrateChooseContext.jspa</page:param>
    <webwork:property value="'true'" id="hideSubMenu" />
    <page:param name="instructions">
        <p>
        <webwork:text name="'bulk.migrate.overview.instructions'">
            <webwork:param name="'value0'"><strong><webwork:property value="/currentRootBulkEditBean/selectedIssues/size"/></strong></webwork:param>
            <webwork:param name="'value1'"><strong><webwork:property value="/currentRootBulkEditBean/projectIds/size"/></strong></webwork:param>
            <webwork:param name="'value2'"><strong><webwork:property value="/currentRootBulkEditBean/issueTypes/size"/></strong></webwork:param>
            <webwork:param name="'value3'"><strong><webwork:property value="/multiBulkMoveBean/issuesInContext/size"/></strong></webwork:param>
        </webwork:text>
        <webwork:if test="/currentRootBulkEditBean/subTaskCollection == true">
            <webwork:text name="'bulk.migrate.overview.subtask.warning'" />
        </webwork:if>
        </p>
        <p>
            <webwork:text name="'bulk.migrate.overview.help'" />
        </p>
        <webwork:if test="/currentRootBulkEditBean/relatedMultiBulkMoveBean/subTasksDiscarded > 0">
            <div class="noteBox">
                <webwork:text name="'bulk.migrate.overview.subtask.warning.discarded'">
                    <webwork:param name="'value0'"><strong><webwork:property value="/currentRootBulkEditBean/relatedMultiBulkMoveBean/subTasksDiscarded" /></strong></webwork:param>
                </webwork:text>
            </div>
        </webwork:if>
    </page:param>


<script language="JavaScript" type="text/javascript">
<!--
    var bulkEditBeanIds = new Array();
<webwork:iterator value="./multiBulkMoveBean/bulkEditBeans" status="'status'">
<webwork:if test="./value/subTaskCollection == false">
   bulkEditBeanIds[bulkEditBeanIds.length] = '<webwork:property value="./value/key" />';
</webwork:if>
</webwork:iterator>

    function toggle(keyToStillShow)
    {
        var sameAsBulkEditBean = document.getElementById("sameAsBulkEditBean");
        var sameAsProject = document.getElementById(sameAsBulkEditBean.value + "project");
        var sameAsIssueType = document.getElementById(sameAsBulkEditBean.value + "issuetype");

        var e;
        for (i = 0; i < bulkEditBeanIds.length; i++)
        {
            if (bulkEditBeanIds[i] != keyToStillShow)
            {
                e = document.getElementById(bulkEditBeanIds[i]);
                if (e.style.display != 'none')
                {
                    e.style.display = 'none';
                    // document.getElementById(bulkEditBeanIds[i] + 'pid');
                }
                else
                {
                    e.style.display = '';
                }
            }
        }
    }
//-->
</script>

<ui:component name="'subTaskPhase'" template="hidden.jsp"  />

<webwork:iterator value="./multiBulkMoveBean/bulkEditBeans" status="'status'">

    <%@include file="/secure/views/bulkedit/includes/chooseContext.jsp" %>

</webwork:iterator>

<script language="JavaScript" type="text/javascript">
<!--
var sameAsBulkEditBean = document.getElementById("sameAsBulkEditBean");
if (sameAsBulkEditBean && sameAsBulkEditBean.checked)
{
    toggle(sameAsBulkEditBean.value);
}
//-->
</script>

</page:applyDecorator>

</body>
</html>
