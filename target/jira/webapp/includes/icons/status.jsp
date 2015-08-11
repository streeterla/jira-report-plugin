<webwork:property value="./statusObject">
<webwork:if test=". != null"> <%-- handle both objects and genericvalues --%>
<webwork:component name="'status'" template="constanticon.jsp">
  <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
  <webwork:param name="'iconurl'" value="iconUrl" />                             -
  <webwork:param name="'alt'"><webwork:property value="nameTranslation" /></webwork:param>
  <webwork:param name="'title'"><webwork:property value="nameTranslation"/> - <webwork:property value="descTranslation"/></webwork:param>
</webwork:component>
</webwork:if>
</webwork:property>
<webwork:else>
<webwork:property value="/constantsManager/status(string('status'))">
<webwork:component name="'status'" template="constanticon.jsp">
  <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
  <webwork:param name="'iconurl'" value="./string('iconurl')" />
  <webwork:param name="'alt'"><webwork:property value="/nameTranslation(.)" /></webwork:param>
  <webwork:param name="'title'"><webwork:property value="/nameTranslation(.)"/> - <webwork:property value="/descTranslation(.)"/></webwork:param>
</webwork:component>
</webwork:property>
</webwork:else>
