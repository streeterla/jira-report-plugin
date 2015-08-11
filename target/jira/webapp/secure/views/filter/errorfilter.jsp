<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'commonfilter.error.fatal.title'"/></title>
</head>

<body>

<table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
        <td class="filterSummaryCell">
            <jsp:include page="/includes/navigator/summary-pane.jsp"/>
        </td>
        <td bgcolor="#ffffff" valign=top>
            <table width="100%" cellpadding="10" cellspacing="0" border="0">
                <tr>
                    <td>
                        <page:applyDecorator name="jiraform">
                            <page:param name="cancelURI">ManageFilters.jspa</page:param>
                            <page:param name="width">100%</page:param>
                            <page:param name="title"><webwork:text name="'commonfilter.error.fatal.title'"/>
                            </page:param>
                        </page:applyDecorator>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

</body>
</html>
