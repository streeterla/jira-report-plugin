<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
</head>

<body>
    <page:applyDecorator name="jiraform">
        <page:param name="action">ConfirmInstallationWithLicense.jspa</page:param>
        <page:param name="submitId">proceed_submit</page:param>
        <page:param name="submitName">Proceed</page:param>
        <page:param name="width">100%</page:param>
        <page:param name="title">Confirm License Update</page:param>
        <page:param name="description">
            <div class="noteBox">
                <p>
                <webwork:text name="'setup.error.invalidlicensekey.confirminstall.problem.title'"/>
                <p>
                <webwork:property value="/licenseProblem" escape="false"/>
            </div>
            <br/>
            <div>
            <strong><webwork:text name="'setup.error.invalidlicensekey.confirminstall.current.details'"/> : </strong><br>
            <table class="borderedBox" bgcolor="#fffff0">
                <webwork:property value="/licenseDetails">
                    <tr><td><b><webwork:text name="'admin.license.organisation'"/>:</b>&nbsp;</td><td><webwork:property value="./organisation" /></td></tr>
                    <tr><td><b><webwork:text name="'admin.license.type'"/>:</b>&nbsp;</td><td><webwork:property value="./description" /></td></tr>
                    <webwork:if test="./partnerName != null && ./partnerName != ''">
                        <tr><td><b><webwork:text name="'setup.error.invalidlicensekey.confirminstall.partner.name'"/>:</b>&nbsp;</td><td><webwork:property value="./partnerName" /></td></tr>
                    </webwork:if>
                    <webwork:if test="./supportEntitlementNumber != null && ./supportEntitlementNumber != ''">
                        <tr><td><b><webwork:text name="'admin.license.sen'"/>:</b>&nbsp;</td><td><webwork:property value="./supportEntitlementNumber" /></td></tr>
                    </webwork:if>
                    <tr><td><b><webwork:text name="'admin.license.date.purchased'"/>:</b>&nbsp;</td><td><webwork:property value="/licensePurchaseDate" /></td></tr>
                </webwork:property>
            </table>
            </div>
            <p>
        </page:param>

        <ui:component label="'Admin User Name'" name="'userName'" template="userselect.jsp">
            <ui:param name="'formname'" value="'jiraform'" />
            <ui:param name="'imageName'" value="'userImage'"/>
            <ui:param name="'size'" value="40"/>
        </ui:component>

        <ui:component label="'Password'" name="'password'" template="password.jsp">
            <ui:param name="'size'">40</ui:param>
            <ui:param name="'description'"><webwork:text name="'setup.error.invalidlicensekey.confirminstall.valid.user.name'"/></ui:param>
        </ui:component>


        <tr>
            <td bgcolor="#fffff0">&nbsp;</td>
            <td bgcolor="#ffffff">&nbsp;</td>
        </tr>

        <page:param name="license"><webwork:text name="'setup.error.invalidlicensekey.confirminstall.copy.and.paste.license'"/></page:param>

        <ui:component template="textlabel.jsp" label="text('admin.server.id')" value="/serverId"/>

        <ui:textarea label="'License'" name="'license'" cols="50" rows="10" >
            <ui:param name="'description'">
                <webwork:text name="'system.error.license.line1.desc'" /><br>
            </ui:param>
        </ui:textarea>

    </page:applyDecorator>
</p>
</body>
</html>
