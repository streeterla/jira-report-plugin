<%@ taglib uri="webwork" prefix="webwork" %><%@ taglib uri="webwork" prefix="ui" %><%@ taglib uri="sitemesh-page" prefix="page" %><% response.setContentType("text/xml"); %>
<users><webwork:iterator value="/users">
        <user>
            <name><webwork:property value="/xmlEscape(./name)" escape="false" /></name>
            <fullname><webwork:property value="/xmlEscape(./fullname)" escape="false" /></fullname>
            <email><webwork:property value="/xmlEscape(./email)" escape="false" /></email>
            <properties><webwork:iterator value="./userPropertyMap">
                <property>
                <key><webwork:property value="/xmlEscape(./key)" escape="false" /></key>
                    <value><webwork:property value="/xmlEscape(./value)" escape="false" /></value>
                </property></webwork:iterator>
            </properties>
        </user></webwork:iterator>
</users>