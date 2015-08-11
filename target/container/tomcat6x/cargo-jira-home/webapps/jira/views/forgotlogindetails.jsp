<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'forgotlogindetails.title'"/></title>
</head>
<body>

    <page:applyDecorator name="auiform">
        <page:param name="id">forgot-login-form</page:param>
        <page:param name="action">ForgotLoginDetails.jspa</page:param>
        <page:param name="submitId">forgot_submit</page:param>
        <page:param name="submitName"><webwork:text name="'forgotpassword.submit'"/></page:param>
        <h2><webwork:text name="'forgotlogindetails.title'"/></h2>
        <fieldset class="group">
            <div>
                <p><webwork:text name="'forgotlogindetails.whats.wrong'"/></p>
            </div>
            <div class="radio">
                <input type="radio" id="forgotPasswordRB" name="forgotten" value="forgotPassword" <webwork:if test="/checked('forgotPassword') == true">checked="checked"</webwork:if> />
                <label for="forgotPasswordRB"><webwork:text name="'forgotlogindetails.my.password'"/></label>
            </div>
            <div class="radio">
                <input type="radio" id="forgotUserNameRB" name="forgotten" value="forgotUserName" <webwork:if test="/checked('forgotUserName') == true">checked="checked"</webwork:if> />
                <label for="forgotUserNameRB"><webwork:text name="'forgotlogindetails.my.username'"/></label>
            </div>
        </fieldset>
        <fieldset>
            <div id="forgotPassword" class="instructions" style="<webwork:property value="/displayStyle('forgotPassword')"/>">
                <p><webwork:text name="'forgotpassword.desc.line1'"/></p>
                <p><webwork:text name="'forgotpassword.desc.line2'"/></p>
                <webwork:textfield label="text('common.words.username')" name="'username'" theme="'aui'">
                    <webwork:param name="'id'">username</webwork:param>
                    <webwork:param name="'mandatory'">true</webwork:param>
                </webwork:textfield>
            </div>
            <div id="forgotUserName" class="instructions" style="<webwork:property value="/displayStyle('forgotUserName')"/>">
                <p><webwork:text name="'forgotusername.desc'"/></p>
                <webwork:textfield label="text('common.words.email')" name="'email'" theme="'aui'">
                    <webwork:param name="'id'">email</webwork:param>
                    <webwork:param name="'mandatory'">true</webwork:param>
                </webwork:textfield>
            </div>
        </fieldset>
    </page:applyDecorator>

<script>
    var handler = function()
    {
        var whichSection = jQuery(this).attr('id');
        if (whichSection == 'forgotPasswordRB')
        {
            jQuery('#forgotUserName').hide();
            jQuery('#forgotPassword').show();
        }
        if (whichSection == 'forgotUserNameRB')
        {
            jQuery('#forgotPassword').hide();
            jQuery('#forgotUserName').show();
        }
    };

    jQuery("input[type=radio]").live("click", handler);

</script>
</body>
</html>
