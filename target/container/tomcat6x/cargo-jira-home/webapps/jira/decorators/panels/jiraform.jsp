<%@ page import="com.atlassian.jira.util.BrowserUtils"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.log4j.Logger" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-decorator" prefix="decorator" %>

<%--
PARAMETERS: (all are optional)
action 			- the URI to submit this form too
submitName		- the name of the submit button
submitId		- the id of the submit button (ALWAYS USE THIS!)
submitClassName - class name of submit button
cancelURI		- the location to redirect to for the cancel button (no cancel button if this isn't present)
leftButtons	    - any other buttons to put to the left of the submit button
buttons			- any other buttons to put next to the submit button
autoSelectFirst	- unless this is present and "false", the first element of the form will be selected automatically using JavaScript
title			- a title for this form (HTML)
notable		    - if this is specified, JIRA form will not output a border table (HTML)
width		    - the width of the border table (HTML)
multipart		- if this parameter is present, the form will be a multipart form
helpURL		    - the URL of a help link related to this form
helpURLFragment - the #fragment identifier to append to the helpURL. Value must include the #
columns         - the number of columns the underlying form will have
method          - the method of the form to submit (get or post)
--%>
<decorator:usePage id="p" />

<%!
    private static final Logger log = Logger.getLogger("jiraform.jsp");
%>

<%
    // Set some defaults
    String columns = (p.isPropertySet("columns")) ? p.getProperty("columns") : "2";
    int columnsInt = Integer.parseInt(columns);
    request.setAttribute("modifierKey", BrowserUtils.getModifierKey());
%>

<% if (StringUtils.isNotBlank(p.getProperty("labelWidth"))) { %>
<style type="text/css"> .fieldLabelArea {width: <decorator:getProperty property="labelWidth" />;}</style>
<% } %>

<% if (p.isPropertySet("action")) { %>
<form action="<decorator:getProperty property="action" />" method="<decorator:getProperty property="method" default="post" />" name="<decorator:getProperty property="formName" default="jiraform" />" <% if (p.isPropertySet("onsubmit")) { %>onsubmit="<decorator:getProperty property="onsubmit"/>" <% } else { %>onsubmit="if (this.submitted) return false; this.submitted = true; return true"<% } %> <% if (p.isPropertySet("multipart")) { %> ENCTYPE="multipart/form-data"<% } %><% if (p.isPropertySet("autocomplete")) { %> autocomplete="<decorator:getProperty property="autocomplete"/>"<% } %> <% if (p.isPropertySet("class")) { %> class="<decorator:getProperty property="class"/>"<% } %>>
    <webwork:component name="'atl_token'" value="/xsrfToken" template="hidden.jsp"/>
<% } %>
	<% if (!p.isPropertySet("notable")) { %>
	<table class="jiraform<% if (!p.isPropertySet("width") || (p.isPropertySet("width") && p.getProperty("width").equals("100%"))){%> maxWidth<%}%>" <% if (p.isPropertySet("jiraformId")) { %>id="<decorator:getProperty property="jiraformId" />"<%}%>
    <% if (p.isPropertySet("width") && !p.getProperty("width").equals("100%")){%>width="<decorator:getProperty property="width" />"<%}%>>
	<% } %>

	<% if (p.isPropertySet("title") && StringUtils.isNotBlank(p.getProperty("title"))) { %>
	<tr class="titlerow">
		<td colspan="<%=columns%>" class="jiraformheader">
        <% if (p.isPropertySet("pretitle")) { %> <decorator:getProperty property="pretitle" />
        <% } if (p.isPropertySet("localHelpAction")) {
            String action = p.getProperty("localHelpAction");
         %>
         <a href="<%=action%>"> <img src="<%= request.getContextPath() %>/images/icons/help_blue.gif"
            width=16 height=16 align=right border=0 alt="Help"
            title="Get local help" /></a>
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
        <h3 class="formtitle"><decorator:getProperty property="title" /><% if (p.isPropertySet("wizard") && "true".equalsIgnoreCase(p.getProperty("wizard"))) { %> (<webwork:text name="'admin.common.phrases.step.x.of.x'">
           <webwork:param name="'value0'"><webwork:property value="/currentStep" /></webwork:param>
           <webwork:param name="'value1'"><webwork:property value="/totalSteps" /></webwork:param>
        </webwork:text>)<%}%></h3></td>
	</tr>
	<% } %>
	<% if (StringUtils.isNotBlank(p.getProperty("description"))) { %>
	<tr class="descriptionrow">
		<td colspan="<%=columns%>" class="jiraformheader">
        <div class="desc-wrap"><decorator:getProperty property="description" /></div>
        <div class="notify info"><decorator:getProperty property="description" /></div>
        </td>
	</tr>
	<% } %>
	<% if (StringUtils.isNotBlank(p.getProperty("instructions"))) { %>
	<tr>
		<td colspan="<%=columns%>" class="instructions">
        <decorator:getProperty property="instructions" />
        </td>
	</tr>
	<% } %>

	<%-- formwide error messages --%>
	<webwork:if test="hasErrorMessages == 'true'">
    <tr>
		<td colspan="<%=columns%>" class="formErrors">
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

    <tr class="ihatemyselffordoingthis"><td colspan="<%=columns%>"></td></tr>
	<decorator:body />

<% if (p.isPropertySet("wizard") && "true".equalsIgnoreCase(p.getProperty("wizard"))) { %>
	<tr>
		<td colspan="<%=columns%>" class="wizardFooter">
            <div class="wizardInfo">
                <decorator:getProperty property="title" /><br />
                <webwork:text name="'admin.common.phrases.step.x.of.x'">
                    <webwork:param name="'value0'"><webwork:property value="/currentStep" /></webwork:param>
                    <webwork:param name="'value1'"><webwork:property value="/totalSteps" /></webwork:param>
                </webwork:text>
            </div>

            <webwork:if test="/currentStep == /totalSteps">
            <% if (!p.isPropertySet("finishButton"))
               { %>
                <webwork:property value="text('common.forms.finish')" id="nextLabel" />

			<% }
               else
               {
                   request.setAttribute("nextLabel", p.getProperty("finishButton"));
               }
            %>
            </webwork:if>
            <webwork:else>
                <webwork:property value="text('common.forms.next.with.arrows')" id="nextLabel"   />
            </webwork:else>


            <input id="currentStep" type="hidden" name="currentStep" value="<webwork:property value="/currentStep" />" />
            <input id="hiddennextButton"  type="submit" name="nextBtn" value="<webwork:property value="@nextLabel" />" accesskey="N" class="hiddenButton" />

            <input id="previousButton" type="submit" name="previousBtn" value="<webwork:text name="'common.forms.previous.with.arrows'"/>" accesskey="P" <webwork:if test="/currentStep == 1">disabled="disabled"</webwork:if> />
            <input id="nextButton"  type="submit" name="nextBtn" value="<webwork:property value="@nextLabel" />"   accesskey="<webwork:text name="'common.forms.submit.accesskey'"/>"
                       title="<webwork:text name="'common.forms.submit.tooltip'">
                       <webwork:param name="'value0'"><webwork:text name="'common.forms.submit.accesskey'"/></webwork:param>
                       <webwork:param name="'value1'"><webwork:property value="@modifierKey"/></webwork:param>
                       </webwork:text>" />


            <% if (p.isPropertySet("buttons")) { %>
				<decorator:getProperty property="buttons" />
			<% } %>
			<% if (p.isPropertySet("cancelURI")) { %>
			<input id="cancelButton" accesskey="<webwork:text name="'common.forms.cancel.accesskey'" />"
                       title="<webwork:property value="text('common.forms.cancel')"/> (<webwork:property value="@modifierKey"/> + <webwork:text name="'common.forms.cancel.accesskey'" />)"
                       type="button" name="<decorator:getProperty property="cancelURI" />"
                       value="<webwork:property value="text('common.forms.cancel')"/>"
                       onclick="location.href='<webwork:if test="/returnUrl != null"><webwork:if test="/returnUrl/startsWith('/') == true"><%= request.getContextPath() %></webwork:if><webwork:property value="/returnUrl" /></webwork:if><webwork:else><decorator:getProperty property="cancelURI" /></webwork:else>'"
                    />
			<% } %>


		</td>
	</tr>
<% } else if (p.isPropertySet("cancelURI") || p.isPropertySet("buttons") || p.isPropertySet("submitName") || p.isPropertySet("leftButtons")){%>
	<tr>
        <%
            if (columnsInt > 1)
            {
        %>
        <td class="jiraformfooter">&nbsp;</td>
		<td colspan="<%=columnsInt - 1%>">
        <%
            } else {
        %>
            <td class="fullyCentered jiraformfooter" >
        <%
            }
        %>
            <% if (p.isPropertySet("leftButtons")) { %>
                <decorator:getProperty property="leftButtons" />
            <% } %>
			<% if (StringUtils.isNotBlank(p.getProperty("submitName"))) { %>
				<input type="submit" name="<decorator:getProperty property="submitName" />" value="<decorator:getProperty property="submitName" />"
                       <% if (StringUtils.isBlank(p.getProperty("submitId"))) { %>
                            id="<decorator:getProperty property="submitName" />"
                       <%       log.info("i18n problem: id defined by localised value: " + p.getProperty("submitName"));
                           } else {%>
                            id="<decorator:getProperty property="submitId" />"
                        <% } %>

			<% if (StringUtils.isBlank(p.getProperty("submitAccessKey"))) { %>
                       accesskey="<webwork:text name="'common.forms.submit.accesskey'"/>"
                       title="<webwork:text name="'common.forms.submit.tooltip'">
                       <webwork:param name="'value0'"><webwork:text name="'common.forms.submit.accesskey'"/></webwork:param>
                       <webwork:param name="'value1'"><webwork:property value="@modifierKey"/></webwork:param>
                       </webwork:text>"
			<% } else {%>
                       accesskey="<decorator:getProperty property="submitName" />"
                       title="<decorator:getProperty property="submitName" /> (<webwork:property value="@modifierKey"/> + <decorator:getProperty property="submitAccessKey" />)"
            <%}%>
                        <% if (p.isPropertySet("onclicksubmit")) { %>onclick="<decorator:getProperty property="onclicksubmit" />"<% } %>
                        class="spaced <% if (p.isPropertySet("submitClassName")) { %><decorator:getProperty property="submitClassName" /><% } %>"
                />


			<% } %>
			<% if (p.isPropertySet("buttons")) { %>
				<decorator:getProperty property="buttons" />
			<% } %>
			<% if (p.isPropertySet("cancelURI")) { %>
			    <input id="cancelButton"  type="button"
                       accesskey="<webwork:text name="'common.forms.cancel.accesskey'" />"
                       title="<webwork:property value="text('common.forms.cancel')"/> (<webwork:property value="@modifierKey"/> + <webwork:text name="'common.forms.cancel.accesskey'" />)"
                       name="<decorator:getProperty property="cancelURI" />"
                       value="<webwork:property value="text('common.forms.cancel')"/>"
                       onclick="location.href='<webwork:if test="/returnUrl != null"><webwork:if test="/returnUrl/startsWith('/') == true"><%= request.getContextPath() %></webwork:if><webwork:property value="/returnUrl" /></webwork:if><webwork:else><decorator:getProperty property="cancelURI" /></webwork:else>'"
                />
			<% } %>
		</td>
	</tr>
<% } %>
    <%-- Forward the return url --%>
<webwork:if test="/returnUrl != null">
    <webwork:component name="'returnUrl'" template="hidden.jsp" theme="'single'"  />
</webwork:if>
    <% if (!p.isPropertySet("notable")) { %>
	</table>
	<% } %>
<% if (p.isPropertySet("action")) { %>
</form>
	<%--
	This enables the first element of the form to be automatically selected.

	Always on unless autoSelectFirst=false
	--%>
	<% if (!p.isPropertySet("autoSelectFirst") || !p.getProperty("autoSelectFirst").equals("false")) { %>
    <script language="javascript" type="text/javascript">
        jQuery(function () {
            AJS.$("form[name='<decorator:getProperty property="formName" default="jiraform" />'] :input:visible:first").focus();
        });
	</script>
	<% } %>
<% } %>
