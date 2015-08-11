<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'iconpicker.title'"/></title>
</head>

<body>
    <h3><webwork:text name="'iconpicker.title'"/></h3>
    <p>
        <webwork:text name="'iconpicker.choose.icon'">
            <webwork:param name="'value0'"><b><webwork:text name="./fieldName"/></b></webwork:param>
        </webwork:text>
    </p>
        <table class="gridBox" width="95%" cellpadding="3" cellspacing="1" align="center">
            <tr bgcolor="#f0f0f0">
                <td class="colHeaderLink">
                    <b><webwork:text name="'iconpicker.label.icon'"/></b>
                </td>
                <td class="colHeaderLink">
                    <b><webwork:text name="'iconpicker.label.filename'"/></b>
                </td>
                <td class="colHeaderLink">
                    <b><webwork:text name="'iconpicker.label.associatedissueconstant'">
                        <webwork:param name="'value0'"><webwork:text name="./fieldName"/></webwork:param>
                    </webwork:text></b>
                </td>
            </tr>
            <webwork:iterator value="./iconUrls(./fieldType)" status="'status'">
                <webwork:property value="image(.)">
                    <tr <webwork:if test="@status/even == true">class="rowNormal"</webwork:if><webwork:else>class="rowAlternate"</webwork:else>
                        onmouseover="rowHover(this)"onclick="select('<webwork:property value="."/>');">
                        <td><img src="<%= request.getContextPath() %><webwork:property value="."/>"></td> <td><webwork:property value="."/></td>
                        <td nowrap>
                            <webwork:if test="/associatedImages(.)/empty == false">
                                <ul class="square_blue">
                                <webwork:iterator value="associatedImages(.)" status="'iteratorStatus'">
                                    <li><webwork:property value="./nameTranslation"/></li>
                                </webwork:iterator>
                                </ul>
                            </webwork:if>
                        </td>
                    </tr>
                </webwork:property>
            </webwork:iterator>
        </table>

    <br />

    <webwork:text name="'iconpicker.enter.image.path'">
        <webwork:param name="'value0'"><span class="warning"></webwork:param>
        <webwork:param name="'value1'"></span></webwork:param>
    </webwork:text>

    <form name="submitter">
    <table width="95%" cellpadding="3" cellspacing="1" align="center">
        <tr>
            <ui:textfield label="'IconURL'" name="'iconurl'" size="'60'" theme="'single'">
                <ui:param name="'description'"><webwork:text name="'admin.common.phrases.relative.to.jira'"/></ui:param>
                <ui:param name="'onkeypress'">return checkkeypressed(event);</ui:param>
            </ui:textfield>
        </tr>
        <tr>
            <td colspan="2" class="fullyCentered jiraformfooter" >
                <input type="button" name="Update" value="<webwork:text name="'common.words.update'"/>" onclick="update();"/>
                <input type="button" value="<webwork:text name="'common.words.cancel'"/>" name="cancel" onclick="closeit();"/>
            </td>
        </tr>
    </table>
    </form>
    <script language="javascript">
        function rowHover(row)
        {
            row.oldClassName = row.className;
            row.className = 'rowHover';
            row.onmouseout = function()
            {
                this.className = this.oldClassName;
            }
        }

        function select(value)
    	{
            var openerForm = opener.document.forms['<webwork:property value="formName"/>'];
    		var openerEl = openerForm.elements['iconurl'];
            openerEl.value = value;
            window.close();
        }

        function update()
        {
            var openerForm = opener.document.forms['<webwork:property value="formName"/>'];
            var openerEl = openerForm.elements['iconurl'];
            openerEl.value = document.forms['submitter'].elements['iconurl'].value;
            window.close();
            return false;
        }

        function closeit()
        {
            window.close();
        }

        function checkkeypressed(event)
        {
            if (event.keyCode == '13')
                return update();
        }
    </script>


</body>
</html>
