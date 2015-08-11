
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.manageversions.merge.versions'"/></title>
</head>

<body>

<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'admin.manageversions.merge.versions'"/></page:param>
	<page:param name="description">
		<p><webwork:text name="'admin.manageversions.merge.confirmation'"/></p>
		<p><font color=#cc0000><webwork:text name="'admin.manageversions.merge.warning'"/></font></p>
	</page:param>
    <page:param name="autoSelectFirst">false</page:param>
	<page:param name="width">100%</page:param>
	<page:param name="action">Merge.jspa</page:param>
	<page:param name="submitId">merge_submit</page:param>
	<page:param name="submitName"><webwork:text name="'admin.manageversions.merge'"/></page:param>
	<page:param name="cancelURI"><webwork:url page="ManageVersions.jspa"><webwork:param name="'pid'" value="pid" /></webwork:url></page:param>

	<tr>
		<td bgcolor=#fffff0 align=center>
			<b><webwork:text name="'admin.manageversions.merging.from.versions'"/></b>
		</td>

		<td bgcolor=#fffff0 align=center>
			<b><webwork:text name="'admin.manageversions.merge.to.version'"/></b>
		</td>
	</tr>

    <tr>
        <td bgcolor=#fffff0 align=center>
            <webwork:iterator value="versionsToMerge">
                <li><webwork:property value="name" />
            </webwork:iterator>
        </td>
        <td bgcolor=#fffff0 align=center>
            <li><webwork:property value="versionMergeTo/name" />
        </td>
    </tr>

    <webwork:iterator value="idsToMerge">
        <ui:component name="'idsToMerge'" value="." template="hidden.jsp" />
    </webwork:iterator>

    <ui:component name="'idMergeTo'" template="hidden.jsp" />
	<ui:component name="'pid'" template="hidden.jsp" />

	<input type="hidden" name="confirm" value="true">
</page:applyDecorator>

</body>
</html>
