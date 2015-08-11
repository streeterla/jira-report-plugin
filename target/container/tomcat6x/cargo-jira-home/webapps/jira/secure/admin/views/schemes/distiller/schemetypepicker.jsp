<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.scheme.type.picker.title'"/></title>
</head>

<body>

<script type="text/javascript">
    function submitForm(typeOfSchemesToDisplay)
    {
        document.forms['jiraform'].action = "SchemeTypePicker!switch.jspa?typeOfSchemesToDisplay=" + typeOfSchemesToDisplay + "&selectedSchemeType=" + document.getElementById("selectedSchemeType").value;
        document.forms['jiraform'].submit();
        return false;
    }
</script>

<p>
    <page:applyDecorator name="jiraform">
        <page:param name="width">100%</page:param>
        <page:param name="title"><webwork:text name="'admin.scheme.type.picker.title'"/></page:param>
        <page:param name="description"><webwork:text name="'admin.scheme.type.picker.desc'"/></page:param>
        <page:param name="helpURL">scheme_tools</page:param>
        <page:param name="action">SchemeTypePicker.jspa</page:param>
        <page:param name="columns">1</page:param>
        <page:param name="submitId">analyse_submit</page:param>
        <page:param name="submitName"><webwork:text name="'admin.scheme.type.picker.analyse'"/></page:param>

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
                        <p>
                            <div style="width:100%;padding:5px 0px;" class="jiraformSectionBreak">
                                <span class="jiraformSectionBreak" style="margin-left:5px;font-weight:bold;">&nbsp;<webwork:text name="'admin.scheme.type.picker.select.type'"/>:</span>
                            </div>
                        </p>

                        <div style="margin:5px;">
                            <ui:select label="" name="'selectedSchemeType'" list="/schemeTypes" listKey="'./value'" listValue="'./key'" theme="'single'">
                                <ui:param name="'mandatory'" value="true"/>
                                <ui:param name="'noTable'" value="true"/>
                                <ui:param name="'id'" value="'selectedSchemeType'"/>
                            </ui:select>
                        </div>

                    </div>
                </div>
            </td>
        </tr>

    </page:applyDecorator>
</p>


</body>
</html>
