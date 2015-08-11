<%@ taglib uri="webwork" prefix="webwork" %>
<webwork:property value="parameters['nameValue']">
<webwork:if test=". == null || ./rows.size == 0 || ./total == 0 ">
    <td style="width:100%; background-color:#f0f0f0;"><img src="<%= request.getContextPath() %>/images/border/spacer.gif" style="height:10px; width:100%; border-width:0" alt="" /></td>
</webwork:if>
<webwork:else>
    <webwork:iterator value="rows">
        <webwork:if test="../percentage(.) != 0" >
            <td style="width:<webwork:property value="../percentage(.)"/>%; background-color:<webwork:property value="color" />" ><img src="<%= request.getContextPath() %>/images/border/spacer.gif"
                    style="height:10px; width:100%; border-width:0" class="hideOnPrint"
                    title="<webwork:property value="./description" />"
                    alt="<webwork:property value="./description" />" ></td>
        </webwork:if>
    </webwork:iterator>
</webwork:else>
</webwork:property>
