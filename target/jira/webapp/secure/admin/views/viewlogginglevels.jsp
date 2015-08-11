<%@ taglib uri="webwork" prefix="webwork"  %>

<%--<a href="ConfigureLogging!default.jspa?loggerName=<webwork:property value="name" />"><webwork:text name="'common.words.edit'"/></a> ---%>
<span>
<webwork:if test="/atLevel(., 'DEBUG') == false">
    <a href="<webwork:url page="ConfigureLogging.jspa"><webwork:param name="'loggerName'" value="./name"/><webwork:param name="'levelName'" value="'DEBUG'"/></webwork:url>">DEBUG</a>
</webwork:if>

<webwork:if test="/atLevel(., 'INFO') == false">
    <a href="<webwork:url page="ConfigureLogging.jspa"><webwork:param name="'loggerName'" value="./name"/><webwork:param name="'levelName'" value="'INFO'"/></webwork:url>">INFO</a>
</webwork:if>

<webwork:if test="/atLevel(., 'WARN') == false">
    <a href="<webwork:url page="ConfigureLogging.jspa"><webwork:param name="'loggerName'" value="./name"/><webwork:param name="'levelName'" value="'WARN'"/></webwork:url>">WARN</a>
</webwork:if>

<webwork:if test="/atLevel(., 'ERROR') == false">
    <a href="<webwork:url page="ConfigureLogging.jspa"><webwork:param name="'loggerName'" value="./name"/><webwork:param name="'levelName'" value="'ERROR'"/></webwork:url>">ERROR</a>
</webwork:if>

<webwork:if test="/atLevel(., 'FATAL') == false">
    <a href="<webwork:url page="ConfigureLogging.jspa"><webwork:param name="'loggerName'" value="./name"/><webwork:param name="'levelName'" value="'FATAL'"/></webwork:url>">FATAL</a>
</webwork:if>

<webwork:if test="/atLevel(., 'OFF') == false">
    <a href="<webwork:url page="ConfigureLogging.jspa"><webwork:param name="'loggerName'" value="./name"/><webwork:param name="'levelName'" value="'OFF'"/></webwork:url>">OFF</a>
</webwork:if>
</span>