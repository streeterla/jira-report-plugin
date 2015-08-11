<%@ taglib uri="webwork" prefix="ww" %>
<ww:if test="/systemAdministrator == true">
    <div style="margin-top:5px; margin-bottom:15px; border: red solid 1px; padding:5px; background-color:white; font-weight:bold;">
        <ww:if test="/safeBackupPath != null">
            <p><ww:text name="'admin.errors.paths.save.backup.is.allowed.1'"/></p>
        </ww:if>
        <ww:else>
            <p><ww:text name="'admin.errors.paths.save.backup.not.allowed'"/></p>
        </ww:else>
    </div>
</ww:if>
