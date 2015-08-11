<%@ taglib uri="webwork" prefix="webwork" %>
<webwork:if test="parameters['name'] != false">
    <td >
        <webwork:if test="parameters['favourite'] != 'false'">
            <div style="float:left;">
                <webwork:component name="'favourite'" template="favourite.jsp">
                    <webwork:param name="'enabled'"><webwork:property value="./favourite"/></webwork:param>
                    <webwork:param name="'entityType'">SearchRequest</webwork:param>
                    <webwork:param name="'entityId'"><webwork:property value="./id" /></webwork:param>
                    <webwork:param name="'tableId'"><webwork:property value="parameters['id']"/></webwork:param>
                    <webwork:param name="'entityName'"><webwork:property value="./name"/></webwork:param>
                    <webwork:param name="'relatedDropdown'">find_link</webwork:param>                    
                    <webwork:if test="parameters['remove'] == true">
                        <webwork:param name="'removeId'">mf_<webwork:property value="./id" /></webwork:param>
                    </webwork:if>
                </webwork:component>
            </div>
        <div style="padding-left:21px">
        </webwork:if>
        <webwork:else>
        <div>
        </webwork:else>
            <webwork:property value="parameters['linkRenderer']/render(./id, ./name)" escape="false"/>
            <webwork:if test="./description != null && ./description/length > 0">
                <br>
                <span class="subText"><webwork:property value="./description"/></span>
            </webwork:if>
        </div>
    </td>
</webwork:if>
