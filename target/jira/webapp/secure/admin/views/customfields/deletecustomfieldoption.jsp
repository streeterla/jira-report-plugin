
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>


<html>
<head>
	<title><webwork:text name="'admin.issuefields.customfields.delete.option'">
	    <webwork:param name="'value0'"> <webwork:property value="selectedValue" /></webwork:param>
	</webwork:text></title>
</head>
<body>



<page:applyDecorator name="jiraform">
	<page:param name="title"><webwork:text name="'admin.issuefields.customfields.delete.option'">
	    <webwork:param name="'value0'"> <webwork:property value="selectedValue" /></webwork:param>
	</webwork:text>
    </page:param>
	<page:param name="autoSelectFirst">false</page:param>
	<page:param name="width">100%</page:param>
	<page:param name="description">
        <p>
        <webwork:if test="selectedOption/parentOption">
            <webwork:text name="'admin.issuefields.customfields.confirm.deletion.parent'">
                <webwork:param name="'value0'"><strong><webwork:property value="selectedOption/value" /></strong></webwork:param>
                <webwork:param name="'value1'"><strong><webwork:property value="selectedOption/parentOption/value" /></strong></webwork:param>
            </webwork:text>
        </webwork:if>
        <webwork:else>
            <webwork:text name="'admin.issuefields.customfields.confirm.deletion'">
                <webwork:param name="'value0'"><strong><webwork:property value="selectedOption/value" /></strong></webwork:param>
            </webwork:text>
        </webwork:else>
        </p>
        <p><webwork:text name="'admin.issuefields.customfields.delete.option.note'">
            <webwork:param name="'value0'"><font color=#990000></webwork:param>
            <webwork:param name="'value1'"></font></webwork:param>
        </webwork:text></p>

	</page:param>
	<page:param name="action">EditCustomFieldOptions!remove.jspa</page:param>
	<page:param name="submitId">delete_submit</page:param>
	<page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
	<page:param name="cancelURI"><webwork:property value="/urlWithParent('default')" /></page:param>

    <ui:component label="text('admin.issuefields.customfields.issues.with.this.value')" name="'affectedIssues/size'" template="textlabel.jsp" >
        <ui:param name="'description'">
        <webwork:text name="'common.concepts.issues'"/>:
        <webwork:iterator value="affectedIssues" status="'iteratorStatus'">
            <a href="<%= request.getContextPath() %>/browse/<webwork:property value="key" />"><webwork:property value="key" /></a><webwork:if test="@iteratorStatus/last != true">,</webwork:if>
            <webwork:if test="@iteratorStatus/modulus(10) == 0" ><%-- break every 10 issues --%>
            <br />
            </webwork:if>
        </webwork:iterator>
        </ui:param>
    </ui:component>


	<ui:component name="'fieldConfigId'" template="hidden.jsp" theme="'single'"  />
	<ui:component name="'selectedParentOptionId'" template="hidden.jsp" theme="'single'"  />
	<ui:component name="'selectedValue'" template="hidden.jsp" theme="'single'"  />
    <ui:component name="'confirm'" value="'true'" template="hidden.jsp" theme="'single'"  />

</page:applyDecorator>

</body>
</html>
