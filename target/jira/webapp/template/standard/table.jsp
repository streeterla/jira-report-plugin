<%@ taglib uri="webwork" prefix="webwork" %>


<%/*This is just a sample table layout that I sometimes use.
   * it shows fine on Internet Explorer but does not always look
   * so good on Netscape ( a blank cell will show up as balck)
   * you can modify this to shopw the table any way you want
   *
   * NOTE : this should currently be included within the context of the
   * webTable bean.
   *
   */%>

<webwork:if test=". != null">
	<webwork:if test="model != null">
        <TABLE bgcolor="555555" border="0" cellpadding="0" cellspacing="0" width=95%>
            <TR>
                <TD>
                    <TABLE  border="0" cellpadding="3" cellspacing="1" width=100%>

                    <TR BGColor=bbbbbb>

                    <%/* Show the visible column names.  Use the display name that can
                       * be set in the jsp.
                       */%>
                    <webwork:property value="columns">
                        <webwork:iterator id="curColumn">
                            <webwork:if test="visible == true">
                                <webwork:if test="sortable == true">
                                    <td
                                    <webwork:if test="sortColumn == offset">
                                        class="colHeaderOver"
                                    </webwork:if>
                                    <webwork:else>
                                        class="colHeaderLink" onMouseOver="this.className='colHeaderOver'" onMouseOut="this.className='colHeaderLink'"
                                    </webwork:else>
                                    >

                                    <webwork:if test="(sortColumn == offset) && (sortOrder == 'ASC')">
                                        <a href='<webwork:url><webwork:param name="sortColumnLinkName" value="offset"/><webwork:param name="sortOrderLinkName" value="'DESC'"/></webwork:url>'><font color="#ffffff"><webwork:property value="displayName"/></font></a>
                                        <a href='<webwork:url><webwork:param name="sortColumnLinkName" value="offset"/><webwork:param name="sortOrderLinkName" value="'DESC'"/></webwork:url>'><img src='<%= request.getContextPath() %>/images/sorted_asc.gif' border='0' valign='bottom'/></a>
                                    </webwork:if>
                                    <webwork:elseIf test="(sortColumn == offset) && (sortOrder == 'DESC')">
                                    <a href='<webwork:url><webwork:param name="sortColumnLinkName" value="offset"/><webwork:param name="sortOrderLinkName" value="'ASC'"/></webwork:url>'>	<font color="#ffffff"><webwork:property value="displayName"/></font></a>
                                        <a href='<webwork:url><webwork:param name="sortColumnLinkName" value="offset"/><webwork:param name="sortOrderLinkName" value="'ASC'"/></webwork:url>'><img src='<%= request.getContextPath() %>/images/sorted_desc.gif' border='0' valign='top'/></a>
                                    </webwork:elseIf>
                                    <webwork:elseIf test="sortColumn != offset">
                                        <a href='<webwork:url><webwork:param name="sortColumnLinkName" value="offset"/><webwork:param name="sortOrderLinkName" value="'DESC'"/></webwork:url>'><font color="#ffffff"><webwork:property value="displayName"/></font></a>
                                        <a href='<webwork:url><webwork:param name="sortColumnLinkName" value="offset"/><webwork:param name="sortOrderLinkName" value="'DESC'"/></webwork:url>'><img src='<%= request.getContextPath() %>/images/unsorted_desc.gif' border='0' valign='top'/></a>
                                    </webwork:elseIf>
                                </webwork:if>
                                <webwork:else>
                                    <td><webwork:property value="displayName"/>
                                </webwork:else>
                                </td>
                            </webwork:if>
                        </webwork:iterator>
                    </webwork:property>
                    </TR>

                    <%/*counter used to alternate background row colors*/%>
                    <webwork:bean name="'webwork.util.Counter'" id="rowCount">
                        <webwork:param name="'wrap'" value="true"/>
                        <webwork:param name="'last'" value="2"/>
                    </webwork:bean>

                    <%/*Row iterator will iterate through the formated rows*/%>
                    <webwork:property value="rowIterator">
                        <webwork:iterator>

                            <%/*set the background colors.  Used in 0.95 version
                               * I haven't looked to see if there is a cleaner way
                               * but there must be
                               */%>
                            <TR
                                <webwork:if test="@rowCount/next == 1">
                                    BGCOLOR="#fffff0"
                                </webwork:if>
                                <webwork:if test = "@rowCount/next == 0"/>
                                <webwork:if test = "@rowCount/next == 2">
                                    BGCOLOR="#FFFFFF"
                                </webwork:if>
                            >
                            <%/*show the actual cell contents.  It is generated by the renderer for the columns*/%>
                            <webwork:iterator>
                                <td><webwork:property value="."/></td>
                            </webwork:iterator>
                            </TR>
                        </webwork:iterator>
                    </webwork:property>
                    </TABLE>
                </TD>
            </TR>
        </TABLE>
	</webwork:if>
	<webwork:else>
        <table border=1>
            <tr><th><font color="red">ERROR</font></th></tr>
            <tr><td>no model was available</td></tr>
        </table>
	</webwork:else>
</webwork:if>
<webwork:else>
	this page can not be loaded directly
</webwork:else>
