<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.issuefields.fieldconfigurations.associate.field.to.schemes'">
	    <webwork:param name="'value0'"><webwork:property value="/field/name" /></webwork:param>
	</webwork:text></title>
</head>

<body>
<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'admin.issuefields.fieldconfigurations.associate.field.to.schemes'">
        <webwork:param name="'value0'"><webwork:property value="/field/name" /></webwork:param>
    </webwork:text></page:param>
    <page:param name="description">
        <webwork:text name="'admin.issuefields.fieldconfigurations.associate.description'">
            <webwork:param name="'value0'"><webwork:property value="/field/name" /></webwork:param>
            <webwork:param name="'value1'"><webwork:text name="'admin.issuefields.fieldconfigurations.associate.a.tab'"/></webwork:param>
        </webwork:text>
    </page:param>
    <page:param name="action">AssociateFieldToScreens.jspa</page:param>
    <page:param name="cancelURI"><webwork:url page="ViewFieldScreens.jspa" /></page:param>
    <page:param name="submitId">update_submit</page:param>
    <page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>

    <ui:component name="'fieldId'" template="hidden.jsp" theme="'single'" />

    <ui:component label="text('admin.issuefields.field.name')" value="/field/name" template="textlabel.jsp" />

    <tr>
    <td colspan="2">
    <table class="grid centred" style="width: 60%;" >
    <tr>
        <th><webwork:text name="'admin.common.words.screen'"/></th>
        <th><webwork:text name="'admin.associatefield.tab'"/></th>
        <th class="minWidth"><webwork:text name="'common.words.select'"/></th>
    </tr>
    <webwork:iterator value="/screens" status="'status'">
        <tr>
            <td><webwork:property value="./name" /></td>
        <webwork:if test="./tabs/size == 1">
            <td>
                <webwork:property value="./tabs/iterator()/next()" id="tabObject" />
                <webwork:property value="@tabObject/name" />
                <ui:component name="./id" template="hidden.jsp"  value="@tabObject/id" />
            </td>
        </webwork:if>
        <webwork:else>
            <ui:select label="''" name="./id"
                       list="./tabs" listKey="'id'" listValue="'name'"
                       template="selectmap.jsp" theme="'single'" value="/selectedTabForScreen(.)/id"
                       >
            </ui:select>
        </webwork:else>
            <td class="fullyCentered minWidth">
                <ui:checkbox theme="'single'" label="''" name="'associatedScreens'" fieldValue="./id">
                    <ui:param name="'checked'"><webwork:if test="/selectedTabForScreen(.)">true</webwork:if></ui:param>
                </ui:checkbox>
            </td>
        </tr>
    </webwork:iterator>
    </table>

    </td>
    </tr>

</page:applyDecorator>

</body>
</html>
