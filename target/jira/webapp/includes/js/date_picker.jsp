<script language="javascript" type="text/javascript">
function openDateRangePicker(formName, previousFieldName, nextFieldName, fieldId)
{

    var previousFieldValue = document.forms[formName].elements[previousFieldName].value;
    var nextFieldValue = document.forms[formName].elements[nextFieldName].value;

    var url = '<%= request.getContextPath() %>/secure/popups/DateRangePicker.jspa?';
    url += 'formName=' + formName + '&';
    url += 'previousFieldName=' + escape(previousFieldName) + '&';
    url += 'nextFieldName=' + escape(nextFieldName) + '&';
    url += 'previousFieldValue=' + escape(previousFieldValue) + '&';
    url += 'nextFieldValue=' + escape(nextFieldValue) + '&';
    url += 'fieldId=' + escape(fieldId);

    var vWinUsers = window.open(url, 'DateRangePopup', 'status=no,resizable=yes,top=100,left=200,width=580,height=400,scrollbars=yes');
    vWinUsers.opener = self;
    vWinUsers.focus();
}

function show_calendar2(formName, fieldName)
{
    var form = document.forms[formName];
    var element = form.elements[fieldName];
    var vWinCal = window.open('<%= request.getContextPath() %>/secure/popups/Calendar.jspa?form=' + formName + '&field=' + fieldName + '&value=' + escape(element.value) + '&decorator=none', 'Calendar','width=230,height=170,status=no,resizable=yes,top=220,left=200');
    vWinCal.opener = self;
    vWinCal.focus();
}

</script>
