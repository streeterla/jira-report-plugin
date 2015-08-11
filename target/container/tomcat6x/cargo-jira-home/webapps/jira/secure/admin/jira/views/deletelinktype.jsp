
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>


<html>
<head>
	<title><webwork:text name="'admin.deletelinktype.title'">
	    <webwork:param name="'value0'">[<webwork:property value="linkType/string('linkname')" />]</webwork:param>
	</webwork:text></title>
</head>
<body>

<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'admin.deletelinktype.title'">
        <webwork:param name="'value0'"><webwork:property value="linkType/string('linkname')" /></webwork:param>
    </webwork:text></page:param>
	<page:param name="autoSelectFirst">false</page:param>
	<page:param name="description">
		<p><webwork:text name="'admin.deletelinktype.confirmation'"/></p>
		<p><webwork:text name="'admin.deletelinktype.matching.links'">
		    <webwork:param name="'value0'"><b><webwork:property value="links/size" /></b></webwork:param>
		</webwork:text></p>
	</page:param>

    <page:param name="width">100%</page:param>
	<page:param name="action">DeleteLinkType.jspa</page:param>
	<page:param name="submitId">delete_link_type</page:param>
	<page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
	<page:param name="cancelURI">ViewLinkTypes!default.jspa</page:param>

    <webwork:if test="links/size > 0">


        <webwork:if test="otherLinkTypes/size > 0">
            <tr>
                <td bgcolor="#ffffff">&nbsp;</td>
                <td bgcolor="#ffffff">
                    <input type="radio" name="action" value="swap"
                        <webwork:if test="action == 'swap'">
                        checked
                        </webwork:if>
                    >
                    <webwork:text name="'admin.deletelinktype.swap.current.links.to'"/>:
                    <select name="swapLinkTypeId">
                        <webwork:iterator value="otherLinkTypes">
                        <option value="<webwork:property value="long('id')" />"
                            <webwork:if test="swapLinkTypeId == id">selected</webwork:if>
                        >
                            <webwork:property value="string('linkname')" />
                        </option>
                        </webwork:iterator>
                    </select>
                </td>
            </tr>
            <tr>
                <td bgcolor="#ffffff">&nbsp;</td>
                <td bgcolor="#ffffff">
                    <input type="radio" name="action" value="remove"
                        <webwork:if test="action == 'remove'">
                        checked
                        </webwork:if>
                    >
                    <webwork:text name="'admin.deletelinktype.remove.all.links'"/>
                </td>
            </tr>
        </webwork:if>
        <webwork:else>
            <tr>
                <td bgcolor="#ffffff">&nbsp;</td>
                <td bgcolor="#ffffff">
                    <input type="hidden" name="action" value="remove">
                    <webwork:text name="'admin.deletelinktype.no.other.link.types'"/>
                </td>
            </tr>
        </webwork:else>
    </webwork:if>
    <webwork:else>
        <tr>
            <td bgcolor="#ffffff">&nbsp;</td>
            <td bgcolor="#ffffff">
                <input type="hidden" name="action" value="remove" />
                <webwork:text name="'admin.deletelinktype.no.link.types'">
                    <webwork:param name="'value0'"><b></webwork:param>
                    <webwork:param name="'value1'"></b></webwork:param>
                </webwork:text>
            </td>
        </tr>
    </webwork:else>


	<ui:component name="'id'" template="hidden.jsp" />
	<input type="hidden" name="confirm" value="true">
</page:applyDecorator>

</body>
</html>
