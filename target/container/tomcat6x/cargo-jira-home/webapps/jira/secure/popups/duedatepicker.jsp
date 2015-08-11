<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'popups.duedate.duedateselector'"/></title>
</head>
<body>
    <h3><webwork:text name="'popups.duedate.duedateselector'"/></h3>
    <page:applyDecorator name="jiraform">
		<page:param name="action">null</page:param>
		<page:param name="onsubmit">return submitForm();</page:param>
		<page:param name="title"><webwork:text name="'popups.duedate.filterissues'"/></page:param>
		<page:param name="description">
	        <webwork:text name="'popups.duedate.description'"/>
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
			function populateForm(previousFieldValue, nextFieldValue)
			{
				var openerPrevEl = opener.document.getElementById('<webwork:property value="previousFieldName"/>');
				openerPrevEl.value = previousFieldValue;
				var openerNextEl = opener.document.getElementById('<webwork:property value="nextFieldName"/>');
				openerNextEl.value = nextFieldValue;
				window.close();
			}

            function handleOverdue()
            {
                populateForm('', '0');
            }

            function handleEndDateDaysAgo()
            {
                var notNumberString = "<webwork:text name="'popups.duedate.validation.notnumber'" />";
                var duedateForm = document.forms['jiraform'];
                var daysoverdue = duedateForm.elements['daysoverdue'].value;
                if (isNaN(daysoverdue)) {
                    var p = new RegExp("\\{0\\}", "g");
                    alert(notNumberString.replace(p, daysoverdue));
                    return false;
                } else if (daysoverdue < 0) {
                    alert("<webwork:text name="'popups.duedate.validation.daysoverduenegative'"/>");
                    return false;
                } else if (trim(daysoverdue) == '') {
                    alert("<webwork:text name="'popups.duedate.validation.daysmissing'"/>");
                    return false;
                }

                var nextField = '-'+daysoverdue+'d';
                populateForm('', nextField);
            }

            function handleDueInNext()
            {
                var notNumberString = new String("<webwork:text name="'popups.duedate.validation.notnumber'" />");
                var duedateForm = document.forms['jiraform'];
                var dueinnext = duedateForm.elements['dueinnext'].value;
                if (isNaN(dueinnext)) {
                    var p = new RegExp("\\{0\\}", "g");
                    alert(notNumberString.replace(p, dueinnext));
                    return false;
                } else if (trim(dueinnext) == '') {
                    alert("<webwork:text name="'popups.duedate.validation.daysmissing'"/>");
                    return false;
                } else if (dueinnext < 0) {
                    alert("<webwork:text name="'popups.duedate.validation.dueinnextnegative'"/>");
                    return false;
                }
                var nextField = dueinnext+'d';
                var prevField;
                var selectedIndex =duedateForm.elements['andoverdue'].selectedIndex;
                if (selectedIndex == 0) {
                    prevField = '0';
                } else {
                    prevField = "";
                }
                populateForm(prevField, nextField);
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
                    return handleOverdue();
                } else if (radio[1].checked) {
                    return handleEndDateDaysAgo();
                } else if (radio[2].checked) {
                    return handleDueInNext();
                } else if (radio[3].checked) {
                    return handleGeneric();
                } else {
                    window.close();
                }
            }
		</script>

        <style>
            TD.unselectedRow { background: #fff; }
            TD.selectedRow { background: #ddd; }
        </style>
            <tr bgcolor="#ffffff">
                <td bgcolor="#fffff0">
                    <input type="radio" name="selectedType" value="TYPE_OVERDUE value="TYPE_OVERDUE" onclick="selectRow('row1');" <webwork:if test="selectedType == 'TYPE_OVERDUE'"> checked</webwork:if> />
                </td>
                <td id="row1" onClick="selectRow('row1')" class="<webwork:if test="selectedType == 'TYPE_OVERDUE'">selectedRow</webwork:if><webwork:else>unselectedRow</webwork:else>">
                        <webwork:text name="'popups.duedate.nowoverdue'"/>
                </td>
            </tr>
            <tr bgcolor="#ffffff">
                <td bgcolor="#fffff0">
                    <input type="radio" name="selectedType" value="END_DATE_DAYS_AGO" onclick="selectRow('row2');" <webwork:if test="selectedType == 'END_DATE_DAYS_AGO'"> checked</webwork:if>/>
                </td>
                <td id="row2" onClick="selectRow('row2')" class="<webwork:if test="selectedType == 'END_DATE_DAYS_AGO'">selectedRow</webwork:if><webwork:else>unselectedRow</webwork:else>">
                        <webwork:text name="'popups.duedate.morethandaysoverdue'">
                            <webwork:param name="'value0'"><input type="text" name="daysoverdue" size="4" onClick="selectRow('row2')" value="<webwork:property value="endDateDaysAgo"/>"></webwork:param>
                        </webwork:text>
                </td>
            </tr>
            <tr bgcolor="#ffffff">
                <td bgcolor="#fffff0">
                    <input type="radio" name="selectedType" value="TYPE_DUEINNEXT" onclick="selectRow('row3');" <webwork:if test="selectedType == 'TYPE_DUEINNEXT'"> checked</webwork:if> />
                </td>
                <td id="row3" onClick="selectRow('row3')" class="<webwork:if test="selectedType == 'TYPE_DUEINNEXT'">selectedRow</webwork:if><webwork:else>unselectedRow</webwork:else>">
                        <webwork:text name="'popups.duedate.dueinnext'">
                            <webwork:param name="'value0'"><input type="text" name="dueinnext" size="4" onClick="selectRow('row3')" value="<webwork:property value="dueInNext"/>" /></webwork:param>
                            <webwork:param name="'value1'">
                                <select name="andoverdue" onClick="selectRow('row3')" >
                                    <option value="andnot" <webwork:if test="andOverdue == 'AND_NOT'">selected</webwork:if>><webwork:text name="'popups.duedate.andnot'"/></option>
                                    <option value="and" <webwork:if test="andOverdue == 'AND'">selected</webwork:if>><webwork:text name="'popups.duedate.and'"/></option>
                                </select>
                            </webwork:param>
                        </webwork:text>
                </td>
            </tr>
            <tr bgcolor="#ffffff">
                <td bgcolor="#fffff0" valign="top">
                    <input type="radio" name="selectedType" value="TYPE_GENERIC" onclick="selectRow('row4');" <webwork:if test="selectedType == 'TYPE_GENERIC'"> checked</webwork:if> />
                </td>
                <td id="row4" onClick="selectRow('row4')" class="<webwork:if test="selectedType == 'TYPE_GENERIC'">selectedRow</webwork:if><webwork:else>unselectedRow</webwork:else>">
                        <webwork:text name="'popups.duedate.inrange'">
                            <webwork:param name="'value0'"><input type="text" name="previous" size="3" onClick="selectRow('row4')" value="<webwork:property value="previousFieldValue"/>" /></webwork:param>
                            <webwork:param name="'value1'"><input type="text" name="next" size="3" onClick="selectRow('row4')" value="<webwork:property value="nextFieldValue"/>" /></webwork:param>
                        </webwork:text>
                        <br><small><webwork:text name="'popups.duedate.inrange.description'">
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
