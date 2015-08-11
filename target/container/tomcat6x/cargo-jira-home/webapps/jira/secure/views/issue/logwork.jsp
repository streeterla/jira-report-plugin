<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <meta content="issuesummary" name="decorator"/>
    <title>
        <webwork:if test="/editMode">
            <webwork:text name="'logwork.edit.title'"/>
        </webwork:if>
        <webwork:else>
            <webwork:text name="'logwork.title'"/>
        </webwork:else>
    </title>
</head>

<body class="type-a">


<div class="item-header">
    <webwork:property value="issue">
        <jsp:include page="/includes/panels/issue_headertable.jsp" />
    </webwork:property>
</div>
<div id="main-content">
    <div class="active-area">
        <div id="primary" class="column">
            <div class="content intform">
            <page:applyDecorator name="jiraform">
            <page:param name="action"><webwork:property value="/actionName"/>.jspa</page:param>
            <page:param name="cancelURI"><webwork:if test="/issueValid == true"><webwork:property value="issuePath"/></webwork:if></page:param>
            <page:param name="submitId">log_submit</page:param>
            <page:param name="submitName"><webwork:text name="'common.forms.log'"/></page:param>
            <page:param name="width">100%</page:param>
                <page:param name="title">
                    <webwork:if test="/editMode">
                        <webwork:text name="'logwork.edit.title'"/>
                    </webwork:if>
                    <webwork:else>
                        <webwork:text name="'logwork.title'"/>
                    </webwork:else>
                </page:param>
                <page:param name="description">
                    <webwork:if test="/editMode">
                        <webwork:text name="'logwork.edit.desc'"/>
                    </webwork:if>
                    <webwork:else>
                        <webwork:text name="'logwork.desc'"/>
                    </webwork:else>
                </page:param>

            <webwork:if test="/issueExists == true">
                <ui:textfield label="text('common.concepts.time.spent')" name="'timeLogged'">
                    <ui:param name="'description'">
                        <webwork:text name="'logwork.timespent.desc'">
                            <webwork:param name="'value0'"><webwork:property value="daysPerWeek"/>d</webwork:param>
                            <webwork:param name="'value1'"><webwork:property value="hoursPerDay"/>h</webwork:param>
                            <webwork:param name="'value2'">*w *d *h *m</webwork:param>
                            <webwork:param name="'value3'">4d, 5h 30m, 60m</webwork:param>
                            <webwork:param name="'value4'">3w</webwork:param>
                            <webwork:param name="'value5'">1w</webwork:param>
                            <webwork:param name="'value6'">1d</webwork:param>
                        </webwork:text>
                    </ui:param>
                </ui:textfield>

                <ui:component name="'worklogId'" template="hidden.jsp" theme="'single'" value="/worklogId" />

                <ui:component label="text('logwork.start.date')" name="'startDate'" template="datepicker2.jsp">
                    <ui:param name="'formname'" value="'jiraform'" />
                    <ui:param name="'showsTime'" value="'true'" />
                    <ui:param name="'style'">width: 20%;</ui:param>
                </ui:component>

                <webwork:if test="errors['adjustmentAmount']">
                    <tr>
                        <td class="fieldLabelArea formErrors">&nbsp;</td>
                        <td class="fieldValueArea formErrors">
                            <span class="errMsg"><webwork:property value="errors['adjustmentAmount']"/></span>
                        </td>
                    </tr>
                </webwork:if>
                <webwork:if test="errors['newEstimate']">
                    <tr>
                        <td class="fieldLabelArea formErrors">&nbsp;</td>
                        <td class="fieldValueArea formErrors">
                            <span class="errMsg"><webwork:property value="errors['newEstimate']"/></span>
                        </td>
                    </tr>
                </webwork:if>
                <tr>
                    <webwork:if test="errors['newEstimate'] || errors['adjustmentAmount']">
                        <td class="fieldLabelArea formErrors">
                    </webwork:if>
                    <webwork:else>
                        <td class="fieldLabelArea">
                    </webwork:else>
                    <webwork:text name="'logwork.adjustestimate'"/>:
                        </td>
                    <webwork:if test="errors['newEstimate'] || errors['adjustmentAmount']">
                        <td class="fieldValueArea formErrors">
                    </webwork:if>
                    <webwork:else>
                        <td class="fieldValueArea">
                    </webwork:else>
                    <input type="radio" name="adjustEstimate" id="auto_adjust_estimate_id" align="middle"
                        value="auto" <webwork:if test="adjustEstimate == 'auto'"> checked</webwork:if>>
                    <label for="auto_adjust_estimate_id">
                        <webwork:text name="'logwork.bullet1.autoadjust'"/><br>
                        &nbsp; &nbsp; &nbsp; &nbsp; <span class="subText">(<webwork:text name="'logwork.bullet1.autoadjust.desc'"/>
                        )</span><br>
                    </label>

                    <input type="radio" name="adjustEstimate" id="leave_estimate_id" align="middle"
                        value="leave" <webwork:if test="adjustEstimate == 'leave'"> checked</webwork:if>>
                    <label for="leave_estimate_id">
                        <webwork:if test="estimate==null">
                            <webwork:text name="'logwork.bullet2.estimateunknown'"/><br>
                        </webwork:if>
                        <webwork:else>
                            <webwork:text name="'logwork.bullet2.leaveestimate'">
                                <webwork:param name="'value0'"><b><webwork:property value="estimate"/></b></webwork:param>
                            </webwork:text><br>
                        </webwork:else>
                    </label>

                    <input type="radio" name="adjustEstimate" id="new_estimate_id" align="middle"
                        value="new" <webwork:if test="adjustEstimate == 'new'"> checked</webwork:if>>
                    <label for="new_estimate_id">
                        <webwork:text name="'logwork.bullet3.setnewestimate'"/>
                    </label>
                    <input type="text" name="newEstimate" align="middle" size="5" onChange="selectNewEstimate();"
                           value="<webwork:property value="/newEstimate"/>"> <span class="subText">(<webwork:text
                        name="'logwork.bullet3.example'">
                        <webwork:param name="value0">4d 2h, 12h</webwork:param>
                        <webwork:param name="value1">3w</webwork:param>
                    </webwork:text>)</span><br>

                    <!-- We only show the "Reduce estimate" option on create, not on edit.-->
                    <webwork:if test="createWorklog">
                        <input type="radio" name="adjustEstimate" id="manual_adjust_estimate_id" align="middle"
                               value="manual" <webwork:if test="adjustEstimate == 'manual'"> checked</webwork:if>>
                        <label for="manual_adjust_estimate_id">
                            <webwork:text name="'logwork.bullet4.reduceestimate'"/>
                        </label>
                        <input type="text" name="adjustmentAmount" align="middle" size="5" onChange="selectManualAdjustEstimate();"
                               value="<webwork:property value="/adjustmentAmount"/>">
                        <span class="subText">(<webwork:text name="'logwork.bullet3.example'">
                            <webwork:param name="value0">4h, 1d</webwork:param>
                            <webwork:param name="value1">2h 30m</webwork:param>
                        </webwork:text>)
                        </span>
                        <br>
                    </webwork:if>

                    </td>
                </tr>

                <ui:textarea label="text('logwork.workdesc')" name="'comment'" cols="60" rows="10"/>

                <webwork:property id="groupsNotPresent" value="groupLevels/empty"/>
                <webwork:property id="rolesNotPresent" value="roleLevels/empty"/>

                <tr>
                    <td class="fieldLabelArea"><webwork:text name="'logwork.viewableby'"/>:</td>
                    <td class="fieldValueArea" bgcolor="#ffffff">
                        <select  name="commentLevel" id="commentLevel">
                            <option value=""><webwork:text name="'comment.constants.allusers'"/></option>
                            <webwork:if test="@rolesNotPresent == false">
                                <optgroup label="<webwork:text name="'common.words.project.roles'"/>">
                                    <!-- TODO: keep value on error -->
                                    <webwork:iterator value="roleLevels">
                                        <option value="role:<webwork:property value="./id"/>" <webwork:if test="/levelSelected('role:' + ./id) == true">selected</webwork:if>><webwork:property value="./name"/></option>
                                     </webwork:iterator>
                                </optgroup>
                            </webwork:if>
                            <webwork:if test="@groupsNotPresent == false">
                                <optgroup label="<webwork:text name="'common.words.groups'"/>">
                                    <webwork:iterator value="groupLevels">
                                        <option value="group:<webwork:property value="."/>" <webwork:if test="/levelSelected('group:' + .) == true">selected</webwork:if>><webwork:property value="."/></option>
                                    </webwork:iterator>
                                </optgroup>
                            </webwork:if>
                        </select>
                    </td>
                </tr>

                <ui:component name="'id'" template="hidden.jsp" theme="'single'"/>
            </webwork:if>
            </page:applyDecorator>
            </div>
        </div>
    </div>
</div>

<script language="JavaScript">
    function selectNewEstimate()
    {
        document.forms['jiraform'].elements['new_estimate_id'].checked = true;
    }

    function selectManualAdjustEstimate()
    {
        document.forms['jiraform'].elements['manual_adjust_estimate_id'].checked = true;
    }

    function resetSelect(form, selectId)
    {
        if (form[selectId])
        {
            form[selectId].selectedIndex = 0;
        }
    }
</script>
</body>
</html>
