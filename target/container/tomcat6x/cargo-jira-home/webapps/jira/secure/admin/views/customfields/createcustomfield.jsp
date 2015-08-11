<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.issuefields.customfields.create.custom.field'"/></title>
</head>
<style>
.rowSelected  { background-color: #dddddd; }
.rowHover  { background-color: #dddddd; }
</style>
<script language="javascript">

    var selected;

    function cellHover(cell)
    {
        cell.oldClassName = cell.className;
        cell.className = 'rowHover';
        cell.onmouseout = function()
        {
            this.className = this.oldClassName;
        }
    }

    function selectCellRadioBox(cellId)
    {
        var id = cellId.substring(4, cellId.length);
        document.forms['jiraform'].elements[id + '_id'].checked = true;
    }

</script>
<body>
<style>
.fieldTypeCell
{
    padding: 5px;
    width: 50%;
}

</style>
	<page:applyDecorator name="jiraform">
		<page:param name="title"><webwork:text name="'admin.issuefields.customfields.create.custom.field'"/></page:param>
		<page:param name="instructions">
            <p>
                <webwork:text name="'admin.issuefields.customfields.choose.the.field.type'">
                    <webwork:param name="'value0'"><webwork:property value="fieldTypes/size" /></webwork:param>
                </webwork:text>
            </p>
            <p>
                <webwork:text name="'admin.issuefields.customfields.extentions'">
                      <webwork:param name="'value0'"><strong><a href="<webwork:component name="'external.link.jira.extensions'" template="externallink.jsp" />"></webwork:param>
                      <webwork:param name="'value1'"></a></strong></webwork:param>
                </webwork:text>
            </p>
        </page:param>
		<page:param name="width">100%</page:param>
		<page:param name="action">CreateCustomField.jspa</page:param>
		<page:param name="cancelURI">ViewCustomFields.jspa</page:param>
        <page:param name="helpURL">addingcustomfields</page:param>
        <page:param name="wizard">true</page:param>

    <tr bgcolor=#ffffff><td align="right" valign="top" bgcolor="#fffff0">
        <webwork:text name="'admin.issuefields.customfields.field.type'"/>:
    <td>

    <table class="grid maxWidth">
        <webwork:if test="fieldTypes/size > 0">
          <webwork:iterator value="fieldTypes" status="'status'">
          <webwork:if test="@status/odd == true"><tr></webwork:if>
              <td class="fieldTypeCell" id="cell<webwork:property value="key"/>" valign=top onmouseover="cellHover(this)" onclick="selectCellRadioBox(this.id)" bgcolor="#<webwork:if test="@status/modulus('4') == 1 || @status/modulus('4') == 0">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
              <label for="<webwork:property value="key"/>_id">
                <input type="radio" name="fieldType" value="<webwork:property value="key"/>" id="<webwork:property value="key"/>_id">
                <b><webwork:property value="name"/></b><br>
                <font size="1"><webwork:property value="description"/></font>
              </label>
              </td>
          <webwork:if test="@status/even == true"></tr></webwork:if>
          </webwork:iterator>
          <webwork:if test="@status/even != true"></tr></webwork:if>
        </webwork:if>
        <webwork:else>
        <tr><td><webwork:text name="'admin.issuefields.customfields.you.have.no.custom.field.types.available'"/></td></tr>
        </webwork:else>
    </table>
    </td></tr>

    <ui:component template="multihidden.jsp" >
        <ui:param name="'fields'">fieldName,description,searcher,global</ui:param>
        <ui:param name="'multifields'">projects,issuetypes</ui:param>
    </ui:component>

	</page:applyDecorator>

    <webwork:if test="/fieldTypeValid == 'true'">
        <script language="JavaScript" type="text/javascript">
        <!--
        selectCellRadioBox('cell<webwork:property value="/fieldType" />');
        //-->
        </script>
    </webwork:if>
</body>
</html>
