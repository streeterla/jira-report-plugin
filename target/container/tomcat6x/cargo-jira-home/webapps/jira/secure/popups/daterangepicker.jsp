<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'popups.daterange.title'"/></title>
</head>
<body>
    <h3><webwork:text name="'popups.daterange.title'"/></h3>
    <page:applyDecorator name="jiraform">
		<page:param name="action">null</page:param>
		<page:param name="onsubmit">return submitForm();</page:param>
		<page:param name="title"><webwork:text name="'popups.duedate.filterissues'"/></page:param>
		<page:param name="description">
	        <webwork:text name="'popups.daterange.description'"/>
		</page:param>
		<page:param name="width">100%</page:param>
		<page:param name="columns">3</page:param>
		<page:param name="autoSelectFirst">false</page:param>
		<page:param name="buttons">
            <input type="submit" value="   <webwork:text name="'popups.duedate.ok'"/>   ">
            <input type="button" value="<webwork:text name="'common.words.cancel'"/>" onclick="window.close();">
        </page:param>

		<script language="JavaScript" type="text/javascript" src="<%=request.getContextPath()%>/includes/js/stringUtil.js"></script>
		<script language="JavaScript" type="text/javascript">


            function validateDay(days)
            {
                if (isNaN(days)) {
                    var notNumberString = "<webwork:text name="'popups.duedate.validation.notnumber'" />";
                    var p = new RegExp("\\{0\\}", "g");
                    alert(notNumberString.replace(p, days));
                    return false;
                } else if (days < 0) {
                    alert("<webwork:text name="'popups.daterange.validation.daysnegative'"/>");
                    return false;
                } else if (trim(days) == '') {
                    alert("<webwork:text name="'popups.duedate.validation.daysmissing'"/>");
                    return false;
                }

                return true;
            }

			function populateForm(previousFieldValue, nextFieldValue)
			{
				var openerPrevEl = opener.document.getElementById('<webwork:property value="previousFieldName"/>');
				openerPrevEl.value = previousFieldValue;
				var openerNextEl = opener.document.getElementById('<webwork:property value="nextFieldName"/>');
				openerNextEl.value = nextFieldValue;
				window.close();
			}

            function handleStartDateInPast()
            {
                populateForm(document.getElementById('startDateInPast').value, '');
            }

            function handleStartDateDaysAgo()
            {
                var days = document.getElementById('startDateDaysAgo').value;

                if(validateDay(days))
                {
                    var field = '-'+days+'d';
                    populateForm(field, '');
                }

                return false;
            }

            function handleEndDateDaysAgo()
            {
                var days = document.getElementById('endDateDaysAgo').value;

                if(validateDay(days))
                {
                    var nextField = '-'+days+'d';
                    populateForm('', nextField);
                }

                return false;
            }

            

            function handleGeneric()
            {
                var duedateForm = document.forms['jiraform'];
                var previous = duedateForm.elements['previous'].value;
                var next = duedateForm.elements['next'].value;
                populateForm(previous, next);
            }

            function selectRowRadioBox(rowID)
            {

                var radio = document.forms['jiraform'].elements['selectedType'];
                switch (rowID) {
                    case "row1":
                        radio[0].checked = true;
                    break;
                    case "row2":
                        radio[1].checked = true;
                    break;
                case "row3":
                        radio[2].checked = true;
                    break;
                case "row4":
                        radio[3].checked = true;
                    break;
                }
            }

            function colourRow(rowID)
            {
                if (document.layers)
                {
                    //this browser == "NN4"
                    //do nothing as NN4's implementation of CSS is no good
                    return;
                }
                if (document.all)
                {
                    //this browser == "ie"
                    resetColour();
                    document.all[rowID].className='selectedRow';
                }
                if (!document.all && document.getElementById)
                {
                    //this browser == "NN6"
                    resetColour();
                    document.getElementById(rowID).className='selectedRow';
                }
            }

            function resetColour()
            {
                if (document.layers)
                {
                    //this browser == "NN4"
                    //do nothing as NN4's implementation of CSS is no good
                    return;
                }
                if (document.all)
                {
                    //this browser == "ie"
                    document.all['row1'].className='unselectedRow';
                    document.all['row2'].className='unselectedRow';
                    document.all['row3'].className='unselectedRow';
                    document.all['row4'].className='unselectedRow';
                }
                if (!document.all && document.getElementById)
                {
                    //this browser == "NN6"
                    document.getElementById('row1').className='unselectedRow';
                    document.getElementById('row2').className='unselectedRow';
                    document.getElementById('row3').className='unselectedRow';
                    document.getElementById('row4').className='unselectedRow';
                }
            }

            function selectRow(rowID)
            {
                colourRow(rowID);
                selectRowRadioBox(rowID);
            }

            function submitForm()
            {
                var radio = document.forms['jiraform'].elements['selectedType'];
                if (radio[0].checked) {
                    return handleStartDateInPast();
                } else if (radio[1].checked) {
                    return handleStartDateDaysAgo();
                } else if (radio[2].checked) {
                    return handleEndDateDaysAgo();
                } else if (radio[3].checked) {
                    return handleGeneric();
                } else {
                    window.close();
                }
            }
		</script>

        <style type="text/css">
            TD.unselectedRow { background: #fff; }
            TD.selectedRow { background: #ddd; }
        </style>
            <tr>
                <td class="fieldLabelArea">
                    <input type="radio" name="selectedType" value="START_DATE_IN_PAST" onclick="selectRow('row1');" <webwork:if test="selectedType == 'START_DATE_IN_PAST'"> checked</webwork:if> />
                </td>
                <td id="row1" onclick="selectRow('row1')" class="<webwork:if test="selectedType == 'START_DATE_IN_PAST'">selectedRow</webwork:if><webwork:else>unselectedRow</webwork:else>">
                    <webwork:if test="/customField == false"><webwork:property value="'popups.daterange.systemfield.inthelast'" id="textkey" /></webwork:if><webwork:else><webwork:property value="'popups.daterange.customfield.inthelast'" id="textkey" /></webwork:else>
                    <webwork:text name="@textkey">
                        <webwork:param name="'value0'" value="/fieldName"/>
                        <webwork:param name="'value1'">
                            <select name="startDateInPast" id="startDateInPast" onfocus="selectRow('row1');">
                                <webwork:iterator value="/timePeriods" status="'status'">
                                    <%-- Do not escape the value as it is escaped in the getName() method. See JRA-7881 --%>
                                    <option value="<webwork:property value="./id" />" <webwork:if test="./id/equals(/previousFieldValue) == true">selected</webwork:if><webwork:else>unselectedRow</webwork:else>><webwork:property value="./name" escape="false"/></option>
                                </webwork:iterator>
                            </select>
                        </webwork:param>
                    </webwork:text>
                </td>
            </tr>

            <tr>
                <td class="fieldLabelArea">
                    <input type="radio" name="selectedType" value="START_DATE_DAYS_AGO" onclick="selectRow('row2');" <webwork:if test="selectedType == 'START_DATE_DAYS_AGO'"> checked</webwork:if>/>
                </td>
                <td id="row2" onclick="selectRow('row2')" class="<webwork:if test="selectedType == 'START_DATE_DAYS_AGO'">selectedRow</webwork:if><webwork:else>unselectedRow</webwork:else>">
                    <webwork:if test="/customField == false"><webwork:property value="'popups.daterange.systemfield.inthelastdays'" id="textkey" /></webwork:if><webwork:else><webwork:property value="'popups.daterange.customfield.inthelastdays'" id="textkey" /></webwork:else>
                    <webwork:text name="@textkey">
                        <webwork:param name="'value0'" value="/fieldName"/>
                        <webwork:param name="'value1'"><input type="text" name="startDateDaysAgo" id="startDateDaysAgo" size="4" onfocus="selectRow('row2')" value="<webwork:property value="startDateDaysAgo"/>"></webwork:param>
                    </webwork:text>
                </td>
            </tr>
 
            <tr>
                <td class="fieldLabelArea">
                    <input type="radio" name="selectedType" value="END_DATE_DAYS_AGO" onclick="selectRow('row3');" <webwork:if test="selectedType == 'END_DATE_DAYS_AGO'"> checked</webwork:if>/>
                </td>
                <td id="row3" onclick="selectRow('row3')" class="<webwork:if test="selectedType == 'END_DATE_DAYS_AGO'">selectedRow</webwork:if><webwork:else>unselectedRow</webwork:else>">
                    <webwork:if test="/customField == false"><webwork:property value="'popups.daterange.systemfield.morethanago'" id="textkey" /></webwork:if><webwork:else><webwork:property value="'popups.daterange.customfield.morethanago'" id="textkey" /></webwork:else>
                    <webwork:text name="@textkey">
                        <webwork:param name="'value0'" value="/fieldName"/>
                        <webwork:param name="'value1'"><input type="text" name="endDateDaysAgo" id="endDateDaysAgo" size="4" onfocus="selectRow('row3')" value="<webwork:property value="endDateDaysAgo"/>"></webwork:param>
                    </webwork:text>
                </td>
            </tr>

            <tr>
                <td class="fieldLabelArea" valign="top">
                    <input type="radio" name="selectedType" value="TYPE_GENERIC" onclick="selectRow('row4');" <webwork:if test="selectedType == 'TYPE_GENERIC'"> checked</webwork:if> />
                </td>
                <td id="row4" onclick="selectRow('row4')" class="<webwork:if test="selectedType == 'TYPE_GENERIC'">selectedRow</webwork:if><webwork:else>unselectedRow</webwork:else>">
                        <webwork:text name="'popups.duedate.inrange'">
                            <webwork:param name="'value0'"><input type="text" name="previous" size="3" onfocus="selectRow('row4')" value="<webwork:property value="previousFieldValue"/>" /></webwork:param>
                            <webwork:param name="'value1'"><input type="text" name="next" size="3" onfocus="selectRow('row4')" value="<webwork:property value="nextFieldValue"/>" /></webwork:param>
                        </webwork:text>
                        <br>
                        <small><webwork:text name="'popups.duedate.inrange.description'">
                            <webwork:param name="'value0'">1w 2d 5h 30m</webwork:param>
                            <webwork:param name="'value1'"><strong>w</strong></webwork:param>
                            <webwork:param name="'value2'"><strong>d</strong></webwork:param>
                            <webwork:param name="'value3'"><strong>h</strong></webwork:param>
                            <webwork:param name="'value4'"><strong>m</strong></webwork:param>
                            <webwork:param name="'value5'"><strong>-1w 3d</strong></webwork:param>
                            <webwork:param name="'value6'"><strong>-1d</strong></webwork:param>
                        </webwork:text></small>
                </td>
            </tr>
    </page:applyDecorator>
</body>
</html>
