package com.atlassian.plugins.jira.report;

import com.atlassian.jira.issue.search.SearchException;
import com.atlassian.jira.issue.search.SearchProvider;
import com.atlassian.jira.jql.builder.JqlQueryBuilder;
import com.atlassian.jira.plugin.report.impl.AbstractReport;
import com.atlassian.jira.project.ProjectManager;
import com.atlassian.jira.project.version.Version;
import com.atlassian.jira.project.version.VersionManager;
import com.atlassian.jira.util.I18nHelper;
import com.atlassian.jira.util.ParameterUtils;
import com.atlassian.jira.web.action.ProjectActionSupport;
import com.atlassian.jira.web.bean.I18nBean;
import com.atlassian.jira.web.util.OutlookDate;
import com.atlassian.jira.web.util.OutlookDateManager;
import com.atlassian.query.Query;
import com.opensymphony.user.User;
import org.apache.log4j.Logger;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Arrays;
import java.util.TreeMap;

/**
 * generate diagrams for KPI and version report
 * @author sm30264
 */
public class IssueSummaryReport extends AbstractReport
{
	//fields
    private static final Logger LOG = Logger.getLogger(IssueSummaryReport.class);
    // The highest issue count encountered in a search
    private long m_iMaxCount = 0;
    //Issue counting variables
    private int m_iNumberOfAssignedIssues;
    private int m_iNumberOfCheckedInIssues;
    private int m_iNumberOfDefinedIssues;
    private int m_iNumberOfInWorkIssues;
    private int m_iNumberOfOpenIssues;
    private int m_iNumberOfReviewedIssues;
    private int m_iNumberOfRecentIssues;
    //saves the maximum number of an issue type
    private int m_iMaxIssue;
    //Array to save the number of each issue type
    private int[] arrIssueNumberArray;
    //temporary Dates to show weekly progress of the issues
    private Date m_oTempDate1;
    private Date m_oTempDate2;
    //week iterator for weekly progress
    int m_iNumberOfWeeks = 1;
    //Collection to save number of assigned issues for each week
    private Collection<Object> assignedCollector = new ArrayList<Object>();
    //Collection to save number of checked in issues for each week
    private Collection<Object> checkedInCollector = new ArrayList<Object>();
    //Collection to save number of closed issues for each week
    private Collection<Object> closedCollector = new ArrayList<Object>();
    //Collection to save number of defined issues for each week
    private Collection<Object> definedCollector = new ArrayList<Object>();
    //Collection to save number of in work issues for each week
    private Collection<Object> inWorkCollector = new ArrayList<Object>();
    //Collection to save number of opened issues for each week
    private Collection<Object> openedCollector = new ArrayList<Object>();
    //Collection to save number of reviewed issues for each week
    private Collection<Object> reviewedCollector = new ArrayList<Object>();
    //Collection to save number of tested issues for each week
    private Collection<Object> testedCollector = new ArrayList<Object>();
    //Collection to save number of recent issues for each week
    private Collection<Object> recentCollector = new ArrayList<Object>();
  
    //save the type of the report - KPI or a versions report
    private String sReportType;
    
    // Pass required information to the velocity template
    private final static Map<String, Object> velocityParams = new HashMap<String, Object>();
    
    //save all versions
    private Collection<Version> versions;
    //map for all issues of a version
    private TreeMap<String, Integer[]> versionIssueCollector = new TreeMap<String, Integer[]>();
    
    //provider for jql
    private final SearchProvider m_oSearchProvider;
    
    //managers for dates, project and versions
    private final OutlookDateManager m_oOutlookDateManager;
    private final ProjectManager m_oProjectManager;
    private final VersionManager m_oVersionManager;


    //Constructor
    public IssueSummaryReport(SearchProvider oSearchProvider, OutlookDateManager oOutlookDateManager, ProjectManager oProjectManager, VersionManager oVersionManager)
    {
        this.m_oSearchProvider = oSearchProvider;
        this.m_oOutlookDateManager = oOutlookDateManager;
        this.m_oProjectManager = oProjectManager;
        this.m_oVersionManager = oVersionManager;
    }

