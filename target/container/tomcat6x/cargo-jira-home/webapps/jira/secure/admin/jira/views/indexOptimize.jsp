<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<webwork:bean name="'com.atlassian.jira.util.JiraDateUtils'" id="dateUtils" />
<html>
<head>
	<title><webwork:text name="'admin.indexing.optimize'"/></title>
</head>
<body>
<webwork:if test="indexing == true">
    <%-- Only allow to optimize the index if indexing is enabled --%>
    <page:applyDecorator name="jiraform">
        <page:param name="action">IndexOptimize.jspa</page:param>
        <page:param name="width">100%</page:param>
        <page:param name="title"><webwork:text name="'admin.indexing.optimize'"/></page:param>
        <page:param name="cancelURI">IndexAdmin.jspa</page:param>
        <%-- NOTE: the following MUST be all on one line so we don't get returns inside the submit button
    --%><page:param name="submitName"><webwork:if test="optimizeTime > 0"><webwork:text name="'admin.indexing.dooptimize.again'"/></webwork:if><webwork:else><webwork:text name="'admin.indexing.dooptimize'"/></webwork:else></page:param>
        <page:param name="submitId">optimise_submit</page:param>
        <page:param name="instructions">
            <webwork:if test="optimizeTime > 0">
                <p>
                    <webwork:text name="'admin.indexing.optimizing.was.successful'">
                        <webwork:param name="'value0'"><strong><span class="greenText"></webwork:param>
                        <webwork:param name="'value1'"></span></strong></webwork:param>
                        <webwork:param name="'value2'"><strong><webwork:property value="@dateUtils/formatTime(optimizeTime)" /></strong></webwork:param>
                    </webwork:text>
                </p>
                <p><a href="IndexAdmin.jspa"><webwork:text name="'admin.indexing.admin.url.title'"/></a></p>
            </webwork:if>
            <webwork:else>
                <p>
                    <webwork:text name="'admin.indexing.to.optimize.click.the.button'"/>
                    <webwork:text name="'admin.indexing.this.may.take.a.minute.or.two'"/>
                </p>
                <p>
                    <webwork:text name="'admin.indexing.optimize.note'">
                        <webwork:param name="'value0'"><span class="note"></webwork:param>
                        <webwork:param name="'value1'"></span></webwork:param>
                    </webwork:text>
                </p>
            </webwork:else>
        </page:param>
    </page:applyDecorator>
</webwork:if>
<webwork:else>
    <page:applyDecorator name="jirapanel">
        <page:param name="width">100%</page:param>
        <page:param name="title"><webwork:text name="'admin.indexing.optimize'"/></page:param>
        <page:param name="description">
            <p>
                <webwork:text name="'admin.indexing.is.currently.off'">
                    <webwork:param name="'value0'"><span class="warning"></webwork:param>
                    <webwork:param name="'value1'"></span></webwork:param>
                </webwork:text>
            </p>
            <p><a href="IndexAdmin.jspa"><webwork:text name="'admin.indexing.admin.url.title'"/></a></p>
        </page:param>
    </page:applyDecorator>
</webwork:else>
</body>
</html>
