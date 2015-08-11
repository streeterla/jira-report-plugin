<%@ page import="webwork.action.CoreActionContext" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%--
    Renders the JIRA logo in a single HTML element; a DIV or an IMG depending on whether the browser requires the
    opacity fix.
    <webwork:component name="'logo.name'" template="logoWithOpacity.jsp" >
        <webwork:param name="'needsOpacityFix'"><%= logoNeedsOpacityFix %></webwork:param>
        <webwork:param name="'logoTitle'"><%= jiraTitle %></webwork:param>
        <webwork:param name="'logoUrl'"><%= jiraLogo %></webwork:param>
        <webwork:param name="'logoWidth'"><%= lookAndFeelBean.getLogoWidth() %></webwork:param>
        <webwork:param name="'logoHeight'"><%= lookAndFeelBean.getLogoHeight() %></webwork:param>
    </webwork:component>
--%>
<webwork:if test="parameters['needsOpacityFix'] == 'true'">
    <div style="height:<webwork:property value="parameters['logoHeight'])"/>px;width:<webwork:property value="parameters['logoWidth'])"/>px;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<webwork:property value="parameters['logoUrl'])"/>', sizingMethod='scale')" alt="<webwork:property value="parameters['logoTitle'])"/>"></div>
</webwork:if>
<webwork:else>
    <img class="logo" src="<webwork:property value="parameters['logoUrl'])"/>" width="<webwork:property value="parameters['logoWidth'])"/>" height="<webwork:property value="parameters['logoHeight'])"/>" border="0" alt="<webwork:property value="parameters['logoTitle'])"/>">
</webwork:else>
