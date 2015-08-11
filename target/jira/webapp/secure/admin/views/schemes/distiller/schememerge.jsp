<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.scheme.merge.title'"/></title>
</head>

<body>

<script type="text/javascript">
    function submitForm(typeOfSchemesToDisplay)
    {
        document.forms['jiraform'].action = "SchemeTypePicker!switch.jspa?typeOfSchemesToDisplay=" + typeOfSchemesToDisplay + "&selectedSchemeType=" + document.getElementById("selectedSchemeType").value;
        document.forms['jiraform'].submit();
        return false;
    }

    function toggleCheckboxes(checked)
    {
        var checkboxes = getElementsByName("input", "selectedDistilledSchemes");

        // run through all the checkboxes in the row and uncheck
        for (var i = 0; i < checkboxes.length; i++)
        {
            var checkbox = checkboxes[i];
            checkbox.checked = checked;
            if (checked)
            {
                setTextFieldDisabled(checkbox.className, false);
            }
            else
            {
                setTextFieldDisabled(checkbox.className, true);
            }
        }

        return false;
    }

    function setTextFieldDisabled(id, value)
    {
        document.getElementById(id).disabled = value;
    }

    function toggleTextFieldEnabled(id)
    {
        document.getElementById(id).disabled = !document.getElementById(id).disabled;
    }

    function getElementsByName(tag, name)
    {
        var elem = document.getElementsByTagName(tag);
        var arr = new Array();
        for (i = 0,iarr = 0; i < elem.length; i++)
        {
            att = elem[i].getAttribute("name");
            if (att == name)
            {
                arr[iarr] = elem[i];
                iarr++;
            }
        }
        return arr;
    }

    function initializeInputBoxes()
    {
        var checkboxes = getElementsByName("input", "selectedDistilledSchemes");

        // run through all the checkboxes in the row and uncheck
        for (var i = 0; i < checkboxes.length; i++)
        {
            var checkbox = checkboxes[i];
            var checked = checkbox.checked;
            if (checked)
            {
                setTextFieldDisabled(checkbox.className, false);
            }
            else
            {
                setTextFieldDisabled(checkbox.className, true);
            }
        }
    }
</script>

