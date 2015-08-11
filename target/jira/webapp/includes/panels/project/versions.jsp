<%@ taglib uri="webwork" prefix="webwork" %>
<webwork:bean id="math" name="'com.atlassian.core.bean.MathBean'"/>

<table class="grid" width="100%">
<tr><td class="jiraformheader">
	<h5><webwork:text name="'admin.projects.versions'"/></h5>
	<webwork:if test="/hasProjectAdminPermission == true">
        <ul class="square">
            <li><webwork:text name="'admin.projects.manage.versions'">
                <webwork:param name="'value0'"><a id="manage_versions" href="ManageVersions.jspa?pid=<webwork:property value="long('id')" />"></webwork:param>
                <webwork:param name="'value1'"></a></webwork:param>
                <webwork:param name="'value2'"><span class="smallgrey"></webwork:param>
                <webwork:param name="'value3'"></span></webwork:param>
            </webwork:text></li>
        </ul>
	</webwork:if>
</td></tr>
<tr><td>
		<webwork:property value="/versionsReversed">
        <webwork:if test="./size > 0">
            <table width="100%" class="blank noPadding">
            <webwork:subset source="." count="20" >
            <webwork:iterator value="." status="'status'">
            <tr <webwork:if test="@status/modulus(2) == 0">class="rowAlternateLightGray"</webwork:if>>
                <td>
                    <%@ include file="/includes/versions/versionstatus_size16.jsp" %>
                    <%@ include file="/includes/versions/versionname.jsp" %>
                </td>
                <td align="right" >
                    <span class="subText"><%@ include file="/includes/versions/versionreleasedate.jsp" %></span>
                </td>
            </tr>
			</webwork:iterator>
            </webwork:subset>
            <webwork:if test="./size > 20">
            <tr>
                <td colspan="2" class="grey">
                ... <webwork:text name="'admin.manageversions.others.not.displayed'">
                    <webwork:param name="'value0'"><webwork:property value="@math/subtract(size, 20)" /></webwork:param>
                    <webwork:param name="'value1'"><a href="ManageVersions.jspa?pid=<webwork:property value="long('id')" />"><span class="small"></webwork:param>
                    <webwork:param name="'value2'"></span></a></webwork:param>
                </webwork:text> </td>
            </tr>
            </webwork:if>
            </table>
        </webwork:if>
		<webwork:if test=". && size == 0">
            <webwork:text name="'admin.projects.no.versions'"/>
		</webwork:if>
		</webwork:property>
</td></tr>
</table>
