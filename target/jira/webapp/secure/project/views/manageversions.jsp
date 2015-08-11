<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="webwork" prefix="webwork" %>

<html>
<head>
	<title><webwork:text name="'admin.manageversions.manage.versions'"/></title>
</head>

<body>
<!-- JRA-4345 - need to statically include the javascript to address IE6 refresh issue -->
<%@ include file="/includes/js/date_picker.jsp" %>

<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.manageversions.manage.versions'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">version_management</page:param>
    <page:param name="instructions"><p><webwork:text name="'admin.manageversions.page.description'">
        <webwork:param name="'value0'"><a href="ViewProject.jspa?pid=<webwork:property value="pid" />"><b><webwork:property value="/projectManager/project(pid)/string('name')"/></b></a></webwork:param>
    </webwork:text></p>
    <p><webwork:text name="'admin.manageversions.order.of.version.list'"/></p>
</page:param>

<%@ include file="/includes/versions/versionadd.jsp" %>
<webwork:property value="project">
<table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="100%">
    <webwork:if test="versionsReversed/size == 0">
            <tr><td bgcolor="#ffffff" valign="top">
                    <webwork:text name="'admin.manageversions.no.versions'"/>
            </td></tr>
    </webwork:if>
    <webwork:else>
    <tr bgcolor="#ffffff"><td>
    <table border="0" cellpadding="3" cellspacing="1" width=100% class="gridBox" id="versions_table">
            <tr width="100%" bgcolor="#f0f0f0">
            <td align="absmiddle" class="colHeaderLink" width="50%" >
                <b><webwork:text name="'common.words.name'"/></b>
            </td>
            <td align="absmiddle" class="colHeaderLink" width="50%">
                <b><webwork:text name="'common.words.description'"/></b>
            </td>
            <td align="absmiddle" class="colHeaderLink" width="1%" nowrap>
                <b><webwork:text name="'version.releasedate'"/></b>
            </td>
            <webwork:if test="versionManager/versions(.)/size > 1">
            <td align="absmiddle" class="colHeaderLink" width="1%" nowrap>
                <b><webwork:text name="'admin.manageversions.schedule'"/></b>
            </td>
            </webwork:if>
            <td align="absmiddle" class="colHeaderLink" width="1%" >
                <b><webwork:text name="'common.words.operations'"/></b>
            </td>
            </tr>
			<webwork:property value="/versionsReversed">
            <%/*counter used to alternate background row colors*/%>
            <webwork:bean name="'webwork.util.Counter'" id="rowCount">
                <webwork:param name="'wrap'" value="true"/>
                <webwork:param name="'last'" value="2"/>
            </webwork:bean>

            <webwork:iterator value="." status="'status'">

            <tr
                <webwork:if test="@rowCount/next == 1">
                    bgcolor="#ffffff"
                </webwork:if>
                <webwork:if test = "@rowCount/next == 0"/>
                <webwork:if test = "@rowCount/next == 2">
                    bgcolor="#fffff0"
                </webwork:if>
            >
            <td align="left" >
                <%@ include file="/includes/versions/versionstatus_size24.jsp" %>
                <b><%@ include file="/includes/versions/versionname.jsp" %></b>
            </td>
            <td align="left">
                <%@ include file="/includes/versions/versiondescription.jsp" %>
            </td>
            <td align="absmiddle" nowrap>
                <%@ include file="/includes/versions/versionreleasedate.jsp" %>
            </td>
            <webwork:if test="/versionsReversed/size > 1">
            <td nowrap>
                <webwork:if test="@status/first != true">
                <a id="movefirst_<webwork:property value="id" />" href="<webwork:url page="VersionFirst.jspa"><webwork:param name="'versionId'" value="id" /><webwork:param name="'pid'" value="project/long('id')"/></webwork:url>"><img src="<%= request.getContextPath() %>/images/icons/arrow_first.gif" border="0" width="16" height="16" title="<webwork:text name="'admin.manageversions.move.first'"/>"></a>
                <a id="moveup_<webwork:property value="id" />" href="<webwork:url page="VersionUp.jspa"><webwork:param name="'versionId'" value="id" /><webwork:param name="'pid'" value="project/long('id')"/></webwork:url>"><img src="<%= request.getContextPath() %>/images/icons/arrow_up_blue.gif" border="0" width="16" height="16" title="<webwork:text name="'admin.manageversions.move.up'"/>"></a></webwork:if>
                <webwork:else><image src="<%= request.getContextPath() %>/images/border/spacer.gif" border="0" width="13" height="14"><image src="<%= request.getContextPath() %>/images/border/spacer.gif" border="0" width="20" height="16"></webwork:else>
                <webwork:if test="@status/last != true">
                <a id="movedown_<webwork:property value="id" />" href="<webwork:url page="VersionDown.jspa"><webwork:param name="'versionId'" value="id" /><webwork:param name="'pid'" value="project/long('id')"/></webwork:url>"><img src="<%= request.getContextPath() %>/images/icons/arrow_down_blue.gif" border="0" width="16" height="16" title="<webwork:text name="'admin.manageversions.move.down'"/>"></a>
                <a id="movelast_<webwork:property value="id" />" href="<webwork:url page="VersionLast.jspa"><webwork:param name="'versionId'" value="id" /><webwork:param name="'pid'" value="project/long('id')"/></webwork:url>"><img src="<%= request.getContextPath() %>/images/icons/arrow_last.gif" border="0" width="16" height="16" title="<webwork:text name="'admin.manageversions.move.last'"/>"></a></webwork:if>
                <webwork:else><image src="<%= request.getContextPath() %>/images/border/spacer.gif" border="0" width="13" height="14"><image src="<%= request.getContextPath() %>/images/border/spacer.gif" border="0" width="20" height="16"></webwork:else>
            </td>
            </webwork:if>
            <td nowrap width="1%">
                <%@ include file="/includes/versions/versionoperations.jsp" %>
            </td>
            </tr>
			</webwork:iterator>
			</webwork:property>
            </table>
            </td></tr>
            </webwork:else>
            </table>
</webwork:property>

</page:applyDecorator>

</body>
</html>



