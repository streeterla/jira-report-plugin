<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><webwork:text name="'admin.integritychecker.integrity.checker'"/></title>
</head>
<body>
<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'admin.integritychecker.integrity.checker'"/></page:param>
    <page:param name="action">IntegrityChecker.jspa</page:param>
    <page:param name="width">100%</page:param>
    <page:param name="columns">3</page:param>
    <page:param name="buttons">
        <input type="button" name="okbutton" value="<webwork:text name="'admin.common.words.ok'"/>" onclick="location.href='IntegrityChecker!default.jspa'">
    </page:param>

    <page:param name="description">
        <webwork:if test="/totalResults > 0">
            <webwork:text name="'admin.integritychecker.x.errors.corrected'">
               <webwork:param name="'value0'"><webwork:property value="/totalResults"/></webwork:param>
            </webwork:text>
        </webwork:if>
        <webwork:else>
            <webwork:text name="'admin.integritychecker.no.errors.corrected'"/>
        </webwork:else>
    </page:param>

    <tr bgcolor=#f0f0f0>
        <td class="colHeaderLink" colspan="2" width="99%">
            <b><webwork:text name="'common.concepts.description'"/></b>
        </td>
        <td class="colHeaderLink" width="1%">
            &nbsp;
        </td>
    </tr>

    <webwork:iterator value="integrityChecks" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
            <td valign="top" colspan="2" width="99%">
                <webwork:property value="./description" />
            </td>
            <td width="1%">
                &nbsp;
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
                        <webwork:if test="/results/(.) != null && /results/(.)/empty == false">
                            <webwork:if test="/hasWarningResults(.) == true">
                                <font color="#cc6600">
                            </webwork:if>
                            <webwork:else>
                                <font color="#009900">
                            </webwork:else>
                        </webwork:if>
                        <webwork:else>
                            <font>
                        </webwork:else>

                        <webwork:property value="./description"/>
                        </font></td></tr>
                        <webwork:if test="/results/(.) != null && /results/(.)/empty == false">
                                <webwork:iterator value="/results/(.)">
                                    <tr>
                                        <td valign="top">
                                            <jira:linkbugkeys>
                                                &nbsp;&nbsp;
                                                <%-- determine the color of the message --%>
                                                <webwork:if test="./warning == true">
                                                    <webwork:text name="'admin.integritychecker.UNFIXABLE.ERROR'"/>:
                                                </webwork:if>
                                                <webwork:else>
                                                    <webwork:text name="'admin.integritychecker.FIXED'"/>:
                                                </webwork:else>
                                            </jira:linkbugkeys>
                                        </td>
                                        <td>
                                            <webwork:if test="./warning == true">
                                                    <font color="#FF0004">
                                                </webwork:if>
                                                <webwork:else>
                                                    <font color="#009900">
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
                <td width="1%" valign="top">
                    &nbsp;
                </td>
            </tr>
        </webwork:iterator>
    </webwork:iterator>
</page:applyDecorator>
</body>
</html>
