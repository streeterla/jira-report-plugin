<%@ include file="/includes/decorators/header-deprecated.jsp" %>

<table border="0" cellpadding="5" cellspacing="0" width="100%" bgcolor="#ffffff">
<tr><td valign="top">

        <%-- get 'titlePrefix' from header.jsp which is the application title --%>
        <h1 class="pagetitle"><%= (titlePrefix != null ? titlePrefix : "") %></h1>
            
		<decorator:body />

</td></tr>
</table>

<%@ include file="/includes/decorators/footer.jsp" %>
