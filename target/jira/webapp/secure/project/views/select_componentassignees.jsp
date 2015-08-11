<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><webwork:text name="'common.concepts.project'"/>: <webwork:property value="project/string('name')"/></title>
</head>

<body>
<%@ include file="/includes/errormessages.jsp" %>

<%-- Display all of the components for the project and allow the users to pick the component assignees --%>
<p>
    <page:applyDecorator name="jiraform">
        <page:param name="title"><webwork:text name="'admin.projects.component.select.component.assignee'"/>
        </page:param>
        <page:param name="width">100%</page:param>
        <page:param name="description"><webwork:text
                name="'admin.projects.component.select.assignee.page.description'"/></page:param>
        <page:param name="action">SelectComponentAssignees.jspa</page:param>
        <page:param name="submitId">update_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
        <page:param name="cancelURI"><webwork:url page="ViewProject.jspa"><webwork:param name="'pid'" value="projectId"/></webwork:url></page:param>
        <page:param name="columns">1</page:param>
        <tr><td bgcolor="#ffffff">
            <br>
            <table class="grid">
                <tr bgcolor="#f0f0f0">
                    <td nowrap><b><webwork:text name="'admin.projects.component.component.name'"/></b></td>
                    <td nowrap><b><webwork:text name="'admin.projects.component.lead'"/></b></td>
                    <td colspan="2" nowrap><b><webwork:text
                            name="'admin.projects.component.default.component.assignee'"/></b></td>
                </tr>
                <webwork:iterator value="/components" status="'componentsStatus'">
                    <webwork:if test="@componentsStatus/even == true">
                        <tr bgcolor="#ffffff">
                    </webwork:if>
                    <webwork:else>
                        <tr bgcolor="#fffff0">
                    </webwork:else>
                    <td width="1%" nowrap><webwork:property value="./string('name')"/></td>
                    <td width="1%" nowrap>
                        <webwork:if test="./string('lead')">
                            <webwork:property value="/userFullName(./string('lead'))"/>
                        </webwork:if>
                        <webwork:else>
                            No Lead
                        </webwork:else>
                    </td>
                    <webwork:if test="errors[/componentFieldName(.)]">
                        <td align="left" class="formErrors"><span class="errMsg"><webwork:property
                            value="errors[/componentFieldName(.)]"/></span><br>
                    </webwork:if>
                    <webwork:else>
                        <td align="left">
                    </webwork:else>
                    <webwork:iterator value="/componentAssigneeTypes(.)" status="'assigneeTypesStatus'">
                        <input type="radio" value="<webwork:property value="./key"/>"
                               id="<webwork:property value="/componentFieldName(..)"/>_<webwork:property value="./key"/>"
                               name="<webwork:property value="/componentFieldName(..)"/>"
                        <webwork:if test="./key == /componentAssigneeType(..)">
                               checked="true"
                        </webwork:if>
                        <webwork:if test="./key < 0">
                               disabled
                        </webwork:if>
                                >

                        <webwork:if test="./key >= 0">
                            <label for="<webwork:property value="/componentFieldName(..)"/>_<webwork:property value="./key"/>">
                                <webwork:property value="text(./value)"/></label>
                            <webwork:if test="./key == 1">
                                <font size="1">(<webwork:text name="'admin.common.words.lead'"/>: <webwork:property
                                        value="/userFullName(../string('lead'))"/>)</font>
                            </webwork:if>
                            <webwork:elseIf test="./key == 2">
                                <font size="1">(<webwork:text name="'admin.common.words.lead'"/>: <webwork:property
                                        value="/userFullName(/project/string('lead'))"/>)</font>
                            </webwork:elseIf>
                            <webwork:elseIf test="./key == 0">
                                <font size="1">(<webwork:text name="'admin.projects.default.assignee'"/>: <webwork:text
                                        name="/prettyAssigneeType(/project/long('assigneetype'))"/>)</font>
                            </webwork:elseIf>
                        </webwork:if>
                        <webwork:else>
                            <font color="#999999"><i><webwork:text name="./value"/></i></font>
                        </webwork:else>
                        <webwork:if test="@assigneeTypesStatus/count == 2">
                            </td><td>
                        </webwork:if>
                        <webwork:else><br></webwork:else>
                    </webwork:iterator>
                    </td>
                    </tr>
                </webwork:iterator>
            </table>
            <webwork:component name="'projectId'" template="hidden.jsp"/>
        </td></tr>
    </page:applyDecorator>
</p>
</body>
</html>
