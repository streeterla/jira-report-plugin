<%@ taglib prefix="webwork" uri="webwork" %>
<div>
<webwork:property value="parameters['label']">
    <webwork:if test=". && ./equals('') == false">
        <label for="<webwork:property value="parameters['name']"/>"><webwork:property value="."/>
        <webwork:if test="parameters['mandatory'] == true"><span class="form-icon icon-required" title="<webwork:text name="'common.forms.requiredfields'"/>"><span><webwork:text name="'common.forms.requiredfields'"/></span></span></webwork:if>
        </label>
    </webwork:if>
</webwork:property>
