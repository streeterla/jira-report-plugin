<%@ taglib uri="webwork" prefix="webwork" %>
<jsp:include page="/template/standard/controlheader.jsp" />

<script language="JavaScript">
    function openMultiWindow(element)
    {
        var vWinUsers = window.open('<%= request.getContextPath() %>/secure/popups/UserPickerBrowser.jspa?formName=jiraform&multiSelect=true&element=' + element, 'UserPicker', 'status=yes,resizable=yes,top=100,left=200,width=580,height=750,scrollbars=yes');
        vWinUsers.opener = self;
        vWinUsers.focus();
    }
</script>

<textarea <webwork:property value="parameters['name']">
             <webwork:if test=".">id="<webwork:property value="."/>" name="<webwork:property value="."/>"</webwork:if>
             <webwork:else>id="multiuserpicker" name="multiuserpicker"</webwork:else>
          </webwork:property>
          <webwork:property value="parameters['cols']">
             <webwork:if test=".">cols="<webwork:property value="."/>"</webwork:if>
             <webwork:else>cols="40"</webwork:else>
          </webwork:property>
          <webwork:property value="parameters['rows']">
             <webwork:if test=".">rows="<webwork:property value="."/>"</webwork:if>
             <webwork:else>rows="3"</webwork:else>
          </webwork:property>
          <webwork:property value="parameters['style']">
             <webwork:if test=".">style="<webwork:property value="."/>"</webwork:if>
             <webwork:else>style="width: 30%;"</webwork:else>
          </webwork:property>
        ><webwork:property value="parameters['nameValue']"/></textarea>

<webwork:if test="hasPermission('pickusers') == true">
    <a href="javascript:openMultiWindow('<webwork:property value="parameters['name']"><webwork:if test="."><webwork:property value="."/></webwork:if><webwork:else>multiuserpicker</webwork:else></webwork:property>');"><img title="<webwork:text name="'user.picker.select.users'"/>" name="multiuserImage" src="<%= request.getContextPath() %>/images/icons/filter_public.gif" hspace=0 height=16 width=16 border=0 align=absmiddle style="margin-left : 5px;" /></a>
</webwork:if>
<webwork:else>
    <img title="<webwork:text name="'user.picker.no.permission'"/>" src="<%= request.getContextPath() %>/images/icons/userpicker_disabled.gif" hspace=0 height=16 width=16 border=0 align=absmiddle style="margin-left : 5px;" />
</webwork:else>

<jsp:include page="/template/standard/controlfooter.jsp" />
