<webwork:property value="/constantsManager/issueType(string('type'))">
<webwork:component name="'issuetype'" template="constanticon.jsp">
  <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
  <webwork:param name="'iconurl'" value="./string('iconurl')" />
  <webwork:param name="'alt'"><webwork:property value="/nameTranslation(.)" /></webwork:param>
  <webwork:param name="'title'"><webwork:property value="/nameTranslation(.)"/> - <webwork:property value="/descTranslation(.)" /></webwork:param>
</webwork:component>
</webwork:property>
