<%@ page import="com.opensymphony.util.TextUtils" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-decorator" prefix="decorator" %>

<%--
PARAMETERS: (all are optional)
title			- a title for this form (HTML)
width		    - the width of the border table (HTML)
helpURL		    - the URL of a help link related to this panel
--%>
<decorator:usePage id="p" />

<table cellpadding=0 cellspacing=0 border=0 bgcolor=#bbbbbb width="<%= (p.isPropertySet("width") ? p.getProperty("width") : "95%" )%>" align="center">
<tr><td>
<table <% if (p.isPropertySet("id")) { %>id="<%=p.getProperty("id")%>" <% } %> cellpadding=3 cellspacing=1 border=0 width="100%">

<% if (p.isPropertySet("title") && TextUtils.stringSet(p.getProperty("title"))) { %>
<tr>
    
    <% if (p.isPropertySet("titleColspan")) { %>
        <td bgcolor=#f0f0f0 colspan=<%= p.getProperty("titleColspan") %> >
    <% } else { %>
        <td bgcolor=#f0f0f0>
    <% } %>
        <%@ include file="/includes/decorators/helplink.jsp" %>

    <h3 class="formtitle"><decorator:getProperty property="title" /></h3>

    <% if (p.isPropertySet("description")) { %>
    <br>
<decorator:getProperty property="description" />
    <% } %>
    </td>
</tr>
<% } %>

<%-- error messages --%>
<webwork:if test="hasErrorMessages == 'true'">
    <tr>
    <td class="formErrors">
        <font color=#cc0000><b>Errors</b>:</font>
        <ul>
            <webwork:iterator value="errorMessages">
            <li><webwork:property /></li>
            </webwork:iterator>
        </ul>
    </td>
    </tr>
</webwork:if>

<decorator:body />

</table>
</td></tr>
</table>
