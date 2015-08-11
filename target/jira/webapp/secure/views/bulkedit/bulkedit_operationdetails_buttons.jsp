<%@ page import="com.atlassian.jira.util.BrowserUtils"%>
<webwork:if test="/availableActions/size != 0">
    <input type="submit" id="<webwork:text name="'common.forms.next'"/>" value="<webwork:text name="'common.forms.next'"/> >>"
       accessKey="<webwork:text name="'common.forms.submit.accesskey'"/>"
       title="<webwork:text name="'common.forms.submit.tooltip'">
       <webwork:param name="'value0'"><webwork:text name="'common.forms.submit.accesskey'"/></webwork:param>
        <webwork:param name="'value1'"><%=BrowserUtils.getModifierKey()%></webwork:param>
           </webwork:text>"    
    >
</webwork:if>&nbsp;<input type=button name="<webwork:text name="'common.forms.cancel'"/>" id="<webwork:text name="'common.forms.cancel'"/>" value="<webwork:text name="'common.forms.cancel'"/>" onclick="location.href='BulkCancelWizard.jspa'">
