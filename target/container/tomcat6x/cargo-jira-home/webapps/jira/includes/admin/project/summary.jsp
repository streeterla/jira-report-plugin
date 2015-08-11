<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'common.words.project'"/>: <webwork:property value="project/string('name')" escape="true" /></page:param>
    <page:param name="width">100%</page:param>

	<webwork:property value="project">

		<%-- Project Summary --%>
        <jsp:include page="/includes/panels/project/summary.jsp" />

        <%-- Schemes (Notification, Permission and Issue Security --%>
        <jsp:include page="/includes/panels/project/schemes.jsp" />

        <webwork:if test="/enterprise == true">
            <br/><b><webwork:text name="'admin.projects.project.category'"/>:</b>
            <webwork:if test="projectCategory != null">
                <webwork:property value="projectCategory/string('name')" />
            </webwork:if>
            <webwork:else>
                <webwork:text name="'common.words.none'"/>
            </webwork:else>
            <webwork:if test="/hasAdminPermission == true">
                (
                <a id="select_category" href="<webwork:url page="SelectProjectCategory!default.jspa"><webwork:param name="'pid'" value="long('id')" /></webwork:url>"><webwork:text name="'admin.projects.select.category'"/></a>
                )
            </webwork:if>
        </webwork:if>

        <%-- JRA-13283: Print all the pluggable project operations --%>
        <webwork:iterator value="/viewableProjectOperations">
            <br/><webwork:property value="./html(projectObject, remoteUser)" escape="false"/>
        </webwork:iterator>
    </webwork:property>
</page:applyDecorator>