    /**
     * create the report and put its values to velocity
     * @return descriptor for web GUI
     */
    public String generateReportHtml(ProjectActionSupport oAction, Map params) throws Exception
    {
        User oRemoteUser = oAction.getRemoteUser(); 
        I18nHelper i18nBean = new I18nBean(oRemoteUser);

        // Retrieve the project parameter
        Long lProjectId = ParameterUtils.getLongParam(params, "projectid");
        // Retrieve the start and end dates and the time interval specified by the user
        Date oStartDate = ParameterUtils.getDateParam(params, "startDate", i18nBean.getLocale());
        Date oEndDate = ParameterUtils.getDateParam(params, "endDate", i18nBean.getLocale());
        // Retrieve weather a KPI or a versions report should be displayed
        sReportType = ParameterUtils.getStringParam(params, "reporttypeid");

        m_iNumberOfAssignedIssues = getAssignedIssueCount(oRemoteUser, oStartDate, oEndDate, lProjectId);
        m_iNumberOfCheckedInIssues = getCheckedInIssueCount(oRemoteUser, oStartDate, oEndDate, lProjectId);
        m_iNumberOfDefinedIssues = getDefinedIssueCount(oRemoteUser, oStartDate, oEndDate, lProjectId);
        m_iNumberOfInWorkIssues = getInWorkIssueCount(oRemoteUser, oStartDate, oEndDate, lProjectId);
        m_iNumberOfOpenIssues = getOpenedIssueCount(oRemoteUser, oStartDate, oEndDate, lProjectId);
        m_iNumberOfReviewedIssues = getReviewedIssueCount(oRemoteUser, oStartDate, oEndDate, lProjectId);
        m_iNumberOfRecentIssues = getRecentIssueCount(oRemoteUser, lProjectId);
        arrIssueNumberArray = new int[]
        {
        		m_iNumberOfDefinedIssues,
        		m_iNumberOfAssignedIssues,
        		m_iNumberOfInWorkIssues,
        		m_iNumberOfCheckedInIssues,
        		m_iNumberOfReviewedIssues, 
        		m_iNumberOfRecentIssues
        };
        //move greatest number of issue to last position of the array...
        Arrays.sort(arrIssueNumberArray);
        //... and save it in a new variable
        m_iMaxIssue = arrIssueNumberArray[arrIssueNumberArray.length-1];

        if (m_iMaxCount < 0)
            oAction.addErrorMessage(oAction.getText("report.issuesummary.error"));
        
        //create KPI-Diagram
        createWeeklyDiagramm(oStartDate, oEndDate, oRemoteUser, lProjectId);
        //create Versions-Status-Diagram
        createVersionDiagramm(oRemoteUser, lProjectId);

        // Pass the issues to the velocity template
        velocityParams.put("startDate", oStartDate);
        velocityParams.put("endDate", oEndDate);
        velocityParams.put("outlookDate", m_oOutlookDateManager.getOutlookDate(i18nBean.getLocale()));
        velocityParams.put("projectName", m_oProjectManager.getProjectObj(lProjectId).getName());
        velocityParams.put("reportType", sReportType);
        velocityParams.put("numberOfAssignedIssues", m_iNumberOfAssignedIssues);
        velocityParams.put("numberOfCheckedInIssues", m_iNumberOfCheckedInIssues);
        velocityParams.put("numberOfDefinedIssues", m_iNumberOfDefinedIssues);
        velocityParams.put("numberOfInWorkIssues", m_iNumberOfInWorkIssues);
        velocityParams.put("numberOfOpenIssues", m_iNumberOfOpenIssues);
        velocityParams.put("numberOfReviewedIssues", m_iNumberOfReviewedIssues);
        velocityParams.put("numberOfRecentIssues", m_iNumberOfRecentIssues);
        velocityParams.put("maxIssue", m_iMaxIssue);
        velocityParams.put("numberOfWeeks", m_iNumberOfWeeks);

             
        return descriptor.getHtml("view", velocityParams);
    }

