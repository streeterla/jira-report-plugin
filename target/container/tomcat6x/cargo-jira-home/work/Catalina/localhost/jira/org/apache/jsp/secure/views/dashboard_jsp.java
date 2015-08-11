package org.apache.jsp.secure.views;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.atlassian.jira.web.util.ExternalLinkUtilImpl;

public final class dashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/WEB-INF/tld/webwork.tld");
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fwebwork_005fparam_0026_005fname;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fescape_005fnobody;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fwebwork_005fparam_0026_005fname = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fescape_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname.release();
    _005fjspx_005ftagPool_005fwebwork_005fparam_0026_005fname.release();
    _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.release();
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fescape_005fnobody.release();
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <content tag=\"section\">home_link</content>\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("        AJS.$(document).ready(function() {\n");
      out.write("            AJS.warnAboutFirebug(AJS.params.firebugWarning);\n");
      out.write("        });\n");
      out.write("    </script>\n");
      out.write("</head>\n");
      out.write("    <body>\n");
      out.write("        <fieldset class=\"hidden parameters\">\n");
      out.write("            <input type=\"hidden\" id=\"firebugWarning\" value=\"");
      //  webwork:text
      com.atlassian.jira.web.tags.TextTag _jspx_th_webwork_005ftext_005f0 = (com.atlassian.jira.web.tags.TextTag) _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname.get(com.atlassian.jira.web.tags.TextTag.class);
      _jspx_th_webwork_005ftext_005f0.setPageContext(_jspx_page_context);
      _jspx_th_webwork_005ftext_005f0.setParent(null);
      // /secure/views/dashboard.jsp(14,60) name = name type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_webwork_005ftext_005f0.setName("'firebug.performance.warning'");
      int _jspx_eval_webwork_005ftext_005f0 = _jspx_th_webwork_005ftext_005f0.doStartTag();
      if (_jspx_eval_webwork_005ftext_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        if (_jspx_eval_webwork_005ftext_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
          out = _jspx_page_context.pushBody();
          _jspx_th_webwork_005ftext_005f0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
          _jspx_th_webwork_005ftext_005f0.doInitBody();
        }
        do {
          out.write("\n");
          out.write("            ");
          //  webwork:param
          webwork.view.taglib.ParamTag _jspx_th_webwork_005fparam_005f0 = (webwork.view.taglib.ParamTag) _005fjspx_005ftagPool_005fwebwork_005fparam_0026_005fname.get(webwork.view.taglib.ParamTag.class);
          _jspx_th_webwork_005fparam_005f0.setPageContext(_jspx_page_context);
          _jspx_th_webwork_005fparam_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005ftext_005f0);
          // /secure/views/dashboard.jsp(15,12) name = name type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
          _jspx_th_webwork_005fparam_005f0.setName("'value0'");
          int _jspx_eval_webwork_005fparam_005f0 = _jspx_th_webwork_005fparam_005f0.doStartTag();
          if (_jspx_eval_webwork_005fparam_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            if (_jspx_eval_webwork_005fparam_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
              out = _jspx_page_context.pushBody();
              _jspx_th_webwork_005fparam_005f0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
              _jspx_th_webwork_005fparam_005f0.doInitBody();
            }
            do {
              out.write("<a href='");
              out.print(ExternalLinkUtilImpl.getInstance().getProperty("external.link.jira.firebug.warning"));
              out.write('\'');
              out.write('>');
              int evalDoAfterBody = _jspx_th_webwork_005fparam_005f0.doAfterBody();
              if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
                break;
            } while (true);
            if (_jspx_eval_webwork_005fparam_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
              out = _jspx_page_context.popBody();
            }
          }
          if (_jspx_th_webwork_005fparam_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
            _005fjspx_005ftagPool_005fwebwork_005fparam_0026_005fname.reuse(_jspx_th_webwork_005fparam_005f0);
            return;
          }
          _005fjspx_005ftagPool_005fwebwork_005fparam_0026_005fname.reuse(_jspx_th_webwork_005fparam_005f0);
          out.write("\n");
          out.write("            ");
          if (_jspx_meth_webwork_005fparam_005f1(_jspx_th_webwork_005ftext_005f0, _jspx_page_context))
            return;
          out.write("\n");
          out.write("            ");
          int evalDoAfterBody = _jspx_th_webwork_005ftext_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
        if (_jspx_eval_webwork_005ftext_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
          out = _jspx_page_context.popBody();
        }
      }
      if (_jspx_th_webwork_005ftext_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname.reuse(_jspx_th_webwork_005ftext_005f0);
        return;
      }
      _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname.reuse(_jspx_th_webwork_005ftext_005f0);
      out.write("\">\n");
      out.write("        </fieldset>\n");
      out.write("        ");
      if (_jspx_meth_webwork_005fif_005f0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("        <div class=\"dashboard-contents\">\n");
      out.write("            ");
      if (_jspx_meth_webwork_005fproperty_005f1(_jspx_page_context))
        return;
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </body>    \n");
      out.write("</html>");
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

  private boolean _jspx_meth_webwork_005fparam_005f1(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005ftext_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:param
    webwork.view.taglib.ParamTag _jspx_th_webwork_005fparam_005f1 = (webwork.view.taglib.ParamTag) _005fjspx_005ftagPool_005fwebwork_005fparam_0026_005fname.get(webwork.view.taglib.ParamTag.class);
    _jspx_th_webwork_005fparam_005f1.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fparam_005f1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005ftext_005f0);
    // /secure/views/dashboard.jsp(16,12) name = name type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fparam_005f1.setName("'value1'");
    int _jspx_eval_webwork_005fparam_005f1 = _jspx_th_webwork_005fparam_005f1.doStartTag();
    if (_jspx_eval_webwork_005fparam_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      if (_jspx_eval_webwork_005fparam_005f1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.pushBody();
        _jspx_th_webwork_005fparam_005f1.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
        _jspx_th_webwork_005fparam_005f1.doInitBody();
      }
      do {
        out.write("</a>");
        int evalDoAfterBody = _jspx_th_webwork_005fparam_005f1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
      if (_jspx_eval_webwork_005fparam_005f1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.popBody();
      }
    }
    if (_jspx_th_webwork_005fparam_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fparam_0026_005fname.reuse(_jspx_th_webwork_005fparam_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fparam_0026_005fname.reuse(_jspx_th_webwork_005fparam_005f1);
    return false;
  }

  private boolean _jspx_meth_webwork_005fif_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:if
    webwork.view.taglib.IfTag _jspx_th_webwork_005fif_005f0 = (webwork.view.taglib.IfTag) _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.get(webwork.view.taglib.IfTag.class);
    _jspx_th_webwork_005fif_005f0.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fif_005f0.setParent(null);
    // /secure/views/dashboard.jsp(19,8) name = test type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fif_005f0.setTest("/warningMessage != null && /warningMessage/length != 0");
    int _jspx_eval_webwork_005fif_005f0 = _jspx_th_webwork_005fif_005f0.doStartTag();
    if (_jspx_eval_webwork_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("            <div id=\"dashmsg\" class=\"notify info\">\n");
        out.write("                ");
        if (_jspx_meth_webwork_005fproperty_005f0(_jspx_th_webwork_005fif_005f0, _jspx_page_context))
          return true;
        out.write("\n");
        out.write("            </div>\n");
        out.write("        ");
        int evalDoAfterBody = _jspx_th_webwork_005fif_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_webwork_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.reuse(_jspx_th_webwork_005fif_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.reuse(_jspx_th_webwork_005fif_005f0);
    return false;
  }

  private boolean _jspx_meth_webwork_005fproperty_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fif_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:property
    webwork.view.taglib.PropertyTag _jspx_th_webwork_005fproperty_005f0 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fescape_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_webwork_005fproperty_005f0.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fproperty_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fif_005f0);
    // /secure/views/dashboard.jsp(21,16) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f0.setValue("/warningMessage");
    // /secure/views/dashboard.jsp(21,16) name = escape type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f0.setEscape(false);
    int _jspx_eval_webwork_005fproperty_005f0 = _jspx_th_webwork_005fproperty_005f0.doStartTag();
    if (_jspx_th_webwork_005fproperty_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fescape_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fescape_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f0);
    return false;
  }

  private boolean _jspx_meth_webwork_005fproperty_005f1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:property
    webwork.view.taglib.PropertyTag _jspx_th_webwork_005fproperty_005f1 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fescape_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_webwork_005fproperty_005f1.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fproperty_005f1.setParent(null);
    // /secure/views/dashboard.jsp(25,12) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f1.setValue("/dashboardHtml");
    // /secure/views/dashboard.jsp(25,12) name = escape type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f1.setEscape(false);
    int _jspx_eval_webwork_005fproperty_005f1 = _jspx_th_webwork_005fproperty_005f1.doStartTag();
    if (_jspx_th_webwork_005fproperty_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fescape_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fescape_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f1);
    return false;
  }
}
