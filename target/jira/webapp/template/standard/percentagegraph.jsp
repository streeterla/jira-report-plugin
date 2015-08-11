<%@ taglib uri="webwork" prefix="webwork" %>
<webwork:property value="parameters['nameValue']">
<webwork:if test=". == null">
    <td><span class="note"><webwork:text name="'common.concepts.noissues'"/></span></td>
</webwork:if>
<webwork:else>
    <webwork:iterator value="rows">
        <webwork:if test="../percentage(.) != 0" >
            <td class="p_graph" width="<webwork:property value="../percentage(.)" />" bgcolor="<webwork:property value="color" />" >
                <webwork:if test="./statuses">
                    <a href="<%= request.getContextPath() %>/secure/IssueNavigator.jspa?reset=true&pid=<webwork:property value="string('project')" />&fixfor=<webwork:property value="string('id')" /><webwork:property value="statuses" />"
                        title="<webwork:text name="'percentagegraph.title'">
                                  <webwork:param name="'value0'"><webwork:property value="description" /></webwork:param>
                                  <webwork:param name="'value1'"><webwork:property value="../percentage(.)" /></webwork:param>
                                  <webwork:param name="'value2'"><webwork:property value="number" /></webwork:param>
                              </webwork:text>" >
                    <img src="<%= request.getContextPath() %>/images/border/spacer.gif" alt="" class="hideOnPrint"
                         width="<webwork:property value="../percentage(.)" />" 
                        title="<webwork:text name="'percentagegraph.title'">
                                  <webwork:param name="'value0'"><webwork:property value="description" /></webwork:param>
                                  <webwork:param name="'value1'"><webwork:property value="../percentage(.)" /></webwork:param>
                                  <webwork:param name="'value2'"><webwork:property value="number" /></webwork:param>
                              </webwork:text>"></a>
                </webwork:if>
                <webwork:else>
                    <img src="<%= request.getContextPath() %>/images/border/spacer.gif" alt="" class="hideOnPrint"
                         width="<webwork:property value="../percentage(.)" />"
                        title="<webwork:text name="'percentagegraph.title'">
                                  <webwork:param name="'value0'"><webwork:property value="description" /></webwork:param>
                                  <webwork:param name="'value1'"><webwork:property value="../percentage(.)" /></webwork:param>
                                  <webwork:param name="'value2'"><webwork:property value="number" /></webwork:param>
                              </webwork:text>" >
                </webwork:else>
            </td>
        </webwork:if>
    </webwork:iterator>
</webwork:else>
</webwork:property>
