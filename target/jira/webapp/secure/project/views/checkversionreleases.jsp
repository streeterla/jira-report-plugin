
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.projectversions.release.title'"><webwork:param name="'value0'"><webwork:property value="versionToRelease/name" /></webwork:param></webwork:text></title>
</head>

<body>

<script language="javascript">

    function selectRow(rowID)
    {
        var radio = document.forms['jiraform'].elements['affectsAction'];
        switch (rowID) {
            case "ignore":
                radio[0].checked = true;
            break;
            case "move":
                radio[1].checked = true;
            break;
        }
    }
</script>

<page:applyDecorator name="jiraform">
    <page:param name="title">
        <webwork:text name="'admin.projectversions.release.title'"><webwork:param name="'value0'"><webwork:property value="versionToRelease/name" /></webwork:param></webwork:text>
    </page:param>
	<page:param name="description">
        <p><webwork:text name="'admin.projectversions.release.description'"/></p>
	</page:param>
	<page:param name="action"><webwork:url page="EditVersionReleases!release.jspa"><webwork:param name="'versionId'" value="versionToRelease/id" /></webwork:url></page:param>
	<page:param name="submitId">release_submit</page:param>
	<page:param name="submitName"><webwork:text name="'admin.manageversions.release'"/></page:param>
	<page:param name="autoSelectFirst">false</page:param>
	<page:param name="cancelURI"><webwork:url page="ManageVersions.jspa"><webwork:param name="'pid'" value="project/long('id')" /></webwork:url></page:param>

    <ui:component label="text('version.releasedate')" name="'releaseDate'" value="editedReleaseDate" template="datepicker2.jsp">
        <ui:param name="'formname'" value="'jiraform'" />
        <ui:param name="'style'">width: 20%;</ui:param>
    </ui:component>

	<webwork:if test="unresolvedIssues/size > 0">
        <ui:component label="text('version.unresolved.issues.size')" name="'unresolvedIssues/size'" template="textlabel.jsp" >
            <ui:param name="'description'">
                (<a href="<%= request.getContextPath() %>/secure/IssueNavigator.jspa?reset=true&mode=hide&pid=<webwork:property value="project/long('id')" />&fixfor=<webwork:property value="/versionId" />&resolution=-1"><webwork:text name="'version.unresolved.issues.view'"/></a>)
            </ui:param>
        </ui:component>
        <webwork:if test="otherUnreleasedVersions/size > 0">
            <tr>
                <td bgcolor=#ffffff>&nbsp;</td>
                <td id="ignore" bgcolor=#ffffff onClick="selectRow('ignore')">
                    <input type="radio" id="ignoreIssues" name="affectsAction" value="ignore" checked>
                    <label for="ignoreIssues"><webwork:text name="'admin.projectversions.release.ignore.issues'"/></label>
                </td>
            </tr>
            <tr>
                <td bgcolor=#ffffff>&nbsp;</td>
                <td id="move" bgcolor=#ffffff onClick="selectRow('move')">
                    <input type="radio" id="moveIssues" name="affectsAction" value="swap">
                    <label for="moveIssues"><webwork:text name="'admin.projectversions.release.move.issues'"/></label>
                    <select name="affectsSwapVersionId" onClick="selectRow('move')">
                        <webwork:iterator value="otherUnreleasedVersions">
                        <option value="<webwork:property value="id" />"
                            <webwork:if test="affectsSwapVersionId == id">selected</webwork:if>
                        >
                            <webwork:property value="name" />
                        </option>
                        </webwork:iterator>
                    </select>
                </td>
            </tr>
        </webwork:if>
        <webwork:else>
        <tr>
                <td bgcolor=#ffffff>&nbsp;</td>
                <td id="ignore" bgcolor=#ffffff onClick="selectRow('ignore')">
                    <input type="radio" id="ignoreIssues" name="affectsAction" value="ignore" checked>
                    <label for="ignoreIssues"><webwork:text name="'admin.projectversions.release.ignore.issues.no.other.versions'"/></label>
                </td>
            </tr>

        </webwork:else>
	</webwork:if>

	<ui:component name="'pid'" template="hidden.jsp" />

</page:applyDecorator>

</body>
</html>
