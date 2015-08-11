<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <meta content="issuesummary" name="decorator"/>
    <title><webwork:text name="'worklog.delete.title'"/></title>
</head>

<body class="type-a">
<webwork:if test="/issueValid == true">
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
                <page:param name="cancelURI"><webwork:property value="issuePath"/></page:param>
                <page:param name="submitId">delete_submit</page:param>
                <page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
                <page:param name="width">100%</page:param>
                <page:param name="title"><webwork:text name="'worklog.delete.title'"/></page:param>
                <page:param name="description">
                    <webwork:text name="'worklog.delete.desc'"/>
                </page:param>

                <webwork:if test="/issueExists == true">
                    <ui:component name="'worklogId'" template="hidden.jsp" theme="'single'" value="/worklogId" />

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
                                   value="<webwork:property value="/newEstimate"/>">
                            <br/>

                            <input type="radio" name="adjustEstimate" id="manual_adjust_estimate_id" align="middle"
                                   value="manual" <webwork:if test="adjustEstimate == 'manual'"> checked</webwork:if>>
                            <label for="manual_adjust_estimate_id">
                                <webwork:text name="'logwork.bullet4.increaseestimate'"/>
                            </label>
                            <input type="text" name="adjustmentAmount" align="middle" size="5" onChange="selectManualAdjustEstimate();"
                                   value="<webwork:property value="/adjustmentAmount"/>">
                            <br>

                        </td>
                    </tr>
                    <tr id="newEstimateTableRow" >
                        <webwork:if test="errors['newEstimate']">
                            <td class="fieldLabelArea formErrors">
                        </webwork:if>
                        <webwork:else>
                            <td class="fieldLabelArea">
                        </webwork:else>

                        <webwork:if test="errors['newEstimate']">
                            <td class="fieldValueArea formErrors">
                        </webwork:if>
                        <webwork:else>
                            <td class="fieldValueArea">
                        </webwork:else>
                            <span class="subText">
                                <webwork:text name="'worklog.delete.adjust.desc'">
                                    <webwork:param name="'value0'"><webwork:property value="daysPerWeek"/>d</webwork:param>
                                    <webwork:param name="'value1'"><webwork:property value="hoursPerDay"/>h</webwork:param>
                                    <webwork:param name="'value2'">*w *d *h *m</webwork:param>
                                    <webwork:param name="'value3'">4d, 5h 30m, 60m</webwork:param>
                                    <webwork:param name="'value4'">3w</webwork:param>
                                    <webwork:param name="'value5'">1w</webwork:param>
                                    <webwork:param name="'value6'">1d</webwork:param>
                                </webwork:text>
                            </span>
                        </td>
                    </tr>

                    <ui:component name="'id'" template="hidden.jsp" theme="'single'"/>
                </webwork:if>
                </page:applyDecorator>
            </div>
        </div>
    </div>
</div>
</webwork:if>
<webwork:else>
    <div class="padded">
        <div class="notify error"><webwork:text name="'issue.wasdeleted'"/></div>
    </div>
</webwork:else>
</body>
</html>
