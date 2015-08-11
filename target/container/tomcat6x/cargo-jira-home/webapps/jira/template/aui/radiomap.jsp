<%@ taglib uri="webwork" prefix="webwork" %>
<jsp:include page="/template/aui/controlheader.jsp" />
<fieldset id="<webwork:property value="parameters['id']" />">
    <webwork:iterator value="parameters['list']" status="'status'">
        <div class="radio">
        <input type="radio"
                <webwork:if test="{parameters['listKey']} == '' && !parameters['nameValue']">checked="checked"</webwork:if>
                <webwork:if test="{parameters['listKey']} == parameters['nameValue']">checked="checked"</webwork:if>
                <webwork:if test="{parameters['listKey']} == parameters['checkRadio']">checked="checked"</webwork:if>
               name="<webwork:property value="parameters['name']"/>"
               value="<webwork:property value="{parameters['listKey']}"/>"
               id="<webwork:property value="parameters['id']" />_<webwork:property value="{parameters['listKey']}"/>"
                <webwork:property value="parameters['disabled']">
                    <webwork:if test="{parameters['disabled']}">DISABLED</webwork:if>
                </webwork:property>
                <webwork:property value="parameters['tabindex']">
                    <webwork:if test=".">tabindex="<webwork:property value="."/>"</webwork:if>
                </webwork:property>
                />
        <label for="<webwork:property value="parameters['id']" />_<webwork:property value="{parameters['listKey']}"/>">
            <webwork:property value="{parameters['listValue']}" escape="false" />
        </label>
        </div>
    </webwork:iterator>
</fieldset>
<jsp:include page="/template/aui/controlfooter.jsp" />
