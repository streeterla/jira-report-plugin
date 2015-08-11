<%@ page contentType="text/css" %><% response.setContentType("text/css"); %>
<%@ page import="com.atlassian.gadgets.dashboard.Color" %>
<%@ page import="com.atlassian.jira.ManagerFactory"%>
<%@ page import="com.atlassian.jira.config.properties.LookAndFeelBean"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="com.atlassian.jira.config.properties.APKeys"%>
<% LookAndFeelBean lookAndFeel = LookAndFeelBean.getInstance(ManagerFactory.getApplicationProperties()); %>
a:link,a:visited {color:<%= lookAndFeel.getTextLinkColour()%>;}
a:hover,a:active {color:<%= lookAndFeel.getTextActiveLinkColour()%>;}
.pagetitle { color: <%= lookAndFeel.getTextHeadingColour() %>; }
.formtitle { color: <%= lookAndFeel.getTextHeadingColour() %>; }
.bluetext { color: <%= lookAndFeel.getTextHeadingColour() %>; }
.custcolour  { color: <%= lookAndFeel.getTextHeadingColour() %>; }
.toptext, .toptext a { color: <%= lookAndFeel.getTopTxtColour() %>; }
.portletLoginHeader { color: <%= lookAndFeel.getMenuTxtColour() %>; background-color: <%= lookAndFeel.getMenuBackgroundColour() %>}
.bgBorder {border:1px <%= lookAndFeel.getTopBackgroundColour()%> solid; }
#filterFormHeader,
.leftFormHeader {border-bottom-color: <%= lookAndFeel.getMenuBackgroundColour() %>; }
#filterForm .tableUnderline { border-bottom-color: <%= lookAndFeel.getMenuBackgroundColour() %>; }

span.switch {color: <%= lookAndFeel.getTextLinkColour() %>;}

.item-header .item-summary,
.item-header .item-summary a:link,
.item-header .item-summary a:visited {color:<%= lookAndFeel.getTextHeadingColour() %>;}

