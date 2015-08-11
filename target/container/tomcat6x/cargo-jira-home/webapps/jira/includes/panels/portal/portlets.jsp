<%@ taglib uri="webwork" prefix="webwork" %>
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

    function selectCellRadioBox(cell)
    {
        var id = parseInt(cell.id.substring(4, cell.id.length));
        document.forms['jiraform'].elements['portletId'][id - 1].checked = true;
    }

    function openThumbnail(evt, imageUrl)
    {
        thumbnailWindow = window.open('<%=request.getContextPath() + "/secure/views/user/portletthumbnail.jsp?decorator=none&imagesrc="%>' + escape(imageUrl), 'thumbnail', 'width=475, height=225');
        thumbnailWindow.moveTo((screen.availWidth/2)-237,(screen.availHeight/2)-112);
        thumbnailWindow.focus();
    }
</script>
<webwork:iterator value="portlets" status="'status'">
<webwork:if test="@status/odd == true">
<tr>
</webwork:if>
    <td id="cell<webwork:property value="@status/count"/>" valign="top" align="left" width="50%" onmouseover="cellHover(this)"
            onclick="selectCellRadioBox(this)"  style="border-width=0;"
            <webwork:if test="@status/modulus(4) == 1 || @status/modulus(4) == 0">class=rowNormal originalClass=rowNormal</webwork:if><webwork:else>class=rowAlternate originalClass=rowAlternate</webwork:else>
            >
        <webwork:if test="thumbnailfile != ''">
            <a onClick="javascript:openThumbnail(event, '<webwork:property value="thumbnailPath"/>'); return false;" href="#"><img align="right" vspace="5" width="75" height="75" alt="Preview of portlet" title="Click for larger version" border="0" src="<webwork:property value="cornerThumbnailPath"/>"/></a>
        </webwork:if>
        <label for="portletId_<webwork:property value="id" />_id">
            <input type="radio" name="portletId" value="<webwork:property value="id" />" id="portletId_<webwork:property value="id" />_id"
            <webwork:if test="/portletId == id">selected</webwork:if>>
            <b><webwork:text name="name" /></b> - <webwork:text name="description" /><br>
            <font size=1>
            <webwork:text name="'addportlet.currentlyconfigured'">
                <webwork:param name="'value0'" value="../portletConfigurations(.)/size" />
            </webwork:text>
        </label>
    </td>
<webwork:if test="@status/last == true && @status/odd == true">
    <td bgcolor="#FFFFFF">&nbsp;</td>
</webwork:if>
<webwork:if test="@status/even == true">
</tr>
</webwork:if>
</webwork:iterator>
