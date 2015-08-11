<%--
  -- WebWork, Web Application Framework
  --
  -- Distributable under LGPL license.
  -- See terms of license at opensource.org
  --
  --
  -- textlabel.jsp
  --
  -- Required Parameters:
  --   * label      - The description that will be used to identfy the control.
  --   * name       - The name of the attribute to put and pull the result from.
  --
  -- Optional Parameters:
  --   * labelposition   - determines were the label will be place in relation
  --                       to the control.  Default is to the left of the control.
  --
  --%>
<%@ taglib uri="webwork" prefix="webwork" %>
<jsp:include page="/template/standard/controlheader.jsp"/>

<table cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td style="padding:0px">
            <input type="text"
                   name="<webwork:property value="parameters['name']"/>"
            <webwork:property value="parameters['size']">
                   <webwork:if test=".">size="<webwork:property value="."/>"
            </webwork:if>
            </webwork:property>
            <webwork:property value="parameters['maxlength']">
                   <webwork:if test=".">maxlength="<webwork:property value="."/>"
            </webwork:if>
            </webwork:property>
            <webwork:property value="parameters['nameValue']">
                   <webwork:if test=".">value="<webwork:property value="."/>"
            </webwork:if>
            </webwork:property>
            <webwork:property value="parameters['disabled']">
                   <webwork:if test="{parameters['disabled']}">DISABLED</webwork:if>
            </webwork:property>
            <webwork:property value="parameters['readonly']">
                   <webwork:if test="{parameters['readonly']}">READONLY</webwork:if>
            </webwork:property>
            <webwork:property value="parameters['onkeyup']">
                   <webwork:if test=".">onkeyup="<webwork:property value="."/>"
            </webwork:if>
            </webwork:property>
            <webwork:property value="parameters['tabindex']">
                   <webwork:if test=".">tabindex="<webwork:property value="."/>"
            </webwork:if>
            </webwork:property>
            <webwork:property value="parameters['onchange']">
                   <webwork:if test=".">onchange="<webwork:property value="."/>"
            </webwork:if>
            </webwork:property>
            <webwork:property value="parameters['style']">
                   <webwork:if test=".">style="<webwork:property value="."/>"
            </webwork:if>
            </webwork:property>
                    >
        </td>
        <td style="padding:0px">&nbsp;</td>
        <td style="padding:0px">
            <table cellpadding="0" cellspacing="1" border="1">
                <td id="<webwork:property value="parameters['name']" />-rep" style="padding:0px;height:18px;width:18px;background-color:<webwork:property value="parameters['nameValue']"/>">
                    <a id="colorpicker-<webwork:property value="parameters['name']" />" href="#"
                       onClick="window.open('<%= request.getContextPath() %>/secure/popups/<webwork:url value="'colorpicker.jsp'"><webwork:param name="'defaultColor'" value="parameters['nameValue']"/><webwork:param name="'element'" value="parameters['name']" /></webwork:url>', 'colorpicker', 'menubar=yes,location=no,personalbar=no,scrollbar=yes,width=580,height=300,resizable');">
                        <img src="<%= request.getContextPath() %>/images/border/spacer.gif" width="15" height="15" border="0">
                    </a></td>
            </table>
        </td>
    </tr>
</table>

<%@ include file="/template/standard/controlfooter.jsp" %>

