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
        <input type="submit" name="check" value="<webwork:text name="'admin.common.words.check'"/>">
    </page:param>

    <page:param name="description">
        <webwork:text name="'admin.integritychecker.select.one.or.more.integrity.checks'"/>
    </page:param>

    <tr bgcolor=#f0f0f0>
        <td class="colHeaderLink" width="1%" nowrap>
            <input type="checkbox" name="all" onClick="changeAll(this)">&nbsp;&nbsp;
        </td>
        <td class="colHeaderLink" colspan="2" width="99%">
            <b><webwork:text name="'admin.integritychecker.select.all.checks'"/></b>
        </td>
    </tr>

    <webwork:iterator value="integrityChecks" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
            <td width="1%">
                <webwork:if test="./available == true">
                    <input type="checkbox" name="integrity_<webwork:property value="./id"/>" value="<webwork:property value="./id"/>" onClick="changeIntegrity(this)">&nbsp;&nbsp;
                </webwork:if>
                <webwork:else>
                    &nbsp;
                </webwork:else>
            </td>
            <td valign="top" colspan="2" width="100%">
                <webwork:property value="./description" />
            </td>
        </tr>
        <webwork:iterator value="./checks">
            <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
                <td valign="top" width="1%">&nbsp;</td>
                <td width="1%" valign="top" align="right">
                    <%-- Ensure that if the check box --%>
                    <webwork:if test="available == true">
                        <webwork:component name="/checkId(.)" value="/checked(.)" label="''" template="checkbox.jsp" theme="'single'" >
                            <webwork:param name="'fieldValue'" value="./id" />
                        </webwork:component>
                    </webwork:if>
                    <webwork:else>
                        &nbsp;
                    </webwork:else>
                </td>
                <td valign="top" width="99%">
                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td colspan="2">
                                <%-- Check if the action is available--%>
                                <webwork:if test="available == true">
                                    <webwork:property value="./description"/>                                                                        
                                </webwork:if>
                                <webwork:else>
                                    <font color="#999999"><webwork:property value="./description"/> - <webwork:property value="unavailableMessage"/></font>
                                </webwork:else>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </webwork:iterator>
    </webwork:iterator>
</page:applyDecorator>
</body>
</html>
