<%@ taglib uri="webwork" prefix="webwork" %>
<webwork:bean id="math" name="'com.atlassian.core.bean.MathBean'"/>

<html>
<head>
	<title><webwork:text name="'admin.systeminfo.memory.info'"/></title>
</head>

<body>
<p>
<table border="0" bgcolor="#bbbbbb" cellpadding="3" cellspacing="1" width="100%">

	<tr bgcolor="#f0f0f0">
		<td class="colHeaderLink" colspan="2">
			<h3 class="formtitle"><webwork:text name="'admin.systeminfo.java.vm.memory.statistics'"/></h3>
		</td>
	</tr>
    <tr bgcolor="#ffffff">
		<td valign="top" width="40%">&nbsp; <b><webwork:text name="'admin.systeminfo.memory.graph'"/></b></td>
		<td valign="top" width="60%">
            <table  border="0" cellpadding="0" cellspacing="0" style="float:left;" width="40%">
                <webwork:property value="@math/percentage(/extendedSystemInfoUtils/systemInfoUtils/usedMemory, /extendedSystemInfoUtils/systemInfoUtils/totalMemory)">
                    <td bgcolor="#CC3333" width="<webwork:property value="."/>%">
                        <a title="<webwork:text name="'admin.systeminfo.used.memory'"/>" >
                            <img src="<%= request.getContextPath() %>/images/border/spacer.gif"
                                 alt=""
                                 height="15"
                                 width="100%"
                                 border="0" title="<webwork:text name="'admin.systeminfo.used.memory.percent'">
                                             <webwork:param name="'value0'"><webwork:property value="."/></webwork:param>
                                         </webwork:text>">
                        </a>
                    </td>
                </webwork:property>

                <webwork:property value="@math/percentage(/extendedSystemInfoUtils/systemInfoUtils/freeMemory, /extendedSystemInfoUtils/systemInfoUtils/totalMemory)">
                <td bgcolor="#00CC00" width="<webwork:property value="."/>%">
                    <a title="<webwork:text name="'admin.systeminfo.free.memory'"/>" >
                        <img src="<%= request.getContextPath() %>/images/border/spacer.gif"
                             alt=""
                             height="15"
                             width="100%"
                             border="0" title="<webwork:text name="'admin.systeminfo.free.memory.percent'">
                                             <webwork:param name="'value0'"><webwork:property value="."/></webwork:param>
                                         </webwork:text>">
                    </a>
                </td>
            </table>
            <b>&nbsp;&nbsp;<webwork:text name="'admin.systeminfo.memory.percent.free'">
                <webwork:param name="'value0'"><webwork:property value="."/> </webwork:param>
            </webwork:text> </b>
            (<webwork:text name="'common.words.used'"/>: <webwork:property value="/extendedSystemInfoUtils/systemInfoUtils/usedMemory"/> MB
            <webwork:text name="'common.words.total'"/>: <webwork:property value="/extendedSystemInfoUtils/systemInfoUtils/totalMemory"/> MB)
            &nbsp;&nbsp;<span class="small">(<a href="ViewSystemInfo!garbageCollection.jspa"><webwork:text name="'admin.systeminfo.force.garbage.collection'"><webwork:param name="value0">garbage collection</webwork:param></webwork:text></a>)</span>
        </td>
                </webwork:property>
        </td>
    </tr>

    <webwork:if test="/extendedSystemInfoUtils/systemInfoUtils/usedPermGenMemory != 0">
    <tr bgcolor="#fffff0">
        <td valign="top" width="40%">&nbsp; <b><webwork:text name="'admin.systeminfo.perm.gen.memory.graph'"/></b></td>
        <td valign="top" width="60%">
            <table  border="0" cellpadding="0" cellspacing="0" style="float:left;" width="40%">
                <webwork:property value="@math/percentage(/extendedSystemInfoUtils/systemInfoUtils/usedPermGenMemory, /extendedSystemInfoUtils/systemInfoUtils/totalPermGenMemory)">
                    <td bgcolor="#CC3333" width="<webwork:property value="."/>%">
                        <a title="<webwork:text name="'admin.systeminfo.used.memory'"/>" >
                            <img src="<%= request.getContextPath() %>/images/border/spacer.gif"
                                 alt=""
                                 height="15"
                                 width="100%"
                                 border="0" title="<webwork:text name="'admin.systeminfo.used.memory.percent'">
                                             <webwork:param name="'value0'"><webwork:property value="."/></webwork:param>
                                         </webwork:text>">
                        </a>
                    </td>
                </webwork:property>

                <webwork:property value="@math/percentage(/extendedSystemInfoUtils/systemInfoUtils/freePermGenMemory, /extendedSystemInfoUtils/systemInfoUtils/totalPermGenMemory)">
                <td bgcolor="#00CC00" width="<webwork:property value="."/>%">
                    <a title="<webwork:text name="'admin.systeminfo.free.memory'"/>" >
                        <img src="<%= request.getContextPath() %>/images/border/spacer.gif"
                             alt=""
                             height="15"
                             width="100%"
                             border="0" title="<webwork:text name="'admin.systeminfo.free.memory.percent'">
                                             <webwork:param name="'value0'"><webwork:property value="."/></webwork:param>
                                         </webwork:text>">
                    </a>
                </td>
            </table>
            <b>&nbsp;&nbsp;<webwork:text name="'admin.systeminfo.memory.percent.free'">
                <webwork:param name="'value0'"><webwork:property value="."/> </webwork:param>
            </webwork:text> </b>
            (<webwork:text name="'common.words.used'"/>: <webwork:property value="/extendedSystemInfoUtils/systemInfoUtils/usedPermGenMemory"/> MB
            <webwork:text name="'common.words.total'"/>: <webwork:property value="/extendedSystemInfoUtils/systemInfoUtils/totalPermGenMemory"/> MB)
        </td>
        </webwork:property>
        </td>
    </tr>
    </webwork:if>
    <webwork:if test="/extendedSystemInfoUtils/systemInfoUtils/usedNonHeapMemory != 0">
    <tr bgcolor="#ffffff">
        <td valign="top" width="40%">&nbsp; <b><webwork:text name="'admin.systeminfo.nonheap.memory.graph'"/></b></td>
        <td valign="top" width="60%">
            <table  border="0" cellpadding="0" cellspacing="0" style="float:left;" width="40%">
                <webwork:property value="@math/percentage(/extendedSystemInfoUtils/systemInfoUtils/usedNonHeapMemory, /extendedSystemInfoUtils/systemInfoUtils/totalNonHeapMemory)">
                    <td bgcolor="#CC3333" width="<webwork:property value="."/>%">
                        <a title="<webwork:text name="'admin.systeminfo.used.memory'"/>" >
                            <img src="<%= request.getContextPath() %>/images/border/spacer.gif"
                                 alt=""
                                 height="15"
                                 width="100%"
                                 border="0" title="<webwork:text name="'admin.systeminfo.used.memory.percent'">
                                             <webwork:param name="'value0'"><webwork:property value="."/></webwork:param>
                                         </webwork:text>">
                        </a>
                    </td>
                </webwork:property>

                <webwork:property value="@math/percentage(/extendedSystemInfoUtils/systemInfoUtils/freeNonHeapMemory, /extendedSystemInfoUtils/systemInfoUtils/totalNonHeapMemory)">
                <td bgcolor="#00CC00" width="<webwork:property value="."/>%">
                    <a title="<webwork:text name="'admin.systeminfo.free.memory'"/>" >
                        <img src="<%= request.getContextPath() %>/images/border/spacer.gif"
                             alt=""
                             height="15"
                             width="100%"
                             border="0" title="<webwork:text name="'admin.systeminfo.free.memory.percent'">
                                             <webwork:param name="'value0'"><webwork:property value="."/></webwork:param>
                                         </webwork:text>">
                    </a>
                </td>
            </table>
            <b>&nbsp;&nbsp;<webwork:text name="'admin.systeminfo.memory.percent.free'">
                <webwork:param name="'value0'"><webwork:property value="."/> </webwork:param>
            </webwork:text> </b>
            (<webwork:text name="'common.words.used'"/>: <webwork:property value="/extendedSystemInfoUtils/systemInfoUtils/usedNonHeapMemory"/> MB
            <webwork:text name="'common.words.total'"/>: <webwork:property value="/extendedSystemInfoUtils/systemInfoUtils/totalNonHeapMemory"/> MB)
        </td>
        </webwork:property>
        </td>
    </tr>
    </webwork:if>
