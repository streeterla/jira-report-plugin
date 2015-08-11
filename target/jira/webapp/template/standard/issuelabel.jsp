<%--
  -- WebWork, Web Application Framework
  --
  -- Distributable under LGPL license.
  -- See terms of license at opensource.org
  --
  --
  -- issuelabel.jsp
  --
  -- Make the 'tag text' link to the Issue via ViewIssue.jspa?key='{issue key}'
  --
  -- Required Parameters:
  --   * label      - The description that will be used to identfy the control.
  --   * name       - The name of the attribute to put and pull the result from.
  --
  -- Optional Parameters:
  --   * labelposition   - determines were the label will be place in relation
  --                       to the control.  Default is to the left of the control.
  --
  --%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<%@ include file="/template/standard/controlheader.jsp" %>

      <webwork:property value="parameters['nameValue']">
         <webwork:if test="."><a href="<%=request.getContextPath()%>/browse/<webwork:property value="."/>"><webwork:property value="."/></a></webwork:if>
      </webwork:property>

	  <webwork:property value="parameters['texthtml']">
         <webwork:if test="."><webwork:property value="."/></webwork:if>
      </webwork:property>

<%@ include file="/template/standard/controlfooter.jsp" %>
