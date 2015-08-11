<%-- This is called by issuelineitem.jsp & also by searchresults.jsp --%>
<%-- issuelineitem.jsp just adds <tr> </tr> to the end of the lines --%>

    <td width=5%><%@ include file="/includes/icons/type.jsp" %></td>
    <td width=5% nowrap><font size=1><a href="<%= request.getContextPath() %>/browse/<webwork:property value="string('key')"/>"><webwork:property value="string('key')" /></a></font></td>
    <td width=5% nowrap>
        <font size=1>
        <webwork:if test="./string('resolution') == null">
            <font color="#990000"><b><webwork:text name="'common.status.UNRESOLVED'" /></b></font>
        </webwork:if>
        <webwork:else>
            <b><webwork:property value="/upperCase(/constantsManager/resolution(string('resolution'))/string('name'))" /></b>
        </webwork:else>
        </font>
    </td>
    <td width=80%>
        <webwork:if test="@issueBean/subTask(.) == true">
            <span class="smallgrey"><a href="<%=request.getContextPath()%>/browse/<webwork:property value="@issueBean/parentIssueKey(.)"/>" style="text-decoration: none; "><webwork:property value="@issueBean/parentIssueKey(.)"/></a></span><br>
            <img src="<%= request.getContextPath() %>/images/icons/link_out_bot.gif" width=16 height=16 border=0 align=absmiddle>
        </webwork:if>
        <font size=1>
        <a href="<%= request.getContextPath() %>/browse/<webwork:property value="string('key')"/>"><webwork:property value="string('summary')" /></a>
        </font>
    </td>
    <td nowrap width=1%>
	<%@ include file="/includes/icons/priority.jsp" %>
    </td>
    <td nowrap width=1%>
	<%@ include file="/includes/icons/status.jsp" %>
    </td>
