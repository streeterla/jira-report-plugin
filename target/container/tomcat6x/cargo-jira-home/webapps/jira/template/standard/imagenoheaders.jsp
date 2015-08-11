<%@ taglib uri="webwork" prefix="webwork" %>
<span style="visibility: hidden; position: absolute;"><input type="text"
       name="<webwork:property value="parameters['name']"/>"
      <webwork:property value="parameters['hiddenvalue']">
         <webwork:if test=".">value="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['hiddenid']">
         <webwork:if test=".">id="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['nameValue']">
         <webwork:if test=".">value="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
/></span>
<span class="subText">
    <a
        <webwork:if test="parameters['linkid']">id="<webwork:property value="parameters['linkid']"/>"</webwork:if>
        href="<webwork:property value="parameters['url']" escape="false"/>"
        <webwork:if test="parameters['onclick']">onclick="<webwork:property value="parameters['onclick']" escape="false"/>;return false;"</webwork:if>
    >
    <img
        <webwork:if test="parameters['src']">
            title="<webwork:property value="parameters['title']"/>"
            alt="<webwork:property value="parameters['title']"/>"
            src="<webwork:property value="parameters['src']" escape="false"/>"
        </webwork:if>
        <webwork:else>
            src="<%= request.getContextPath()%>/images/border/spacer.gif"
        </webwork:else>
        name="<webwork:property value="parameters['imagename']"/>"
        id="<webwork:property value="parameters['id']"/>"
        <webwork:if test="parameters['width']">
            width="<webwork:property value="parameters['width']"/>"
        </webwork:if>
        <webwork:if test="parameters['height']">
            height="<webwork:property value="parameters['height']"/>"
        </webwork:if>
        border="0"/>
    </a>
    <span id="<webwork:property value="parameters['textid']"/>">
    <webwork:if test="!parameters['src']">
        [ <a href="#" class="subText" onclick="<webwork:property value="parameters['onclick']" escape="false"/>;return false;"><webwork:text name="'admin.text.image.select.image'"/></a> ]
    </webwork:if>
    </span>
</span>
