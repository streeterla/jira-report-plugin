<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="webwork" prefix="iterator" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<webwork:bean id="fieldVisibility" name="'com.atlassian.jira.web.bean.FieldVisibilityBean'"/>

<html>
<head>
    <title><webwork:text name="textKey('title')"/>: <webwork:property value="issue/key"/></title>
</head>

<body>
<table width="100%" class="noPadding">
    <tr>
        <%-- wizard steps pane --%>
        <td class="rowHeader" width="200" valign="top">
            <jsp:include page="/secure/views/issue/convertissuetosubtaskpane.jsp" flush="false"/>
        </td>
        <%-- input pane --%>
        <td class="fieldValueArea rowClear" style="padding:10px;">

            <webwork:if test="errorMessages/empty == true">
                <table width="100%" cellpadding="10" cellspacing="0" border="0">
                    <page:applyDecorator name="jiraform">
                        <page:param name="title">
                            <webwork:text name="textKey('title')"/>: <webwork:property value="issue/key"/>
                        </page:param>
                        <page:param name="description">
                            <webwork:if test="enterprise == true">
                                <webwork:text name="textKey('step3.desc.ent')">
                                    <webwork:param name="value0"><strong></webwork:param>
                                     <webwork:param name="value1"></strong></webwork:param>
                                 </webwork:text>
                                <%-- This means that step 2 of move process has been skipped --%>
                                <webwork:if test="statusChangeRequired == false">
                                    <p>
                                        <span class="red-highlight"><strong><webwork:text
                                                name="'common.words.note'"/></strong></span>:&nbsp;<webwork:text
                                            name="textKey('step2.notrequired')"/>.
                                    </p>
                                </webwork:if>
                            </webwork:if>
                            <webwork:else>
                                <webwork:text name="textKey('step2.desc.pro')">
                                    <webwork:param name="value0"><strong></webwork:param>
                                    <webwork:param name="value1"></strong></webwork:param>
                                </webwork:text>
                            </webwork:else>
                        </page:param>
                        <page:param name="width">100%</page:param>
                        <page:param name="action"><webwork:property value="/actionPrefix"/>UpdateFields.jspa</page:param>
                        <page:param name="autoSelectFirst">false</page:param>
                        <page:param name="cancelURI"><%= request.getContextPath() %>/secure/<webwork:property value="/actionPrefix"/>!cancel.jspa?id=<webwork:property value="issue/id"/></page:param>
                        <page:param name="submitId">next_submit</page:param>
                        <page:param name="submitName"><webwork:property value="text('common.forms.next')"/> &gt;&gt;</page:param>

                        <webwork:if test="convertFieldLayoutItems/empty == false">
                            <webwork:iterator value="convertFieldLayoutItems">
                                <webwork:property value="/fieldHtml(.)" escape="'false'"/>
                            </webwork:iterator>
                            <page:param name="columns">2</page:param>
                        </webwork:if>
                        <webwork:else>
                            <%-- We still need to go through this action and this step in teh move issue wizard, as during the doValidation stage of this action errors can be detected.
                 For example, if a field is required but cannot be set by the user becuase of permissions, the error will be detected here. Later need to refactor that the step is skipped,
                 however, the doValidation() of the action still needs to be executed. --%>
                            <tr ><td><webwork:text
                                    name="textKey('step3.nofieldsneedupdate')"/></td></tr>
                            <page:param name="columns">1</page:param>
                        </webwork:else>

                        <ui:component name="'id'" template="hidden.jsp" theme="'single'"/>
                        <ui:component name="'guid'" template="hidden.jsp"  theme="'single'" />

                    </page:applyDecorator>
                </table>
            </webwork:if>
            <webwork:else>

                <page:applyDecorator name="jiraform">
                    <%-- Must have body, else NullPointer is thrown --%>
                </page:applyDecorator>
            </webwork:else>
        </td>
    </tr>
</table>

</body>
</html>
