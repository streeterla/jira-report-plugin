<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>

<%-- Show conditional results (if any) --%>
<webwork:if test="transition/conditionalResults && transition/conditionalResults/empty == false">
    <h3><webwork:text name="'admin.workflowtransition.conditional.results'"/></h3>

    <p>
    <table align=center bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width=100%><tr><td>
    <table border="0" cellpadding="3" cellspacing="1" width=100%>
        <tr bgcolor=#f0f0f0>
            <td class="colHeaderLink"><webwork:text name="'admin.workflowtransition.destinationstep'"/></td>
            <td class="colHeaderLink"><webwork:text name="'admin.workflowtransition.linked.status'"/></td>
            <td class="colHeaderLink"><webwork:text name="'common.words.operations'"/></td>
        </tr>

        <webwork:iterator value="transition/conditionalResults" status="'status'">
            <tr bgcolor=<webwork:if test="@status/odd == true">ffffff</webwork:if><webwork:else>fffff0</webwork:else>>
                <webwork:property value="/stepDescriptor(.)">
                    <td>
                        <b><webwork:property value="./name"/></b>
                    </td>
                    <td valign=top>
                        <webwork:if test="metaAttributes/('jira.status.id')">
                        <webwork:property value="metaAttributes/('jira.status.id')">
                            <webwork:property value="/status(.)">
                                <webwork:component name="'status'" template="constanticon.jsp">
                                    <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                                    <webwork:param name="'iconurl'" value="./string('iconurl')" />
                                    <webwork:param name="'alt'"><webwork:property value="./string('name')" /></webwork:param>
                                    <webwork:param name="'title'"><webwork:property value="./string('name')" /> - <webwork:property value="./string('description')" /></webwork:param>
                                </webwork:component>
                                <webwork:property value="./string('name')" />
                            </webwork:property>
                        </webwork:property>
                        </webwork:if>
                        <webwork:else>
                            <webwork:text name="'admin.workflowtransition.no.linked.status'"/>
                        </webwork:else>
                    </td>
                </webwork:property>
                <td width=1% valign=top>
                    <a id="conditional_step_xml_<webwork:property value="@status/count"/>" href="<webwork:url page="ViewWorkflowTransitionConditionalResult.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="/step/id" /><webwork:param name="'workflowTransition'" value="/transition/id" /><webwork:param name="'resultCount'" value="@status/count" /></webwork:url>"><webwork:text name="'admin.common.words.xml'"/></a>
                </td>
            </tr>
        </webwork:iterator>
    </table>
    </table>
    </p>
</webwork:if>
