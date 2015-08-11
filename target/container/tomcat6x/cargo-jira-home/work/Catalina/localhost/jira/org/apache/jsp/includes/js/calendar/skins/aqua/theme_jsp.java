package org.apache.jsp.includes.js.calendar.skins.aqua;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class theme_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("/* Distributed as part of The Coolest DHTML Calendar\n");
      out.write("   Author: Mihai Bazon, www.bazon.net/mishoo\n");
      out.write("   Copyright Dynarch.com 2005, www.dynarch.com\n");
      out.write("*/\n");
      out.write("\n");

    String path = request.getContextPath() + "/includes/js/calendar/skins/aqua";

      out.write("\n");
      out.write("/* The main calendar widget.  DIV containing a table. */\n");
      out.write("\n");
      out.write("div.calendar { position: relative; }\n");
      out.write("\n");
      out.write(".calendar, .calendar table {\n");
      out.write("  border: 1px solid #bdb2bf;\n");
      out.write("  font-size: 11px;\n");
      out.write("  color: #000;\n");
      out.write("  cursor: default;\n");
      out.write("  background: url(\"");
      out.print( path );
      out.write("/normal-bg.gif\");\n");
      out.write("  font-family: \"trebuchet ms\",verdana,tahoma,sans-serif;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar {\n");
      out.write("  border-color: #797979;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Header part -- contains navigation buttons and day names. */\n");
      out.write("\n");
      out.write(".calendar .button { /* \"<<\", \"<\", \">\", \">>\" buttons have this class */\n");
      out.write("  text-align: center;    /* They are the navigation buttons */\n");
      out.write("  padding: 2px;          /* Make the buttons seem like they're pressing */\n");
      out.write("  background: url(\"");
      out.print( path );
      out.write("/title-bg.gif\") repeat-x 0 100%; color: #000;\n");
      out.write("  font-weight: bold;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar .nav {\n");
      out.write("  font-family: verdana,tahoma,sans-serif;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar .nav div {\n");
      out.write("  background: transparent url(\"");
      out.print( path );
      out.write("/menuarrow.gif\") no-repeat 100% 100%;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar thead tr { background: url(\"");
      out.print( path );
      out.write("/title-bg.gif\") repeat-x 0 100%; color: #000; }\n");
      out.write("\n");
      out.write(".calendar thead .title { /* This holds the current \"month, year\" */\n");
      out.write("  font-weight: bold;      /* Pressing it will take you to the current date */\n");
      out.write("  text-align: center;\n");
      out.write("  padding: 2px;\n");
      out.write("  background: url(\"");
      out.print( path );
      out.write("/title-bg.gif\") repeat-x 0 100%; color: #000;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar thead .headrow { /* Row <TR> containing navigation buttons */\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar thead .name { /* Cells <TD> containing the day names */\n");
      out.write("  border-bottom: 1px solid #797979;\n");
      out.write("  padding: 2px;\n");
      out.write("  text-align: center;\n");
      out.write("  color: #000;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar thead .weekend { /* How a weekend day name shows in header */\n");
      out.write("  color: #c44;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar thead .hilite { /* How do the buttons in header appear when hover */\n");
      out.write("  background: url(\"");
      out.print( path );
      out.write("/hover-bg.gif\");\n");
      out.write("  border-bottom: 1px solid #797979;\n");
      out.write("  padding: 2px 2px 1px 2px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar thead .active { /* Active (pressed) buttons in header */\n");
      out.write("  background: url(\"");
      out.print( path );
      out.write("/active-bg.gif\"); color: #fff;\n");
      out.write("  padding: 3px 1px 0px 3px;\n");
      out.write("  border-bottom: 1px solid #797979;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar thead .daynames { /* Row <TR> containing the day names */\n");
      out.write("  background: url(\"");
      out.print( path );
      out.write("/dark-bg.gif\");\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* The body part -- contains all the days in month. */\n");
      out.write("\n");
      out.write(".calendar tbody .day { /* Cells <TD> containing month days dates */\n");
      out.write("  font-family: verdana,tahoma,sans-serif;\n");
      out.write("  width: 2em;\n");
      out.write("  color: #000;\n");
      out.write("  text-align: right;\n");
      out.write("  padding: 2px 4px 2px 2px;\n");
      out.write("}\n");
      out.write(".calendar tbody .day.othermonth {\n");
      out.write("  font-size: 80%;\n");
      out.write("  color: #999;\n");
      out.write("}\n");
      out.write(".calendar tbody .day.othermonth.oweekend {\n");
      out.write("  color: #f99;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar table .wn {\n");
      out.write("  padding: 2px 3px 2px 2px;\n");
      out.write("  border-right: 1px solid #797979;\n");
      out.write("  background: url(\"");
      out.print( path );
      out.write("/dark-bg.gif\");\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar tbody .rowhilite td,\n");
      out.write(".calendar tbody .rowhilite td.wn {\n");
      out.write("  background: url(\"");
      out.print( path );
      out.write("/rowhover-bg.gif\");\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar tbody td.today { font-weight: bold; /* background: url(\"");
      out.print( path );
      out.write("/today-bg.gif\") no-repeat 70% 50%; */ }\n");
      out.write("\n");
      out.write(".calendar tbody td.hilite { /* Hovered cells <TD> */\n");
      out.write("  background: url(\"");
      out.print( path );
      out.write("/hover-bg.gif\");\n");
      out.write("  padding: 1px 3px 1px 1px;\n");
      out.write("  border: 1px solid #bbb;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar tbody td.active { /* Active (pressed) cells <TD> */\n");
      out.write("  padding: 2px 2px 0px 2px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar tbody td.weekend { /* Cells showing weekend days */\n");
      out.write("  color: #c44;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar tbody td.selected { /* Cell showing selected date */\n");
      out.write("  font-weight: bold;\n");
      out.write("  border: 1px solid #797979;\n");
      out.write("  padding: 1px 3px 1px 1px;\n");
      out.write("  background: url(\"");
      out.print( path );
      out.write("/active-bg.gif\"); color: #fff;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar tbody .disabled { color: #999; }\n");
      out.write("\n");
      out.write(".calendar tbody .emptycell { /* Empty cells (the best is to hide them) */\n");
      out.write("  visibility: hidden;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar tbody .emptyrow { /* Empty row (some months need less than 6 rows) */\n");
      out.write("  display: none;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* The footer part -- status bar and \"Close\" button */\n");
      out.write("\n");
      out.write(".calendar tfoot .footrow { /* The <TR> in footer (only one right now) */\n");
      out.write("  text-align: center;\n");
      out.write("  background: #565;\n");
      out.write("  color: #fff;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar tfoot .ttip { /* Tooltip (status bar) cell <TD> */\n");
      out.write("  padding: 2px;\n");
      out.write("  background: url(\"");
      out.print( path );
      out.write("/status-bg.gif\") repeat-x 0 0; color: #000;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar tfoot .hilite { /* Hover style for buttons in footer */\n");
      out.write("  background: #afa;\n");
      out.write("  border: 1px solid #084;\n");
      out.write("  color: #000;\n");
      out.write("  padding: 1px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar tfoot .active { /* Active (pressed) style for buttons in footer */\n");
      out.write("  background: #7c7;\n");
      out.write("  padding: 2px 0px 0px 2px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Combo boxes (menus that display months/years for direct selection) */\n");
      out.write("\n");
      out.write(".calendar .combo {\n");
      out.write("  position: absolute;\n");
      out.write("  display: none;\n");
      out.write("  top: 0px;\n");
      out.write("  left: 0px;\n");
      out.write("  width: 4em;\n");
      out.write("  cursor: default;\n");
      out.write("  border-width: 0 1px 1px 1px;\n");
      out.write("  border-style: solid;\n");
      out.write("  border-color: #797979;\n");
      out.write("  background: url(\"");
      out.print( path );
      out.write("/normal-bg.gif\"); color: #000;\n");
      out.write("  z-index: 100;\n");
      out.write("  font-size: 90%;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar .combo .label,\n");
      out.write(".calendar .combo .label-IEfix {\n");
      out.write("  text-align: center;\n");
      out.write("  padding: 1px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar .combo .label-IEfix {\n");
      out.write("  width: 4em;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar .combo .hilite {\n");
      out.write("  background: url(\"");
      out.print( path );
      out.write("/hover-bg.gif\"); color: #000;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar .combo .active {\n");
      out.write("  background: url(\"");
      out.print( path );
      out.write("/active-bg.gif\"); color: #fff;\n");
      out.write("  font-weight: bold;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar td.time {\n");
      out.write("  border-top: 1px solid #797979;\n");
      out.write("  padding: 1px 0px;\n");
      out.write("  text-align: center;\n");
      out.write("  background: url(\"");
      out.print( path );
      out.write("/dark-bg.gif\");\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar td.time .hour,\n");
      out.write(".calendar td.time .minute,\n");
      out.write(".calendar td.time .ampm {\n");
      out.write("  padding: 0px 5px 0px 6px;\n");
      out.write("  font-weight: bold;\n");
      out.write("  background: url(\"");
      out.print( path );
      out.write("/normal-bg.gif\"); color: #000;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar td.time .hour,\n");
      out.write(".calendar td.time .minute {\n");
      out.write("  font-family: monospace;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar td.time .ampm {\n");
      out.write("  text-align: center;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar td.time .colon {\n");
      out.write("  padding: 0px 2px 0px 3px;\n");
      out.write("  font-weight: bold;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar td.time span.hilite {\n");
      out.write("  background: url(\"");
      out.print( path );
      out.write("/hover-bg.gif\"); color: #000;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar td.time span.active {\n");
      out.write("  background: url(\"");
      out.print( path );
      out.write("/active-bg.gif\"); color: #fff;\n");
      out.write("}\n");
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
