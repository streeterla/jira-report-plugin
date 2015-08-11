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
         statusToStepMap.put("1", new Integer(1));
         statusToStepMap.put("2", new Integer(2));
         statusToStepMap.put("3", new Integer(3));
         statusToStepMap.put("4", new Integer(5));
         statusToStepMap.put("5", new Integer(4));
         statusToStepMap.put("6", new Integer(6));
     }
     static String printKey(HttpServletRequest request, String key)
     {
         return "<a href='"+request.getContextPath()+"/browse/"+key+"'>"+key+"</a>";
     }
 %>
<html>
<body>
<h3><a href="http://jira.atlassian.com/browse/JRA-2674">JRA-2674</a>-fixer. </h3>
<p><webwork:text name="'admin.fixworkflow.script.description'"/></p>
<p><a href="fixworkflow.jsp?preview=true"><webwork:text name="'admin.fixworkflow.click.to.preview'"/></a></p>
<p><a href="fixworkflow.jsp?run=true"><webwork:text name="'admin.fixworkflow.click.to.fix'"/></a></p>
<%
    boolean isRun = request.getParameter("run") != null;
    boolean isPreview = request.getParameter("preview") != null;
    if (isPreview || isRun)
    {
        out.println("<hr><h2>Script "+(isPreview ? "Preview" : "Run" )+"</h2>");
        GenericDelegator genericDelegator = CoreFactory.getGenericDelegator();
        List issues = genericDelegator.findAll("Issue");
        for (int i = 0; i < issues.size(); i++)
        {
            GenericValue issue = (GenericValue) issues.get(i);
            List currentSteps = genericDelegator.findByAnd("OSCurrentStep", EasyMap.build("entryId", issue.getLong("workflowId")), EasyList.build("startDate DESC"));
            String key = issue.getString("key");
            String keyStr = printKey(request, key);
            GenericValue step;
            switch (currentSteps.size()) {
                case 0:
                    // Not a problem - current step will be created when 'Resolved' (a global action that is always available) is clicked
                    out.println("Issue "+keyStr+" has no currentstep  (not a problem)<br>");
                    break;
                case 1:
                    // The usual case - 1 currentstep per issue.  Check if the issue status corresponds (through the almost-identity mapping) to the step id
                    step = (GenericValue) currentSteps.get(0);
                    
                    if (!step.getInteger("stepId").equals(statusToStepMap.get(issue.getString("status"))))
                    {
                        out.println("Issue "+keyStr+" has status "+issue.getString("status")+" but currentstep has status "+step.getInteger("stepId")+"<br>");
                    }
                    break;
                default:
                    // Broken workflow - more than one currentstep per issue. In this case we use the last updated currentstep (and verify the mapping), and delete the others
                    out.println("Multiple workflow steps for "+keyStr+" with status "+issue.getString("status")+":<br>");
                    step = (GenericValue) currentSteps.get(0);
                    if (!step.getInteger("stepId").equals(statusToStepMap.get(issue.getString("status"))))
                    {
                        out.println("Unexpected first step id. ");
                        out.println("Issue "+keyStr+" has status "+issue.getString("status")+" but currentstep has status "+step.getInteger("stepId")+"<br>");
                    }
                    else
                    {
                        out.println("<ol>");
                        out.println("<li>Correct currentstep: "+step+"</li>");
                        for (int j=1; j < currentSteps.size(); j++)
                        {
                            step = (GenericValue) currentSteps.get(j);
                            out.println("<li>Incorrect currentstep "+step.getString("startDate")+", "+step.getString("stepId")+"</li>");

                            if (isRun)
                            {
                                out.println("<li><font color='red'>Deleting</font> "+step.getString("startDate")+", "+step.getString("stepId")+"</li>");
                                step.remove();
                            }
                        }
                        out.println("</ol>");
                    }
                    out.println("<br>");
                    break;
            }
        }
        if (isRun)
        {
            out.println("<strong>Database modified -- issues fixed</strong>");
        }
    }
%>
