<%@ page import="com.atlassian.core.util.WebRequestUtils, com.opensymphony.util.TextUtils"%>
<%@ taglib uri="sitemesh-decorator" prefix="decorator" %>
<%--
PARAMETERS:
title		- the text of the link
url 		- the URI to link to
selected	- the nav item will be selected if this link matches request.getServletPath().startsWith(selected)
tooltip		- an optional phrase to be used as the tooltip for the navitem link.
--%>
<decorator:usePage id="p" />
<%
    //only hide the javascript if it is IE or Mozilla (not netscape or Opera) - Fixes JRA-1427
    final boolean captureJavascript = WebRequestUtils.isGoodBrowser(request) && TextUtils.noNull(request.getHeader("USER-AGENT")).indexOf("Opera") == -1;

    if (p.getRequest().getServletPath().startsWith(p.getProperty("selected")) ||
        (p.isPropertySet("selected2") && p.getRequest().getServletPath().startsWith(p.getProperty("selected2")))) { %>
<%-- css hack as described here:  http://www.fo3nix.pwp.blueyonder.co.uk/tutorials/css/hacks/ --%>
<%-- only good browsers recognise that 'return false' isn't killing the <a> tag.  So don't 'return false' in netscape 4 --%>
	<td nowrap onClick="window.document.location='<decorator:getProperty property="url" />'" align=center valign=middle class="navItemOver">&nbsp;&nbsp;
        <a <% if (p.isPropertySet("id")) { %> id="<decorator:getProperty property="id" />" <% } %> <% if (p.isPropertySet("tooltip")) { %> title="<decorator:getProperty property="tooltip" />" <% } %> href="<decorator:getProperty property="url" />"
        <% if (p.isPropertySet("accesskey")) { %> accessKey="<decorator:getProperty property="accesskey" />" <% } %>
        <% if (captureJavascript) { %> onClick="return false" <% } %>><decorator:getProperty property="title" /></a> &nbsp;&nbsp;</td>
<% } else { %>
	<td nowrap  onClick="window.document.location='<decorator:getProperty property="url" />'" align=center valign=middle class="navItem" onMouseOver="this.className='navItemOver'" onMouseOut="this.className='navItem'">&nbsp;&nbsp;
    <a <% if (p.isPropertySet("id")) { %> id="<decorator:getProperty property="id" />" <% } %> <% if (p.isPropertySet("tooltip")) { %> title="<decorator:getProperty property="tooltip" />" <% } %> href="<decorator:getProperty property="url" />"
    <% if (p.isPropertySet("accesskey")) { %> accessKey="<decorator:getProperty property="accesskey" />" <% } %>
    <% if (captureJavascript) { %> onClick="return false" <% } %>><decorator:getProperty property="title" /></a> &nbsp;&nbsp;</td>
<% } %>