    /**
     * creates weekly diagram values for KPI report and put them to velocity
     * @param oStartDate
     * @param oEndDate
     * @throws SearchException 
     */
    private void createWeeklyDiagramm(Date oStartDate, Date oEndDate, User oRemoteUser, Long lProjectId) throws SearchException
    {
    	m_iNumberOfWeeks = 1;
        //Date of the first week
    	m_oTempDate1 = oStartDate;
    	long lLongDate;
 		while(oEndDate.after(m_oTempDate1))
		{
			try 
			{
				//Date of the second week
				m_oTempDate2 = new Date(m_oTempDate1.getTime()+(7*24*60*60*1000));
				//Assigned Issues
				assignedCollector.add(getAssignedIssueCount(oRemoteUser, m_oTempDate1, m_oTempDate2, lProjectId));
				//CheckedIn Issues
				checkedInCollector.add(getCheckedInIssueCount(oRemoteUser, m_oTempDate1, m_oTempDate2, lProjectId));
				//Closed Issues
				closedCollector.add(getClosedIssueCount(oRemoteUser, m_oTempDate1, m_oTempDate2, lProjectId));
				//Defined Issues
				definedCollector.add(getDefinedIssueCount(oRemoteUser, m_oTempDate1, m_oTempDate2, lProjectId));
				//In Work Issues
				inWorkCollector.add(getInWorkIssueCount(oRemoteUser, m_oTempDate1, m_oTempDate2, lProjectId));
				//Opened Issues
				openedCollector.add(getOpenedIssueCount(oRemoteUser, m_oTempDate1, m_oTempDate2, lProjectId));
				//Reviewed Issues
				reviewedCollector.add(getReviewedIssueCount(oRemoteUser, m_oTempDate1, m_oTempDate2, lProjectId));
				//Tested Issues
				testedCollector.add(getTestedIssueCount(oRemoteUser, m_oTempDate1, m_oTempDate2, lProjectId));	
				//Recent Issues
				recentCollector.add(getRecentIssueCount(oRemoteUser, lProjectId));
			} 
			catch (Exception e)
			{
				LOG.error("An error occured");
				e.printStackTrace();
			}
			//convert current time to long
			lLongDate = m_oTempDate1.getTime(); 
			//add one week
			lLongDate += (7*24*60*60*1000);
			//convert long to new date
			m_oTempDate1 = new Date(lLongDate);
			m_iNumberOfWeeks++;
		}
		//put numbers of assigned issues as array to velocity
		velocityParams.put("assignedCollector", assignedCollector.toArray());
		//put numbers of checkedIn issues as array to velocity
		velocityParams.put("checkedInCollector", checkedInCollector.toArray());
		//put numbers of defined issues as array to velocity
		velocityParams.put("definedCollector", definedCollector.toArray());
		//put numbers of inWork issues as array to velocity
		velocityParams.put("inWorkCollector", inWorkCollector.toArray());
		//put numbers of opened issues as array to velocity
		velocityParams.put("openedCollector", openedCollector.toArray());
		//put numbers of reviewed issues as array to velocity
		velocityParams.put("reviewedCollector", reviewedCollector.toArray());
		//put numbers of tested issues as array to velocity
		velocityParams.put("testedCollector", testedCollector.toArray());
		//put numbers of recent issues as array to velocity
		velocityParams.put("recentCollector", recentCollector.toArray());
	}
    
    /**
     * create version diagram values for versions report and put them to velocity
     */
    private void createVersionDiagramm(User oRemoteUser, Long lProjectId)
    {
    	//get all versions
    	versions = m_oVersionManager.getVersions(lProjectId);
    	
    	if (versions != null)
    	{
    		int i = 0;
    		Integer tempArray[];
    		int iMaxIssuesPerVersion = 0;
    		int iTmpCounter = 0;
	    	for(Version version : versions)
	    	{
	    		//get all numbers of statuses for each version and put it to velocity
	    		tempArray = countVersionIssues(oRemoteUser, lProjectId, version);
	    		//count issues for each version except closed issues
	    		for(int number = 0; number < tempArray.length-1; number++)
	    		{
	    			iTmpCounter += tempArray[number];
	    		}
	    		versionIssueCollector.put(version.getName(), tempArray);
	    		i++;
	    		//search greatest number of issues per version
	    		if (iTmpCounter > iMaxIssuesPerVersion)
	    		{
	    			iMaxIssuesPerVersion = iTmpCounter;
	    		}
	    		iTmpCounter = 0;
	    	}
	    	velocityParams.put("maxIssuesPerVersion", iMaxIssuesPerVersion);
    	}
    	velocityParams.put("versionIssueCollector",	versionIssueCollector);
    }
    

    /**
     * Validate the parameters set by the user
     */
    public void validate(ProjectActionSupport oAction, Map params)
    {
        User oRemoteUser = oAction.getRemoteUser();
        I18nHelper i18nBean = new I18nBean(oRemoteUser);

        Date oStartDate = ParameterUtils.getDateParam(params, "startDate", i18nBean.getLocale());
        Date oEndDate = ParameterUtils.getDateParam(params, "endDate", i18nBean.getLocale());
        Long lProjectId = ParameterUtils.getLongParam(params, "projectid");

        OutlookDate outlookDate = m_oOutlookDateManager.getOutlookDate(i18nBean.getLocale());

        //parameters are not allowed to  be null. Otherwise an error message occurs
        if (oStartDate == null || !outlookDate.isDatePickerDate(outlookDate.formatDMY(oStartDate)))
            oAction.addError("startDate", oAction.getText("report.issuecreation.startdate.required"));

        if (oEndDate == null || !outlookDate.isDatePickerDate(outlookDate.formatDMY(oEndDate)))
            oAction.addError("endDate", oAction.getText("report.issuecreation.enddate.required"));
        
        if (lProjectId == null)
            oAction.addError("projectid", oAction.getText("report.issuecreation.projectid.invalid"));

        // The end date must be after the start date
        if (oStartDate != null && oEndDate != null && oEndDate.before(oStartDate))
        {
            oAction.addError("endDate", oAction.getText("report.issuecreation.before.startdate"));
        }
    }
    
