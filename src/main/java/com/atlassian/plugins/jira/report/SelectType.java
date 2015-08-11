package com.atlassian.plugins.jira.report;

import java.util.HashMap;
import java.util.Map;
import com.atlassian.configurable.ValuesGenerator;

/**
 * 
 * @author sm30264
 * create values for report type
 */
public class SelectType implements ValuesGenerator
{
	//Map with report types
	Map<Integer, String> types = new HashMap<Integer, String>();
	
	@SuppressWarnings("unchecked")
	/**
	 * puts requested values into a map
	 * @author sm30264
	 * @return map with requested values, key as running number, value as report type
	 */
	public Map getValues(Map arg0) 
	{
		types.put(1, "KPI-Report");
		types.put(2, "Versions-Status-Report");
		
		return types;
	}

}