<%@ taglib uri="webwork" prefix="webwork"  %>
<%@ taglib uri="sitemesh-page" prefix="page" %>


<html>
<head>
	<title><webwork:text name="'admin.loggingandprofiling.logging.and.profiling'"/></title>
</head>

<%
    
%>
<body>

<%--
   General Logging Section

   Part of JRA-14513
--%>
<p>
<page:applyDecorator name="jiratable">
    <page:param name="title"><webwork:text name="'admin.loggingandprofiling.logging'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="titleColspan">3</page:param>
    <page:param name="description">
        <webwork:text name="'admin.loggingandprofiling.description'"/>
        <p>
        <webwork:text name="'admin.loggingandprofiling.note'">
            <webwork:param name="'value0'"><i></webwork:param>
            <webwork:param name="'value1'"></i></webwork:param>
            <webwork:param name="'value2'"><br></webwork:param>
        </webwork:text>
        <p>
        <webwork:text name="'admin.loggingandprofiling.logging.will.go.to.the.console'"/>
    </page:param>

    <tr class=rowHeader>
        <th><webwork:text name="'admin.loggingandprofiling.package.name'"/></th>
        <th><webwork:text name="'admin.loggingandprofiling.logging.level'"/></th>
        <th><webwork:text name="'common.words.operations'"/></th>
    </tr>

<webwork:property value="/rootLogger" >
    <tr class="rowAlternate">
        <td><i><webwork:text name="'admin.common.words.default'"/></i></td>
        <td><strong><webwork:property value="./level" /></strong></td>
        <td><jsp:include page="viewlogginglevels.jsp"/></td>
    </tr>
</webwork:property>


<webwork:iterator value="/loggers" status="'iteratorStatus'">
    <tr <webwork:if test="@iteratorStatus/odd == true">class="rowNormal"</webwork:if><webwork:else>class="rowAlternate"</webwork:else>>
        <td><webwork:property value="name" /></td>
        <td><strong><webwork:property value="./level" /></strong></td>
        <td><jsp:include page="viewlogginglevels.jsp"/></td>
    </tr>

</webwork:iterator>
</page:applyDecorator>

<%--
   HTTP Access Log Section
--%>
<p><a name="http"></a>
<page:applyDecorator name="jiratable">
    <page:param name="title"><webwork:text name="'admin.loggingandprofiling.httpaccesslog'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="description">
        <webwork:text name="'admin.loggingandprofiling.httpaccesslog.description'"/>
        <p>
    </page:param>
