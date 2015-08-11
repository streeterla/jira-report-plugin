<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.common.words.configure'"/> - <webwork:property value="report/name" /></title>
	<meta name="decorator" content="notitle">
</head>

<body>
<!-- JRA-4345 - need to statically include the javascript to address IE6 refresh issue -->
<%@ include file="/includes/js/date_picker.jsp" %>

<page:applyDecorator name="jiraform" >
	<page:param name="method">GET</page:param>
	<page:param name="action">ConfigureReport.jspa</page:param>
	<page:param name="cancelURI"><%= request.getContextPath() %>/secure/BrowseProject.jspa</page:param>
	<page:param name="width">100%</page:param>
	<page:param name="title"><webwork:text name="'common.concepts.report'"/>: <webwork:property value="report/label" /></page:param>
	<page:param name="description">
        <webwork:if test="report/description"><b><webwork:text name="'common.concepts.description'"/>:</b><br/><webwork:property value="report/description" escape="false" /></webwork:if>
    </page:param>

    <webwork:iterator value="objectConfiguration/fieldKeys" >
    <%@ include file="/includes/panels/objectconfiguration_form.jsp"  %>
    </webwork:iterator>

    <ui:component name="'selectedProjectId'" value="selectedProjectId" template="hidden.jsp" />
    <ui:component name="'reportKey'" value="reportKey" template="hidden.jsp" />
        <% if (! Boolean.FALSE.equals(request.getAttribute("jira.portletform.showsavebutton")))
           { // if there is a problem with one of the parameters not being satisfied above, then we should not show the save button
             // Fixes JRA-5279
        %>
    	<page:param name="submitId">next_submit</page:param>
    	<page:param name="submitName"><webwork:text name="'common.forms.next'"/></page:param>
        <% }
           else
           { // reset the submit button to empty since in tomcat the state seems to be cached and we run into JRA-5042
        %>
        <page:param name="submitName"><webwork:text name="''"/></page:param>
        <%
           }
        %>

</page:applyDecorator>

</body>
</html>