.ops li a.button:hover,
#view-drop a.drop:hover,
.tabs2 ul.horizontal li a {color:<%= lookAndFeel.getTextLinkColour()%>;}
.ops li a.active:hover {color:#fff;} 
/* header colours
    header-top */
#header {color:<%= lookAndFeel.getTopTxtColour() %>;background-color:<%= lookAndFeel.getTopBackgroundColour() %>;}
#header-top div.aui-dd-parent a.lnk {color:<%= lookAndFeel.getTopTxtColour()  %>;}
#header-top div.aui-dd-parent a.drop {background-image:url("<%= request.getContextPath() %>/rest/api/1.0/dropdowns?color=<%= lookAndFeel.stripHash(lookAndFeel.getTopTxtColour()) %>&bgcolor=<%= lookAndFeel.stripHash(lookAndFeel.getTopBackgroundColour())%>");}
#header-top div.aui-dd-parent.active,
#header-top div.aui-dd-parent:hover {background-color:<%= lookAndFeel.getTopHighlightColor() %>;}
#header-top #popup-profile-user  {color:<%= lookAndFeel.getTopTxtColour()  %>;padding-right:1em;}

#header-top div.aui-dd-parent.active a.lnk,
#header-top div.aui-dd-parent:hover a.lnk {color:<%= lookAndFeel.getTopTextHighlightColor() %>;}

#header-top div:hover a.drop {background-image: url("<%= request.getContextPath() %>/rest/api/1.0/dropdowns?color=<%= lookAndFeel.stripHash(lookAndFeel.getTopTextHighlightColor()) %>&bgcolor=<%= lookAndFeel.stripHash(lookAndFeel.getTopHighlightColor()) %>");}
#header-top div.active a.drop,
#header-top div a.drop:hover,
#header-top div a.drop:active,
#header-top div a.drop:focus {background-color:<%= lookAndFeel.getTopBackgroundColour() %>;background-image: url('<%= request.getContextPath() %>/rest/api/1.0/dropdowns?color=<%= lookAndFeel.stripHash(lookAndFeel.getTopTxtColour()) %>&bgcolor=<%= lookAndFeel.stripHash(lookAndFeel.getTopBackgroundColour()) %>');}
#header-top div .drop-wrap {background-image: url("<%= request.getContextPath() %>/rest/api/1.0/header-separator?color=<%= lookAndFeel.stripHash(lookAndFeel.getTopTxtColour()) %>&bgcolor=<%= lookAndFeel.stripHash(lookAndFeel.getTopBackgroundColour())%>");}
#header-top div:hover .drop-wrap,
#header-top div.active .drop-wrap {background-image: url("<%= request.getContextPath() %>/rest/api/1.0/header-separator?color=<%= lookAndFeel.stripHash(lookAndFeel.getTopTextHighlightColor()) %>&bgcolor=<%= lookAndFeel.stripHash(lookAndFeel.getTopHighlightColor()) %>");}
/* ie6 only */
#header-top div.active {_background-color:<%= lookAndFeel.getTopHighlightColor() %>;}
#header-top div.active div {_background-color:<%= lookAndFeel.getTopHighlightColor() %>;}

 /* header bottom (navigation bar) */
#header-bottom {background-color:<%= lookAndFeel.getMenuBackgroundColour()%>;border-top:1px solid <%= lookAndFeel.getTopSeparatorBackgroundColor()%>;}
#header-bottom #main-nav li.aui-dd-parent {background-color:<%= lookAndFeel.getMenuBackgroundColour()%>;}
    #create_link {color:<%= lookAndFeel.getMenuTxtColour() %>;}
    #header-bottom #main-nav a.lnk {color:<%= lookAndFeel.getMenuTxtColour() %>;}
    #header-bottom #main-nav li a.drop {background-image:url("<%= request.getContextPath() %>/rest/api/1.0/dropdowns?color=<%= lookAndFeel.stripHash(lookAndFeel.getMenuTxtColour()) %>&bgcolor=<%= lookAndFeel.stripHash(lookAndFeel.getMenuBackgroundColour())%>");}
/* //header colours */
/* note: the styles below are NOT user configurable in admin
   They give the hover/active state of the drop arrow */
#header-bottom #main-nav li:hover a.drop,
#header-bottom #main-nav li.selected a.drop {background-image: url('../../../images/menu_indicator_for_light_backgrounds.gif')}
#header-bottom #main-nav li.active a.drop,
#header-bottom #main-nav li a.drop:hover,
#header-bottom #main-nav li a.drop:active,
#header-bottom #main-nav li a.drop:focus {background-color:#ccc;background-image: url('<%= request.getContextPath() %>/rest/api/1.0/dropdowns?color=fff&bgcolor=ccc');}
#header-bottom #main-nav li .drop-wrap {background-image: url("<%= request.getContextPath() %>/rest/api/1.0/header-separator?color=<%= lookAndFeel.stripHash(lookAndFeel.getMenuSeparatorColour()) %>&bgcolor=<%= lookAndFeel.stripHash(lookAndFeel.getMenuBackgroundColour())%>");}
#header-bottom #main-nav li.selected .drop-wrap {background-image: url("<%= request.getContextPath() %>/rest/api/1.0/header-separator?color=ccc&bgcolor=f7f7f7");}
#header-bottom #main-nav li:hover .drop-wrap,
#header-bottom #main-nav li.active .drop-wrap {background-image: url("<%= request.getContextPath() %>/rest/api/1.0/header-separator?color=ccc&bgcolor=ffffff");}
/* ie6 only */
#header-bottom #main-nav li.selected {_background-color:#f7f7f7;_border:none}
#header-bottom #main-nav li.active {_background-color:#fff;}
#header-bottom #main-nav li.selected div,
#header-bottom #main-nav li.active div {_background-color:#fff;}

<%
    final String labelWidthStr = lookAndFeel.getDefaultBackedString(APKeys.JIRA_LF_FIELD_LABEL_WIDTH, "11");
    int labelWidth = 10;
    if (StringUtils.isNumeric(labelWidthStr))
    {
        labelWidth = Integer.parseInt(labelWidthStr);
    }

%>
.property-list .name {width:<%= labelWidth %>em; margin-left:-<%= labelWidth + 1 %>em;}
.property-list .wrap {padding-left:<%= labelWidth + 1 %>em;}
.two-cols .item-right .wrap {padding-left:<%= labelWidth + 2 %>em;}

<%-- Override the gadget chrome colours --%>
<%
final Color[] colors = Color.values();
for (int i=0; i < colors.length; i++) {
      final Color color = colors[i];
      //color8 is chromeless and therefore special.  
      if(color.equals(Color.color8))
      {
        continue;
      }
      final String colorString = lookAndFeel.getGadgetChromeColor(color.toString());
      if(StringUtils.isNotEmpty(colorString)) {%>
#jira .dashboard .gadget .gadget-menu .aui-dd-parent .gadget-colors li.<%=color%>,
    #jira .dashboard #dashboard-content div.gadget.<%=color%> .gadget-hover .dashboard-item-title,
    #jira .dashboard #dashboard-content div.gadget.<%=color%> .dashboard-item-title {background: <%=colorString%>;_background:<%=colorString%>}

#jira .dashboard #dashboard-content div.gadget.<%=color%> .dashboard-item-frame.gadget-hover {border-color: #999999;}
#jira .dashboard #dashboard-content div.gadget.<%=color%> form.aui {border-color:#bbb;}

#jira .dashboard .gadget .gadget-menu .aui-dd-parent .gadget-colors li.<%=color%> a:hover,
    #jira .dashboard ul.column li.<%=color%>.hover .gadget-container,
    #jira li.<%=color%>.hover .gadget-menu .aui-dropdown,
    #jira li.<%=color%> form.aui {border-color: <%=colorString%>;_background:<%=colorString%>}
<%}}%>