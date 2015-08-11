<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>


<ul>
    <webwork:iterator value="@fieldlist">
        <webwork:if test="./validated == false">
            <li class="unprocessed">
                <img src="<%=request.getContextPath()%>/images/icons/control_stop.png" alt="" title="Not validated"><webwork:property value="./displayName"/>
                <div class="notification"><webwork:text name="'admin.project.import.summary.not.checked'"/></div>
            </li>
        </webwork:if>
        <webwork:elseIf test="./messageSet/hasAnyMessages == true">
            <webwork:if test="./messageSet/hasAnyErrors == true">
                <li class="error">
                    <img src="<%=request.getContextPath()%>/images/icons/cancel.png" alt="Error" title="Error"><webwork:property value="./displayName"/>
                    <webwork:iterator value="./messageSet/errorMessages">
                        <div class="description"><webwork:property value="escapeValuePreserveSpaces(.)" escape="false"/>
                            <webwork:if test="../messageSet/linkForError(.) != null">
                                <br/>
                                <webwork:if test="../messageSet/linkForError(.)/absolutePath == false" >
                                    <a href="<%= request.getContextPath() %><webwork:property value="../messageSet/linkForError(.)/linkUrl"/>"><webwork:property value="../messageSet/linkForError(.)/linkText"/></a>
                                </webwork:if>
                                <webwork:else>
                                    <a href="<webwork:property value="../messageSet/linkForError(.)/linkUrl"/>"><webwork:property value="../messageSet/linkForError(.)/linkText"/></a>
                                </webwork:else>
                            </webwork:if>
                        </div>
                    </webwork:iterator>
                </li>
            </webwork:if>
            <webwork:if test="./messageSet/hasAnyWarnings == true">
                <li class="warning">
                    <img src="<%=request.getContextPath()%>/images/icons/error.png" alt="Warning" title="Warning"><webwork:property value="./displayName"/>
                    <webwork:iterator value="./messageSet/warningMessages">
                        <div class="description"><webwork:property value="escapeValuePreserveSpaces(.)" escape="false"/>
                            <webwork:if test="../messageSet/linkForWarning(.) != null">
                                <br/>
                                <webwork:if test="../messageSet/linkForWarning(.)/absolutePath == false" >
                                    <a href="<%= request.getContextPath() %><webwork:property value="../messageSet/linkForWarning(.)/linkUrl"/>"><webwork:property value="../messageSet/linkForWarning(.)/linkText"/></a>
                                </webwork:if>
                                <webwork:else>
                                    <a href="<webwork:property value="../messageSet/linkForWarning(.)/linkUrl"/>"><webwork:property value="../messageSet/linkForWarning(.)/linkText"/></a>
                                </webwork:else>
                            </webwork:if>
                        </div>
                    </webwork:iterator>
                </li>
            </webwork:if>
        </webwork:elseIf>
        <webwork:else>
            <li>
                <img src="<%=request.getContextPath()%>/images/icons/accept.png" alt="OK" title="OK"><webwork:property value="./displayName"/>
            </li>
        </webwork:else>
    </webwork:iterator>
</ul>