<tr><td bgcolor="#ffffff">

        <webwork:if test="/httpAccessLogEnabled == true">
            <webwork:text name="'admin.loggingandprofiling.httpaccesslog.status'">
                <webwork:param name="'value0'"><b><font color="#009900"><webwork:text name="'admin.common.words.on'"/></font></b></webwork:param>
            </webwork:text>
            <p>
            <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle" alt="" />
            <webwork:text name="'admin.loggingandprofiling.disable.httpaccesslog'">
                <webwork:param name="'value0'"><a id="disable_http_access" href="ViewLogging!disableHttpAccessLog.jspa"><b></webwork:param>
                <webwork:param name="'value1'"></b></a></webwork:param>
            </webwork:text>

            <div style="padding-left:2em">
    
            <webwork:if test="/httpAccessLogIncludeImagesEnabled == true">
                <webwork:text name="'admin.loggingandprofiling.httpaccesslog.includeimages.status'">
                    <webwork:param name="'value0'"><b><font color="#009900"><webwork:text name="'admin.common.words.on'"/></font></b></webwork:param>
                </webwork:text>
                <p>
                <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle" alt=""/>
                <webwork:text name="'admin.loggingandprofiling.disable.httpaccesslog.includeimages'">
                    <webwork:param name="'value0'"><a id="disable_http_access_includeimages" href="ViewLogging!disableHttpAccessLogIncludeImages.jspa"><b></webwork:param>
                    <webwork:param name="'value1'"></b></a></webwork:param>
                </webwork:text>
            </webwork:if>
            <webwork:else>
                </p>
                <webwork:text name="'admin.loggingandprofiling.httpaccesslog.includeimages.status'">
                    <webwork:param name="'value0'"><b><font color="#990000"><webwork:text name="'admin.common.words.off'"/></font></b></webwork:param>
                </webwork:text>
                <p>
                <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle" alt=""/>
                <webwork:text name="'admin.loggingandprofiling.enable.httpaccesslog.includeimages'">
                <webwork:param
                        name="'value0'"><a id="enable_http_access_includeimages" href="ViewLogging!enableHttpAccessLogIncludeImages.jspa"><b></webwork:param>
                <webwork:param name="'value1'"></b></a></webwork:param>
                </webwork:text>
            </webwork:else>


            <webwork:if test="/httpDumpLogEnabled == true">
                </p>
                <webwork:text name="'admin.loggingandprofiling.httpdumplog.status'">
                    <webwork:param name="'value0'"><b><font color="#009900"><webwork:text name="'admin.common.words.on'"/></font></b></webwork:param>
                </webwork:text>
                <p>
                    <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle" alt=""/>
                    <webwork:text name="'admin.loggingandprofiling.disable.httpdumplog'">
                        <webwork:param name="'value0'"><a id="disable_http_dump" href="ViewLogging!disableHttpDumpLog.jspa"><b></webwork:param>
                        <webwork:param name="'value1'"></b></a></webwork:param>
                    </webwork:text>
            </webwork:if>
            <webwork:else>
                </p>
                <webwork:text name="'admin.loggingandprofiling.httpdumplog.status'">
                    <webwork:param name="'value0'"><b><font color="#990000"><webwork:text name="'admin.common.words.off'"/></font></b></webwork:param>
                </webwork:text>
                <p>
                <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle" alt=""/>
                <webwork:text name="'admin.loggingandprofiling.enable.httpdumplog'">
                <webwork:param
                        name="'value0'"><a id="enable_http_dump" href="ViewLogging!enableHttpDumpLog.jspa"><b></webwork:param>
                <webwork:param name="'value1'"></b></a></webwork:param>
                </webwork:text>
            </webwork:else>
            </div>

        </webwork:if>
        <webwork:else>
             <webwork:text name="'admin.loggingandprofiling.httpaccesslog.status'">
                 <webwork:param name="'value0'"><b><font color="#990000"><webwork:text name="'admin.common.words.off'"/></font></b></webwork:param>
             </webwork:text>
            <p>
            <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle" alt="" />
                    <webwork:text name="'admin.loggingandprofiling.enable.httpaccesslog'">
                        <webwork:param name="'value0'"><a id="enable_http_access" href="ViewLogging!enableHttpAccessLog.jspa"><b></webwork:param>
                        <webwork:param name="'value1'"></b></a></webwork:param>
                    </webwork:text>
        </webwork:else>
</td></tr>

</page:applyDecorator>

<%--
   SOAP Access Log Section
--%>
<p><a name="soap"></a>
<page:applyDecorator name="jiratable">
    <page:param name="title"><webwork:text name="'admin.loggingandprofiling.soapaccesslog'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="description">
        <webwork:text name="'admin.loggingandprofiling.soapaccesslog.description'"/>
        <p>
    </page:param>