    /**
     * 
     * @param oRemoteUser - JIRA-User
     * @param oStartDate - start date for the duration to show KPI report
     * @param oEndDate - end date for the duration to show KPI report
     * @param lProjectId - Project chosen by User
     * @return number of assigned issues within the duration
     * @throws SearchException
     */
    private int getAssignedIssueCount(User oRemoteUser, Date oStartDate, Date oEndDate, Long lProjectId) throws SearchException
    {
        JqlQueryBuilder oQueryBuilder = JqlQueryBuilder.newBuilder();
        Query oQuery = oQueryBuilder.where().updatedBetween(oStartDate, oEndDate).and().project(lProjectId).and().status("Assigned").buildQuery();
        return (int) m_oSearchProvider.searchCount(oQuery, oRemoteUser);
    }
    
    private int getCheckedInIssueCount(User oRemoteUser, Date oStartDate, Date oEndDate, Long lProjectId) throws SearchException
    {
        JqlQueryBuilder queryBuilder = JqlQueryBuilder.newBuilder();
        Query oQuery = queryBuilder.where().updatedBetween(oStartDate, oEndDate).and().project(lProjectId).and().status("CheckedIn").buildQuery();
    
        return (int) m_oSearchProvider.searchCount(oQuery, oRemoteUser);
    }
    
    private int getClosedIssueCount(User oRemoteUser, Date oStartDate, Date oEndDate, Long lProjectId) throws SearchException
    {
        JqlQueryBuilder queryBuilder = JqlQueryBuilder.newBuilder();
        Query oQuery = queryBuilder.where().updatedBetween(oStartDate, oEndDate).and().project(lProjectId).and().status("Closed").buildQuery();
    
        return (int) m_oSearchProvider.searchCount(oQuery, oRemoteUser);
    }
    
    private int getDefinedIssueCount(User oRemoteUser, Date oStartDate, Date oEndDate, Long lProjectId) throws SearchException
    {
        JqlQueryBuilder queryBuilder = JqlQueryBuilder.newBuilder();
        Query oQuery = queryBuilder.where().createdBetween(oStartDate, oEndDate).and().project(lProjectId).and().status("Defined").buildQuery();
    
        return (int) m_oSearchProvider.searchCount(oQuery, oRemoteUser);
    }
    
    private int getInWorkIssueCount(User oRemoteUser, Date oStartDate, Date oEndDate, Long lProjectId) throws SearchException
    {
        JqlQueryBuilder queryBuilder = JqlQueryBuilder.newBuilder();
        Query oQuery = queryBuilder.where().updatedBetween(oStartDate, oEndDate).and().project(lProjectId).and().status("InWork").buildQuery();
    
        return (int) m_oSearchProvider.searchCount(oQuery, oRemoteUser);
    }
    
    private int getOpenedIssueCount(User oRemoteUser, Date oStartDate, Date oEndDate, Long lProjectId) throws SearchException
    {
        JqlQueryBuilder queryBuilder = JqlQueryBuilder.newBuilder();
        Query oQuery = queryBuilder.where().updatedBetween(oStartDate, oEndDate).and().project(lProjectId).and().status("Open").buildQuery();
    
        return (int) m_oSearchProvider.searchCount(oQuery, oRemoteUser);
    }
    
    private int getReviewedIssueCount(User oRemoteUser, Date oStartDate, Date oEndDate, Long lProjectId) throws SearchException
    {
        JqlQueryBuilder queryBuilder = JqlQueryBuilder.newBuilder();
        Query oQuery = queryBuilder.where().updatedBetween(oStartDate, oEndDate).and().project(lProjectId).and().status("Reviewed").buildQuery();
    
        return (int) m_oSearchProvider.searchCount(oQuery, oRemoteUser);
    }
    
    private int getTestedIssueCount(User oRemoteUser, Date oStartDate, Date oEndDate, Long lProjectId) throws SearchException
    {
        JqlQueryBuilder queryBuilder = JqlQueryBuilder.newBuilder();
        Query oQuery = queryBuilder.where().updatedBetween(oStartDate, oEndDate).and().project(lProjectId).and().status("Tested").buildQuery();
    
        return (int) m_oSearchProvider.searchCount(oQuery, oRemoteUser);
    }
    
