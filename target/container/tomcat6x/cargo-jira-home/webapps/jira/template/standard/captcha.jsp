<%--
  -- WebWork, Web Application Framework
  --
  -- Distributable under LGPL license.
  -- See terms of license at opensource.org
  --
  --
  -- text.jsp
  --
  -- Required Parameters:
  --   * label      - The description that will be used to identfy the control.
  --   * name       - The name of the attribute to put and pull the result from.
  --                  Equates to the NAME parameter of the HTML INPUT tag.
  --
  -- Optional Parameters:
  --   * labelposition   - determines were the label will be place in relation
  --                       to the control.  Default is to the left of the control.
  --   * size       - SIZE parameter of the HTML INPUT tag.
  --   * maxlength  - MAXLENGTH parameter of the HTML INPUT tag.
  --   * disabled   - DISABLED parameter of the HTML INPUT tag.
  --   * readonly   - READONLY parameter of the HTML INPUT tag.
  --   * onkeyup    - onkeyup parameter of the HTML INPUT tag.
  --   * tabindex  - tabindex parameter of the HTML INPUT tag.
  --   * onchange  - onkeyup parameter of the HTML INPUT tag.
  --
  --%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<jsp:include page="/template/standard/controlheader.jsp" />

<p>
    <input type="text"
       name="<webwork:property value="parameters['name']"/>"
      <webwork:property value="parameters['cssId']">
         <webwork:if test=".">id="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['size']">
         <webwork:if test=".">size="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['maxlength']">
         <webwork:if test=".">maxlength="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['nameValue']">
         <webwork:if test=".">value="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['disabled']">
         <webwork:if test="{parameters['disabled']}">DISABLED</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['readonly']">
         <webwork:if test="{parameters['readonly']}">READONLY</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['onkeyup']">
         <webwork:if test=".">onkeyup="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['onkeypress']">
         <webwork:if test=".">onkeypress="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['tabindex']">
         <webwork:if test=".">tabindex="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['onchange']">
         <webwork:if test=".">onchange="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['style']">
         <webwork:if test=".">style="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['class']">
         <webwork:if test=".">class="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['title']">
         <webwork:if test=".">title="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
    />
</p>
<p>
    <img src="<webwork:property value="parameters['url']"/>">
</p>

<jsp:include page="/template/standard/controlfooter.jsp" />
