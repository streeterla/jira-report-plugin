<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.scheme.picker.comparison.title'"/></title>
</head>

<body>

<script type="text/javascript">
    function submitForm(typeOfSchemesToDisplay)
    {
        document.forms['jiraform'].action = "SchemeComparisonPicker!switch.jspa?typeOfSchemesToDisplay=" + typeOfSchemesToDisplay + "&selectedSchemeType=" + document.getElementById("selectedSchemeType").value;
        document.forms['jiraform'].submit();
        return false;
    }
</script>

<p>
    <page:applyDecorator name="jiraform">
        <page:param name="width">100%</page:param>
        <page:param name="title"><webwork:text name="'admin.scheme.picker.comparison.title'"/></page:param>
        <page:param name="helpURL">scheme_tools</page:param>
        <page:param name="description"><webwork:text name="'admin.scheme.picker.comparison.desc'">
           <webwork:param name="'value0'"><p/></webwork:param>
           <webwork:param name="'value1'"><webwork:property value="/maxNumberOfSchemesToCompare" /></webwork:param>
        </webwork:text>
        </page:param>
        <page:param name="action">SchemeComparisonPicker.jspa</page:param>
        <page:param name="columns">1</page:param>
        <page:param name="submitId">compare_submit</page:param>
        <page:param name="submitName"><webwork:text name="'admin.scheme.picker.comparison.submit'"/></page:param>

        <tr>
            <td>
                <div class="tabContainer maxWidth centered">
                    <div class="tabHeader">
                        <a href="#" <webwork:if test="/typeOfSchemesToDisplay/equals('associated') == true">
                            class="selected"</webwork:if> onclick="submitForm('associated')"><webwork:text name="'admin.scheme.picker.associated'"/></a>
                        <a href="#" <webwork:if test="/typeOfSchemesToDisplay/equals('all') == true">
                            class="selected"</webwork:if> onclick="submitForm('all')"><webwork:text name="'admin.scheme.picker.all'"/></a>
                        <input type="hidden" name="typeOfSchemesToDisplay" value="<webwork:property value='/typeOfSchemesToDisplay'/>"/>
                    </div>

                    <div class="tabContent">
                        <webwork:property value="/schemePickerWebComponentHtml" escape="false"/>
                    </div>
                </div>
            </td>
        </tr>

    </page:applyDecorator>
</p>


</body>
</html>
