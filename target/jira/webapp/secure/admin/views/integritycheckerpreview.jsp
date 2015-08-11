<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><webwork:text name="'admin.integritychecker.integrity.checker'"/></title>
</head>
<body>
<script language="JavaScript">
    function changeAll(checkbox)
    {
        checkStartingWith("<webwork:property value="/integrityCheckPrefix"/>", checkbox.checked);
    }

    function changeIntegrity(checkbox)
    {
        checkStartingWith("<webwork:property value="/checkPrefix"/>" + checkbox.name.split("_")[1], checkbox.checked);
    }

    function checkStartingWith(prefix, checked)
    {
        var elements = document.forms['jiraform'].elements;
        for (var i=0;i<elements.length;i++)
        {
            if (elements[i].name.indexOf(prefix) == 0)
            {
                elements[i].checked = checked;
            }
        }
    }
</script>
<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'admin.integritychecker.integrity.checker'"/></page:param>
    <page:param name="action">IntegrityChecker.jspa</page:param>
    <page:param name="width">100%</page:param>
    <page:param name="columns">3</page:param>
    <page:param name="buttons">
        <webwork:if test="/hasCorrectableResults == true">
            <input type="submit" name="fix" value="<webwork:text name="'admin.common.words.fix'"/>">
        </webwork:if>
        <input type="submit" name="back" value="<webwork:text name="'admin.common.words.back'"/>">
    </page:param>

    <page:param name="description">
        <webwork:if test="/hasCorrectableResults == true">
            <webwork:text name="'admin.integritychecker.choose'"/>
        </webwork:if>
        <webwork:else>
            <webwork:text name="'admin.integritychecker.no.errors'"/>
        </webwork:else>
    </page:param>

    <tr bgcolor=#f0f0f0>
        <td class="colHeaderLink" colspan="2" width="99%">
            <b><webwork:text name="'common.concepts.description'"/></b>
        </td>
        <td class="colHeaderLink" width="1%">
            <webwork:if test="/hasCorrectableResults == true">
                <input type="checkbox" name="all" onClick="changeAll(this)">&nbsp;&nbsp;
            </webwork:if>
            <webwork:else>
                &nbsp;
            </webwork:else>
        </td>
    </tr>

    <webwork:iterator value="integrityChecks" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
            <td valign="top" colspan="2" width="99%">
                <webwork:property value="./description" />
            </td>
            <td width="1%" nowrap>
                <%-- Only show the check box if we have correctable results for this integrity check --%>
                <webwork:if test="/integrityCheckAvailable(.) == true">
                    <input type="checkbox" name="integrity_<webwork:property value="./id"/>" value="<webwork:property value="./id"/>" onClick="changeIntegrity(this)">&nbsp;&nbsp;
                </webwork:if>
                <webwork:else>
                    &nbsp;
                </webwork:else>
            </td>
        </tr>
        <webwork:iterator value="./checks">
            <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
                <td valign="top" width="1%">&nbsp;</td>
                <td valign="top" width="99%">
                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                    <tr><td colspan="2">
                    <%-- Check if the action is available--%>
                    <webwork:if test="available == false">
                        <font color="#999999"><webwork:property value="./description"/> - <webwork:property value="unavailableMessage"/></font>
                        </td></tr></table>
                    </webwork:if>
                    <webwork:else>
                        <%-- Work out the color for the check --%>
                        <webwork:if test="/checked(.) == true">
                            <webwork:if test="/results/(.) != null && /results/(.)/empty == false">
                                <webwork:if test="/hasCorrectableResults(.) == true">
                                    <font color="#990000">
                                </webwork:if>
                                <webwork:else>
                                    <font color="#cc6600">
                                </webwork:else>
                            </webwork:if>
                            <webwork:else>
                                <webwork:text name="'admin.integritychecker.PASSED'"/>:<font color="#009900">
                            </webwork:else>
                        </webwork:if>
                        <webwork:else>
                            <%-- No color as the integrity check was not selected --%>
                            <font>
                        </webwork:else>

                        <webwork:property value="./description"/>
                        </font></td></tr>
                        <webwork:if test="/results/(.) != null && /results/(.)/empty == false">
                                <webwork:iterator value="/results/(.)">
                                    <tr>
                                        <td valign="top" nowrap="true">
                                            &nbsp;&nbsp;
                                            <%-- determine the color of the message --%>
                                            <webwork:if test="./error == true">
                                                <webwork:text name="'admin.integritychecker.ERROR'"/>:
                                            </webwork:if>
                                            <webwork:else>
                                                <webwork:text name="'admin.integritychecker.UNFIXABLE.ERROR'"/>:
                                            </webwork:else>
                                        </td>
                                        <td>
                                            <webwork:if test="./error == true">
                                                <font color="#990000">
                                            </webwork:if>
                                            <webwork:else>
                                                <font color="#FF0004">
                                            </webwork:else>
                                            <jira:linkbugkeys>
                                                <webwork:property value="./message" escape="false" /></font>
                                            </jira:linkbugkeys>
                                        </td>
                                        <td>
                                            <webwork:if test="./bugId != null && ./bugId/trim/length > 0">
                                                <a href="http://jira.atlassian.com/secure/ViewIssue.jspa?key=<webwork:property value="./bugId"/>"><webwork:property value="./bugId"/></a>
                                            </webwork:if>
                                            <webwork:else>
                                                &nbsp;
                                            </webwork:else>
                                        </td>
                                    </tr>
                                </webwork:iterator>
                        </webwork:if>
                        </table>
                        </font>
                    </webwork:else>
                </td>
                <td width="1%" valign="top" align="right">
                    <%-- Ensure that if the check box --%>
                    <webwork:if test="/checkAvailable(.) == true">
                        <webwork:component name="/checkId(.)" value="/checked(.)" label="''" template="checkbox.jsp" theme="'single'" >
                            <webwork:param name="'fieldValue'" value="./id" />
                        </webwork:component>
                    </webwork:if>
                    <webwork:else>
                            &nbsp;
                    </webwork:else>
                </td>
            </tr>
        </webwork:iterator>
    </webwork:iterator>
</page:applyDecorator>
</body>
</html>
