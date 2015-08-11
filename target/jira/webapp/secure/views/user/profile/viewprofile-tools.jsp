<%@ taglib prefix="webwork" uri="webwork" %>
<div id="navigator-options">
    <ul class="operations">
    <webwork:iterator value="/sectionsForMenu">
        <webwork:property value="/sectionLinks(./id)">
            <webwork:if test="./empty == false">
                <li class="aui-dd-parent">
                     <a id="<webwork:property value="../id"/>" class="lnk aui-dd-link standard <webwork:property value="../styleClass"/>" href="#" hidefocus title="<webwork:property value="../title" />"><span><webwork:property value="../label"/></span></a>
                     <ul id="<webwork:property value="../id"/>-dropdown" class="aui-dropdown standard hidden">
                         <webwork:iterator value=".">
                             <li class="dropdown-item">
                                 <a id="<webwork:property value="./id"/>" title="<webwork:property value="./title"/>" href="<webwork:property value="./url"/>"><webwork:property value="./label"/></a>

                             </li>
                         </webwork:iterator>
                     </ul>
                 </li>
            </webwork:if>
        </webwork:property>
    </webwork:iterator>
    </ul>
</div>
