<p>
<table id="metas_table" class=gridBox width=90% align=center cellpadding=3 cellspacing=1>
    <webwork:if test="/metaAttributes && /metaAttributes/empty == false">
        <tr bgcolor=#f0f0f0>
            <td class="colHeaderLink">
                <b><webwork:text name="'admin.workflows.property.key'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'admin.workflows.property.value'"/></b>
            </td>
            <webwork:if test="workflow/editable == true">
            <td class="colHeaderLink">
                <b><webwork:text name="'common.words.operations'"/></b>
            </td>
            </webwork:if>
        </tr>

        <webwork:iterator value="/metaAttributes" status="'status'">
            <tr bgcolor=<webwork:if test="@status/odd == true">ffffff</webwork:if><webwork:else>fffff0</webwork:else>>
                <td><webwork:property value="./key"/></td>
                <td><webwork:property value="./value"/></td>
                <webwork:if test="workflow/editable == true"><td><a id="del_meta_<webwork:property value="./key"/>" href="<webwork:url value="/removeAttributeUrl(./key)"/>"><webwork:text name="'common.words.delete'"/></a></td></webwork:if>
            </tr>
        </webwork:iterator>

    </webwork:if>
    <webwork:else>
        <tr bgcolor=#ffffff>
            <td><webwork:text name="'admin.workflows.nowdefinedproperties'"/></td>
        </tr>
    </webwork:else>
</table>
