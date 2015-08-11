<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.workflowtransition.add.workflow.transition'"/> <webwork:property value="/descriptorName"/></title>
</head>

<body>

    <page:applyDecorator name="jiraform">
        <page:param name="action"><webwork:property value="/actionName"/>.jspa</page:param>
        <%-- NOTE!!! If you are changing the submit button name also need to change the
        AbstractAddWorkflowTransitionDescriptorParams.setupWorkflowDescriptorParams() method as it expects the
        name of the button as a parameter --%>
        <page:param name="submitId">add_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
    	<page:param name="cancelURI"><webwork:url page="ViewWorkflowTransition.jspa"><webwork:param name="'workflowMode'" value="workflow/mode" /><webwork:param name="'workflowName'" value="workflow/name" /><webwork:param name="'workflowStep'" value="/step/id" /><webwork:param name="'workflowTransition'" value="transition/id" /></webwork:url></page:param>
        <page:param name="title"><webwork:text name="'admin.workflowtransitions.add.something.to.transition'">
            <webwork:param name="'value0'"><webwork:property value="/descriptorName"/></webwork:param>
        </webwork:text></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="columns">1</page:param>
        <page:param name="description">
            <webwork:text name="'admin.schemes.add.to.description'">
                <webwork:param name="'value0'"><webwork:property value="/descriptorName"/></webwork:param>
            </webwork:text>
        </page:param>

        <ui:component name="'workflowStep'" value="step/id" template="hidden.jsp" />
        <ui:component name="'workflowName'" value="workflow/name" template="hidden.jsp" />
        <ui:component name="'workflowMode'" value="workflow/mode" template="hidden.jsp" />
        <ui:component name="'workflowTransition'" value="transition/id" template="hidden.jsp" />
        <ui:component name="'count'" template="hidden.jsp" />
        <ui:component name="'nested'" template="hidden.jsp" />

        <tr bgcolor=#ffffff><td>
        <p>
        <webwork:if test="/workflowModuleDescriptors && /workflowModuleDescriptors/empty == false">
            <table id="descriptors_table" class="grid" width="100%">
                <tr>
                    <th>&nbsp;</th>
                    <th><webwork:text name="'common.words.name'"/></th>
                    <th><webwork:text name="'common.words.description'"/></th>
                </tr>
                <webwork:iterator value="/workflowModuleDescriptors" status="'status'">
                    <tr bgcolor=<webwork:if test="@status/odd == true">ffffff</webwork:if><webwork:else>fffff0</webwork:else>>
                        <td width="1%" valign="top">
                            <input type="radio" name="type" id="<webwork:property value="completeKey"/>" value="<webwork:property value="completeKey"/>"/>
                        </td>
                        <td width="20%" valign="top">
                            <label for="<webwork:property value="completeKey"/>" >
                                <webwork:property value="./name"/>
                            </label>
                        </td>
                        <td>
                            <webwork:property value="./description"/>
                        </td>
                    </tr>
                </webwork:iterator>
            </table>
        </webwork:if>
        <webwork:else>
            <webwork:text name="'admin.schemes.there.are.no.available.descriptors.to.add'">
                <webwork:param name="'value0'"><webwork:property value="/descriptorName"/></webwork:param>
            </webwork:text>
        </webwork:else>
        </p>
        </td></tr>

    </page:applyDecorator>

</body>
</html>
