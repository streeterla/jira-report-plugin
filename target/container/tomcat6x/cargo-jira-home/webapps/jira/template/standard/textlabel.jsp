<%--
  -- WebWork, Web Application Framework
  --
  -- Distributable under LGPL license.
  -- See terms of license at opensource.org
  --
  --
  -- textlabel.jsp
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
         <webwork:if test="."><span id="<webwork:property value="parameters['name']" />"><webwork:property value="."/></span></webwork:if>
      </webwork:property>

	  <webwork:property value="parameters['texthtml']">
         <webwork:if test="."><webwork:property value="." escape="false"/></webwork:if>
      </webwork:property>

<%@ include file="/template/standard/controlfooter.jsp" %>
