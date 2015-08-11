package org.apache.jsp.styles;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.atlassian.gadgets.dashboard.Color;
import com.atlassian.jira.ManagerFactory;
import com.atlassian.jira.config.properties.LookAndFeelBean;
import org.apache.commons.lang.StringUtils;
import com.atlassian.jira.config.properties.APKeys;

public final class global_005fcss_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/css");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

 response.setContentType("text/css"); 
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
 LookAndFeelBean lookAndFeel = LookAndFeelBean.getInstance(ManagerFactory.getApplicationProperties()); 
      out.write("\n");
      out.write("a:link,a:visited {color:");
      out.print( lookAndFeel.getTextLinkColour());
      out.write(";}\n");
      out.write("a:hover,a:active {color:");
      out.print( lookAndFeel.getTextActiveLinkColour());
      out.write(";}\n");
      out.write(".pagetitle { color: ");
      out.print( lookAndFeel.getTextHeadingColour() );
      out.write("; }\n");
      out.write(".formtitle { color: ");
      out.print( lookAndFeel.getTextHeadingColour() );
      out.write("; }\n");
      out.write(".bluetext { color: ");
      out.print( lookAndFeel.getTextHeadingColour() );
      out.write("; }\n");
      out.write(".custcolour  { color: ");
      out.print( lookAndFeel.getTextHeadingColour() );
      out.write("; }\n");
      out.write(".toptext, .toptext a { color: ");
      out.print( lookAndFeel.getTopTxtColour() );
      out.write("; }\n");
      out.write(".portletLoginHeader { color: ");
      out.print( lookAndFeel.getMenuTxtColour() );
      out.write("; background-color: ");
      out.print( lookAndFeel.getMenuBackgroundColour() );
      out.write("}\n");
      out.write(".bgBorder {border:1px ");
      out.print( lookAndFeel.getTopBackgroundColour());
      out.write(" solid; }\n");
      out.write("#filterFormHeader,\n");
      out.write(".leftFormHeader {border-bottom-color: ");
      out.print( lookAndFeel.getMenuBackgroundColour() );
      out.write("; }\n");
      out.write("#filterForm .tableUnderline { border-bottom-color: ");
      out.print( lookAndFeel.getMenuBackgroundColour() );
      out.write("; }\n");
      out.write("\n");
      out.write("span.switch {color: ");
      out.print( lookAndFeel.getTextLinkColour() );
      out.write(";}\n");
      out.write("\n");
      out.write(".item-header .item-summary,\n");
      out.write(".item-header .item-summary a:link,\n");
      out.write(".item-header .item-summary a:visited {color:");
      out.print( lookAndFeel.getTextHeadingColour() );
      out.write(";}\n");
      out.write("\n");
      out.write(".ops li a.button:hover,\n");
      out.write("#view-drop a.drop:hover,\n");
      out.write(".tabs2 ul.horizontal li a {color:");
      out.print( lookAndFeel.getTextLinkColour());
      out.write(";}\n");
      out.write(".ops li a.active:hover {color:#fff;} \n");
      out.write("/* header colours\n");
      out.write("    header-top */\n");
      out.write("#header {color:");
      out.print( lookAndFeel.getTopTxtColour() );
      out.write(";background-color:");
      out.print( lookAndFeel.getTopBackgroundColour() );
      out.write(";}\n");
      out.write("#header-top div.aui-dd-parent a.lnk {color:");
      out.print( lookAndFeel.getTopTxtColour()  );
      out.write(";}\n");
      out.write("#header-top div.aui-dd-parent a.drop {background-image:url(\"");
      out.print( request.getContextPath() );
      out.write("/rest/api/1.0/dropdowns?color=");
      out.print( lookAndFeel.stripHash(lookAndFeel.getTopTxtColour()) );
      out.write("&bgcolor=");
      out.print( lookAndFeel.stripHash(lookAndFeel.getTopBackgroundColour()));
      out.write("\");}\n");
      out.write("#header-top div.aui-dd-parent.active,\n");
      out.write("#header-top div.aui-dd-parent:hover {background-color:");
      out.print( lookAndFeel.getTopHighlightColor() );
      out.write(";}\n");
      out.write("#header-top #popup-profile-user  {color:");
      out.print( lookAndFeel.getTopTxtColour()  );
      out.write(";padding-right:1em;}\n");
      out.write("\n");
      out.write("#header-top div.aui-dd-parent.active a.lnk,\n");
      out.write("#header-top div.aui-dd-parent:hover a.lnk {color:");
      out.print( lookAndFeel.getTopTextHighlightColor() );
      out.write(";}\n");
      out.write("\n");
      out.write("#header-top div:hover a.drop {background-image: url(\"");
      out.print( request.getContextPath() );
      out.write("/rest/api/1.0/dropdowns?color=");
      out.print( lookAndFeel.stripHash(lookAndFeel.getTopTextHighlightColor()) );
      out.write("&bgcolor=");
      out.print( lookAndFeel.stripHash(lookAndFeel.getTopHighlightColor()) );
      out.write("\");}\n");
      out.write("#header-top div.active a.drop,\n");
      out.write("#header-top div a.drop:hover,\n");
      out.write("#header-top div a.drop:active,\n");
      out.write("#header-top div a.drop:focus {background-color:");
      out.print( lookAndFeel.getTopBackgroundColour() );
      out.write(";background-image: url('");
      out.print( request.getContextPath() );
      out.write("/rest/api/1.0/dropdowns?color=");
      out.print( lookAndFeel.stripHash(lookAndFeel.getTopTxtColour()) );
      out.write("&bgcolor=");
      out.print( lookAndFeel.stripHash(lookAndFeel.getTopBackgroundColour()) );
      out.write("');}\n");
      out.write("#header-top div .drop-wrap {background-image: url(\"");
      out.print( request.getContextPath() );
      out.write("/rest/api/1.0/header-separator?color=");
      out.print( lookAndFeel.stripHash(lookAndFeel.getTopTxtColour()) );
      out.write("&bgcolor=");
      out.print( lookAndFeel.stripHash(lookAndFeel.getTopBackgroundColour()));
      out.write("\");}\n");
      out.write("#header-top div:hover .drop-wrap,\n");
      out.write("#header-top div.active .drop-wrap {background-image: url(\"");
      out.print( request.getContextPath() );
      out.write("/rest/api/1.0/header-separator?color=");
      out.print( lookAndFeel.stripHash(lookAndFeel.getTopTextHighlightColor()) );
      out.write("&bgcolor=");
      out.print( lookAndFeel.stripHash(lookAndFeel.getTopHighlightColor()) );
      out.write("\");}\n");
      out.write("/* ie6 only */\n");
      out.write("#header-top div.active {_background-color:");
      out.print( lookAndFeel.getTopHighlightColor() );
      out.write(";}\n");
      out.write("#header-top div.active div {_background-color:");
      out.print( lookAndFeel.getTopHighlightColor() );
      out.write(";}\n");
      out.write("\n");
      out.write(" /* header bottom (navigation bar) */\n");
      out.write("#header-bottom {background-color:");
      out.print( lookAndFeel.getMenuBackgroundColour());
      out.write(";border-top:1px solid ");
      out.print( lookAndFeel.getTopSeparatorBackgroundColor());
      out.write(";}\n");
      out.write("#header-bottom #main-nav li.aui-dd-parent {background-color:");
      out.print( lookAndFeel.getMenuBackgroundColour());
      out.write(";}\n");
      out.write("    #create_link {color:");
      out.print( lookAndFeel.getMenuTxtColour() );
      out.write(";}\n");
      out.write("    #header-bottom #main-nav a.lnk {color:");
      out.print( lookAndFeel.getMenuTxtColour() );
      out.write(";}\n");
      out.write("    #header-bottom #main-nav li a.drop {background-image:url(\"");
      out.print( request.getContextPath() );
      out.write("/rest/api/1.0/dropdowns?color=");
      out.print( lookAndFeel.stripHash(lookAndFeel.getMenuTxtColour()) );
      out.write("&bgcolor=");
      out.print( lookAndFeel.stripHash(lookAndFeel.getMenuBackgroundColour()));
      out.write("\");}\n");
      out.write("/* //header colours */\n");
      out.write("/* note: the styles below are NOT user configurable in admin\n");
      out.write("   They give the hover/active state of the drop arrow */\n");
      out.write("#header-bottom #main-nav li:hover a.drop,\n");
      out.write("#header-bottom #main-nav li.selected a.drop {background-image: url('../../../images/menu_indicator_for_light_backgrounds.gif')}\n");
      out.write("#header-bottom #main-nav li.active a.drop,\n");
      out.write("#header-bottom #main-nav li a.drop:hover,\n");
      out.write("#header-bottom #main-nav li a.drop:active,\n");
      out.write("#header-bottom #main-nav li a.drop:focus {background-color:#ccc;background-image: url('");
      out.print( request.getContextPath() );
      out.write("/rest/api/1.0/dropdowns?color=fff&bgcolor=ccc');}\n");
      out.write("#header-bottom #main-nav li .drop-wrap {background-image: url(\"");
      out.print( request.getContextPath() );
      out.write("/rest/api/1.0/header-separator?color=");
      out.print( lookAndFeel.stripHash(lookAndFeel.getMenuSeparatorColour()) );
      out.write("&bgcolor=");
      out.print( lookAndFeel.stripHash(lookAndFeel.getMenuBackgroundColour()));
      out.write("\");}\n");
      out.write("#header-bottom #main-nav li.selected .drop-wrap {background-image: url(\"");
      out.print( request.getContextPath() );
      out.write("/rest/api/1.0/header-separator?color=ccc&bgcolor=f7f7f7\");}\n");
      out.write("#header-bottom #main-nav li:hover .drop-wrap,\n");
      out.write("#header-bottom #main-nav li.active .drop-wrap {background-image: url(\"");
      out.print( request.getContextPath() );
      out.write("/rest/api/1.0/header-separator?color=ccc&bgcolor=ffffff\");}\n");
      out.write("/* ie6 only */\n");
      out.write("#header-bottom #main-nav li.selected {_background-color:#f7f7f7;_border:none}\n");
      out.write("#header-bottom #main-nav li.active {_background-color:#fff;}\n");
      out.write("#header-bottom #main-nav li.selected div,\n");
      out.write("#header-bottom #main-nav li.active div {_background-color:#fff;}\n");
      out.write("\n");

    final String labelWidthStr = lookAndFeel.getDefaultBackedString(APKeys.JIRA_LF_FIELD_LABEL_WIDTH, "11");
    int labelWidth = 10;
    if (StringUtils.isNumeric(labelWidthStr))
    {
        labelWidth = Integer.parseInt(labelWidthStr);
    }


      out.write("\n");
      out.write(".property-list .name {width:");
      out.print( labelWidth );
      out.write("em; margin-left:-");
      out.print( labelWidth + 1 );
      out.write("em;}\n");
      out.write(".property-list .wrap {padding-left:");
      out.print( labelWidth + 1 );
      out.write("em;}\n");
      out.write(".two-cols .item-right .wrap {padding-left:");
      out.print( labelWidth + 2 );
      out.write("em;}\n");
      out.write("\n");
      out.write('\n');

