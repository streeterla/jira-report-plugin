<%@ taglib uri="webwork" prefix="webwork" %>
<table cellpadding=3 cellspacing=0 border=0 width=100%>
<tr><td class="lhc-h">
    <b><webwork:text name="'movesubtask.title'"/>: <webwork:property value="issue/string('key')" /></b>
</td></tr>
</table>

<table cellpadding="5" border=0>
    <tr><td>
    <table border=0>
    <webwork:if test="moveIssueBean/currentStep == 0">
        <tr>
            <td valgin="top"><img src="<%= request.getContextPath() %>/images/icons/bullet_inprogress.gif"></td>
            <td width="1%"><b>1.</b></td>
            <td nowrap><b>
            <webwork:text name="'move.subtask.step1.title'"/>
            </b></td>
        </tr>
    </webwork:if>
    <webwork:else>
        <tr>
            <td><img src="<%= request.getContextPath() %>/images/icons/bullet_done.gif"></td>
            <td width="1%">1.</td>
            <webwork:if test="/moveIssueBean/availablePreviousStep(0) == true">
                <td nowrap><a href="MoveSubTaskChooseOperation!default.jspa?id=<webwork:property value="issue/string('id')"/>&reset=true"><webwork:text name="'move.subtask.step1.title'"/></a></td>
            </webwork:if>
            <webwork:else>
                <td><webwork:text name="'move.subtask.step1.title'"/></td>
            </webwork:else>
        </tr>
    </webwork:else>

    <webwork:if test="/moveIssueBean/currentStep == 1">
        <tr>
            <td><img src="<%= request.getContextPath() %>/images/icons/bullet_inprogress.gif"></td>
            <td width="1%">
                <b>2.</b>
            </td>
            <td>
                <b><webwork:text name="'move.subtask.step2.title'"/></b>
            </td>
        </tr>
    </webwork:if>
    <webwork:elseIf test="/moveIssueBean/currentStep > 1">
        <tr>
            <td><img src="<%= request.getContextPath() %>/images/icons/bullet_done.gif"></td>
            <td width="1%">2.</td>
            <webwork:if test="/moveIssueBean/availablePreviousStep(1) == true">
                <td><a href="MoveSubTaskType!default.jspa?id=<webwork:property value="issue/string('id')"/>&reset=true"><webwork:text name="'move.subtask.step2.title'"/></a></td>
            </webwork:if>
            <webwork:else>
                <td><webwork:text name="'move.subtask.step2.title'"/></td>
            </webwork:else>
        </tr>
    </webwork:elseIf>
    <webwork:else>
        <tr>
            <td><img src="<%= request.getContextPath() %>/images/icons/bullet_notdone.gif"></td>
            <td width="1%">
                2.
            </td>
            <td>
                <webwork:text name="'move.subtask.step2.title'"/>
            </td>
        </tr>
    </webwork:else>


    <webwork:if test="/moveIssueBean/currentStep == 2">
        <tr>
            <td><img src="<%= request.getContextPath() %>/images/icons/bullet_inprogress.gif"></td>
            <td width="1%">
                <b>3.</b>
            </td>
            <td>
                <b><webwork:text name="'move.subtask.step3.title'"/></b>
            </td>
        </tr>
    </webwork:if>
    <webwork:elseIf test="/moveIssueBean/currentStep > 2">
        <tr>
            <td><img src="<%= request.getContextPath() %>/images/icons/bullet_done.gif"></td>
            <td width="1%">3.</td>
            <webwork:if test="/moveIssueBean/availablePreviousStep(1) == true">
                <td><a href="MoveIssueUpdateFields!default.jspa?id=<webwork:property value="issue/string('id')"/>&reset=true"><webwork:text name="'move.subtask.step3.title'"/></a></td>
            </webwork:if>
            <webwork:else>
                <td><webwork:text name="'move.subtask.step3.title'"/></td>
            </webwork:else>
        </tr>
    </webwork:elseIf>
    <webwork:else>
        <tr>
            <td><img src="<%= request.getContextPath() %>/images/icons/bullet_notdone.gif"></td>
            <td width="1%">
                3.
            </td>
            <td>
                <webwork:text name="'move.subtask.step3.title'"/>
            </td>
        </tr>
    </webwork:else>

    <webwork:if test="/moveIssueBean/currentStep == 3">
        <tr>
            <td><img src="<%= request.getContextPath() %>/images/icons/bullet_inprogress.gif"></td>
            <td width="1%">
                <b>4.</b>
            </td>
            <td>
                <b><webwork:text name="'move.subtask.step4.title'"/></b>
            </td>
        </tr>
    </webwork:if>
    <webwork:else>
        <tr>
            <td><img src="<%= request.getContextPath() %>/images/icons/bullet_notdone.gif"></td>
            <td width="1%">
                4.
            </td>
            <td>
                <webwork:text name="'move.subtask.step4.title'"/>
            </td>
        </tr>
    </webwork:else>
    </table>

<webwork:if test="/moveIssueBean/currentStep != 0">
    <div class="infoBox " style="margin: 10px;"><webwork:text name="'moveissue.note'"/></div>
</webwork:if>

    </td></tr>
</table>
