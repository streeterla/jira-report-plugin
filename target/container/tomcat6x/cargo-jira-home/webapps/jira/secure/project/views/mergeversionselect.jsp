
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
	<page:param name="width">100%</page:param>
	<page:param name="action">MergeVersions.jspa</page:param>
    <page:param name="submitId">merge_submit</page:param>
    <page:param name="submitName"><webwork:text name="'admin.manageversions.merge'"/></page:param>
    <page:param name="cancelURI"><webwork:url page="ManageVersions.jspa"><webwork:param name="'pid'" value="pid" /></webwork:url></page:param>
	<page:param name="description">
		<webwork:text name="'admin.manageversions.merge.page.description'"/>

        <webwork:text name="'admin.manageversions.merge.description'"/>
	</page:param>
	<tr>
		<td bgcolor=#fffff0 align=center>
			<b><webwork:text name="'admin.manageversions.merging.from.versions'"/></b>
		</td>

		<td bgcolor=#fffff0 align=center>
			<b><webwork:text name="'admin.manageversions.merge.to.version'"/></b>
		</td>
	</tr>
	<tr>
		<td bgcolor=#ffffff align=center valign=top>
            <webwork:property value="versionId" />
			<webwork:if test="versions != null && versions/size > 0">
                <ui:component template="selectmultiple.jsp" theme="'common'" name="'idsToMerge'">
                    <ui:param name="'list'" value="versions" />
                    <ui:param name="'listKey'" value="'id'" />
                    <ui:param name="'listValue'" value="'name'" />
                </ui:component>
			</webwork:if>
			<webwork:else>
				<webwork:text name="'admin.manageversions.no.versions'"/>
			</webwork:else>
		</td>
		<td bgcolor=#ffffff align=center valign=top>
			<webwork:if test="versions != null && versions/size > 0">
				<select name="idMergeTo" >
					<webwork:iterator value="versions">
						<option value="<webwork:property value="id" />"
                        <webwork:if test="id == idMergeTo">
                            selected
                        </webwork:if>
                        ><webwork:property value="name" /></option>
					</webwork:iterator>
				</select>
			</webwork:if>
			<webwork:else>
				<webwork:text name="'admin.manageversions.no.versions'"/>
			</webwork:else>
		</td>
	</tr>

	<ui:component name="'pid'" template="hidden.jsp" />
    <ui:component name="'versionId'" template="hidden.jsp" />
</page:applyDecorator>

</body>
</html>
