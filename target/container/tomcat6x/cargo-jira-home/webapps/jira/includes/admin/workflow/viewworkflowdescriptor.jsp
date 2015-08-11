<%@ taglib uri="webwork" prefix="webwork" %>


<div class="<webwork:if test="@descriptorBean/singleDescriptor() == true">single-leaf</webwork:if><webwork:elseIf test="@descriptorBean/highlighted(@status/count, /currentCount) == true">highlighted-leaf</webwork:elseIf><webwork:else>leaf</webwork:else>">
    <webwork:property id="descriptorInfo" value="@descriptorBean/formatDescriptor(.)"/>

    <%-- Test if we have a plugin module that generated a description --%>
    <webwork:if test="@descriptorInfo/description != null">
        <webwork:property value="@descriptorInfo/description" escape="false"/>
    </webwork:if>
    <webwork:else>
        <%-- If we do not have a plugin module then simply print all the info we have --%>
        <b>Type</b>: <webwork:property value="./type"/><br>
        <webwork:if test="./type == 'class' && args">
            <webwork:if test="args/('class.name')">
                <b>Class</b>: <webwork:property value="./args/('class.name')"/><br>
            </webwork:if>
            <%-- Test if we have any other arguments than 'class.name' --%>
            <webwork:if test="@descriptorBean/hasRelevantArgs(args) == true">
            <b>Arguments</b>:<br>
            <webwork:iterator value="./args">
                    <webwork:if test="./key != 'class.name'">
                        <webwork:property value="./key"/> = <webwork:property value="./value"/><br>
                    </webwork:if>
            </webwork:iterator>
            </webwork:if>
        </webwork:if>
    </webwork:else>
    <webwork:if test="@descriptorBean/delete == true || workflow/editable == true">
        <br />

        <webwork:property value="false" id="actionprinted" />

        <webwork:if test="@descriptorBean/allowNested() == true">
            <a href="<webwork:url page="AddWorkflowTransitionCondition!default.jspa"><webwork:param name="'workflowMode'" value="workflow/mode" /><webwork:param name="'workflowName'" value="workflow/name" /><webwork:param name="'workflowStep'" value="step/id" /><webwork:param name="'workflowTransition'" value="transition/id" /><webwork:param name="'count'"><webwork:property value="@descriptorBean/parentPrefix" /><webwork:property value="@status/count" /></webwork:param><webwork:param name="'nested'" value="'true'" /></webwork:url>">
                <webwork:text name="'admin.workflowtransition.addnewcondition.tonestedblock'"/></a>
            </a>
            <webwork:property value="true" id="actionprinted" />
        </webwork:if>
        <%-- check if the descriptor is editable --%>
        <webwork:if test="@descriptorInfo/editable == true">
            <webwork:if test="@actionprinted == true">|</webwork:if>
            <a href="<webwork:url value="@descriptorBean/editAction"><webwork:param name="'workflowMode'" value="workflow/mode" /><webwork:param name="'workflowName'" value="workflow/name" /><webwork:param name="'workflowStep'" value="step/id" /><webwork:param name="'workflowTransition'" value="transition/id" /><webwork:param name="'count'"><webwork:property value="@descriptorBean/parentPrefix" /><webwork:property value="@status/count" /></webwork:param></webwork:url>">
                <webwork:text name="'common.words.edit'"/>
            </a>
            <webwork:property value="true" id="actionprinted" />
        </webwork:if>

        <webwork:if test="@descriptorInfo/orderable == true">
            <webwork:if test="@status/first != true">
                <webwork:if test="@actionprinted == true">|</webwork:if>
                <a href="<webwork:url value="'MoveWorkflowFunctionUp.jspa'"><webwork:param name="'workflowMode'" value="workflow/mode" /><webwork:param name="'workflowName'" value="workflow/name" /><webwork:param name="'workflowStep'" value="step/id" /><webwork:param name="'workflowTransition'" value="transition/id" /><webwork:param name="'up'" value="@status/index" /></webwork:url>">
                    Move Up
                </a>
                <webwork:property value="true" id="actionprinted" />
            </webwork:if>
            <webwork:if test="@status/last != true">
                <webwork:if test="@actionprinted == true">|</webwork:if>
                <a href="<webwork:url value="'MoveWorkflowFunctionDown.jspa'"><webwork:param name="'workflowMode'" value="workflow/mode" /><webwork:param name="'workflowName'" value="workflow/name" /><webwork:param name="'workflowStep'" value="step/id" /><webwork:param name="'workflowTransition'" value="transition/id" /><webwork:param name="'down'" value="@status/index" /></webwork:url>">
                    Move Down
                </a>
                <webwork:property value="true" id="actionprinted" />
            </webwork:if>
        </webwork:if>

        <webwork:if test="@descriptorInfo/deletable == true">
            <webwork:if test="@actionprinted == true">|</webwork:if>
            <a href="<webwork:url value="@descriptorBean/deleteAction"><webwork:param name="'workflowMode'" value="workflow/mode" /><webwork:param name="'workflowName'" value="workflow/name" /><webwork:param name="'workflowStep'" value="step/id" /><webwork:param name="'workflowTransition'" value="transition/id" /><webwork:param name="'count'"><webwork:property value="@descriptorBean/parentPrefix" /><webwork:property value="@status/count" /></webwork:param></webwork:url>">
                <webwork:text name="'common.words.delete'"/>
            </a>
            <webwork:property value="true" id="actionprinted" />
        </webwork:if>

        <%-- reset the value for the next descriptor --%>
        <webwork:property value="false" id="actionprinted" />
    </webwork:if>
</div>
