<%@ page import="webwork.action.CoreActionContext"%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%-- Modified controlheader.jsp: --%>
<jsp:include page="/template/standard/duedatecontrolheader.jsp" />
<%-- End modified controlheader.jsp: --%>
<table border="0" width="100%"
    <webwork:property value="parameters['style']">
        <webwork:if test=".">style="<webwork:property value="."/>"</webwork:if>
    </webwork:property>
cellspacing="0" cellpadding="0">
    <tr>
        <td>
            <span class="label">
                <webwork:property value="parameters['labelPrevious']">
                    <webwork:if test="."><webwork:property value="."/></webwork:if>
                </webwork:property>
            </span>
        </td>
        <td>
            <jsp:include page="/template/standard/duedatenextfield.jsp" />
        </td>
        <td>
            <span class="label">
                <webwork:property value="parameters['labelNext']">
                    <webwork:if test="."><webwork:property value="."/></webwork:if>
                </webwork:property>
            </span>
        </td>
        <td>
            <jsp:include page="/template/standard/duedatepreviousfield.jsp" />
        </td>
        <td align="right">
            <%
                Object value = CoreActionContext.getValueStack().findValue("parameters['firstLineInclude']");
                if (value != null) {
                String include = value.toString();
            %>
            <jsp:include page="<%=include%>"/>
            <%}%>
        </td>
        <%-- Include the help icon on the same line as the text components. --%>
        <td><webwork:property value="parameters['helpURL']">
            <webwork:if test=".">
            <webwork:component template="help.jsp" name="." >
                <webwork:param name="'align'">middle</webwork:param>
                <webwork:param name="'helpURLFragment'" value="parameters['helpURLFragment']"/>
            </webwork:component>
			</webwork:if>
         </webwork:property></td>
    </tr>
 </table>

 <%-- include the control footer here, as we don't want a <br> before the description as in the normal control footer --%>
        <webwork:property value="parameters['description']">
            <webwork:if test=".">
				<span class="subText"><webwork:property value="." escape="false" /></span>
			</webwork:if>
         </webwork:property>
	</td>
</tr>
