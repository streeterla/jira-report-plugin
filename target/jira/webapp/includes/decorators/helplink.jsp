<% if (p.isPropertySet("localHelpAction")) {
    String action = p.getProperty("localHelpAction");
 %>
 <a class="help-lnk" href=<%=action%>> <img src="<%= request.getContextPath() %>/images/icons/help_blue.gif"
    width=16 height=16 align=right border=0 alt="Test"
    title="Get local help"></a>
<%
}
if (p.isPropertySet("helpURL")) {
    String helpUrl = "'" + p.getProperty("helpURL") + "'";
    String helpURLFragment = "";
    if (p.isPropertySet("helpURLFragment"))
        helpURLFragment = p.getProperty("helpURLFragment"); %>
    <webwork:component template="help.jsp" name="<%= helpUrl %>" >
        <webwork:param name="'helpURLFragment'"><%= helpURLFragment %></webwork:param>
    </webwork:component>
<% } %>
