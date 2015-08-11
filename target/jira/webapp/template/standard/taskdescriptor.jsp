<%@ page import="com.atlassian.jira.ComponentManager" %>
<%@ page import="com.atlassian.plugin.webresource.WebResourceManager" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<%
    WebResourceManager webResourceManager = ComponentManager.getInstance().getWebResourceManager();
    webResourceManager.requireResource("jira.webresources:task");
%>

<webwork:property value="parameters['nameValue']">
    <webwork:if test=". != null">
        <div class="pb_border" id="pb_taskid_<webwork:property value="taskId"/>">
            <%-- description part --%>
            <div class="pb_section">
                <span class="pb_description"><webwork:property value="description"/></span>

                <webwork:if test="parameters['acknowledgementURL']  && finished == true && userWhoStartedTask == true">
                    <div class="pb_taskinfo" style="text-align:right;">
                          <span><webwork:text name="'common.tasks.info.acknowledge.task'">
                              <webwork:param name="'value0'"><a href="<webwork:property value="progressURL" escape="false"/>"></webwork:param>
                              <webwork:param name="'value2'"></a></webwork:param>
                          </webwork:text></span>
                    </div>
                </webwork:if>
            </div>


            <%-- progress bar part --%>
            <div class="pb_barborder pb_section">
                <table class="pb_bartable" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <webwork:if test="progressNumber > 0">
                            <td class="pb_barlefttd"  style="width : <webwork:property value="progressNumber"/>%"><img src="<%= request.getContextPath() %>/images/border/spacer.gif" alt="" class="pb_img" /></td>
                        </webwork:if>
                        <webwork:if test="progressNumber < 100">
                            <td class="pb_barrighttd" style="width : <webwork:property value="inverseProgressNumber"/>%"><img src="<%= request.getContextPath() %>/images/border/spacer.gif" alt="" class="pb_img" /></td>
                        </webwork:if>
                    </tr>
                </table>
            </div>

            <%-- progress message  part --%>
            <webwork:if test="exceptionCause">
                <div class="pb_section">
                    <span><webwork:property value="exceptionCause/message"/></span>
                </div>
            </webwork:if>
            <webwork:elseIf test="lastProgressEvent">
                <div class="pb_section">
                    <span>
                    <webwork:if test="lastProgressEvent/currentSubTask">
                        <webwork:property value="lastProgressEvent/currentSubTask"/>:
                    </webwork:if>
                    <webwork:property value="lastProgressEvent/message"/>
                    </span>
               </div>
            </webwork:elseIf>


            <%-- details part --%>
            <div class="pb_section">
                <div class="pb_taskinfo ">
                    <span><webwork:property value="formattedProgress"/></span>
                </div>
                <webwork:if test="started == true">
                    <div class="pb_taskinfo">
                        <webwork:if test="userWhoStartedTask == false">
                            <span><webwork:text name="'common.tasks.info.started.by'">
                                <webwork:param name="'value0'"><webwork:property value="formattedStartedTimestamp"/></webwork:param>
                                <webwork:param name="'value1'"><a href="<webwork:property value="userURL"/>"><webwork:property value="user"/></a></webwork:param>
                            </webwork:text></span>
                        </webwork:if>
                        <webwork:else>
                            <span><webwork:text name="'common.tasks.info.started'">
                                <webwork:param name="'value0'"><webwork:property value="formattedStartedTimestamp"/></webwork:param>
                            </webwork:text></span>
                        </webwork:else>
                    </div>
                    <webwork:if test="finished == true">
                        <div class="pb_taskinfo">
                            <span><webwork:text name="'common.tasks.info.finished'">
                                <webwork:param name="'value0'"><webwork:property value="formattedFinishedTimestamp"/></webwork:param>
                            </webwork:text></span>
                        </div>
                    </webwork:if>
                    <webwork:if test="formattedExceptionCause">
                    <div class="pb_taskexception">
                        <pre><webwork:property value="formattedExceptionCause"/></pre>
                    </webwork:if>
                    </div>
                </webwork:if>
            </div>
        </div>
    </webwork:if>
</webwork:property>