final Color[] colors = Color.values();
for (int i=0; i < colors.length; i++) {
      final Color color = colors[i];
      //color8 is chromeless and therefore special.  
      if(color.equals(Color.color8))
      {
        continue;
      }
      final String colorString = lookAndFeel.getGadgetChromeColor(color.toString());
      if(StringUtils.isNotEmpty(colorString)) {
      out.write("\n");
      out.write("#jira .dashboard .gadget .gadget-menu .aui-dd-parent .gadget-colors li.");
      out.print(color);
      out.write(",\n");
      out.write("    #jira .dashboard #dashboard-content div.gadget.");
      out.print(color);
      out.write(" .gadget-hover .dashboard-item-title,\n");
      out.write("    #jira .dashboard #dashboard-content div.gadget.");
      out.print(color);
      out.write(" .dashboard-item-title {background: ");
      out.print(colorString);
      out.write(";_background:");
      out.print(colorString);
      out.write("}\n");
      out.write("\n");
      out.write("#jira .dashboard #dashboard-content div.gadget.");
      out.print(color);
      out.write(" .dashboard-item-frame.gadget-hover {border-color: #999999;}\n");
      out.write("#jira .dashboard #dashboard-content div.gadget.");
      out.print(color);
      out.write(" form.aui {border-color:#bbb;}\n");
      out.write("\n");
      out.write("#jira .dashboard .gadget .gadget-menu .aui-dd-parent .gadget-colors li.");
      out.print(color);
      out.write(" a:hover,\n");
      out.write("    #jira .dashboard ul.column li.");
      out.print(color);
      out.write(".hover .gadget-container,\n");
      out.write("    #jira li.");
      out.print(color);
      out.write(".hover .gadget-menu .aui-dropdown,\n");
      out.write("    #jira li.");
      out.print(color);
      out.write(" form.aui {border-color: ");
      out.print(colorString);
      out.write(";_background:");
      out.print(colorString);
      out.write('}');
      out.write('\n');
}}
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
