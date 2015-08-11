<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>

<!-- Breaking page into smaller parts - JRA-5059 -->

<!-- TYPE & STATUS -->
<tr>
    <td bgcolor="#f0f0f0" width="20%" valign="top">
        <strong><webwork:text name="'issue.field.type'"/></strong>
    </td>
    <td bgcolor="#ffffff" width="40%" valign="top">
    <%-- Highlight differences --%>
        <span class="red-highlight"><webwork:property value="/issue/issueTypeObject/nameTranslation(.)" /></span>

    </td>
    <td bgcolor="#ffffff" width="40%" valign="top">
        <span class="green-highlight"><webwork:property value="/updatedIssue/issueTypeObject/nameTranslation(.)" /></span>
    </td>
</tr>

<webwork:if test="currentWorkflow != targetWorkflow">
<tr>
    <td bgcolor="#f0f0f0" width="20%" valign="top">
        <strong><webwork:text name="'issue.field.status'"/></strong> &nbsp;<span class="smallgrey">(<webwork:text name="'convert.issue.to.subtask.workflow'"/>)</span>
    </td>
    <td bgcolor="#ffffff" width="40%" valign="top">
        <webwork:if test="statusChangeRequired == true">
            <span class="red-highlight"><webwork:property value="/issue/statusObject/nameTranslation(.)" /></span>
        </webwork:if>
        <webwork:else>
            <webwork:property value="/issue/statusObject/nameTranslation(.)" />
        </webwork:else>
        <webwork:if test="currentWorkflow != targetWorkflow">
            &nbsp;<span class="red-highlight-small">(<webwork:property value="currentWorkflow/name"/>)</span>
        </webwork:if>
        <webwork:else>
            &nbsp;<span class="smallgrey">(<webwork:property value="currentWorkflow/name"/>)</span>
        </webwork:else>
    </td>
    <td bgcolor="#ffffff" width="40%" valign="top">
        <webwork:if test="statusChangeRequired == true">
            <span class="green-highlight"><webwork:property value="/updatedIssue/statusObject/nameTranslation(.)" /></span>
        </webwork:if>
        <webwork:else>
            <webwork:property value="/updatedIssue/statusObject/nameTranslation(.)" />
        </webwork:else>
        <webwork:if test="currentWorkflow != targetWorkflow">
            &nbsp;<span class="green-highlight-small">(<webwork:property value="targetWorkflow/name"/>)</span>
        </webwork:if>
        <webwork:else>
            &nbsp;<span class="smallgrey">(<webwork:property value="targetWorkflow/name"/>)</span>
        </webwork:else>
    </td>
</tr>
</webwork:if>

<webwork:if test="/issue/subTask == false">

    <!-- Security Level -->
    <webwork:if test="issue/securityLevelId != targetIssue/parentObject/securityLevelId">
    <tr>
        <td bgcolor="#f0f0f0" width="20%" valign="top">
            <webwork:text name="'issue.field.securitylevel'"/>
        </td>
        <td bgcolor="#ffffff" width="40%" valign="top">
            <webwork:if test="/issue/securityLevel">
                <span class="red-highlight"><webwork:property value="/issue/securityLevel/string('name')" /></span>
            </webwork:if>
            <webwork:else>
                <span class="red-highlight"><webwork:text name="'common.words.none'"/></span>
            </webwork:else>
        </td>
        <td bgcolor="#ffffff" width="40%" valign="top">
            <webwork:if test="/targetIssue/parentObject/securityLevel">
                <span class="green-highlight"><webwork:property value="/targetIssue/parentObject/securityLevel/string('name')" /></span>
            </webwork:if>
            <webwork:else>
                <span class="green-highlight"><webwork:text name="'common.words.none'"/></span>    
            </webwork:else>
        </td>
    </tr>
    </webwork:if>
</webwork:if>