</table>
</p>
<p>
<table border="0" bgcolor="#bbbbbb" cellpadding="3" cellspacing="1" width="100%">

    <tr bgcolor="#f0f0f0">
        <th class="colHeaderLink" colspan="4">
            <h3 class="formtitle"><webwork:text name="'admin.systeminfo.memory.pool.list'"/></h3>
        </th>
    </tr>
    <tr>
        <td colspan="4" bgcolor="#ffffff"><webwork:text name="'admin.systeminfo.memory.pool.description'"/></td>
    </tr>
    <webwork:iterator value="/runtimeInformation/memoryPoolInformation" status="'status'">
    <tr bgcolor="<webwork:if test="@status/odd == false">#ffffff</webwork:if><webwork:else>#fffff0</webwork:else>">
        <td valign="top" width="40%">&nbsp; <strong><webwork:property value="name"/></strong></td>
        <td valign="top" width="60%">
            <table  border="0" cellpadding="0" cellspacing="0" style="float:left;" width="40%">
                <webwork:property value="@math/percentage(used, total)">
                    <td bgcolor="#CC3333" width="<webwork:property value="."/>%">
                        <a title="<webwork:text name="'admin.systeminfo.used.memory'"/>" >
                            <img src="<%= request.getContextPath() %>/images/border/spacer.gif"
                                 alt=""
                                 height="15"
                                 width="100%"
                                 border="0" title="<webwork:text name="'admin.systeminfo.used.memory.percent'">
                                             <webwork:param name="'value0'"><webwork:property value="."/></webwork:param>
                                         </webwork:text>">
                        </a>
                    </td>
                </webwork:property>

                <webwork:property value="@math/percentage(free, total)">
                <td bgcolor="#00CC00" width="<webwork:property value="."/>%">
                    <a title="<webwork:text name="'admin.systeminfo.free.memory'"/>" >
                        <img src="<%= request.getContextPath() %>/images/border/spacer.gif"
                             alt=""
                             height="15"
                             width="100%"
                             border="0" title="<webwork:text name="'admin.systeminfo.free.memory.percent'">
                                             <webwork:param name="'value0'"><webwork:property value="."/></webwork:param>
                                         </webwork:text>">
                    </a>
                </td>
            </table>
            <b>&nbsp;&nbsp;<webwork:text name="'admin.systeminfo.memory.percent.free'">
                <webwork:param name="'value0'"><webwork:property value="."/> </webwork:param>
            </webwork:text> </b>
            (<webwork:text name="'common.words.used'"/>: <webwork:property value="used"/> MB
            <webwork:text name="'common.words.total'"/>: <webwork:property value="total"/> MB)
        </td>
        </webwork:property>
        </td>
    </tr>
    </webwork:iterator>
</table>

</p>
</body>
</html>
