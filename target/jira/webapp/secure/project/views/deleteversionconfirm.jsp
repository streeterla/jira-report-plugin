
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.manageversions.delete.version'"/>: <webwork:property value="version/string('name')" /></title>
</head>

<body>

<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'admin.manageversions.delete.version'"/>: <webwork:property value="version/name" /></page:param>
	<page:param name="description">
		<p>
            <webwork:if test="affectsIssues/size > 0">
                <webwork:text name="'admin.manageversions.delete.confirmation.related.issues'"/>
            </webwork:if>
            <webwork:else>
                <webwork:text name="'admin.manageversions.delete.confirmation.no.related.issues'"/>
            </webwork:else>
        </p>
	</page:param>

	<page:param name="action">DeleteVersion.jspa</page:param>
	<page:param name="submitId">delete_submit</page:param>
	<page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
	<page:param name="autoSelectFirst">false</page:param>
	<page:param name="cancelURI"><webwork:url page="ManageVersions.jspa"><webwork:param name="'pid'" value="project/long('id')" /></webwork:url></page:param>


	<webwork:if test="affectsIssues/size > 0">
        <ui:component label="'Issues raised against this version'" name="'affectsIssues/size'" template="textlabel.jsp" >
            <ui:param name="'description'">
                (<a href="<%= request.getContextPath() %>/secure/IssueNavigator.jspa?reset=true&mode=hide&pid=<webwork:property value="project/long('id')" />&version=<webwork:property value="versionId" />">View the issues</a> raised against this version.)
            </ui:param>
        </ui:component>
        <webwork:if test="otherUnarchivedVersions/size > 0">
            <tr>
                <td bgcolor=#ffffff>&nbsp;</td>
                <td bgcolor=#ffffff>
                    <input type="radio" name="affectsAction" value="swap" id="swap"
                        <webwork:if test="affectsAction == 'swap'">
                        checked
                        </webwork:if>
                    >
                    <label for="swap"><webwork:text name="'admin.manageversions.swap'"/></label>
                    <select name="affectsSwapVersionId">
                        <webwork:iterator value="otherUnarchivedVersions">
                        <option value="<webwork:property value="long('id')" />"
                            <webwork:if test="affectsSwapVersionId == long('id')">selected</webwork:if>
                        >
                            <webwork:property value="string('name')" />
                        </option>
                        </webwork:iterator>
                    </select>
                </td>
            </tr>
            <tr>
                <td bgcolor=#ffffff>&nbsp;</td>
                <td bgcolor=#ffffff>
                    <input type="radio" name="affectsAction" value="remove" id="remove"
                        <webwork:if test="affectsAction == 'remove'">
                        checked
                        </webwork:if>
                    >
                    <label for="remove"><webwork:text name="'admin.manageversions.remove.from.all.issues'"/></label>
                </td>
            </tr>
        </webwork:if>
        <webwork:else>
            <tr>
                <td bgcolor=#ffffff>&nbsp;</td>
                <td bgcolor=#ffffff>
                    <input type="hidden" name="affectsAction" value="remove">
                    <webwork:text name="'admin.manageversions.no.other.versions'"/>
                </td>
            </tr>
        </webwork:else>
	</webwork:if>
    <webwork:else>
        <tr><td><input type="hidden" name="affectsAction" value="remove"></td></tr>
    </webwork:else>

      <webwork:if test="fixIssues/size > 0">
        <ui:component label="'Issues with this as a fix version'" name="'fixIssues/size'" template="textlabel.jsp">
            <ui:param name="'description'">
                (<a href="<%= request.getContextPath() %>/secure/IssueNavigator.jspa?reset=true&mode=hide&pid=<webwork:property value="project/long('id')" />&fixfor=<webwork:property value="versionId" />">View the issues</a> with this as a fix for version.)
            </ui:param>
        </ui:component>
        <webwork:if test="otherUnarchivedVersions/size > 0">
            <tr>
                <td bgcolor=#ffffff>&nbsp;</td>
                <td bgcolor=#ffffff>
                    <input type="radio" name="fixAction" value="swap"
                        <webwork:if test="fixAction == 'swap'">
                        checked
                        </webwork:if>
                    >
                    <webwork:text name="'admin.manageversions.swap.current.fix.version.to'"/>
                    <select name="fixSwapVersionId">
                        <webwork:iterator value="otherUnarchivedVersions">
                        <option value="<webwork:property value="long('id')" />"
                            <webwork:if test="fixSwapVersionId == long('id')">selected</webwork:if>
                        >
                            <webwork:property value="string('name')" />
                        </option>
                        </webwork:iterator>
                    </select>
                </td>
            </tr>
            <tr>
                <td bgcolor=#ffffff>&nbsp;</td>
                <td bgcolor=#ffffff>
                    <input type="radio" name="fixAction" value="remove"
                        <webwork:if test="fixAction == 'remove'">
                        checked
                        </webwork:if>
                    >
                    <webwork:text name="'admin.manageversions.remove.fix.version.from.all'"/>
                </td>
            </tr>
        </webwork:if>
        <webwork:else>
            <tr>
                <td bgcolor=#ffffff>&nbsp;</td>
                <td bgcolor=#ffffff>
                    <input type="hidden" name="fixAction" value="remove">
                    <webwork:text name="'admin.manageversions.no.other.versions.remove.all.fix'"/>
                </td>
            </tr>
        </webwork:else>
	</webwork:if>
    <webwork:else>
        <tr><td><input type="hidden" name="fixAction" value="remove"></td></tr>
    </webwork:else>

    <webwork:if test="affectedIssues/empty == true && fixIssues/empty == true">
        <tr>
            <td bgcolor=#ffffff>
                <webwork:text name="'admin.manageversions.no.issues.with.specified.version'"/>
            </td>
        </tr>
    </webwork:if>

	<ui:component name="'versionId'" template="hidden.jsp" />
	<input type="hidden" name="confirm" value="true">
</page:applyDecorator>

</body>
</html>
