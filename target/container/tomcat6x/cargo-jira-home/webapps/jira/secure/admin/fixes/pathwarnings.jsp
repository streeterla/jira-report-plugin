<%@ taglib uri="webwork" prefix="ww" %>
<ww:if test="/systemAdministrator == true">
    <div style="margin-top:5px; margin-bottom:15px; border: red solid 1px; padding:5px; background-color:white; font-weight:bold;">
        <ww:if test="/pathsAllowedToBetSet == true">
            <p><ww:text name="'admin.errors.paths.set.is.allowed.1'"/></p>
            <p><ww:text name="'admin.errors.paths.set.is.allowed.2'"/></p>
        </ww:if>
        <ww:else>
            <p><ww:text name="'admin.errors.paths.set.not.allowed'"/></p>
        </ww:else>
    </div>
</ww:if>
