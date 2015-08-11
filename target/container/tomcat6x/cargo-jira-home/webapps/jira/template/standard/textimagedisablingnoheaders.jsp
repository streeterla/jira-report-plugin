<%@ taglib uri="webwork" prefix="webwork" %>
<input type="text"
       name="<webwork:property value="parameters['name']"/>"
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
/>
    <span class="subText">
    <webwork:if test="parameters['imagesrc']">
        <a href="#" onclick="<webwork:property value="parameters['imagefunction']"/>;return false;">
        <img title="<webwork:property value="parameters['imagetitle']"/>"
            name="<webwork:property value="parameters['imagename']"/>"
            src="<webwork:property value="parameters['imagesrc']"/>" hspace=0 height=16 width=16 border=0 align=absmiddle>
        </a>
    </webwork:if>
    <webwork:else>
        [ <a href="#" class="subText" onclick="<webwork:property value="parameters['imagefunction']"/>;return false;"><webwork:text name="'admin.text.image.select.image'"/></a> ]
    </webwork:else>
    </span>
