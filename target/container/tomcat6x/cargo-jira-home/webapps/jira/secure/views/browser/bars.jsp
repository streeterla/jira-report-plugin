<%@ taglib uri="webwork" prefix="webwork" %>
<style>
TD.covered {FONT-SIZE: 2px; BACKGROUND: #00df00; BORDER:#9c9c9c 1px solid;}
TD.uncovered {FONT-SIZE: 2px; BACKGROUND: #df0000; BORDER:#9c9c9c 1px solid;}
TD.estimate {FONT-SIZE: 2px; BACKGROUND: #cccccc; BORDER:#9c9c9c 1px solid;}
TD.overestimate {FONT-SIZE: 2px; BACKGROUND: #999999; BORDER:#9c9c9c 1px solid;}
TD.underestimate {FONT-SIZE: 2px; BACKGROUND: #eee; BORDER:#eee 1px solid;}
TABLE.estimateGraph {BORDER-TOP: #ffffff 4px solid;}
</style>
<webwork:property value="summaryBean">
<table width=100%>
    <tr>
        <td valign=middle align=right>
            <span class="bluetext"><b><webwork:text name="'bar.progress'"/></b></span>:
            <b><webwork:property value="../completionPercentage" />%</b>
        </td>
        <td valign=middle width=1%>
            <table class=estimateGraph cellspacing=0 cellpadding=0 width="<webwork:property value="completionTotalWidth"/>">
            <tbody>
            <tr>
                <td class=covered><img src="<%= request.getContextPath() %>/images/border/spacer.gif"
                        width="<webwork:property value="completedWidth" />" height="12"></td>
                <td class=uncovered><img src="<%= request.getContextPath() %>/images/border/spacer.gif" width="<webwork:property value="incompleteWidth" />" height="12"></td>
            </tr>
            </tbody>
            </table>
        </td>
        <td align=left>
            <webwork:text name="'bar.time.completed'">
                <webwork:param name="'value0'"><b><webwork:property value="../timeSpentTot" /></b></webwork:param>
                <webwork:param name="'value1'"><b><webwork:property value="../totalCurrentEst" /></b></webwork:param>
            </webwork:text>.
        </td>
    </tr>
    <tr>
        <td valign=middle align=right>
            <span class="bluetext"><b><webwork:text name="'bar.accuracy'"/></b></span>:
            <b><webwork:property value="../accuracyPercentage" />%</b>
        </td>
        <td valign=middle>
            <table class=estimateGraph cellspacing=0 cellpadding=0 width="<webwork:property value="estimationTotalWidth"/>">
            <tbody>
            <tr>
                <td class=estimate><img src="<%= request.getContextPath() %>/images/border/spacer.gif" width="<webwork:property value="estimateWidth" />" height="12"></td>
                <webwork:if test="underEstimateWidth > 0">
                    <td class=underestimate><img src="<%= request.getContextPath() %>/images/border/spacer.gif" width="<webwork:property value="underEstimateWidth" />" height="12"></td>
                </webwork:if>
                <webwork:else>
                    <td class=overestimate><img src="<%= request.getContextPath() %>/images/border/spacer.gif" width="<webwork:property value="overEstimateWidth" />" height="12"></td>
                </webwork:else>
            </tr>
            </tbody>
            </table>
        </td>
        <td align=left>
            <webwork:if test="../totalOnSchedule == 1">
                <webwork:text name="'bar.issues.ahead'">
                    <webwork:param name="'value0'"><font color="green"></webwork:param>
                    <webwork:param name="'value1'"></font></webwork:param>
                    <webwork:param name="'value2'"><webwork:property value="../originalEstTot" /></webwork:param>
                    <webwork:param name="'value3'"><webwork:property value="accuracyTot"/></webwork:param>
                </webwork:text>.
            </webwork:if>
             <webwork:elseIf test="../totalOnSchedule == -1">
                <webwork:text name="'bar.issues.behind'">
                    <webwork:param name="'value0'"><font color="#990000"></webwork:param>
                    <webwork:param name="'value1'"></font></webwork:param>
                    <webwork:param name="'value2'"><webwork:property value="../originalEstTot" /></webwork:param>
                    <webwork:param name="'value3'"><webwork:property value="accuracyTot"/></webwork:param>
                </webwork:text>.
            </webwork:elseIf>
            <webwork:else>
                <webwork:text name="'bar.issues.onschedule'">
                    <webwork:param name="'value0'"><webwork:property value="../originalEstTot"/></webwork:param>
                </webwork:text>.
            </webwork:else>
        </td>
    </tr>
</table>
</webwork:property>
