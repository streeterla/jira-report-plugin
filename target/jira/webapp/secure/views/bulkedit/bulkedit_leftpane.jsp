<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-decorator" prefix="decorator" %>

<div class="leftFormHeader"><webwork:text name="'bulkedit.title'"/></div>
<ol class="steps">
    <webwork:if test="/rootBulkEditBean/currentStep == 1">
        <li class="current"><webwork:text name="'bulkedit.step1.title'"/></li>
    </webwork:if>
    <webwork:else>
        <li class="done">
            <webwork:if test="/rootBulkEditBean/availablePreviousStep(1) == true">
                <webwork:if test="/rootBulkEditBean/maxIssues > 0">
                    <a id="bulkedit_chooseissues" href="BulkEdit1!default.jspa?currentStep=1&tempMax=<webwork:property value="/rootBulkEditBean/maxIssues"/>"><webwork:text name="'bulkedit.step1.title'"/></a>
                </webwork:if>
                <webwork:else>
                    <a id="bulkedit_chooseissues" href="BulkEdit1!default.jspa?currentStep=1"><webwork:text name="'bulkedit.step1.title'"/></a>
                </webwork:else>
            </webwork:if>
            <webwork:else>
                <webwork:text name="'bulkedit.step1.title'"/>
            </webwork:else>
            <br />
            <webwork:text name="'bulkedit.step1.status'">
                <webwork:param name="'value0'"><strong><webwork:property value="/rootBulkEditBean/selectedIssues/size"/></strong></webwork:param>
                <webwork:param name="'value1'"><strong><webwork:property value="/rootBulkEditBean/projectIds/size"/></strong></webwork:param>
            </webwork:text>
        </li>
    </webwork:else>

    <webwork:if test="/rootBulkEditBean/currentStep == 2">
        <li class="current"><webwork:text name="'bulkedit.step2.title'"/></li>
    </webwork:if>
    <webwork:elseIf test="/rootBulkEditBean/currentStep > 2">
        <li class="done">
            <webwork:if test="/rootBulkEditBean/availablePreviousStep(2) == true">
                <a href="BulkChooseOperation!default.jspa"><webwork:text name="'bulkedit.step2.title'"/></a>
            </webwork:if>
            <webwork:else>
                <webwork:text name="'bulkedit.step2.title'"/>
            </webwork:else>
        </li>
    </webwork:elseIf>
    <webwork:else>
        <li class="todo"><webwork:text name="'bulkedit.step2.title'"/></li>
    </webwork:else>
    <webwork:if test="/rootBulkEditBean/currentStep == 3">
        <li class="current"><webwork:text name="'bulkedit.step3.title'"/>
            <webwork:if test="!@hideSubMenu">
                <webwork:property value="/rootBulkEditBean/relatedMultiBulkMoveBean">

                <webwork:if test=".">
                <ul class="steps">
                    <webwork:iterator value="./bulkEditBeans" status="'status'">
                        <li
                         <webwork:if test="@status/index < ../currentBulkEditBeanIndex">
                             class="done"
                         </webwork:if>
                         <webwork:if test="@status/index == ../currentBulkEditBeanIndex">
                             class="current"
                             title="<webwork:text name="'bulk.migrate.currently'" ><webwork:param name="'value0'"><webwork:property value="./key/project/string('name')" /></webwork:param><webwork:param name="'value1'"><webwork:property value="./key/issueTypeObject/name" /></webwork:param></webwork:text>"
                         </webwork:if>
                         <webwork:else>
                             class="todo"
                         </webwork:else>
                         >
                            <webwork:property value="./key/project/string('name')" /> - <webwork:property value="./key/issueTypeObject/name" />
                        </li>
                    </webwork:iterator>
                </ul>
                </webwork:if>
                </webwork:property>
            </webwork:if>
        </li>
    </webwork:if>
    <webwork:elseIf test="/rootBulkEditBean/currentStep > 3">
        <li class="done">
            <webwork:if test="/rootBulkEditBean/availablePreviousStep(3) == true">
                <a href="<webwork:property value="/operationDetailsActionName"/>"><webwork:text name="'bulkedit.step3.title'"/></a>
            </webwork:if>
            <webwork:else>
               <webwork:text name="'bulkedit.step3.title'"/>
            </webwork:else>
        </li>
    </webwork:elseIf>
    <webwork:else>
        <li class="todo"><webwork:text name="'bulkedit.step3.title'"/></li>
    </webwork:else>
    <webwork:if test="/rootBulkEditBean/currentStep == 4">
        <li class="current"><webwork:text name="'bulkedit.step4.title'"/></li>
    </webwork:if>
    <webwork:else>
        <li class="todo"><webwork:text name="'bulkedit.step4.title'"/></li>
    </webwork:else>
</ol>

<webwork:if test="/rootBulkEditBean/currentStep != 1">
    <div class="infoBox " style="margin: 10px;"><webwork:text name="'bulkedit.note'"/></div>
</webwork:if>
