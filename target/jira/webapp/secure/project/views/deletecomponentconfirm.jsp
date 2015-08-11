
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.delete.component.title'"/>: <webwork:property value="component/string('name')" /></title>
</head>

<body>

<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'admin.delete.component.title'"/>: <webwork:property value="component/string('name')" /></page:param>
	<page:param name="description">
		<p><webwork:text name="'admin.delete.component.desc'"/></p>
	</page:param>
	<page:param name="width">100%</page:param>
	<page:param name="action">DeleteComponent.jspa</page:param>
	<page:param name="submitId">delete_submit</page:param>
	<page:param name="submitName"><webwork:text name="'admin.common.words.delete'"/></page:param>
	<page:param name="cancelURI"><webwork:url page="ViewProject.jspa"><webwork:param name="'pid'" value="project/long('id')" /></webwork:url></page:param>

	<webwork:if test="matchingIssues/size > 0">

	<ui:component label="text('admin.delete.component.issues.in.comp')" name="'matchingIssues/size'" template="textlabel.jsp">
        <ui:param name="'description'">
            (<webwork:text name="'admin.delete.component.issues.in.comp.desc'">
               <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/IssueNavigator.jspa?reset=true&mode=hide&pid=<webwork:property value="project/long('id')" />&component=<webwork:property value="cid" />"></webwork:param>
               <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>)
        </ui:param>
    </ui:component>
        <webwork:if test="otherComponents/size > 0">
            <tr>
                <td bgcolor=#ffffff>&nbsp;</td>
                <td bgcolor=#ffffff>
                    <input type="radio" name="action" value="swap"
                        <webwork:if test="action == 'swap'">
                        checked
                        </webwork:if>
                    >
                    <webwork:text name="'admin.delete.component.issues.swap.comp'"/>:
                    <select name="swapComponentId">
                        <webwork:iterator value="otherComponents">
                        <option value="<webwork:property value="long('id')" />"
                            <webwork:if test="swapComponentId == id">selected</webwork:if>
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
                    <input type="radio" name="action" value="remove"
                        <webwork:if test="action == 'remove'">
                        checked
                        </webwork:if>
                    >
                    <webwork:text name="'admin.delete.component.issues.remove.comp'"/>
                </td>
            </tr>
        </webwork:if>
        <webwork:else>
            <tr>
                <td bgcolor=#ffffff>&nbsp;</td>
                <td bgcolor=#ffffff>
                    <input type="hidden" name="action" value="remove">
                    <webwork:text name="'admin.delete.component.issues.no.other.comps'"/>
                </td>
            </tr>
        </webwork:else>
    </webwork:if>
    <webwork:else>
        <tr>
            <td bgcolor=#ffffff>&nbsp;</td>
            <td bgcolor=#ffffff>
                <input type="hidden" name="action" value="remove" />
                <webwork:text name="'admin.delete.component.issues.delete.not.alter'">
                   <webwork:param name="'value0'"><b></webwork:param>
                   <webwork:param name="'value1'"></b></webwork:param>
                </webwork:text>
            </td>
        </tr>
    </webwork:else>

	<ui:component name="'cid'" template="hidden.jsp" theme="'single'" />
	<input type="hidden" name="confirm" value="true">
</page:applyDecorator>

</body>
</html>
