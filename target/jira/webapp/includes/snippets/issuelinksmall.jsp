<%@ taglib uri="webwork" prefix="webwork" %>
<%-- depends on an issue being on the value stack --%>
<td>
    <div class="flooded">
        <div class="attribute-wrap">
            <webwork:if test=". != null && @fieldVisibility/fieldHidden('priority', .) == false">
            <span class="priority">
                <%@ include file="/includes/icons/priority.jsp" %>
            </span>
            </webwork:if>
            <span class="status">
                <%@ include file="/includes/icons/status.jsp" %>
            </span>
        </div>
        <a href="<webwork:url value="'/browse/' + string('key')" atltoken="false" />" title="<webwork:property value="string('summary')" />">
        <webwork:if test="string('resolution')" ><strike><webwork:property value="string('key')" /></strike></webwork:if>
        <webwork:else><webwork:property value="string('key')" /></webwork:else></a>
        <webwork:property value="string('summary')" />
    </div>
</td>
