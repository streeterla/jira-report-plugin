<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-decorator" prefix="decorator" %>

<%--
PARAMETERS: (all are optional)
title			- a title for this form (HTML)
width		    - the width of the border table (HTML)
helpURL		    - the URL of a help link related to this panel
--%>
<decorator:usePage id="p" />

<table class="jiraform <decorator:getProperty property="class" /><% if (!p.isPropertySet("width") || (p.isPropertySet("width") && p.getProperty("width").equals("100%"))){%> maxWidth<%}%>"
       <% if (p.isPropertySet("width") && !p.getProperty("width").equals("100%")){%>width="<decorator:getProperty property="width" />"<%}%>
>

<% if (p.isPropertySet("title") && StringUtils.isNotBlank(p.getProperty("title"))) { %>
<tr>
    <td class="jiraformheader">
    <%@ include file="/includes/decorators/helplink.jsp" %>

    <h3 class="formtitle"><decorator:getProperty property="title" /></h3></td>
</tr>
<% } %>
<% if (p.isPropertySet("description") && StringUtils.isNotBlank(p.getProperty("description"))) { %>
<tr>
    <td class="jiraformheader"><decorator:getProperty property="description" /></td>
</tr>
<% } %>
	<% if (p.isPropertySet("instructions") && StringUtils.isNotBlank(p.getProperty("instructions"))) { %>
	<tr>
		<td class="instructions">
        <decorator:getProperty property="instructions" />
        </td>
	</tr>
	<% } %>
<%-- error messages --%>
<webwork:if test="hasErrorMessages == 'true'">
<tr>
    <td class="formErrors">
    <div class="errorArea">
        <h4><webwork:text name="'panel.errors'"/></h4>
        <ul>
        <webwork:iterator value="flushedErrorMessages">
        <li><webwork:property /></li>
        </webwork:iterator>
        </ul>
    </div>
    </td>
</tr>
</webwork:if>

    <tr>
    <td class="jiraformbody">
        <decorator:body />
    </td>
    </tr>
<% if (p.isPropertySet("footerHtml")) { %>
	<tr>
		<td class="darkFooter">
            <decorator:getProperty property="footerHtml" />
		</td>
	</tr>
<% }  else if (p.isPropertySet("cancelURI") || p.isPropertySet("buttons")){%>
    <tr>
        <td class="fullyCentered jiraformfooter" >
			<% if (p.isPropertySet("buttons")) { %>
                <decorator:getProperty property="buttons" />
			<% } %>
			<% if (p.isPropertySet("cancelURI")) { %>
                <input id="cancelButton"  type="button"
                       accesskey="<webwork:text name="'common.forms.cancel.accesskey'" />"
                       title="<webwork:property value="text('common.forms.cancel')"/> (Alt + <webwork:text name="'common.forms.cancel.accesskey'" />)"
                       name="<decorator:getProperty property="cancelURI" />"
                       value="<webwork:property value="text('common.forms.cancel')"/>"
                       onclick="location.href='<webwork:if test="/returnUrl != null"><webwork:property value="/returnUrl" /></webwork:if><webwork:else><decorator:getProperty property="cancelURI" /></webwork:else>'"
                />
			<% } %>
        </td>
    </tr>
<% } %>

</table>
