
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.issuefields.customfields.view.custom.fields'"/></title>
</head>

<body>

<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.issuefields.customfields.view.custom.fields'"/></page:param>
    <page:param name="helpURL">customfields</page:param>
    <page:param name="width">100%</page:param>
    <p>
        <webwork:text name="'admin.issuefields.customfields.the.table.below'"/>
        <webwork:if test="customFields/size > 0">
            <webwork:text name="'admin.issuefields.customfields.number.available'">
                <webwork:param name="'value0'"><webwork:property value="customFields/size" /></webwork:param>
            </webwork:text>
        </webwork:if>
    </p>

    <webwork:if test="/customFieldTypesExist == true">
    <ul class="square">
        <li><a id="add_custom_fields" href="<%= request.getContextPath() %>/secure/admin/CreateCustomField!default.jspa"><webwork:text name="'admin.issuefields.customfields.add.custom.field'"/></a></li>
<%--        <li><a id="reset_custom_fields" href="<%= request.getContextPath() %>/secure/admin/ViewCustomFields!reset.jspa">Refresh custom fields cache</a></li>--%>
    </ul>
    </webwork:if>
    <webwork:else>
        <p><webwork:text name="'admin.issuefields.customfields.no.plugins.configured'"/></p>
    </webwork:else>
</page:applyDecorator>

<p>

    <table class="grid maxWidth">
        <tr>
            <th>
                <webwork:text name="'common.words.name'"/>
            </th>
            <th>
                <webwork:text name="'admin.common.words.type'"/>
            </th>
            <th>
                <webwork:text name="'admin.issuefields.available.contexts'"/>
            </th>
            <th>
                <webwork:text name="'admin.issuefields.screens'"/>
            </th>
            <th>
                <webwork:text name="'common.words.operations'"/>
            </th>
        </tr>

        <webwork:if test="customFields/size > 0">

          <webwork:iterator value="customFields" status="'status'">
          <tr <webwork:if test="@status/modulus(2) != 1">class="rowAlternate"</webwork:if>>
              <td class="">
                <strong><webwork:property value="name"/></strong><br />
                <span class="subText"><webwork:property value="description" escape="false"/></span>
              </td>
              <td class="noWrap">
                    <webwork:property value='customFieldType/name'/>
              </td>
              <td class="">
                <jsp:include page="contexts.jsp" flush="true" ></jsp:include>
              </td>
              <td  class="noWrap">
                    <webwork:if test="/fieldScreenTabs(.)/empty == false">
                    <ul class="square_blue">
                        <webwork:iterator value="/fieldScreenTabs(.)" status="'tabStatus'">
                            <li>
                            <webwork:if test="./fieldScreen/tabs/size > 1">
                                <a href="<%= request.getContextPath() %>/secure/admin/ConfigureFieldScreen.jspa?id=<webwork:property value="./fieldScreen/id" />&tabPosition=<webwork:property value="./position" />"><webwork:property value="./fieldScreen/name" /></a> <span class="small">(<webwork:property value="./name" />)</span>
                            </webwork:if>
                            <webwork:else>
                                <a href="<%= request.getContextPath() %>/secure/admin/ConfigureFieldScreen.jspa?id=<webwork:property value="./fieldScreen/id" />"><webwork:property value="./fieldScreen/name" /></a>
                            </webwork:else>
                            </li>
                        </webwork:iterator>
                    </ul>
                    </webwork:if>
                    <webwork:else>&nbsp;</webwork:else>
              </td>
              <td class="noWrap">
                  <a id="config_<webwork:property value="./id" />" href="ConfigureCustomField!default.jspa?customFieldId=<webwork:property value="genericValue/long('id')"/>"><webwork:text name="'admin.common.words.configure'"/></a> |
                  <a id="edit_<webwork:property value="./name" />" href="EditCustomField!default.jspa?id=<webwork:property value="genericValue/long('id')"/>"><webwork:text name="'common.words.edit'"/></a> |
                  <a id="associate_<webwork:property value="./id" />" href="AssociateFieldToScreens!default.jspa?fieldId=<webwork:property value="id"/>&returnUrl=ViewCustomFields.jspa"><webwork:text name="'admin.issuefields.screens'"/></a> |
                  <a id="del_<webwork:property value="./id" />" href="DeleteCustomField!default.jspa?id=<webwork:property value="genericValue/long('id')"/>"><webwork:text name="'common.words.delete'"/></a>
              </td>
          </tr>
          </webwork:iterator>
        </webwork:if>
        <webwork:else>
        <tr><td colspan="6"> <webwork:text name="'admin.issuefields.customfields.no.custom.fields.defined'"/></td></tr>
        </webwork:else>
    </table>

</body>
</html>