<tr><td bgcolor="#ffffff">

        <webwork:if test="/soapAccessLogEnabled == true">
            <webwork:text name="'admin.loggingandprofiling.soapaccesslog.status'">
                <webwork:param name="'value0'"><b><font color="#009900"><webwork:text name="'admin.common.words.on'"/></font></b></webwork:param>
            </webwork:text>
            <p>
            <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle" alt="" />
                    <webwork:text name="'admin.loggingandprofiling.disable.soapaccesslog'">
                        <webwork:param name="'value0'"><a id="disable_soap_access" href="ViewLogging!disableSoapAccessLog.jspa"><b></webwork:param>
                        <webwork:param name="'value1'"></b></a></webwork:param>
                    </webwork:text>

            <div style="padding-left:2em">
            <webwork:if test="/soapDumpLogEnabled == true">
                </p>
                <webwork:text name="'admin.loggingandprofiling.soapdumplog.status'">
                    <webwork:param name="'value0'"><b><font color="#009900"><webwork:text name="'admin.common.words.on'"/></font></b></webwork:param>
                </webwork:text>
                <p>
                <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle" alt="" />
                        <webwork:text name="'admin.loggingandprofiling.disable.soapdumplog'">
                            <webwork:param name="'value0'"><a id="disable_soap_dump" href="ViewLogging!disableSoapDumpLog.jspa"><b></webwork:param>
                            <webwork:param name="'value1'"></b></a></webwork:param>
                        </webwork:text>
            </webwork:if>
            <webwork:else>
                </p>
                <webwork:text name="'admin.loggingandprofiling.soapdumplog.status'">
                    <webwork:param name="'value0'"><b><font color="#990000"><webwork:text name="'admin.common.words.off'"/></font></b></webwork:param>
                </webwork:text>
               <p>
               <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle" alt="" />
                       <webwork:text name="'admin.loggingandprofiling.enable.soapdumplog'">
                           <webwork:param name="'value0'"><a id="enable_soap_dump" href="ViewLogging!enableSoapDumpLog.jspa"><b></webwork:param>
                           <webwork:param name="'value1'"></b></a></webwork:param>
                       </webwork:text>
            </webwork:else>
            </div>
        </webwork:if>
        <webwork:else>
             <webwork:text name="'admin.loggingandprofiling.soapaccesslog.status'">
                 <webwork:param name="'value0'"><b><font color="#990000"><webwork:text name="'admin.common.words.off'"/></font></b></webwork:param>
             </webwork:text>
            <p>
            <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle" alt="" />
                    <webwork:text name="'admin.loggingandprofiling.enable.soapaccesslog'">
                        <webwork:param name="'value0'"><a id="enable_soap_access" href="ViewLogging!enableSoapAccessLog.jspa"><b></webwork:param>
                        <webwork:param name="'value1'"></b></a></webwork:param>
                    </webwork:text>
        </webwork:else>
</td></tr>

</page:applyDecorator>            
        <%--
           Profiling Access Log Section
        --%>
        <p><a name="profiling"></a>
        <page:applyDecorator name="jiratable">
            <page:param name="title"><webwork:text name="'admin.loggingandprofiling.profiling'"/></page:param>
            <page:param name="width">100%</page:param>
            <page:param name="description">
                <webwork:text name="'admin.loggingandprofiling.profiling.description'"/></page:param>
        <tr><td bgcolor="#ffffff">

                <webwork:if test="/profilingEnabled == true">
                    <webwork:text name="'admin.loggingandprofiling.profiling.status'">
                        <webwork:param name="'value0'"><b><font color="#009900"><webwork:text name="'admin.common.words.on'"/></font></b></webwork:param>
                    </webwork:text>
                    <p>
                    <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle" alt="" />
                            <webwork:text name="'admin.loggingandprofiling.disable.profiling'">
                                <webwork:param name="'value0'"><a id="disable_profiling" href="ViewLogging!disableProfiling.jspa"><b></webwork:param>
                                <webwork:param name="'value1'"></b></a></webwork:param>
                            </webwork:text>
                </webwork:if>
                <webwork:else>
                     <webwork:text name="'admin.loggingandprofiling.profiling.status'">
                         <webwork:param name="'value0'"><b><font color="#990000"><webwork:text name="'admin.common.words.off'"/></font></b></webwork:param>
                     </webwork:text>
                    <p>
                    <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle" alt="" />
                            <webwork:text name="'admin.loggingandprofiling.enable.profiling'">
                                <webwork:param name="'value0'"><a JIraW"enable_profiling" href="ViewLogging!enableProfiling.jspa"><b></webwork:param>
                                <webwork:param name="'value1'"></b></a></webwork:param>
                            </webwork:text>
                </webwork:else>
        </td></tr>

</page:applyDecorator>

</body>
</html>

