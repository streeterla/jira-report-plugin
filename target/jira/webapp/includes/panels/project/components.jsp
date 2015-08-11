<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<table class="grid" width="100%">
<tr><td class="jiraformheader">
	<h5><webwork:text name="'admin.projects.components'"/></h5>
	<webwork:if test="/hasProjectAdminPermission == true">
        <ul class="square">
            <li>
                <webwork:text name="'admin.projects.addcomponent'">
                    <webwork:param name="'value0'"><a id="add_component" href="<webwork:url page="AddComponent!default.jspa"><webwork:param name="'pid'" value="./long('id')"/></webwork:url>"></webwork:param>
                    <webwork:param name="'value1'"></a></webwork:param>
                </webwork:text>
            </li>
            <webwork:if test="/enterprise == true && /projectManager/components(.)/size > 0"><li>
                <webwork:text name="'admin.projects.select.assignees.for.components'">
                    <webwork:param name="'value0'"><a id="select_component_assignees" href="<webwork:url page="/secure/project/SelectComponentAssignees!default.jspa"><webwork:param name="'projectId'" value="./long('id')"/></webwork:url>"></webwork:param>
                    <webwork:param name="'value1'"></a></webwork:param>
                </webwork:text>
            </li></webwork:if>
        </ul>
	</webwork:if>
</td></tr>
<tr><td>
		<webwork:property value="/projectManager/components(.)">
        <table width="100%" class="blank noPadding">
        <webwork:iterator value="." status="'status'">
            <tr <webwork:if test="@status/modulus(2) == 0">class="rowAlternateLightGray"</webwork:if>>
                <td>
                    <span title="<webwork:property value="./string('name')" /> <webwork:property value="./string('description')" ><webwork:if test="."> - <webwork:property value="." /></webwork:if></webwork:property>">
                    <img src="<%= request.getContextPath() %>/images/icons/component.gif" height="16" width="16" border="0" align="absmiddle" alt="Component">
                    <webwork:property value="./string('name')" />
                    <webwork:if test="/enterprise == true && ./string('lead') != null">
                        <webwork:if test="/userExists(./string('lead')) == true">
                            <span class="subText">(<b><webwork:text name="'common.concepts.lead'"/>:</b> <webwork:property value="/userFullName(./string('lead'))"/>)</span>
                        </webwork:if>
                        <webwork:else>
                            <span class="subText">(<b><webwork:text name="'common.concepts.lead'"/>:</b> <span class="errLabel"><webwork:property value="/userFullName(./string('lead'))"/></span>)</span>
                        </webwork:else>
                    </webwork:if>
                    </span>
                </td>
                <td>
                    <webwork:if test="/hasProjectAdminPermission == true">
                        <span style="float: right;" class="subText">
                        (<a id="edit_comp_<webwork:property value="string('name')"/>" href="<webwork:url page="EditComponent!default.jspa"><webwork:param name="'id'" value="long('id')" /><webwork:param name="'pid'" value="project/long('id')"/></webwork:url>"><webwork:text name="'common.words.edit'"/></a>
                        | <a id="del_comp_<webwork:property value="string('name')"/>" href="<webwork:url page="DeleteComponent!default.jspa"><webwork:param name="'cid'" value="long('id')" /></webwork:url>"><webwork:text name="'common.words.delete'"/></a>)</span>
                    </webwork:if>
                </td>
            </tr>
        </webwork:iterator>
        </table>
		<webwork:if test=". && size == 0">
			<webwork:text name="'admin.projects.no.components'"/>
		</webwork:if>
		</webwork:property>
</td></tr>
</table>
