<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>


<html>
<body>
<script language="JavaScript" type="text/javascript">

function populateForm(selectedIssue)
{
    var openerForm = window.opener.document.forms['<webwork:property value="$formName" />'];
    var openerLinkEl = openerForm.elements['<webwork:property value="$linkFieldName"/>'];
    openerLinkEl.value = selectedIssue;
    window.close();
}
// Provide hover and click effect to entire table rows.
// Usage:
// <table class="grid">
//   <tr href="somelink.jsp" onmouseover="rowHover(this)">
//   ...

// populate the parent form with multiple values
function populateFormMultiple()
{
    var issuelist = '';

    if (document.issues.issuekey.length > 0)
    {
        // get all the selected checkboxes
        for (var counter=0; counter<document.issues.issuekey.length; counter++)
        {
            if (document.issues.issuekey[counter].checked == true)
            {
                if (issuelist == '')
                {
                    issuelist = document.issues.issuekey[counter].value;
                }
                else
                {
                    issuelist = issuelist + ', ' + document.issues.issuekey[counter].value;
                }
            }
        }
    }
    else if (document.issues.issuekey.checked == true)
    {
       issuelist = document.issues.issuekey.value;
    }
    var openerForm = window.opener.document.forms['<webwork:property value="$formName" />'];
    var openerLinkEl = openerForm.elements['<webwork:property value="$linkFieldName"/>'];
    openerLinkEl.value = issuelist;
    window.close();
}

function rowHover(row)
{
    row.oldClassName = row.className;
    row.className = 'rowHover';
    row.onmouseout = function()
    {
        this.className = this.oldClassName;
    }
}
</script>

<table width="100%">
<tr >
<td width=1% nowrap>
<b><webwork:text name="'issuepicker.name'"/> </b>
</td>
<td valign=middle align="right" nowrap>

    <webwork:if test="mode == 'recent'">
        <font color="#999999"><webwork:text name="'issuepicker.recent.issues'"/></font>
    </webwork:if>
    <webwork:else>
        <a href="<webwork:url ><webwork:param name="'mode'" value="'recent'" /><webwork:param name="'defaultSelectMode'" value="/defaultSelectMode" /><webwork:param name="'currentIssue'" value="/currentIssue"/><webwork:param name="'formName'" value="/formName"/><webwork:param name="'linkFieldName'" value="/linkFieldName"/></webwork:url>" title="<webwork:text name="'issuepicker.recent.issues.desc'"/>"><webwork:text name="'issuepicker.recent.issues'"/></a>
    </webwork:else>
    | <span title="<webwork:text name="'issuepicker.search.filter.desc'"/>"><webwork:text name="'issuepicker.search.filter'"/></span>
</td>
<td width=1% nowrap>
    <form name="selectFilter">
            <select name="searchRequestId" onChange="submit()">
                <option value="-1"><webwork:text name="'issuepicker.select.value'"/></option>

                <webwork:iterator value="/availableFilters">
                    <option value="<webwork:property value="./id"/>" <webwork:if test="./id == /searchRequestId && mode=='search'">SELECTED</webwork:if>>
                        <webwork:property value="./name"/></option>
                </webwork:iterator>
            </select>

            <input type="hidden" name="mode" value="search">
            <input type="hidden" name="formName" value="<webwork:property value="/formName" />">
            <input type="hidden" name="linkFieldName" value="<webwork:property value="/linkFieldName"/>">
            <input type="hidden" name="currentIssue" value="<webwork:property value="/currentIssue"/>">
            <input type="hidden" name="defaultSelectMode" value="<webwork:property value="/defaultSelectMode"/>">
            <input type="hidden" name="singleSelectOnly" value="<webwork:property value="/singleSelectOnly"/>">
            <input type="hidden" name="showSubTasks" value="<webwork:property value="/showSubTasks"/>">
            <input type="hidden" name="showSubTasksParent" value="<webwork:property value="/showSubTasksParent"/>">
            <webwork:if test="selectedProjectId">
                <input type="hidden" name="selectedProjectId" value="<webwork:property value="/selectedProjectId"/>">
            </webwork:if>
    </form>
</td>
</tr>
</table>

<form name="issues">
<hr>


<webwork:if test="mode == 'recent'">

    <webwork:property value="/userHistoryIssues" >
        <webwork:if test=". && size > 0">
            <b><webwork:text name="'issuepicker.issues.viewed'"/></b>
            <%@ include file="/includes/issue/issuedisplayer.jsp" %>
        </webwork:if>
        <webwork:else>
            <b><webwork:text name="'issuepicker.noissues.viewed'"/></b>
        </webwork:else>
    </webwork:property>

<hr>

<%--

See if the user has a current search.  If they do - show them the first 50 issues in that search

--%>
    <webwork:property value="/browsableIssues" >
        <webwork:if test=". && size > 0">
        <b><webwork:text name="'issuepicker.current.search.issues'"/></b>
        <%@ include file="/includes/issue/issuedisplayer.jsp" %>
        </webwork:if>
        <webwork:else>
        <b><webwork:text name="'issuepicker.current.search.noissues'"/></b>
        </webwork:else>
    </webwork:property>

</webwork:if>
<webwork:elseIf test="mode == 'search'">
<%--

Return the first 50 results from the selected filter.

--%>

    <webwork:property value="/searchRequestIssues" >
        <webwork:if test=". && size > 0">
        <b><webwork:text name="'issuepicker.search.issues'"/> <i><webwork:property value="/searchRequestName" /></i>:</b>

        <%@ include file="/includes/issue/issuedisplayer.jsp" %>

        </webwork:if>
        <webwork:else>
        <b><webwork:text name="'issuepicker.search.noissues'"/> <i><webwork:property value="/searchRequestName" /></i>.</b>
        </webwork:else>
    </webwork:property>

</webwork:elseIf>
<webwork:elseIf test="mode == 'list'">
<%--

Return the first all results from the action.

--%>

    <webwork:property value="/issueList" >
        <webwork:if test=". && size > 0">
        <b><webwork:text name="'issuepicker.list.issues'"/>:</b>

        <%@ include file="/includes/issue/issuedisplayer.jsp" %>

        </webwork:if>
        <webwork:else>
        <b><webwork:text name="'issuepicker.list.noissues'"/>.</b>
        </webwork:else>
    </webwork:property>

</webwork:elseIf>

</form>
</body>
</html>
