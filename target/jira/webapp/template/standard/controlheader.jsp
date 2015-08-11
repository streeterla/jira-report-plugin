<%@ taglib uri="webwork" prefix="webwork" %>
<webwork:property value="errors[parameters['name']]">
<%--Dealing with errors --%>
	<webwork:if test=".">
        <webwork:if test="!parameters['errorSameLine']">

            <tr <webwork:property value="parameters['rowClass']"><webwork:if test=".">class="<webwork:property value="." />"</webwork:if></webwork:property>
                <webwork:property value="parameters['rowStyle']"><webwork:if test=".">style="<webwork:property value="." />"</webwork:if></webwork:property>
                >
        </webwork:if>
        <webwork:if test="parameters['labelposition'] == 'top'">
			<td align="left" valign="top" colspan="2" class="formErrors">
		</webwork:if>
		<webwork:else>
            <webwork:if test="!parameters['nolabel']">
                <td class="formErrors">&nbsp;</td>
            </webwork:if>
            <td valign="top" class="formErrors" <webwork:property value="parameters['valueColSpan']"><webwork:if test=".">colspan="<webwork:property value="." />"</webwork:if></webwork:property>>
		</webwork:else>
			<span class="errMsg"><webwork:property value="."/></span>
			<webwork:property value="errors[parameters['name']/concat('Exception')]">
			<webwork:if test=".">
				<script language="javascript">
				<!--
				function toggle(id) {
					var element = document.getElementById(id);
					with (element.style) {
						if ( display == "none" ){
							display = ""
						} else{
							display = "none"
						}
					}
					var text = document.getElementById(id + "-switch").firstChild;
					if (text.nodeValue == "[show]") {
						text.nodeValue = "[hide]";
					} else {
						text.nodeValue = "[show]";
					}
				}
				//-->
				</script>
				<br />
				<b>Extra Information:</b>
				<span style="cursor: pointer; margin-left: 5px; text-decoration: underline;" id="<webwork:property value="../parameters['name']/concat('Exception')"/>-switch" onclick="toggle('<webwork:property value="../parameters['name']/concat('Exception')"/>')">[show]</span>
				<div id="<webwork:property value="../parameters['name']/concat('Exception')"/>" style="display:none"><webwork:property value="." escape="false"/></div>
			</webwork:if>
			</webwork:property>
		</td>
        <webwork:if test="!parameters['errorSameLine']">

            </tr>
        </webwork:if>
    </webwork:if>
</webwork:property>

<webwork:if test="!parameters['nolabel']">
	<tr <webwork:property value="parameters['rowClass']"><webwork:if test=".">class="<webwork:property value="." />"</webwork:if></webwork:property>
        <webwork:property value="parameters['rowStyle']"><webwork:if test=".">style="<webwork:property value="." />"</webwork:if></webwork:property>
        <webwork:property value="parameters['rowId']"><webwork:if test=".">id="<webwork:property value="." />"</webwork:if></webwork:property>
    >
		<webwork:if test="parameters['labelposition'] == 'top'">
			<td colspan="2" class="fieldLabelAreaTop">
		</webwork:if>
		<webwork:else>
			<webwork:if test="errors[parameters['name']]">
				<td class="fieldLabelArea formErrors">
			</webwork:if>
			<webwork:else>
				<td class="fieldLabelArea">
			</webwork:else>
		</webwork:else>
        <webwork:property value="parameters['label']">
        <webwork:if test=". && ./equals('') == false">
 		<webwork:if test="parameters['mandatory'] == true"><i><span title="<webwork:text name="'common.forms.requiredfields'"/>"><sup>*</sup> <webwork:property value="."/></span></i>:</webwork:if>
		<webwork:else><webwork:property value="."/>:</webwork:else>
        </webwork:if>
        </webwork:property>
		</td>

	<%-- add the extra row  --%>
	<webwork:if test="parameters['labelposition'] == 'top'">
		</tr><tr <webwork:property value="parameters['rowClass']">class="<webwork:property value="." />"</webwork:property>
                <webwork:property value="parameters['rowStyle']">style="<webwork:property value="." />"</webwork:property>>
	</webwork:if>
</webwork:if>

<%-- valueColSpan - controls how many columns the value TD spans --%>
<webwork:if test="errors[parameters['name']]">
	<td class="fieldValueArea formErrors" <webwork:property value="parameters['valueColSpan']"><webwork:if test=".">colspan="<webwork:property value="." />"</webwork:if></webwork:property>>
</webwork:if>
<webwork:else>
	<td bgcolor="#ffffff" class="fieldValueArea" <webwork:property value="parameters['valueColSpan']"><webwork:if test=".">colspan="<webwork:property value="." />"</webwork:if></webwork:property>>
</webwork:else>