<p>
    <page:applyDecorator name="jiraform">
        <page:param name="width">100%</page:param>
        <page:param name="title"><webwork:text name="'admin.scheme.merge.title'"/></page:param>
        <page:param name="helpURL">scheme_tools</page:param>
        <page:param name="description">

            <webwork:if test="/distilledSchemeResults/distilledSchemeResults/size !=0">
                <webwork:text name="'admin.scheme.merge.desc.1'">
                   <webwork:param name="'value0'"><strong></webwork:param>
                   <webwork:param name="'value1'"><webwork:property value="/totalDistilledFromSchemes"/></webwork:param>
                   <webwork:param name="'value2'"></strong></webwork:param>
                   <webwork:param name="'value3'"><webwork:property value="/distilledSchemeResults/distilledSchemeResults/size"/></webwork:param>
                </webwork:text>
            </webwork:if>
            <webwork:else>
                <webwork:if test="/typeOfSchemesToDisplay/equals('associated') == true">
                    <webwork:text name="'admin.scheme.merge.desc.2'">
                       <webwork:param name="'value0'"><webwork:property value="/schemeTypeDisplayName(/selectedSchemeType)"/></webwork:param>
                       <webwork:param name="'value1'"><a href="<%=request.getContextPath()%>/secure/admin/SchemeComparisonPicker!default.jspa?typeOfSchemesToDisplay=<webwork:property value="/typeOfSchemesToDisplay" />&selectedSchemeType=<webwork:property value="/selectedSchemeType"/>"></webwork:param>
                       <webwork:param name="'value2'"></a></webwork:param>
                    </webwork:text>
                </webwork:if>
                <webwork:else>
                    <webwork:text name="'admin.scheme.merge.desc.3'">
                       <webwork:param name="'value0'"><webwork:property value="/schemeTypeDisplayName(/selectedSchemeType)"/></webwork:param>
                       <webwork:param name="'value1'"><a href="<%=request.getContextPath()%>/secure/admin/SchemeComparisonPicker!default.jspa?typeOfSchemesToDisplay=<webwork:property value="/typeOfSchemesToDisplay" />&selectedSchemeType=<webwork:property value="/selectedSchemeType"/>"></webwork:param>
                       <webwork:param name="'value2'"></a></webwork:param>
                    </webwork:text>
                </webwork:else>
            </webwork:else>
        </page:param>
        <page:param name="action">SchemeMerge.jspa</page:param>
        <page:param name="columns">1</page:param>
        <webwork:if test="/distilledSchemeResults/distilledSchemeResults/size !=0">
            <page:param name="submitId">changes_submit</page:param>
            <page:param name="submitName"><webwork:text name="'admin.scheme.merge.preview.changes'"/></page:param>
            <page:param name="cancelURI">SchemeTypePicker!default.jspa</page:param>
        </webwork:if>
        <page:param name="autoSelectFirst">false</page:param>


        <tr>
            <td>
                <webwork:if test="/distilledSchemeResults/distilledSchemeResults/size !=0">

                <table class="grid defaultWidth centered" id="merged_schemes">
                    <p/>
                    <th width="2%"> <input type="checkbox" id="selectAll" onclick="toggleCheckboxes(this.checked);"/></th>
                    <th width="49%"><webwork:text name="'admin.scheme.merge.merged.schemes'"/></th>
                    <th width="49%"><webwork:text name="'admin.scheme.merge.new.scheme.name'"/></th>

                    <webwork:iterator value="/distilledSchemeResults/distilledSchemeResults" status="'status'">
                        <tr>
                            <td valign="top"><input type="checkbox" name="selectedDistilledSchemes"
                                                    id="checkbox_<webwork:property value="@status/index"/>"
                                                    class="<webwork:property value="./resultingScheme/name"/>"
                                                    onclick="toggleTextFieldEnabled('<webwork:property value="./resultingScheme/name"/>')"
                                                    value="<webwork:property value="./resultingScheme/name"/>"
                                                    <webwork:if test="/selectedDistilledSchemesAsList/contains(./resultingScheme/name) ==true || ./selected == true">checked</webwork:if> />
                            </td>
                                <td>
                                <span class="small">
                                <webwork:iterator value="./originalSchemes" status="'status'">
                                    <a href="<%=request.getContextPath()%>/secure/admin/<webwork:property value="/editPage"/>!default.jspa?schemeId=<webwork:property value="./id"/>"
                                       id="<webwork:property value="./id"/>_editScheme" title="Edit Scheme"><webwork:property value="./name"/></a>
                                    <webwork:if test="@status/last == false">, </webwork:if>
                                </webwork:iterator>
                                </span>
                            </td>
                            <ui:textfield tabindex="@status/index + 1" label="" theme="'single'" name="./resultingScheme/name" value="./resultingSchemeTempName" size="50">
                                <ui:param name="'id'"><webwork:property value="./resultingScheme/name"/></ui:param>
                            </ui:textfield>
                        </tr>
                    </webwork:iterator>
                    <ui:component name="'selectedSchemeType'" value="/selectedSchemeType" template="hidden.jsp" theme="'single'" />
                    <ui:component name="'typeOfSchemesToDisplay'" value="/typeOfSchemesToDisplay" template="hidden.jsp" theme="'single'" />
                </table>
                </webwork:if>
                <webwork:else>
                    <table class="defaultWidth centered"><tr><td align="center"><a id="return_link" href="<%=request.getContextPath()%>/secure/admin/SchemeTypePicker!default.jspa">&lt;&lt; <webwork:text name="'admin.scheme.comparison.return.link'"/></a></td></tr></table>
                </webwork:else>

            </td>
        </tr>

    </page:applyDecorator>
</p>


<script type="text/javascript">
    initializeInputBoxes();
</script>
</body>
</html>
