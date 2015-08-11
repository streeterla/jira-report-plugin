 <%@ page import="com.atlassian.core.ofbiz.CoreFactory,
                 java.util.List,
                 org.ofbiz.core.entity.GenericValue,
                 org.ofbiz.core.entity.GenericDelegator,
                 com.atlassian.core.util.collection.EasyList,
                 java.util.HashMap,
                  com.atlassian.core.util.map.EasyMap"%>
 <%!
     static HashMap statusToStepMap = new HashMap();
     static {
         // map from Issue.status ('issuestatus' table) to OSCurrentStep.status (jira-workflow.xml)
         statusToStepMap.put("1", new Integer(1)); // Open
         statusToStepMap.put("2", new Integer(2)); // n/a
         statusToStepMap.put("3", new Integer(3)); // In Progress
         statusToStepMap.put("4", new Integer(5)); // Reopened
         statusToStepMap.put("5", new Integer(4)); // Resolved
         statusToStepMap.put("6", new Integer(6)); // Closed
     }
     static String printKey(HttpServletRequest request, String key)
     {
         return "<a href='"+request.getContextPath()+"/browse/"+key+"'>"+key+"</a>";
     }
     static String formatAction(HttpServletRequest request, String issueKey, String problem, String cause, String resolution)
     {
         return "<tr><td>"+printKey(request, issueKey)+"</td>" + 
                 "<td>"+problem+"</td>" +
                 "<td>"+(cause.startsWith("JRA") ? "<a href='http://jira.atlassian.com/browse/"+cause+"'>"+cause+"</a>" : cause)+"</td>" +
                 (resolution != null ? "<td>"+resolution+"</td>" : "") + "</tr>";
     }
 %>
<html>
<head><title><webwork:text name="'admin.dbchecker.title'"/></title></head>
<body>
<h3><webwork:text name="'admin.dbchecker.data.validity.checker'"/></h3>
<p><webwork:text name="'admin.dbchecker.description'"/></p>
<style type="css">
body { background-color: red; }
ul { list-style-image: url('http://localhost:8090<%=request.getContextPath()%>/images/icons/bullet_creme.gif'); }
</style>
<ul style="list-style-image: url(<%=request.getContextPath()%>/images/icons/bullet_creme.gif)">
  <li><a href="dbchecker.jsp?preview=true"><webwork:text name="'admin.dbchecker.clicktopreview'"/></a></li>
  <li><a href="dbchecker.jsp?run=true"><webwork:text name="'admin.dbchecker.clicktofix'"/></a></li>
</ul>
<%
    boolean isRun = request.getParameter("run") != null;
    boolean isPreview = request.getParameter("preview") != null;
    if (isPreview || isRun)
    {
        out.println("<hr><h2>Script "+(isPreview ? "Preview" : "Run" )+"</h2><br>");
        out.println("<table border='1' cellpadding='5' cellspacing='4'>");
        out.println("<tr><th>Issue</th><th>Problem</th><th>Cause</th>"+(isRun ? "<th>Resolution</th>" : "")+"</tr>");
        GenericDelegator genericDelegator = CoreFactory.getGenericDelegator();
        List issues = genericDelegator.findAll("Issue");
        for (int i = 0; i < issues.size(); i++)
        {
            String problem = null;
            String resolution = null;
            GenericValue issue = (GenericValue) issues.get(i);
            String key = issue.getString("key");
            String keyStr = printKey(request, key);
                        
            String status = issue.getString("status");
            if (status == null)
            {
                problem = "null issue status";
                if (isRun) {
                    resolution = "Reset status to Open";
                    issue.set("status", "1");
                    issue.store();
                }
                out.println(formatAction(request, key, problem, "JRA-2872", resolution));
            }
            List currentSteps = genericDelegator.findByAnd("OSCurrentStep", EasyMap.build("entryId", issue.getLong("workflowId")), EasyList.build("startDate DESC"));
            GenericValue step;
            switch (currentSteps.size()) {
                case 0:
                    // Not a problem - current step will be created when 'Resolved' (a global action that is always available) is clicked
                    out.println(formatAction(request, key, "No currentstep (not a problem)", "", null));
                    break;
                case 1:
                    // The usual case - 1 currentstep per issue.  Check if the issue status corresponds (through the almost-identity mapping) to the step id
                    step = (GenericValue) currentSteps.get(0);
//                    if (step.getInteger("stepId").equals("2"))
//                    {
//                        problem = "Issue workflow at old 'Assigned' step";
//                        if (isRun)
//                        {
//                            step.set("stepId", "1");
//                            step.store();
//                            resolution = "Changed workflow step from 'Assigned' to 'Open'";
//                        }
//                        out.println(formatAction(request, key, problem, "JRA-2674", resolution));
//                        
//                    }
                    if (!step.getInteger("stepId").equals(statusToStepMap.get(issue.getString("status"))))
                    {
                        problem = "Issue "+keyStr+" has status "+issue.getString("status")+" but currentstep has status "+step.getInteger("stepId");
                        if (isRun)
                        {
                            Object newStepId = statusToStepMap.get(issue.getString("status"));
                            resolution = "Reset workflow step id to "+newStepId;
                            step.set("stepId", newStepId);
                            step.store();
                        }
                        out.println(formatAction(request, key, problem, "JRA-2875", resolution));
                    }
                    break;
                default:
                    // Broken workflow - more than one currentstep per issue. In this case we use the last updated currentstep (and verify the mapping), and delete the others
                    problem = "Multiple workflow steps for "+keyStr+" with status "+issue.getString("status")+": ";
                    step = (GenericValue) currentSteps.get(0);
                    if (!step.getInteger("stepId").equals(statusToStepMap.get(issue.getString("status"))))
                    {
                        problem += "Unexpected first step id. ";
                        problem += "Issue "+keyStr+" has status "+issue.getString("status")+" but currentstep has status "+step.getInteger("stepId");
                        if (isRun)
                        {
                            Object newStepId = statusToStepMap.get(issue.getString("status"));
                            resolution = "Reset workflow step id to "+newStepId;
                            step.set("stepId", newStepId);
                            step.store();
                        }
                    }
                    else
                    {
                        resolution = "Correct currentstep: "+step+"<br>";
                        for (int j=1; j < currentSteps.size(); j++)
                        {
                            step = (GenericValue) currentSteps.get(j);
                            problem += "Incorrect currentstep "+step.getString("startDate")+", "+step.getString("stepId");

                            if (isRun)
                            {
                                resolution += "Deleting "+step.getString("startDate")+", "+step.getString("stepId");
                                step.remove();
                            }
                        }
                    }
                    out.println(formatAction(request, key, problem, "JRA-2674", resolution));
                    break;
            }
        }
        out.println("</table>");
        if (isRun && issues.size() > 0)
        {
            out.println("<br><strong>Database modified -- issues fixed.  <a href='dbchecker.jsp?preview=true'>Rerun</a> to verify no problems remain.  You may also need to <a href='"+request.getContextPath()+"/secure/admin/jira/IndexAdmin.jspa'>reindex</a> afterwards.</strong>");
        }
    }
%>
