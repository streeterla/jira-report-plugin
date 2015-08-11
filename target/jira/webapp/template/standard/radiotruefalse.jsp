<%--
  --
  -- Required Parameters:
  --   * label     - The description that will be used to identfy the control.
  --   * name      - The name of the attribute to put and pull the result from.
  --                 Equates to the NAME parameter of the HTML tag INPUT.
  --   * trueLabel
  --   * falseLabel
  -- Optional Parameters:
  --   * labelposition   - determines were the label will be place in relation
  --                       to the control.  Default is to the left of the control.
  --   * disabledTrue        - DISABLED parameter of the HTML INPUT tag.
  --   * tabindexTrue        - tabindex parameter of the HTML INPUT tag.
  --   * onchangeTrue        - onkeyup parameter of the HTML INPUT tag.
  --   * checkRadio      - determine which radio option is checked by default
  --
  --%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ include file="/template/standard/controlheader.jsp" %>
  <input type="radio"
         name="<webwork:property value="parameters['name']"/>"
         value="true"
         id="<webwork:property value="parameters['name']" />_true"
     <webwork:property value="parameters['disabledTrue']">
        <webwork:if test=".">disabled="disabled"</webwork:if>
     </webwork:property>
     <webwork:property value="parameters['tabindexTrue']">
        <webwork:if test=".">tabindex="<webwork:property value="."/>"</webwork:if>
     </webwork:property>
     <webwork:property value="parameters['onclickTrue']">
        <webwork:if test=".">onclick="<webwork:property value="."/>"</webwork:if>
     </webwork:property>
     <webwork:if test="parameters['checkRadio'] == true || parameters['nameValue'] == true">
         checked="checked"
     </webwork:if>
  />
   <label for="<webwork:property value="parameters['name']" />_true">
      <webwork:property value="parameters['trueLabel']">
      <webwork:if test=".">
        <webwork:property value="." />
      </webwork:if>
      <webwork:else>
        On
      </webwork:else>
      </webwork:property>
   </label>
  <input type="radio"
         name="<webwork:property value="parameters['name']"/>"
         value="false"
         id="<webwork:property value="parameters['name']" />_false"
     <webwork:property value="parameters['disabledFalse']">
        <webwork:if test=".">disabled="disabled"</webwork:if>
     </webwork:property>
     <webwork:property value="parameters['tabindexFalse']">
        <webwork:if test=".">tabindex="<webwork:property value="."/>"</webwork:if>
     </webwork:property>
     <webwork:property value="parameters['onclickFalse']">
        <webwork:if test=".">onclick="<webwork:property value="."/>"</webwork:if>
     </webwork:property>
     <webwork:if test="parameters['checkRadio'] == false || parameters['nameValue'] == false">
         checked="checked"
     </webwork:if>
  />
   <label for="<webwork:property value="parameters['name']" />_false">
      <webwork:property value="parameters['falseLabel']">
      <webwork:if test=".">
        <webwork:property value="." />
      </webwork:if>
      <webwork:else>
        Off
      </webwork:else>
      </webwork:property>
   </label>

<webwork:property value="parameters['fieldBody']">
    <webwork:if test="."><webwork:property value="." escape="false"/></webwork:if>
</webwork:property>

<%@ include file="/template/standard/controlfooter.jsp" %>
