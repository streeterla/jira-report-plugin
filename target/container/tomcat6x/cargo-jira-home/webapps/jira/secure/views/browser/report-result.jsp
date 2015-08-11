<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'common.concepts.report'"/> - <webwork:property value="report/name" /></title>
	<meta name="decorator" content="notitle">
    <style type="text/css">
    .jiraformbody
    {
        padding: 0 !important;
    }
    .excel
    {
        float:right;
        text-align: right;
        padding-top: .5em;
        padding-right: .5em;
        padding-bottom: .5em;
    }
    </style>
    <style type="text/css" media="print">
    .excel
    {
        display: none;
    }
    </style>
</head>
<body>
<page:applyDecorator name="jirapanel">
	<page:param name="title"><webwork:text name="'common.concepts.report'"/>: <a href="<webwork:url page="ConfigureReport!default.jspa"><webwork:param name="'reportKey'" value="report/completeKey" /></webwork:url>"><webwork:property value="report/label" /></a></page:param>
	<page:param name="instructions">
        <webwork:if test="report/module/excelViewSupported == true">
        <div class="excel">
            <a href="<%= request.getContextPath() %>/secure/ConfigureReport!excelView.jspa?<webwork:property value="queryString"/>"><webwork:text name="'excel.view'"/><img src="<%= request.getContextPath() %>/images/icons/attach/excel.gif" height="16" width="16" border="0" align="absmiddle" alt="<webwork:text name="'excel.view'"/>"/></a>
        </div>
        <webwork:if test="report/description"><b><webwork:text name="'common.concepts.description'"/>:</b><br/><webwork:property value="report/description" escape="false" /></webwork:if>
        </webwork:if>
    </page:param>
    <page:param name="width">100%</page:param>

    <webwork:property value="generatedReport" escape="false" />
</page:applyDecorator>
</body>
</html>
