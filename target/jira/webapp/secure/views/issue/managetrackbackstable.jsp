<%@ taglib uri="webwork" prefix="webwork" %>
<table class="typeA" border="0" cellpadding="0" cellspacing="0" width="100%">
	<thead>
        <tr>
            <th>
                &nbsp;
            </th>
            <th>
                <webwork:text name="'trackback.manage.colheader'"/>
            </th>
            <th>
                &nbsp;
            </th>
        </tr>
    </thead>
	<webwork:iterator value="trackbacks" status="'status'">
        <tbody>
            <tr<webwork:if test="@status/even == true"> class="alt"</webwork:if>>
                <td><webwork:property value="@status/count"/></td>
                <td>
                    <div class="trackback">
                        <div class="trackbackheader">
                            <img border="0" src="<%=request.getContextPath()%>/images/icons/document_exchange.gif" width=16 height=16 align=absmiddle>
                            <span class="trackbacklink"><a href="<webwork:property value="url"/>"><webwork:property value="title"/></a></span>
                            <span class="trackbackblogname">(<webwork:property value="blogName"/>)</span>
                        </div>
                        <webwork:if test="excerpt">
                            <div class="trackbackexcerpt"><webwork:property value="excerpt" /></div>
                        </webwork:if>
                    </div>
                </td>
                <td>
                    <webwork:if test="/canDeleteTrackbacks">
                    <a href="<webwork:url page="DeleteTrackback.jspa"><webwork:param name="'id'" value="/issueObject/id" /><webwork:param name="'trackbackId'" value="./id" /></webwork:url>" id="del_<webwork:property value="id" />"><webwork:text name="'common.words.delete'"/></a>
                    </webwork:if>
                </td>
            </tr>
        </tbody>
	</webwork:iterator>
</table>