    private int getRecentIssueCount(User oRemoteUser, Long lProjectId) throws SearchException
    {
    	Date oEndDate = new Date();
    	Date oStartDate = new Date(oEndDate.getTime()- 7*24*60*60*1000);
    	JqlQueryBuilder queryBuilder = JqlQueryBuilder.newBuilder();
        Query oQuery = queryBuilder.where().createdBetween(oStartDate, oEndDate).and().project(lProjectId).buildQuery();
    
        return (int) m_oSearchProvider.searchCount(oQuery, oRemoteUser);
    }
    
    /**
     * 
     * @param oRemoteUser - JIRA-User
     * @param lProjectId - Project chosen by User
     * @param oVersion - Version to collect status numbers for
     * @return array with all numbers per status depending on oVersion
     * @throws SearchException, NumberFormatException
     */
    private Integer[] countVersionIssues(User oRemoteUser, Long lProjectId, Version oVersion)
    {
    	JqlQueryBuilder queryBuilder;
    	Query oQuery;
    	Integer[] arrVersionStatus = new Integer[8];
    	
    	try 
    	{
    		//search all defined issues of the project and add it to the array
    		queryBuilder = JqlQueryBuilder.newBuilder();
    		oQuery = queryBuilder.where().project(lProjectId).and().fixVersion(oVersion.getName()).and().status("Defined").buildQuery();
			arrVersionStatus[0] = (Integer.parseInt("" + m_oSearchProvider.searchCount(oQuery, oRemoteUser)));
			
    		//search all assigned issues of the project and add it to the array
			queryBuilder = JqlQueryBuilder.newBuilder();
    		oQuery = queryBuilder.where().project(lProjectId).and().fixVersion(oVersion.getName()).and().status("Assigned").buildQuery();
			arrVersionStatus[1] = (Integer.parseInt("" + m_oSearchProvider.searchCount(oQuery, oRemoteUser)));
			
    		//search all InWork issues of the project and add it to the array
			queryBuilder = JqlQueryBuilder.newBuilder();
    		oQuery = queryBuilder.where().project(lProjectId).and().fixVersion(oVersion.getName()).and().status("InWork").buildQuery();
			arrVersionStatus[2] = (Integer.parseInt("" + m_oSearchProvider.searchCount(oQuery, oRemoteUser)));
			
    		//search all CheckedIn issues of the project and add it to the array
			queryBuilder = JqlQueryBuilder.newBuilder();
    		oQuery = queryBuilder.where().project(lProjectId).and().fixVersion(oVersion.getName()).and().status("CheckedIn").buildQuery();
			arrVersionStatus[3] = (Integer.parseInt("" + m_oSearchProvider.searchCount(oQuery, oRemoteUser)));	
			
    		//search all Reviewed issues of the project and add it to the array
			queryBuilder = JqlQueryBuilder.newBuilder();
    		oQuery = queryBuilder.where().project(lProjectId).and().fixVersion(oVersion.getName()).and().status("Reviewed").buildQuery();
			arrVersionStatus[4] = (Integer.parseInt("" + m_oSearchProvider.searchCount(oQuery, oRemoteUser)));
			
			//search all Tested issues of the project and add it to the array
			queryBuilder = JqlQueryBuilder.newBuilder();
    		oQuery = queryBuilder.where().project(lProjectId).and().fixVersion(oVersion.getName()).and().status("Tested").buildQuery();
			arrVersionStatus[5] = (Integer.parseInt("" + m_oSearchProvider.searchCount(oQuery, oRemoteUser)));
			
    		//search all Open issues of the project and add it to the array
			queryBuilder = JqlQueryBuilder.newBuilder();
    		oQuery = queryBuilder.where().project(lProjectId).and().fixVersion(oVersion.getName()).and().status("Defined", "Assigned", "InWork").buildQuery();
			arrVersionStatus[6] = (Integer.parseInt("" + m_oSearchProvider.searchCount(oQuery, oRemoteUser)));
			
			//search all Closed issues of the project and add it to the array
			queryBuilder = JqlQueryBuilder.newBuilder();
    		oQuery = queryBuilder.where().project(lProjectId).and().fixVersion(oVersion.getName()).and().status("Closed").buildQuery();
			arrVersionStatus[7] = (Integer.parseInt("" + m_oSearchProvider.searchCount(oQuery, oRemoteUser)));


		} 
    	catch (SearchException e) 
		{
			System.err.println("A SearchException occured:");
			e.printStackTrace();
		} 
    	catch (NumberFormatException e) 
		{
    		System.err.println("A NumberFormatException occured:");
			e.printStackTrace();
		}
    	
    	return arrVersionStatus;
    }
}
