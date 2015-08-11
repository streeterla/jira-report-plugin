<webwork:iterator value="parameters['list']" status="'status'">
    <input type="radio"
            <webwork:if test="{parameters['listKey']} == '' && !parameters['nameValue']">checked="checked"</webwork:if>
            <webwork:if test="{parameters['listKey']} == parameters['nameValue']">checked="checked"</webwork:if>
            <webwork:if test="{parameters['listKey']} == parameters['checkRadio']">checked="checked"</webwork:if>
           name="<webwork:property value="parameters['name']"/>"
           value="<webwork:property value="{parameters['listKey']}"/>"
           id="<webwork:property value="parameters['name']" />_<webwork:property value="{parameters['listKey']}"/>"
            <webwork:property value="parameters['disabled']">
                <webwork:if test="{parameters['disabled']}">DISABLED</webwork:if>
            </webwork:property>
            <webwork:property value="parameters['tabindex']">
                <webwork:if test=".">tabindex="<webwork:property value="."/>"</webwork:if>
            </webwork:property>
            <webwork:property value="parameters['onchange']">
                <webwork:if test=".">onchange="<webwork:property value="."/>"</webwork:if>
            </webwork:property>
            <webwork:property value="parameters['onclick']">
                <webwork:if test=".">onclick="<webwork:property value="."/>"</webwork:if>
            </webwork:property>
            />
    <label for="<webwork:property value="parameters['name']" />_<webwork:property value="{parameters['listKey']}"/>">
        <webwork:property value="{parameters['listValue']}" escape="false" />
    </label>
    <webwork:property value="parameters['inline']">
        <webwork:if test=". != true"><webwork:if test="@status/last != true"><br /></webwork:if></webwork:if>
    </webwork:property>
</webwork:iterator>
