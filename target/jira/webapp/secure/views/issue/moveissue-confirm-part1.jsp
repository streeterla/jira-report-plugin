<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>

<!-- Breaking page into smaller parts - JRA-5059 -->

<!-- PROJECT, TYPE & STATUS -->

<webwork:if test="subTask == false">
    <tr>
        <td bgcolor=#f0f0f0 width=20% valign=top>
            <b><webwork:text name="'common.concepts.project'"/></b>
        </td>
        <td bgcolor=#ffffff width=40% valign=top>
            <%-- Highlight differences --%>
            <webwork:if test="projectMatch == false">
                <span class="red-highlight"><webwork:property value="projectManager/project(issue)/string('name')" /></span>
            </webwork:if>
            <webwork:else>
                <webwork:property value="projectManager/project(issue)/string('name')" />
            </webwork:else>
        </td>
        <td bgcolor=#ffffff width=40% valign=top>
            <webwork:if test="projectMatch == false">
                <span class="green-highlight"><webwork:property value="targetProject/string('name')" /></span>
            </webwork:if>
            <webwork:else>
                <webwork:property value="targetProject/string('name')" />
            </webwork:else>
        </td>
    </tr>
</webwork:if>
<webwork:if test="subTask == true || (enterprise == true || professional == true)">
    <tr>
        <td bgcolor=#f0f0f0 width=20% valign=top>
            <b><webwork:text name="'issue.field.type'"/></b>
        </td>
        <td bgcolor=#ffffff width=40% valign=top>
        <%-- Highlight differences --%>
            <webwork:if test="issueTypeMatch == false">
                <span class="red-highlight"><webwork:property value="/nameTranslation(constantsManager/issueType(issue/string('type')))" /></span>
            </webwork:if>
            <webwork:else>
                <webwork:property value="/nameTranslation(constantsManager/issueType(issue/string('type')))" />
            </webwork:else>
        </td>
        <td bgcolor=#ffffff width=40% valign=top>
            <webwork:if test="issueTypeMatch == false">
                <span class="green-highlight"><webwork:property value="./moveIssueBean/targetTypeName" /></span>
            </webwork:if>
            <webwork:else>
                <webwork:property value="./moveIssueBean/targetTypeName" />
            </webwork:else>
        </td>
    </tr>
</webwork:if>
<webwork:if test="enterprise == true && workflowMatch(issue/string('type'), targetIssueType) == false">
    <tr>
        <td bgcolor=#f0f0f0 width=20% valign=top>
            <b><webwork:text name="'issue.field.status'"/></b> &nbsp;<span class="smallgrey">(<webwork:text name="'moveissue.workflow'"/>)</span>
        </td>
        <td bgcolor=#ffffff width=40% valign=top>
            <webwork:if test="statusMatch() == false">
                <span class="red-highlight"><webwork:property value="/nameTranslation(constantsManager/status(issue/string('status')))" /></span>
            </webwork:if>
            <webwork:else>
                <webwork:property value="/nameTranslation(constantsManager/status(issue/string('status')))" />
            </webwork:else>
                <webwork:if test="workflowMatch(issue/string('type'), targetIssueType) == false">
                    &nbsp;<span class="red-highlight-small">(<webwork:property value="currentWorkflow/name"/>)</span>
                </webwork:if>
                <webwork:else>
                    &nbsp;<span class="smallgrey">(<webwork:property value="currentWorkflow/name"/>)</span>
                </webwork:else>
        </td>
        <td bgcolor=#ffffff width=40% valign=top>
            <webwork:if test="statusMatch() == false">
                <span class="green-highlight"><webwork:property value="./moveIssueBean/targetStatusName" /></span>
            </webwork:if>
            <webwork:else>
                <webwork:property value="./moveIssueBean/targetStatusName" />
            </webwork:else>
            <webwork:if test="workflowMatch(issue/string('type'), targetIssueType) == false">
                &nbsp;<span class="green-highlight-small">(<webwork:property value="targetWorkflow/name"/>)</span>
            </webwork:if>
            <webwork:else>
                &nbsp;<span class="smallgrey">(<webwork:property value="targetWorkflow/name"/>)</span>
            </webwork:else>
        </td>
    </tr>
</webwork:if>
