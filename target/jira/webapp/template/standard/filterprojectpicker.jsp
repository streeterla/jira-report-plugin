<%--
  --
  -- Required Parameters:
  --   * label     - The description that will be used to identfy the control.
  --   * name      - The name of the attribute to put and pull the result from.

  -- Optional Parameters:
  --   * value     - id of the currently selected filter (optional)
  --   * filtername     - name of the currently selected filter (optional)

--%>

<%@ taglib uri="webwork" prefix="webwork" %>
<jsp:include page="/template/standard/controlheader.jsp"/>
<div style="display:none;">
<input name="<webwork:property value="parameters['name']"/>" id="filter_<webwork:property value="parameters['name']"/>_id" type="text" value="<webwork:property value="parameters['value']"/>"/>
</div>
<span id="filter_<webwork:property value="parameters['name']"/>_name"><webwork:property value="parameters['filterprojectname']"/></span>
<a href="#" id="filter_<webwork:property value="parameters['name']"/>_button" onclick="window.open('<%= request.getContextPath() %>/secure/FilterPickerPopup.jspa?showProjects=true&field=<webwork:property value="parameters['name']"/>','filter_<webwork:property value="parameters['name']"/>_window', 'width=800, height=500, resizable, scrollbars=yes').focus(); return false;">
    <webwork:if test="parameters['value'] == null || parameters['value'] == ''">
        <webwork:text name="'popups.filterpicker.selectfilterproject'"/>
    </webwork:if>
    <webwork:else>
        <webwork:text name="'popups.filterpicker.changefilterproject'"/>
    </webwork:else>
</a>
<jsp:include page="/template/standard/controlfooter.jsp"/>