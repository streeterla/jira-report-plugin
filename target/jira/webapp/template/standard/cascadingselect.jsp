<%--
  --
  -- Required Parameters:
  --   * label     - The description that will be used to identfy the control.
  --   * name      - The name of the attribute to put and pull the result from.
  --                 Equates to the NAME parameter of the HTML tag SELECT.
  --   * list      - Iterator that will provide the options for the control.
  --                 Equates to the HTML OPTION tags in the SELECT.
  --   * listKey   - Where to get the values for the OPTION tag.  Equates to
  --                 the VALUE parameter of the OPTION tag.
  --   * listValue - The value displayed by the control.  Equates to the body
  --                 of the HTML OPTION tag.
  --   * listClass - The value displayed by the control.  Equates to the class
  --                 of the HTML OPTION tag which is used in the cascading functionality.
  --   * cascadeFrom  - The name of the select which causes this select to cascade, there must
                        be a relationship between this named elements values and the classes used
                        in the options of this SELECT tag.
  --%>

<%@ taglib uri="webwork" prefix="webwork" %>

<webwork:if test="!@summaryCounter">
<webwork:property value="0" id="summaryCounter" />
</webwork:if>

<webwork:property value="parameters['summary']" id="summary" />
<webwork:if test="@summary">
<%
    Integer counter = (Integer) request.getAttribute("summaryCounter");
    if (counter != null)
    {
        int i = counter.intValue();
        int value =  i + 1;
        request.setAttribute("summaryCounter", new Integer(value));
    }
%>

<script>
function changeDescription<webwork:property value="@summaryCounter" />(dropdown)
{

var summaries = [
 <webwork:property value="parameters['headerrow']">
      <webwork:if test=". && . != ''">"<webwork:property value="parameters['headersummary']" />",</webwork:if>
   </webwork:property>
   <webwork:property value="parameters['headerrow2']">
      <webwork:if test=". && . != ''">"<webwork:property value="parameters['headersummary2']" />",</webwork:if>
   </webwork:property>
   <webwork:iterator value="parameters['list']">
      "<webwork:property value="{parameters['summary']}"/>",
   </webwork:iterator>
   ];
    document.getElementById("<webwork:property value="parameters['name']"/>_summary").innerHTML =  summaries[dropdown.selectedIndex] ? summaries[dropdown.selectedIndex] : "";
}
</script>
</webwork:if>

<script language="JavaScript" type="text/javascript" src="<%=request.getContextPath()%>/includes/js/cascadingUtil.js"></script>
<script type="text/javascript">
    window.onload = function()
    {
        dynamicSelect("<webwork:property value="parameters['cascadeFrom']"/>_select", "<webwork:property value="parameters['name']"/>_select");
    }
</script>

<jsp:include page="/template/standard/controlheader.jsp"/>
<select name='<webwork:property value="parameters['name']"/>' id='<webwork:property value="parameters['name']"/>_select'>
    <webwork:iterator value="parameters['list']">
        <option value='<webwork:property value="{parameters['listKey']}"/>' class='<webwork:property value="{parameters['listClass']}"/>'
                <webwork:if test="{parameters['listKey']} == parameters['value']">SELECTED</webwork:if>
                >
            <webwork:if test="parameters['internat'] == true"><webwork:text name="{parameters['listValue']}"/>
            </webwork:if>
            <webwork:else><webwork:property value="{parameters['listValue']}"/></webwork:else>
        </option>
    </webwork:iterator>
</select>

<webwork:if test="@summary && !parameters['description']"><br /></webwork:if>
<span class="selectDescription" id="<webwork:property value="parameters['name']"/>_summary"></span>
<webwork:if test="@summary">
    <script>
    changeDescription<webwork:property value="@summaryCounter" />(document.getElementById("<webwork:property value="parameters['name']"/>_select"));
    </script>
</webwork:if>
<jsp:include page="/template/standard/controlfooter.jsp"/>
