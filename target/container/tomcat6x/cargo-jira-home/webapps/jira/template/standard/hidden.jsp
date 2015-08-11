<%--
  -- WebWork, Web Application Framework
  --
  -- Distributable under LGPL license.
  -- See terms of license at opensource.org
  --
  --
  -- hidden.jsp
  --
  -- Required Parameters:
  --   * name       - The name of the attribute to put and pull the result from.
  --                  Equates to the NAME parameter of the HTML INPUT tag.
  --%>
<%@ taglib uri="webwork" prefix="webwork" %>

<input type="hidden"
       <webwork:if test="parameters['id']">
           id="<webwork:property value="parameters['id']"/>"
       </webwork:if>
       <webwork:else>
           id="<webwork:property value="parameters['name']"/>"
       </webwork:else>
       name="<webwork:property value="parameters['name']"/>"
      <webwork:property value="parameters['nameValue']">
         <webwork:if test=".">value="<webwork:property value="."/>"</webwork:if>
         <webwork:elseIf test="parameters['defaultValue']">value="<webwork:property value="parameters['defaultValue']" />"</webwork:elseIf>
      </webwork:property>
/>
