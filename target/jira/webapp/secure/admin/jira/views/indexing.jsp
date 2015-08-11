<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<webwork:bean name="'com.atlassian.jira.util.JiraDateUtils'" id="dateUtils" />
<html>
<head>
	<title><webwork:text name="'admin.indexing.jira.indexing'"/></title>
</head>
<body>

<jsp:include page="/secure/admin/fixes/pathwarnings.jsp"/>


<webwork:if test="indexing == true">
    <page:applyDecorator name="jiraform">
        <page:param name="action">IndexReIndex.jspa</page:param>
        <page:param name="submitId">reindex_submit</page:param>
        <page:param name="submitName"><webwork:text name="'admin.indexing.reindex'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="title"><webwork:text name="'admin.indexing.reindexing'"/></page:param>
        <page:param name="helpURL">searchindex</page:param>
        <%--    <page:param name="helpDescription">with Indexing</page:param>--%>
        <page:param name="instructions">

            <webwork:if test="reindexTime > 0">
                <p><webwork:text name="'admin.indexing.reindexing.was.successful'">
                    <webwork:param name="'value0'"><strong><span class="greenText"></webwork:param>
                    <webwork:param name="'value1'"></span></strong></webwork:param>
                    <webwork:param name="'value2'"><strong><webwork:property value="@dateUtils/formatTime(reindexTime)" /></strong></webwork:param>
                </webwork:text> </p>
            </webwork:if>
            <p>
                <webwork:text name="'admin.indexing.to.reindex.click.the.button'"/>
                <webwork:text name="'admin.indexing.optimize.url.title'">
                    <webwork:param name="'value0'"><a href="IndexOptimize!default.jspa"></webwork:param>
                    <webwork:param name="'value1'"></a></webwork:param>
                </webwork:text>
            </p>
            <p>
                <webwork:text name="'admin.indexing.johnson.desc'"/>
            </p>
            <p>
                <webwork:text name="'admin.indexing.this.may.take.a.while'">
                    <webwork:param name="'value0'"><span class="note"></webwork:param>
                    <webwork:param name="'value1'"></span></webwork:param>
                </webwork:text>
            </p>
            <p>
                <webwork:text name="'admin.import.index.warning.line.2'">
                    <webwork:param name="'value0'"><span class="warning"></webwork:param>
                    <webwork:param name="'value1'"></span></webwork:param>
                </webwork:text>
            </p>

            <%-- TODO - until we have an All Tasks Page this is disabled --%>
            <%--<webwork:if test="anyLiveTasks == true">--%>
                <%--<ui:component template="taskwarning.jsp"/>--%>
            <%--</webwork:if>--%>
        </page:param>
        <webwork:if test="/hasSystemAdminPermission == true">
            <ui:component template="radio-indexing-config.jsp" label="text('setup.indexpath.label')" name="'indexPath'"/>
            <script language="javascript" type="text/javascript">
                window.onload = function()
                {
                    jQuery("#indexPathOption_CUSTOM").toggleField("#indexPath")
                }
            </script>
        </webwork:if>
        <webwork:else>
            <ui:component label="text('admin.indexing.search.index.path')" template="label.jsp">
                <ui:param name="'description'">
                    <webwork:text name="'admin.import.index.no.permission.note'">
                        <webwork:param name="'value0'"><span class="note"></webwork:param>
                        <webwork:param name="'value1'"></span></webwork:param>
                    </webwork:text>
                </ui:param>
                <ui:param name="'value'">
                    <webwork:property value="indexPath"/>
                </ui:param>
            </ui:component>
        </webwork:else>
    </page:applyDecorator>
</webwork:if>
<webwork:else>
    <page:applyDecorator name="jiraform">
        <page:param name="action">IndexActivate.jspa</page:param>
        <page:param name="width">100%</page:param>
        <webwork:if test="/hasSystemAdminPermission == true">
            <page:param name="submitId">activate_submit</page:param>
            <page:param name="submitName"><webwork:text name="'admin.common.words.activate'"/></page:param>
        </webwork:if>
        <page:param name="title"><webwork:text name="'admin.indexing.indexing'"/></page:param>
        <page:param name="helpURL">searchindex</page:param>
        <%--	<page:param name="helpDescription">with Indexing</page:param>--%>
        <page:param name="description">
            <webwork:text name="'admin.indexing.is.currently.off'">
                <webwork:param name="'value0'"><strong><span class="redText"></webwork:param>
                <webwork:param name="'value1'"></span></strong></webwork:param>
            </webwork:text>
            <webwork:if test="/hasSystemAdminPermission == true">
                <p>
                        <webwork:text name="'admin.indexing.to.activate'"/>
                <p>
                <webwork:text name="'admin.indexing.this.may.take.a.while'">
                    <webwork:param name="'value0'"><span class="note"></webwork:param>
                    <webwork:param name="'value1'"></span></webwork:param>
                </webwork:text>
                </p>
            </webwork:if>
            <webwork:else>
                <p/>
                <webwork:text name="'admin.import.index.disable.contact.sysadmin'">
                    <webwork:param name="'value0'"><span class="note"></webwork:param>
                    <webwork:param name="'value1'"></span></webwork:param>
                </webwork:text>
            </webwork:else>
        </page:param>

        <webwork:if test="/hasSystemAdminPermission == true">
            <ui:component template="radio-indexing-config.jsp" label="text('setup.indexpath.label')" name="'indexPath'"/>

            <script language="javascript" type="text/javascript">
                window.onload = function()
                {
                    jQuery("#indexPathOption_CUSTOM").toggleField("#indexPath")
                }
            </script>
        </webwork:if>
    </page:applyDecorator>
</webwork:else>
</body>
</html>
