<%@ taglib uri="webwork" prefix="webwork" %>
<%
    final String IMG_DONE = request.getContextPath() + "/images/icons/bullet_done.gif";
    final String IMG_NOT_DONE = request.getContextPath() + "/images/icons/bullet_notdone.gif";
    final String IMG_IN_PROGRESS = request.getContextPath() + "/images/icons/bullet_inprogress.gif";
%>
<table cellpadding="3" cellspacing="0" border="0" width="100%">
<tr><td class="noWrap lhc-h">
    <strong><webwork:text name="textKey('title')"/>: <webwork:property value="issue/key" /></strong>
</td></tr>
</table>

<webwork:if test="errorMessages/empty == true">
    <%-- Enterprise Convert Wizard --%>
    <webwork:if test="enterprise == true">
    <table cellpadding="5" border="0">
        <tr><td>
        <table border="0">
        <webwork:if test="currentStep == 1">
            <tr>
                <td valign="top"><img src="<%= IMG_IN_PROGRESS %>" alt=""></td>
                <td class="minWidth"><strong>1.</strong></td>
                <td class="noWrap"><strong><webwork:text name="textKey('step1.title')"/></strong></td>
            </tr>
        </webwork:if>
        <webwork:elseIf test="currentStep > 1">
            <tr>
                <td><img src="<%= IMG_DONE %>" alt=""></td>
                <td class="minWidth">1.</td>
                <td class="noWrap"><a href="<webwork:property value="/actionPrefix"/>.jspa?id=<webwork:property value="issue/id"/>&guid=<webwork:property value="guid"/>"><webwork:text name="textKey('step1.title')"/></a></td>
            </tr>
            <webwork:if test="/issue/subTask == false">
                <tr>
                    <td></td>
                    <td></td>
                    <td class="noWrap">
                        <webwork:text name="textKey('step1.parentissue')">
                            <webwork:param name="'value0'"><strong><webwork:property value="/parentIssueKey"/></strong></webwork:param>
                        </webwork:text>
                    </td>
                </tr>
            </webwork:if>
            <tr>
                <td></td>
                <td></td>
                <td class="noWrap">
                    <webwork:text name="textKey('step1.issuetype')">
                        <webwork:param name="'value0'"><strong><webwork:property value="/targetIssue/issueTypeObject/nameTranslation(.)"/></strong></webwork:param>
                    </webwork:text>
                </td>
            </tr>
        </webwork:elseIf>
        <webwork:else>
            <tr>
                <td valign="top"><img src="<%= IMG_NOT_DONE %>" alt=""></td>
                <td class="minWidth">1.</td>
                <td class="noWrap"><webwork:text name="textKey('step1.title')"/></td>
            </tr>
        </webwork:else>

        <webwork:if test="/currentStep == 2">
            <tr>
                <td><img src="<%= IMG_IN_PROGRESS %>" alt=""></td>
                <td class="minWidth"><strong>2.</strong></td>
                <td><strong><webwork:text name="textKey('step2.title')"/></strong></td>
            </tr>
        </webwork:if>
        <webwork:elseIf test="/currentStep > 2">
            <tr>
                <td><img src="<%= IMG_DONE %>" alt=""></td>
                <td class="minWidth">2.</td>
                <webwork:if test="/statusChangeRequired == true">
                    <td><a href="<webwork:property value="/actionPrefix"/>SetIssueType.jspa?id=<webwork:property value="issue/id"/>&guid=<webwork:property value="guid"/>"><webwork:text name="textKey('step2.title')"/></a></td>
                </webwork:if>
                <webwork:else>
                    <td><webwork:text name="textKey('step2.title')"/></td>
                </webwork:else>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td class="noWrap">
                    <webwork:text name="textKey('step2.status')">
                        <webwork:param name="'value0'"><strong><webwork:property value="/targetIssue/statusObject/nameTranslation(.)"/></strong></webwork:param>
                    </webwork:text>
                </td>
            </tr>
        </webwork:elseIf>
        <webwork:else>
            <tr>
                <td><img src="<%= IMG_NOT_DONE %>" alt=""></td>
                <td class="minWidth">2.</td>
                <td><webwork:text name="textKey('step2.title')"/></td>
            </tr>
        </webwork:else>

        <webwork:if test="/currentStep == 3">
            <tr>
                <td><img src="<%= IMG_IN_PROGRESS %>" alt=""></td>
                <td class="minWidth"><strong>3.</strong></td>
                <td><strong><webwork:text name="textKey('step3.title')"/></strong></td>
            </tr>
        </webwork:if>
        <webwork:elseIf test="/currentStep > 3">
            <tr>
                <td><img src="<%= IMG_DONE %>" alt=""></td>
                <td class="minWidth">3.</td>
                <td><a href="<webwork:property value="/actionPrefix"/>SetStatus.jspa?id=<webwork:property value="issue/id"/>&guid=<webwork:property value="guid"/>"><webwork:text name="textKey('step3.title')"/></a></td>
            </tr>
        </webwork:elseIf>
        <webwork:else>
            <tr>
                <td><img src="<%= IMG_NOT_DONE %>" alt=""></td>
                <td class="minWidth">3.</td>
                <td><webwork:text name="textKey('step3.title')"/></td>
            </tr>
        </webwork:else>

        <webwork:if test="/currentStep == 4">
            <tr>
                <td><img src="<%= IMG_IN_PROGRESS %>" alt=""></td>
                <td class="minWidth"><strong>4.</strong></td>
                <td><strong><webwork:text name="textKey('step4.title')"/></strong></td>
            </tr>
        </webwork:if>
        <webwork:else>
            <tr>
                <td><img src="<%= IMG_NOT_DONE %>" alt=""></td>
                <td class="minWidth">4.</td>
                <td><webwork:text name="textKey('step4.title')"/></td>
            </tr>
        </webwork:else>
        </table>
        <br/>
        <webwork:if test="/currentStep > 1">
            <table cellpadding="1" cellspacing="0" border="0" bgcolor="#bbbbbb" width="80%">
                <tr><td>
                <table cellpadding="4" cellspacing="0" border="0" width="100%" bgcolor="#666666">
                    <td bgcolor="#fffff0"><webwork:text name="textKey('note')"/></td>
                </table>
                </td></tr>
            </table>
        </webwork:if>
        </td></tr>
    </table>
    </webwork:if>




    <%-- Profession Move Wizard --%>
    <webwork:else>
    <table cellpadding="5" border="0">
        <tr><td>
        <table border="0">

        <webwork:if test="currentStep == 1">
            <tr>
                <td valign="top"><img src="<%= IMG_IN_PROGRESS %>" alt=""></td>
                <td class="minWidth"><strong>1.</strong></td>
                <td class="noWrap"><strong>
                <webwork:text name="textKey('step1.title')"/>
                </strong></td>
            </tr>
        </webwork:if>
        <webwork:else>
            <tr>
                <td><img src="<%= IMG_DONE %>" alt=""></td>
                <td class="minWidth">1.</td>
                <td class="noWrap"><a href="<webwork:property value="/actionPrefix"/>.jspa?id=<webwork:property value="issue/id"/>&guid=<webwork:property value="guid"/>"><webwork:text name="textKey('step1.title')"/></a></td>
            </tr>
            <webwork:if test="/issue/subTask == false">
                <tr>
                    <td></td>
                    <td></td>
                    <td class="noWrap">
                        <webwork:text name="textKey('step1.parentissue')">
                            <webwork:param name="'value0'"><strong><webwork:property value="/parentIssueKey"/></strong></webwork:param>
                        </webwork:text>
                    </td>
                </tr>
            </webwork:if>
            <tr>
                <td></td>
                <td></td>
                <td class="noWrap">
                    <webwork:text name="textKey('step1.issuetype')">
                        <webwork:param name="'value0'"><strong><webwork:property value="/targetIssue/issueTypeObject/nameTranslation(.)"/></strong></webwork:param>
                    </webwork:text>
                </td>
            </tr>
        </webwork:else>

        <webwork:if test="/currentStep == 3">
            <tr>
                <td><img src="<%= IMG_IN_PROGRESS %>" alt=""></td>
                <td class="minWidth"><strong>2.</strong></td>
                <td><strong><webwork:text name="textKey('step3.title')"/></strong></td>
            </tr>
        </webwork:if>
        <webwork:elseIf test="/currentStep > 3">
            <tr>
                <td><img src="<%= IMG_DONE %>" alt=""></td>
                <td class="minWidth">2.</td>
                <td><a href="<webwork:property value="/actionPrefix"/>SetIssueType.jspa?id=<webwork:property value="issue/id"/>&guid=<webwork:property value="guid"/>"><webwork:text name="textKey('step3.title')"/></a></td>
            </tr>
        </webwork:elseIf>
        <webwork:else>
            <tr>
                <td><img src="<%= IMG_NOT_DONE %>" alt=""></td>
                <td class="minWidth">2.</td>
                <td><webwork:text name="textKey('step3.title')"/></td>
            </tr>
        </webwork:else>

        <webwork:if test="/currentStep == 4">
            <tr>
                <td><img src="<%= IMG_IN_PROGRESS %>" alt=""></td>
                <td class="minWidth"><strong>3.</strong></td>
                <td><strong><webwork:text name="textKey('step4.title')"/></strong></td>
            </tr>
        </webwork:if>
        <webwork:else>
            <tr>
                <td><img src="<%= IMG_NOT_DONE %>" alt=""></td>
                <td class="minWidth">3.</td>
                <td><webwork:text name="textKey('step4.title')"/></td>
            </tr>
        </webwork:else>
        </table>
        <br/>
        <webwork:if test="/currentStep != 1">
            <table cellpadding="1" cellspacing="0" border="0" bgcolor="#bbbbbb" width="80%">
                <tr><td>
                <table cellpadding="4" cellspacing="0" border="0" width="100%" bgcolor="#666666">
                    <td bgcolor="#fffff0"><webwork:text name="textKey('note')"/></td>
                </table>
                </td></tr>
            </table>
        </webwork:if>
        </td></tr>
    </table>
    </webwork:else>
</webwork:if>
<webwork:else>
    <div style="padding: 4px">
        <webwork:if test="/issue">
            <webwork:text name="textKey('error.exit.issue')">
                <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/browse/<webwork:property value="/issue/key" />"></webwork:param>
                <webwork:param name="'value1'"><webwork:property value="/issue/key" /></webwork:param>
                <webwork:param name="'value2'"></a></webwork:param>
            </webwork:text>
        </webwork:if>
        <webwork:else>
            <webwork:text name="textKey('error.exit.dashboard')">
                <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>"></webwork:param>
                <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>
        </webwork:else>
    </div>
</webwork:else>
