<webwork:property value="./priorityObject">
<webwork:if test=". != null"> <%-- handle both objects and genericvalues --%>
<webwork:component name="'priority'" template="constanticon.jsp">
  <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
  <webwork:param name="'iconurl'" value="iconUrl" />                             -
  <webwork:param name="'alt'"><webwork:property value="nameTranslation" /></webwork:param>
  <webwork:param name="'title'"><webwork:property value="nameTranslation"/> - <webwork:property value="descTranslation"/></webwork:param>
</webwork:component>
</webwork:if>
</webwork:property>
<webwork:elseIf test="entityName() != null && string('priority') != null">
<webwork:property value="/constantsManager/priority(string('priority'))">
<webwork:component name="'priority'" template="constanticon.jsp">
  <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
  <webwork:param name="'iconurl'" value="./string('iconurl')" />                             -
  <webwork:param name="'alt'"><webwork:property value="/nameTranslation(.)" /></webwork:param>
  <webwork:param name="'title'"><webwork:property value="/nameTranslation(.)"/> - <webwork:property value="/descTranslation(.)"/></webwork:param>
</webwork:component>
</webwork:property>
</webwork:elseIf>
