<%@ page import="com.atlassian.jira.ComponentManager"%>
<%@ page import="com.atlassian.jira.bean.SubTask"%>
<%@ page import="com.atlassian.jira.bean.SubTaskBean"%>
<%@ page import="com.atlassian.jira.issue.Issue"%>
<%@ page import="com.atlassian.jira.issue.IssueUtils"%>
<%@ page import="com.atlassian.jira.issue.util.AggregateTimeTrackingBean"%>
<%@ page import="com.atlassian.jira.web.action.issue.ViewIssue"%>
<%@ page import="com.atlassian.jira.web.component.IssueTableLayoutBean"%>
<%@ page import="com.atlassian.jira.web.component.IssueTableWebComponent"%>
<%@ page import="com.atlassian.jira.web.component.TableLayoutFactory"%>
<%@ page import="com.opensymphony.user.User"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>


<%-- Ensure we retrive 'all' subtasks and see whetehr there are any of them, and not just sub-tasks for current view, as
if there are no sub-tasks for current view, vut still some exists, we should draw the subtasks table. See JRA-5087 --%>
<webwork:if test="/applicationProperties/option('jira.option.allowsubtasks')  == true">
<webwork:if test="/subTaskBean/subTasks('all')/empty == false || /applicationProperties/option('jira.view.issue.show.quicksubtask.when.no.subtasks') == true">
<div class="module" id="view-subtasks">
    <div class="mod-header">
        <webwork:if test="/subTaskCreatable == true">
            <ul id="stqc_link" class="ops">
                <li><a id="stqc_show" href="?stqc=show" class="icon icon-add16" title="<webwork:text name="'viewissue.subtasks.quickcreate.addsubtask.label'"/>"><span><webwork:text name="'viewissue.subtasks.quickcreate.addsubtask.label'"/></span></a></li>
            </ul>
        </webwork:if>
        <h3><webwork:text name="'issue.field.subtasks'"/></h3>
    </div>
    <div class="mod-content intform">



<webwork:if test="/subTaskCreatable == true">
    <form enctype="multipart/form-data" id="stqcform" name="stqcform" action="<%= request.getContextPath() %>/secure/CreateSubTaskIssueDetails.jspa" method="post" onsubmit="if (this.submitted) return false; this.submitted = true; return true">
    <webwork:component name="'atl_token'" value="/xsrfToken" template="hidden.jsp"/>
    <webwork:property value="/subTaskQuickCreationWebComponent/html()" escape="'false'" />

    </form>

</webwork:if>


        <div class="tabwrap tabs2">

            <webwork:if test="/applicationProperties/option('jira.option.timetracking')  == false">
            <div class="subtask-prog-wrap">
                <h5><webwork:text name="'viewissue.subtasks.progress'"/></h5>
                <table id="subtasks_resolution_percentage" cellspacing="0" cellpadding="0" border="0">
                    <tr>
                        <webwork:component template="percentagegraph.jsp" name="'/subTaskBean/subTaskProgress'" />
                    </tr>
                </table>
            </div>
            </webwork:if>
                


            <ul id="subtasks-tabs" class="tabs horizontal">
            <webwork:if test="/subTaskView == 'all'">
                <li class="active"><strong><webwork:text name="'viewissue.subtasks.tab.all.subtasks'"/></strong></li>
                <li><a href="<%= request.getContextPath() %>/browse/<webwork:property value="/issue/string('key')"/>?subTaskView=unresolved#subtasks-tabs"><strong><webwork:text name="'viewissue.subtasks.tab.open.subtasks'"/></strong></a></li>
            </webwork:if>
            <webwork:else>
                <li><a href="<%= request.getContextPath() %>/browse/<webwork:property value="/issue/string('key')"/>?subTaskView=all#subtasks-tabs"><strong><webwork:text name="'viewissue.subtasks.tab.all.subtasks'"/></strong></a></li>
                <li class="active"><strong><webwork:text name="'viewissue.subtasks.tab.open.subtasks'"/></strong></li>
            </webwork:else>
            </ul>
        </div>





        
        <webwork:if test="/selectedIssueId != null">
            <style type="text/css">
                <!--
                #issuerow<webwork:property value="/selectedIssueId"/> {background-color: #f2f2f2;}
                -->
            </style>
        </webwork:if>






<webwork:property value="/subTaskBean/subTasks(/subTaskView)" id="subtasks"/>
<webwork:property value="/" id="viewIssueAction"/>

    <webwork:if test="@subtasks != null && @subtasks/empty == false">
        <%
            ViewIssue viewIssue = (ViewIssue) pageContext.getAttribute("viewIssueAction");
            AggregateTimeTrackingBean aggregateTTBean = viewIssue.getAggregateTimeTrackingBean();


            SubTaskBean subTaskBean = viewIssue.getSubTaskBean();
            String subTaskView = viewIssue.getSubTaskView();
            Collection issues = subTaskBean.getSubTasks(subTaskView);
            Issue parentIssue = viewIssue.getIssueObject();
            User user = viewIssue.getRemoteUser();

            List issueObjects = new ArrayList();
            boolean atLeastOneIssueHasTimeTrackingData = false;
            // get the subtask Issue object out of each SubTask and calculate if we need to display timetracking progress
            for (java.util.Iterator iterator = issues.iterator(); iterator.hasNext();)
            {
                SubTask subTask = (SubTask) iterator.next();
                Issue subTaskIssue = subTask.getSubTaskIssueObject();
                atLeastOneIssueHasTimeTrackingData = atLeastOneIssueHasTimeTrackingData || IssueUtils.hasTimeTracking(subTaskIssue);
                issueObjects.add(subTaskIssue);
            }

            IssueTableWebComponent issueTable = new IssueTableWebComponent();
            TableLayoutFactory layoutFactory = (TableLayoutFactory) ComponentManager.getComponentInstanceOfType(TableLayoutFactory.class);
            IssueTableLayoutBean layout = layoutFactory.getSubTaskIssuesLayout(user, parentIssue, subTaskBean, subTaskView, atLeastOneIssueHasTimeTrackingData);

            layout.addCellDisplayParam("aggTTBean", aggregateTTBean);
            out.print(issueTable.getHtml(layout, issueObjects, null));
        %>

    </webwork:if>
    <webwork:else>
        <div class="notify info">
            <webwork:text name="'viewissue.subtasks.notasksforview'"/>
        </div>
    </webwork:else>

	
</div>
</div>

</webwork:if>
</webwork:if>
