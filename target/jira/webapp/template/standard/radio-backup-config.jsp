<%@ taglib uri="webwork" prefix="webwork" %>
<%@ include file="/template/standard/controlheader.jsp" %>

<div class="formOne">
    <div>
        <webwork:text name="'setup.backuppath.line1.desc'" /><br>
        <strong><webwork:text name="'setup.backuppath.line2.desc'" /></strong><br>
        <input class="radio" type="radio" id="backupPathOption_DEFAULT" name="backupPathOption" value="DEFAULT" <webwork:if test="backupPathOption == 'DEFAULT'">CHECKED</webwork:if> />
        <label for="backupPathOption_DEFAULT"><webwork:text name="'setup.backup.usedefaultpath'"/></label>
        <div class="field-description">
            <p><webwork:property value="/defaultBackupPath" /></p>
        </div>
    </div>
    <div>
        <input class="radio" type="radio" id="backupPathOption_CUSTOM" name="backupPathOption" value="CUSTOM" <webwork:if test="backupPathOption == 'CUSTOM'">CHECKED</webwork:if> />
        <label for="backupPathOption_CUSTOM"><webwork:text name="'setup.backup.usecustompath'"/></label>
        <div>
            <input class="text" type="textfield" size="40" id="backupPath" name="backupPath" value="<webwork:property value="backupPath"/>" />
            <div class="field-description">
                <p><webwork:text name="'setup.backuppath.line3.desc'" /></p>
            </div>
        </div>
    </div>
    <div>
        <input class="radio" type="radio" id="backupPathOption_DISABLED" name="backupPathOption" value="DISABLED" <webwork:if test="backupPathOption == 'DISABLED'">CHECKED</webwork:if> />
        <label for="backupPathOption_DISABLED"><webwork:text name="'setup.backup.disable'"/></label>
    </div>
</div>

<%@ include file="/template/standard/controlfooter.jsp" %>
