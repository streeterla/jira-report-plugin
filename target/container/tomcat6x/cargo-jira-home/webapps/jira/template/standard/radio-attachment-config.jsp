<%@ taglib uri="webwork" prefix="webwork" %>
<%@ include file="/template/standard/controlheader.jsp" %>

<div class="formOne">
    <div>
        <input class="radio" type="radio" id="attachmentPathOption_DEFAULT" name="attachmentPathOption" value="DEFAULT" <webwork:if test="attachmentPathOption == 'DEFAULT'">CHECKED</webwork:if> />
        <label for="attachmentPathOption_DEFAULT"><webwork:text name="'admin.attachmentsettings.usedefaultpath'"/></label>
        <div class="field-description">
            <p><webwork:property value="/defaultAttachmentPath" /></p>
        </div>
    </div>
    <div>
        <input class="radio" type="radio" id="attachmentPathOption_CUSTOM" name="attachmentPathOption" value="CUSTOM" <webwork:if test="attachmentPathOption == 'CUSTOM'">CHECKED</webwork:if> />
        <label for="attachmentPathOption_CUSTOM"><webwork:text name="'admin.attachmentsettings.usecustompath'"/></label>
        <div>
            <input class="text" type="textfield" size="40" id="attachmentPath" name="attachmentPath" value="<webwork:property value="attachmentPath"/>" />
            <div class="field-description">
                <p><webwork:text name="'setup.attachmentpath.desc'" /></p>
            </div>
        </div>
    </div>
    <div>
        <input class="radio" type="radio" id="attachmentPathOption_DISABLED" name="attachmentPathOption" value="DISABLED" <webwork:if test="attachmentPathOption == 'DISABLED'">CHECKED</webwork:if> />
        <label for="attachmentPathOption_DISABLED"><webwork:text name="'admin.attachmentsettings.disableattachments'"/></label>
    </div>
</div>

<%@ include file="/template/standard/controlfooter.jsp" %>
