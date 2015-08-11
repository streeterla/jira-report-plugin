<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.scheme.purge.picker.title'"/></title>
</head>

<body>

<script language="JavaScript" type="text/javascript">


    function swapTable(sel1)
    {
        // Feature test to see if there is enough W3C DOM support
        if (document.getElementById && document.getElementsByTagName)
        {

            // Obtain references to all cloned options
            var options = sel1.getElementsByTagName("option");

            for (var i = 0; i < options.length; i++)
            {
                var div = document.getElementById(options[i].value);
                if (options[i].selected)
                {
                    div.style.display = '';
                }
                else
                {
                    div.style.display = 'none';
                }
            }
        }
        return false;
    }

    function toggleCheckboxes(checked, schemeType)
    {
        var checkboxes = getElementsByAttribute("schemeType", "input", schemeType);

        // run through all the checkboxes in the row and uncheck
        for (var i = 0; i < checkboxes.length; i++)
        {
            var checkbox = checkboxes[i];
            checkbox.checked = checked;
        }

        return false;
    }

    function getElementsByAttribute(attribute, tag, name)
    {
        var elem = document.getElementsByTagName(tag);
        var arr = new Array();
        for (i = 0,iarr = 0; i < elem.length; i++)
        {
            att = elem[i].getAttribute(attribute);
            if (att == name)
            {
                arr[iarr] = elem[i];
                iarr++;
            }
        }
        return arr;
    }

    function clearCheckboxesForUnselectedType()
    {
        if (document.getElementById && document.getElementsByTagName)
        {

            var sel1 = document.getElementById("selectedSchemeType_select")

            // Obtain references to all cloned options
            var options = sel1.getElementsByTagName("option");

            for (var i = 0; i < options.length; i++)
            {
                var div = document.getElementById(options[i].value);
                if (!options[i].selected)
                {
                    toggleCheckboxes(false, options[i].value);
                }
            }
        }
        return true;
    }

</script>

<p>
    <page:applyDecorator name="jiraform">
        <page:param name="width">100%</page:param>
        <page:param name="helpURL">scheme_tools</page:param>
        <page:param name="title"><webwork:text name="'admin.scheme.purge.picker.title'"/></page:param>
        <page:param name="description">
            <webwork:text name="'admin.scheme.purge.picker.desc'">
               <webwork:param name="'value0'"><p/></webwork:param>
            </webwork:text>
        </page:param>
        <page:param name="action">SchemePurgeTypePicker.jspa</page:param>
        <page:param name="submitId">preview_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.preview'"/></page:param>
        <page:param name="onsubmit">clearCheckboxesForUnselectedType();</page:param>


        <ui:select label="text('admin.scheme.type.picker.select.type')" name="'selectedSchemeType'" list="/schemeTypes"
                   listKey="'./value'" listValue="'./key'" onchange="'swapTable(this);'">
            <ui:param name="'mandatory'" value="true"/>
            <ui:param name="'id'" value="'selectedSchemeType'"/>
        </ui:select>

        <tr><td colspan="2">

            <webwork:iterator value="/schemeTypes" status="'status'">
                <div id="<webwork:property value="./value"/>" <webwork:if test="./value/equals(/selectedSchemeType) == false">style="display:none;"</webwork:if>>
                    <webwork:if test="/unassociatedSchemes(./value)/size() != 0">
                        <table class="grid defaultWidth centered" id="purge_schemes_<webwork:property value="./value"/>">
                        <th width="2%"><input type="checkbox" id="selectAll"
                                              onclick="toggleCheckboxes(this.checked, '<webwork:property value="./value"/>');"/>
                        </th>
                        <th width="49%"><webwork:text name="'admin.scheme.purge.picker.scheme.name'"/></th>
                        <th width="49%"><webwork:text name="'common.concepts.description'"/></th>

                        <webwork:iterator value="/unassociatedSchemes(./value)" status="'status'">
                            <tr class="<webwork:if test="@status/odd == true">rowNormal</webwork:if><webwork:else>rowAlternate</webwork:else>">
                                <td valign="top"><input type="checkbox" name="selectedSchemeIds"
                                                        id="checkbox_<webwork:property value="@status/index"/>"
                                                        value="<webwork:property value="./id"/>"
                                                        schemeType="<webwork:property value="../value"/>"
                                        <webwork:if test="/selectedSchemeIdsAsList/contains(./id/toString()) == true && /selectedSchemeType/equals(./type) == true">
                                            checked</webwork:if> /> <!-- NOTE: there must be a space between checked and the closing tag for safari to work -->
                                </td>
                                <td>
                                    <webwork:property value="./name"/>
                                </td>
                                <td>
                                    <webwork:property value="./description"/>
                                </td>
                            </tr>
                        </webwork:iterator>
                    </webwork:if>
                    <webwork:else>
                        <table class="defaultWidth centered" id="merged_schemes">
                        <tr>
                            <td>
                                <div class="infoBox">
                                    <webwork:text name="'admin.scheme.purge.picker.no.unassociated.schemes'"/>
                                </div>
                            </td>
                        </tr>
                    </webwork:else>
                    </table>
                </div>
            </webwork:iterator>
        </td></tr>
    </page:applyDecorator>
</p>


</body>
</html>
