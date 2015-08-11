<%@ taglib uri="webwork" prefix="webwork" %>
<table cellpadding="3" cellspacing="0" border="0" width="100%">
<tr><td class="lhc-h">
    <b><webwork:text name="'moveissue.title'"/>: <webwork:if test="/issueValid == true"><webwork:property value="issue/string('key')" /></webwork:if></b>
</td></tr>
</table>

<table cellpadding="5" border="0">
    <tr><td>
    <table border="0">
    <webwork:if test="moveIssueBean/currentStep == 1">
        <tr>
            <td valign="top"><img src="<%= request.getContextPath() %>/images/icons/bullet_inprogress.gif" alt=""></td>
            <td width="1%"><b>1.</b></td>
            <td nowrap><b>
            <webwork:text name="'moveissue.step1.title.ent'"/>
            </b></td>
        </tr>
    </webwork:if>
    <webwork:else>
        <tr>
            <td><img src="<%= request.getContextPath() %>/images/icons/bullet_done.gif" alt=""></td>
            <td width="1%">1.</td>
            <webwork:if test="/moveIssueBean/availablePreviousStep(1) == true">
                <td nowrap><a href="MoveIssue!default.jspa?id=<webwork:property value="issue/string('id')"/>&reset=true"><webwork:text name="'moveissue.step1.title.ent'"/></a></td>
            </webwork:if>
            <webwork:else>
                <td nowrap><webwork:text name="'moveissue.step1.title.ent'"/></td>
            </webwork:else>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td nowrap>
                <webwork:text name="'moveissue.step1.project'">
                    <webwork:param name="'value0'"><b><webwork:property value="/moveIssueBean/targetProjectName"/></b></webwork:param>
                </webwork:text>
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td nowrap>
                <webwork:text name="'moveissue.step1.issuetype'">
                    <webwork:param name="'value0'"><b><webwork:property value="/moveIssueBean/targetTypeName"/></b></webwork:param>
                </webwork:text>
            </td>
        </tr>
    </webwork:else>

    <webwork:if test="/moveIssueBean/currentStep == 2">
        <tr>
            <td><img src="<%= request.getContextPath() %>/images/icons/bullet_inprogress.gif" alt=""></td>
            <td width="1%"><b>2.</b></td>
            <td><b><webwork:text name="'moveissue.step2.title'"/></b></td>
        </tr>
    </webwork:if>
    <webwork:elseIf test="/moveIssueBean/currentStep > 2">
        <tr>
            <td><img src="<%= request.getContextPath() %>/images/icons/bullet_done.gif" alt=""></td>
            <td width="1%">2.</td>
            <webwork:if test="/moveIssueBean/availablePreviousStep(2) == true && statusChangeRequired == true">
                <td><a href="MoveIssueUpdateWorkflow!default.jspa?id=<webwork:property value="issue/string('id')"/>"><webwork:text name="'moveissue.step2.title'"/></a></td>
            </webwork:if>
            <webwork:else>
                <td><webwork:text name="'moveissue.step2.title'"/></td>
            </webwork:else>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td nowrap>
                <webwork:text name="'moveissue.step2.status'">
                    <webwork:param name="'value0'"><b><webwork:property value="/moveIssueBean/targetStatusName"/></b></webwork:param>
                </webwork:text>
            </td>
        </tr>
    </webwork:elseIf>
    <webwork:else>
        <tr>
            <td><img src="<%= request.getContextPath() %>/images/icons/bullet_notdone.gif" alt=""></td>
            <td width="1%">
                2.
            </td>
            <td>
                <webwork:text name="'moveissue.step2.title'"/>
            </td>
        </tr>
    </webwork:else>
    <webwork:if test="/moveIssueBean/currentStep == 3">
        <tr>
            <td><img src="<%= request.getContextPath() %>/images/icons/bullet_inprogress.gif" alt=""></td>
            <td width="1%">
                <b>3.</b>
            </td>
            <td>
                <b><webwork:text name="'moveissue.step3.title'"/></b>
            </td>
        </tr>
    </webwork:if>
    <webwork:elseIf test="/moveIssueBean/currentStep > 3">
        <tr>
            <td><img src="<%= request.getContextPath() %>/images/icons/bullet_done.gif" alt=""></td>
            <td width="1%">3.</td>
            <webwork:if test="/moveIssueBean/availablePreviousStep(3) == true">
                <td><a href="MoveIssueUpdateFields!default.jspa?id=<webwork:property value="issue/string('id')"/>&reset=true"><webwork:text name="'moveissue.step3.title'"/></a></td>
            </webwork:if>
            <webwork:else>
                <td><webwork:text name="'moveissue.step3.title'"/></td>
            </webwork:else>
        </tr>
    </webwork:elseIf>
    <webwork:else>
        <tr>
            <td><img src="<%= request.getContextPath() %>/images/icons/bullet_notdone.gif" alt=""></td>
            <td width="1%">
                3.
            </td>
            <td>
                <webwork:text name="'moveissue.step3.title'"/>
            </td>
        </tr>
    </webwork:else>
    <webwork:if test="/moveIssueBean/currentStep == 4">
        <tr>
            <td><img src="<%= request.getContextPath() %>/images/icons/bullet_inprogress.gif" alt=""></td>
            <td width="1%">
                <b>4.</b>
            </td>
            <td>
                <b><webwork:text name="'moveissue.step4.title'"/></b>
            </td>
        </tr>
    </webwork:if>
    <webwork:else>
        <tr>
            <td><img src="<%= request.getContextPath() %>/images/icons/bullet_notdone.gif" alt=""></td>
            <td width="1%">
                4.
            </td>
            <td>
                <webwork:text name="'moveissue.step4.title'"/>
            </td>
        </tr>
    </webwork:else>
    </table>
    <p>
    <webwork:if test="/moveIssueBean/currentStep != 1">
        <table cellpadding="1" cellspacing="0" border="0" bgcolor="#bbbbbb" width="80%">
            <tr><td>
            <table cellpadding="4" cellspacing="0" border="0" width="100%" bgcolor="#666666">
                <td bgcolor="#fffff0"><webwork:text name="'moveissue.note'"/></td>
            </table>
            </td></tr>
        </table>
    </webwork:if>
    </td></tr>
</table>