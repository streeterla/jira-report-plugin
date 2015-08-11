package org.apache.jsp.secure.views.browser;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class browseproject_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/WEB-INF/tld/webwork.tld");
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fwebwork_005fiterator_0026_005fvalue;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fwebwork_005fiterator_0026_005fvalue_005fstatus;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fwebwork_005felse;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fwebwork_005furl_0026_005fvalue_005fatltoken;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fwebwork_005fparam_0026_005fvalue_005fname_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fescape_005fnobody;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fwebwork_005fiterator_0026_005fvalue = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fwebwork_005fiterator_0026_005fvalue_005fstatus = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fwebwork_005felse = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fwebwork_005furl_0026_005fvalue_005fatltoken = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fwebwork_005fparam_0026_005fvalue_005fname_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fescape_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.release();
    _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.release();
    _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.release();
    _005fjspx_005ftagPool_005fwebwork_005fiterator_0026_005fvalue.release();
    _005fjspx_005ftagPool_005fwebwork_005fiterator_0026_005fvalue_005fstatus.release();
    _005fjspx_005ftagPool_005fwebwork_005felse.release();
    _005fjspx_005ftagPool_005fwebwork_005furl_0026_005fvalue_005fatltoken.release();
    _005fjspx_005ftagPool_005fwebwork_005fparam_0026_005fvalue_005fname_005fnobody.release();
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
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>");
      if (_jspx_meth_webwork_005fproperty_005f0(_jspx_page_context))
        return;
      out.write("</title>\n");
      out.write("    <meta name=\"decorator\" content=\"general\" />\n");
      out.write("    <content tag=\"section\">browse_link</content>\n");
      out.write("</head>\n");
      out.write("<body class=\"type-aa\">\n");
      out.write("<script type=\"text/javascript\">window.dhtmlHistory.create();</script>\n");
      out.write("\n");
      out.write("<div class=\"item-header\" id=\"content-top\">\n");
      out.write("\n");
      //  webwork:if
      webwork.view.taglib.IfTag _jspx_th_webwork_005fif_005f0 = (webwork.view.taglib.IfTag) _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.get(webwork.view.taglib.IfTag.class);
      _jspx_th_webwork_005fif_005f0.setPageContext(_jspx_page_context);
      _jspx_th_webwork_005fif_005f0.setParent(null);
      // /secure/views/browser/browseproject.jsp(13,0) name = test type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_webwork_005fif_005f0.setTest("/hasCreateIssuePermissionForProject == true");
      int _jspx_eval_webwork_005fif_005f0 = _jspx_th_webwork_005fif_005f0.doStartTag();
      if (_jspx_eval_webwork_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("    <div id=\"create-issue\">\n");
          out.write("        <h2>");
          if (_jspx_meth_webwork_005ftext_005f0(_jspx_th_webwork_005fif_005f0, _jspx_page_context))
            return;
          out.write(":</h2>\n");
          out.write("        <ul class=\"operations\">\n");
          out.write("            ");
          //  webwork:iterator
          webwork.view.taglib.IteratorTag _jspx_th_webwork_005fiterator_005f0 = (webwork.view.taglib.IteratorTag) _005fjspx_005ftagPool_005fwebwork_005fiterator_0026_005fvalue.get(webwork.view.taglib.IteratorTag.class);
          _jspx_th_webwork_005fiterator_005f0.setPageContext(_jspx_page_context);
          _jspx_th_webwork_005fiterator_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fif_005f0);
          // /secure/views/browser/browseproject.jsp(17,12) name = value type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
          _jspx_th_webwork_005fiterator_005f0.setValue("/popularIssueTypes");
          int _jspx_eval_webwork_005fiterator_005f0 = _jspx_th_webwork_005fiterator_005f0.doStartTag();
          if (_jspx_eval_webwork_005fiterator_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            if (_jspx_eval_webwork_005fiterator_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
              out = _jspx_page_context.pushBody();
              _jspx_th_webwork_005fiterator_005f0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
              _jspx_th_webwork_005fiterator_005f0.doInitBody();
            }
            do {
              out.write("\n");
              out.write("                <li>\n");
              out.write("                    <a class=\"lnk\" title=\"");
              if (_jspx_meth_webwork_005fproperty_005f1(_jspx_th_webwork_005fiterator_005f0, _jspx_page_context))
                return;
              out.write("\" href=\"");
              out.print( request.getContextPath() );
              out.write("/secure/CreateIssue.jspa?pid=");
              if (_jspx_meth_webwork_005fproperty_005f2(_jspx_th_webwork_005fiterator_005f0, _jspx_page_context))
                return;
              out.write("&issuetype=");
              if (_jspx_meth_webwork_005fproperty_005f3(_jspx_th_webwork_005fiterator_005f0, _jspx_page_context))
                return;
              out.write("\"><img src=\"");
              out.print( request.getContextPath() );
              if (_jspx_meth_webwork_005fproperty_005f4(_jspx_th_webwork_005fiterator_005f0, _jspx_page_context))
                return;
              out.write("\" alt=\"\"/>");
              if (_jspx_meth_webwork_005fproperty_005f5(_jspx_th_webwork_005fiterator_005f0, _jspx_page_context))
                return;
              out.write("</a>\n");
              out.write("                </li>\n");
              out.write("            ");
              int evalDoAfterBody = _jspx_th_webwork_005fiterator_005f0.doAfterBody();
              if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
                break;
            } while (true);
            if (_jspx_eval_webwork_005fiterator_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
              out = _jspx_page_context.popBody();
            }
          }
          if (_jspx_th_webwork_005fiterator_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
            _005fjspx_005ftagPool_005fwebwork_005fiterator_0026_005fvalue.reuse(_jspx_th_webwork_005fiterator_005f0);
            return;
          }
          _005fjspx_005ftagPool_005fwebwork_005fiterator_0026_005fvalue.reuse(_jspx_th_webwork_005fiterator_005f0);
          out.write("\n");
          out.write("            ");
          //  webwork:if
          webwork.view.taglib.IfTag _jspx_th_webwork_005fif_005f1 = (webwork.view.taglib.IfTag) _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.get(webwork.view.taglib.IfTag.class);
          _jspx_th_webwork_005fif_005f1.setPageContext(_jspx_page_context);
          _jspx_th_webwork_005fif_005f1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fif_005f0);
          // /secure/views/browser/browseproject.jsp(22,12) name = test type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
          _jspx_th_webwork_005fif_005f1.setTest("/otherIssueTypes/empty == false");
          int _jspx_eval_webwork_005fif_005f1 = _jspx_th_webwork_005fif_005f1.doStartTag();
          if (_jspx_eval_webwork_005fif_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            do {
              out.write("\n");
              out.write("                <li class=\"aui-dd-parent\">\n");
              out.write("                    <a id=\"more\" class=\"lnk aui-dd-link standard no-icon\" href=\"#\" hidefocus title=\"");
              if (_jspx_meth_webwork_005ftext_005f1(_jspx_th_webwork_005fif_005f1, _jspx_page_context))
                return;
              out.write("\"><span>");
              if (_jspx_meth_webwork_005ftext_005f2(_jspx_th_webwork_005fif_005f1, _jspx_page_context))
                return;
              out.write("</span></a>\n");
              out.write("                    <ul id=\"more-dropdown\" class=\"aui-dropdown standard hidden images\">\n");
              out.write("                        ");
              //  webwork:iterator
              webwork.view.taglib.IteratorTag _jspx_th_webwork_005fiterator_005f1 = (webwork.view.taglib.IteratorTag) _005fjspx_005ftagPool_005fwebwork_005fiterator_0026_005fvalue.get(webwork.view.taglib.IteratorTag.class);
              _jspx_th_webwork_005fiterator_005f1.setPageContext(_jspx_page_context);
              _jspx_th_webwork_005fiterator_005f1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fif_005f1);
              // /secure/views/browser/browseproject.jsp(26,24) name = value type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
              _jspx_th_webwork_005fiterator_005f1.setValue("/otherIssueTypes");
              int _jspx_eval_webwork_005fiterator_005f1 = _jspx_th_webwork_005fiterator_005f1.doStartTag();
              if (_jspx_eval_webwork_005fiterator_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                if (_jspx_eval_webwork_005fiterator_005f1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                  out = _jspx_page_context.pushBody();
                  _jspx_th_webwork_005fiterator_005f1.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                  _jspx_th_webwork_005fiterator_005f1.doInitBody();
                }
                do {
                  out.write("\n");
                  out.write("                            <li class=\"dropdown-item\">\n");
                  out.write("                                <a title=\"");
                  if (_jspx_meth_webwork_005fproperty_005f6(_jspx_th_webwork_005fiterator_005f1, _jspx_page_context))
                    return;
                  out.write("\" href=\"");
                  out.print( request.getContextPath() );
                  out.write("/secure/CreateIssue.jspa?pid=");
                  if (_jspx_meth_webwork_005fproperty_005f7(_jspx_th_webwork_005fiterator_005f1, _jspx_page_context))
                    return;
                  out.write("&issuetype=");
                  if (_jspx_meth_webwork_005fproperty_005f8(_jspx_th_webwork_005fiterator_005f1, _jspx_page_context))
                    return;
                  out.write("\"><img src=\"");
                  out.print( request.getContextPath() );
                  if (_jspx_meth_webwork_005fproperty_005f9(_jspx_th_webwork_005fiterator_005f1, _jspx_page_context))
                    return;
                  out.write("\" alt=\"\"/>");
                  if (_jspx_meth_webwork_005fproperty_005f10(_jspx_th_webwork_005fiterator_005f1, _jspx_page_context))
                    return;
                  out.write("</a>\n");
                  out.write("                            </li>\n");
                  out.write("                        ");
                  int evalDoAfterBody = _jspx_th_webwork_005fiterator_005f1.doAfterBody();
                  if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
                    break;
                } while (true);
                if (_jspx_eval_webwork_005fiterator_005f1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                  out = _jspx_page_context.popBody();
                }
              }
              if (_jspx_th_webwork_005fiterator_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
                _005fjspx_005ftagPool_005fwebwork_005fiterator_0026_005fvalue.reuse(_jspx_th_webwork_005fiterator_005f1);
                return;
              }
              _005fjspx_005ftagPool_005fwebwork_005fiterator_0026_005fvalue.reuse(_jspx_th_webwork_005fiterator_005f1);
              out.write("\n");
              out.write("                    </ul>\n");
              out.write("                </li>\n");
              out.write("            ");
              int evalDoAfterBody = _jspx_th_webwork_005fif_005f1.doAfterBody();
              if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
                break;
            } while (true);
          }
          if (_jspx_th_webwork_005fif_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
            _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.reuse(_jspx_th_webwork_005fif_005f1);
            return;
          }
          _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.reuse(_jspx_th_webwork_005fif_005f1);
          out.write("\n");
          out.write("        </ul>\n");
          out.write("    </div>\n");
          int evalDoAfterBody = _jspx_th_webwork_005fif_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_webwork_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.reuse(_jspx_th_webwork_005fif_005f0);
        return;
      }
      _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.reuse(_jspx_th_webwork_005fif_005f0);
      out.write("\n");
      out.write("    \n");
      out.write("    <h1 class=\"item-name avatar\">\n");
      out.write("    ");
      //  webwork:if
      webwork.view.taglib.IfTag _jspx_th_webwork_005fif_005f2 = (webwork.view.taglib.IfTag) _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.get(webwork.view.taglib.IfTag.class);
      _jspx_th_webwork_005fif_005f2.setPageContext(_jspx_page_context);
      _jspx_th_webwork_005fif_005f2.setParent(null);
      // /secure/views/browser/browseproject.jsp(39,4) name = test type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_webwork_005fif_005f2.setTest("/project/avatar != null");
      int _jspx_eval_webwork_005fif_005f2 = _jspx_th_webwork_005fif_005f2.doStartTag();
      if (_jspx_eval_webwork_005fif_005f2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("        <img id=\"project-avatar\" alt=\"\" class=\"project-avatar-48\" height=\"48\" src=\"");
          out.print( request.getContextPath() );
          out.write("/secure/projectavatar?pid=");
          if (_jspx_meth_webwork_005fproperty_005f11(_jspx_th_webwork_005fif_005f2, _jspx_page_context))
            return;
          out.write("&avatarId=");
          if (_jspx_meth_webwork_005fproperty_005f12(_jspx_th_webwork_005fif_005f2, _jspx_page_context))
            return;
          out.write("&size=large\" width=\"48\">\n");
          out.write("    ");
          int evalDoAfterBody = _jspx_th_webwork_005fif_005f2.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_webwork_005fif_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.reuse(_jspx_th_webwork_005fif_005f2);
        return;
      }
      _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.reuse(_jspx_th_webwork_005fif_005f2);
      out.write("\n");
      out.write("        <span>");
      if (_jspx_meth_webwork_005fproperty_005f13(_jspx_page_context))
        return;
      out.write("</span>\n");
      out.write("    </h1>\n");
      out.write("    <h2 class=\"item-summary\">");
      if (_jspx_meth_webwork_005fproperty_005f14(_jspx_page_context))
        return;
      out.write("</h2>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<div id=\"main-content\">\n");
      out.write("    <ul class=\"vertical tabs\">\n");
      out.write("        ");
      if (_jspx_meth_webwork_005fiterator_005f2(_jspx_page_context))
        return;
      out.write("\n");
      out.write("    </ul>\n");
      out.write("    <div class=\"active-area\" id=\"project-tab\">\n");
      out.write("        ");
      if (_jspx_meth_webwork_005fproperty_005f18(_jspx_page_context))
        return;
      out.write("\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
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

  private boolean _jspx_meth_webwork_005fproperty_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:property
    webwork.view.taglib.PropertyTag _jspx_th_webwork_005fproperty_005f0 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_webwork_005fproperty_005f0.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fproperty_005f0.setParent(null);
    // /secure/views/browser/browseproject.jsp(4,11) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f0.setValue("/project/name");
    int _jspx_eval_webwork_005fproperty_005f0 = _jspx_th_webwork_005fproperty_005f0.doStartTag();
    if (_jspx_th_webwork_005fproperty_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f0);
    return false;
  }

  private boolean _jspx_meth_webwork_005ftext_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fif_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:text
    com.atlassian.jira.web.tags.TextTag _jspx_th_webwork_005ftext_005f0 = (com.atlassian.jira.web.tags.TextTag) _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.get(com.atlassian.jira.web.tags.TextTag.class);
    _jspx_th_webwork_005ftext_005f0.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005ftext_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fif_005f0);
    // /secure/views/browser/browseproject.jsp(15,12) name = name type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005ftext_005f0.setName("'common.words.create'");
    int _jspx_eval_webwork_005ftext_005f0 = _jspx_th_webwork_005ftext_005f0.doStartTag();
    if (_jspx_th_webwork_005ftext_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.reuse(_jspx_th_webwork_005ftext_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.reuse(_jspx_th_webwork_005ftext_005f0);
    return false;
  }

  private boolean _jspx_meth_webwork_005fproperty_005f1(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fiterator_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:property
    webwork.view.taglib.PropertyTag _jspx_th_webwork_005fproperty_005f1 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_webwork_005fproperty_005f1.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fproperty_005f1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fiterator_005f0);
    // /secure/views/browser/browseproject.jsp(19,42) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f1.setValue("./descTranslation");
    int _jspx_eval_webwork_005fproperty_005f1 = _jspx_th_webwork_005fproperty_005f1.doStartTag();
    if (_jspx_th_webwork_005fproperty_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f1);
    return false;
  }

  private boolean _jspx_meth_webwork_005fproperty_005f2(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fiterator_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:property
    webwork.view.taglib.PropertyTag _jspx_th_webwork_005fproperty_005f2 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_webwork_005fproperty_005f2.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fproperty_005f2.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fiterator_005f0);
    // /secure/views/browser/browseproject.jsp(19,155) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f2.setValue("/project/id");
    int _jspx_eval_webwork_005fproperty_005f2 = _jspx_th_webwork_005fproperty_005f2.doStartTag();
    if (_jspx_th_webwork_005fproperty_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f2);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f2);
    return false;
  }

  private boolean _jspx_meth_webwork_005fproperty_005f3(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fiterator_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:property
    webwork.view.taglib.PropertyTag _jspx_th_webwork_005fproperty_005f3 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_webwork_005fproperty_005f3.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fproperty_005f3.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fiterator_005f0);
    // /secure/views/browser/browseproject.jsp(19,206) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f3.setValue("./id");
    int _jspx_eval_webwork_005fproperty_005f3 = _jspx_th_webwork_005fproperty_005f3.doStartTag();
    if (_jspx_th_webwork_005fproperty_005f3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f3);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f3);
    return false;
  }

  private boolean _jspx_meth_webwork_005fproperty_005f4(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fiterator_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:property
    webwork.view.taglib.PropertyTag _jspx_th_webwork_005fproperty_005f4 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_webwork_005fproperty_005f4.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fproperty_005f4.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fiterator_005f0);
    // /secure/views/browser/browseproject.jsp(19,282) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f4.setValue("./iconUrl");
    int _jspx_eval_webwork_005fproperty_005f4 = _jspx_th_webwork_005fproperty_005f4.doStartTag();
    if (_jspx_th_webwork_005fproperty_005f4.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f4);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f4);
    return false;
  }

  private boolean _jspx_meth_webwork_005fproperty_005f5(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fiterator_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:property
    webwork.view.taglib.PropertyTag _jspx_th_webwork_005fproperty_005f5 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_webwork_005fproperty_005f5.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fproperty_005f5.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fiterator_005f0);
    // /secure/views/browser/browseproject.jsp(19,329) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f5.setValue("./nameTranslation");
    int _jspx_eval_webwork_005fproperty_005f5 = _jspx_th_webwork_005fproperty_005f5.doStartTag();
    if (_jspx_th_webwork_005fproperty_005f5.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f5);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f5);
    return false;
  }

  private boolean _jspx_meth_webwork_005ftext_005f1(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fif_005f1, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:text
    com.atlassian.jira.web.tags.TextTag _jspx_th_webwork_005ftext_005f1 = (com.atlassian.jira.web.tags.TextTag) _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.get(com.atlassian.jira.web.tags.TextTag.class);
    _jspx_th_webwork_005ftext_005f1.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005ftext_005f1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fif_005f1);
    // /secure/views/browser/browseproject.jsp(24,100) name = name type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005ftext_005f1.setName("'browseproject.create.other.issue.type'");
    int _jspx_eval_webwork_005ftext_005f1 = _jspx_th_webwork_005ftext_005f1.doStartTag();
    if (_jspx_th_webwork_005ftext_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.reuse(_jspx_th_webwork_005ftext_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.reuse(_jspx_th_webwork_005ftext_005f1);
    return false;
  }

  private boolean _jspx_meth_webwork_005ftext_005f2(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fif_005f1, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:text
    com.atlassian.jira.web.tags.TextTag _jspx_th_webwork_005ftext_005f2 = (com.atlassian.jira.web.tags.TextTag) _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.get(com.atlassian.jira.web.tags.TextTag.class);
    _jspx_th_webwork_005ftext_005f2.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005ftext_005f2.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fif_005f1);
    // /secure/views/browser/browseproject.jsp(24,171) name = name type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005ftext_005f2.setName("'common.words.other.no.dots'");
    int _jspx_eval_webwork_005ftext_005f2 = _jspx_th_webwork_005ftext_005f2.doStartTag();
    if (_jspx_th_webwork_005ftext_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.reuse(_jspx_th_webwork_005ftext_005f2);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.reuse(_jspx_th_webwork_005ftext_005f2);
    return false;
  }

  private boolean _jspx_meth_webwork_005fproperty_005f6(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fiterator_005f1, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:property
    webwork.view.taglib.PropertyTag _jspx_th_webwork_005fproperty_005f6 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_webwork_005fproperty_005f6.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fproperty_005f6.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fiterator_005f1);
    // /secure/views/browser/browseproject.jsp(28,42) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f6.setValue("./descTranslation");
    int _jspx_eval_webwork_005fproperty_005f6 = _jspx_th_webwork_005fproperty_005f6.doStartTag();
    if (_jspx_th_webwork_005fproperty_005f6.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f6);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f6);
    return false;
  }

  private boolean _jspx_meth_webwork_005fproperty_005f7(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fiterator_005f1, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:property
    webwork.view.taglib.PropertyTag _jspx_th_webwork_005fproperty_005f7 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_webwork_005fproperty_005f7.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fproperty_005f7.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fiterator_005f1);
    // /secure/views/browser/browseproject.jsp(28,155) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f7.setValue("/project/id");
    int _jspx_eval_webwork_005fproperty_005f7 = _jspx_th_webwork_005fproperty_005f7.doStartTag();
    if (_jspx_th_webwork_005fproperty_005f7.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f7);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f7);
    return false;
  }

  private boolean _jspx_meth_webwork_005fproperty_005f8(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fiterator_005f1, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:property
    webwork.view.taglib.PropertyTag _jspx_th_webwork_005fproperty_005f8 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_webwork_005fproperty_005f8.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fproperty_005f8.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fiterator_005f1);
    // /secure/views/browser/browseproject.jsp(28,206) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f8.setValue("./id");
    int _jspx_eval_webwork_005fproperty_005f8 = _jspx_th_webwork_005fproperty_005f8.doStartTag();
    if (_jspx_th_webwork_005fproperty_005f8.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f8);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f8);
    return false;
  }

  private boolean _jspx_meth_webwork_005fproperty_005f9(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fiterator_005f1, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:property
    webwork.view.taglib.PropertyTag _jspx_th_webwork_005fproperty_005f9 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_webwork_005fproperty_005f9.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fproperty_005f9.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fiterator_005f1);
    // /secure/views/browser/browseproject.jsp(28,282) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f9.setValue("./iconUrl");
    int _jspx_eval_webwork_005fproperty_005f9 = _jspx_th_webwork_005fproperty_005f9.doStartTag();
    if (_jspx_th_webwork_005fproperty_005f9.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f9);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f9);
    return false;
  }

  private boolean _jspx_meth_webwork_005fproperty_005f10(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fiterator_005f1, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:property
    webwork.view.taglib.PropertyTag _jspx_th_webwork_005fproperty_005f10 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_webwork_005fproperty_005f10.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fproperty_005f10.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fiterator_005f1);
    // /secure/views/browser/browseproject.jsp(28,329) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f10.setValue("./nameTranslation");
    int _jspx_eval_webwork_005fproperty_005f10 = _jspx_th_webwork_005fproperty_005f10.doStartTag();
    if (_jspx_th_webwork_005fproperty_005f10.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f10);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f10);
    return false;
  }

  private boolean _jspx_meth_webwork_005fproperty_005f11(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fif_005f2, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:property
    webwork.view.taglib.PropertyTag _jspx_th_webwork_005fproperty_005f11 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_webwork_005fproperty_005f11.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fproperty_005f11.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fif_005f2);
    // /secure/views/browser/browseproject.jsp(40,140) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f11.setValue("/project/id");
    int _jspx_eval_webwork_005fproperty_005f11 = _jspx_th_webwork_005fproperty_005f11.doStartTag();
    if (_jspx_th_webwork_005fproperty_005f11.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f11);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f11);
    return false;
  }

  private boolean _jspx_meth_webwork_005fproperty_005f12(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fif_005f2, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:property
    webwork.view.taglib.PropertyTag _jspx_th_webwork_005fproperty_005f12 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_webwork_005fproperty_005f12.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fproperty_005f12.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fif_005f2);
    // /secure/views/browser/browseproject.jsp(40,189) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f12.setValue("/project/avatar/id");
    int _jspx_eval_webwork_005fproperty_005f12 = _jspx_th_webwork_005fproperty_005f12.doStartTag();
    if (_jspx_th_webwork_005fproperty_005f12.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f12);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f12);
    return false;
  }

  private boolean _jspx_meth_webwork_005fproperty_005f13(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:property
    webwork.view.taglib.PropertyTag _jspx_th_webwork_005fproperty_005f13 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_webwork_005fproperty_005f13.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fproperty_005f13.setParent(null);
    // /secure/views/browser/browseproject.jsp(42,14) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f13.setValue("/project/name");
    int _jspx_eval_webwork_005fproperty_005f13 = _jspx_th_webwork_005fproperty_005f13.doStartTag();
    if (_jspx_th_webwork_005fproperty_005f13.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f13);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f13);
    return false;
  }

  private boolean _jspx_meth_webwork_005fproperty_005f14(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:property
    webwork.view.taglib.PropertyTag _jspx_th_webwork_005fproperty_005f14 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_webwork_005fproperty_005f14.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fproperty_005f14.setParent(null);
    // /secure/views/browser/browseproject.jsp(44,29) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f14.setValue("/project/name");
    int _jspx_eval_webwork_005fproperty_005f14 = _jspx_th_webwork_005fproperty_005f14.doStartTag();
    if (_jspx_th_webwork_005fproperty_005f14.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f14);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f14);
    return false;
  }

  private boolean _jspx_meth_webwork_005fiterator_005f2(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:iterator
    webwork.view.taglib.IteratorTag _jspx_th_webwork_005fiterator_005f2 = (webwork.view.taglib.IteratorTag) _005fjspx_005ftagPool_005fwebwork_005fiterator_0026_005fvalue_005fstatus.get(webwork.view.taglib.IteratorTag.class);
    _jspx_th_webwork_005fiterator_005f2.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fiterator_005f2.setParent(null);
    // /secure/views/browser/browseproject.jsp(49,8) name = value type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fiterator_005f2.setValue("/projectTabPanels");
    // /secure/views/browser/browseproject.jsp(49,8) name = status type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fiterator_005f2.setStatus("'status'");
    int _jspx_eval_webwork_005fiterator_005f2 = _jspx_th_webwork_005fiterator_005f2.doStartTag();
    if (_jspx_eval_webwork_005fiterator_005f2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      if (_jspx_eval_webwork_005fiterator_005f2 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.pushBody();
        _jspx_th_webwork_005fiterator_005f2.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
        _jspx_th_webwork_005fiterator_005f2.doInitBody();
      }
      do {
        out.write("\n");
        out.write("            <li class=\"");
        if (_jspx_meth_webwork_005fif_005f3(_jspx_th_webwork_005fiterator_005f2, _jspx_page_context))
          return true;
        out.write(' ');
        if (_jspx_meth_webwork_005fif_005f4(_jspx_th_webwork_005fiterator_005f2, _jspx_page_context))
          return true;
        out.write("\">\n");
        out.write("                <a class=\"browse-tab\" id=\"");
        if (_jspx_meth_webwork_005fif_005f5(_jspx_th_webwork_005fiterator_005f2, _jspx_page_context))
          return true;
        if (_jspx_meth_webwork_005felse_005f0(_jspx_th_webwork_005fiterator_005f2, _jspx_page_context))
          return true;
        out.write("-panel\" href=\"");
        if (_jspx_meth_webwork_005furl_005f0(_jspx_th_webwork_005fiterator_005f2, _jspx_page_context))
          return true;
        out.write("\" hidefocus><strong>");
        if (_jspx_meth_webwork_005fproperty_005f17(_jspx_th_webwork_005fiterator_005f2, _jspx_page_context))
          return true;
        out.write("</strong></a>\n");
        out.write("            </li>\n");
        out.write("        ");
        int evalDoAfterBody = _jspx_th_webwork_005fiterator_005f2.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
      if (_jspx_eval_webwork_005fiterator_005f2 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.popBody();
      }
    }
    if (_jspx_th_webwork_005fiterator_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fiterator_0026_005fvalue_005fstatus.reuse(_jspx_th_webwork_005fiterator_005f2);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fiterator_0026_005fvalue_005fstatus.reuse(_jspx_th_webwork_005fiterator_005f2);
    return false;
  }

  private boolean _jspx_meth_webwork_005fif_005f3(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fiterator_005f2, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:if
    webwork.view.taglib.IfTag _jspx_th_webwork_005fif_005f3 = (webwork.view.taglib.IfTag) _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.get(webwork.view.taglib.IfTag.class);
    _jspx_th_webwork_005fif_005f3.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fif_005f3.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fiterator_005f2);
    // /secure/views/browser/browseproject.jsp(50,23) name = test type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fif_005f3.setTest("/selected == completeKey");
    int _jspx_eval_webwork_005fif_005f3 = _jspx_th_webwork_005fif_005f3.doStartTag();
    if (_jspx_eval_webwork_005fif_005f3 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("active");
        int evalDoAfterBody = _jspx_th_webwork_005fif_005f3.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_webwork_005fif_005f3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.reuse(_jspx_th_webwork_005fif_005f3);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.reuse(_jspx_th_webwork_005fif_005f3);
    return false;
  }

  private boolean _jspx_meth_webwork_005fif_005f4(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fiterator_005f2, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:if
    webwork.view.taglib.IfTag _jspx_th_webwork_005fif_005f4 = (webwork.view.taglib.IfTag) _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.get(webwork.view.taglib.IfTag.class);
    _jspx_th_webwork_005fif_005f4.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fif_005f4.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fiterator_005f2);
    // /secure/views/browser/browseproject.jsp(50,87) name = test type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fif_005f4.setTest("@status/first == true");
    int _jspx_eval_webwork_005fif_005f4 = _jspx_th_webwork_005fif_005f4.doStartTag();
    if (_jspx_eval_webwork_005fif_005f4 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write(" first");
        int evalDoAfterBody = _jspx_th_webwork_005fif_005f4.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_webwork_005fif_005f4.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.reuse(_jspx_th_webwork_005fif_005f4);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.reuse(_jspx_th_webwork_005fif_005f4);
    return false;
  }

  private boolean _jspx_meth_webwork_005fif_005f5(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fiterator_005f2, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:if
    webwork.view.taglib.IfTag _jspx_th_webwork_005fif_005f5 = (webwork.view.taglib.IfTag) _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.get(webwork.view.taglib.IfTag.class);
    _jspx_th_webwork_005fif_005f5.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fif_005f5.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fiterator_005f2);
    // /secure/views/browser/browseproject.jsp(51,42) name = test type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fif_005f5.setTest("./completeKey/startsWith('com.atlassian.jira.plugin.system.')");
    int _jspx_eval_webwork_005fif_005f5 = _jspx_th_webwork_005fif_005f5.doStartTag();
    if (_jspx_eval_webwork_005fif_005f5 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        if (_jspx_meth_webwork_005fproperty_005f15(_jspx_th_webwork_005fif_005f5, _jspx_page_context))
          return true;
        int evalDoAfterBody = _jspx_th_webwork_005fif_005f5.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_webwork_005fif_005f5.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.reuse(_jspx_th_webwork_005fif_005f5);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.reuse(_jspx_th_webwork_005fif_005f5);
    return false;
  }

  private boolean _jspx_meth_webwork_005fproperty_005f15(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fif_005f5, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:property
    webwork.view.taglib.PropertyTag _jspx_th_webwork_005fproperty_005f15 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_webwork_005fproperty_005f15.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fproperty_005f15.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fif_005f5);
    // /secure/views/browser/browseproject.jsp(51,123) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f15.setValue("./key");
    int _jspx_eval_webwork_005fproperty_005f15 = _jspx_th_webwork_005fproperty_005f15.doStartTag();
    if (_jspx_th_webwork_005fproperty_005f15.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f15);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f15);
    return false;
  }

  private boolean _jspx_meth_webwork_005felse_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fiterator_005f2, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:else
    webwork.view.taglib.ElseTag _jspx_th_webwork_005felse_005f0 = (webwork.view.taglib.ElseTag) _005fjspx_005ftagPool_005fwebwork_005felse.get(webwork.view.taglib.ElseTag.class);
    _jspx_th_webwork_005felse_005f0.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005felse_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fiterator_005f2);
    int _jspx_eval_webwork_005felse_005f0 = _jspx_th_webwork_005felse_005f0.doStartTag();
    if (_jspx_eval_webwork_005felse_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        if (_jspx_meth_webwork_005fproperty_005f16(_jspx_th_webwork_005felse_005f0, _jspx_page_context))
          return true;
        int evalDoAfterBody = _jspx_th_webwork_005felse_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_webwork_005felse_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005felse.reuse(_jspx_th_webwork_005felse_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005felse.reuse(_jspx_th_webwork_005felse_005f0);
    return false;
  }

  private boolean _jspx_meth_webwork_005fproperty_005f16(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005felse_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:property
    webwork.view.taglib.PropertyTag _jspx_th_webwork_005fproperty_005f16 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_webwork_005fproperty_005f16.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fproperty_005f16.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005felse_005f0);
    // /secure/views/browser/browseproject.jsp(51,183) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f16.setValue("./completeKey");
    int _jspx_eval_webwork_005fproperty_005f16 = _jspx_th_webwork_005fproperty_005f16.doStartTag();
    if (_jspx_th_webwork_005fproperty_005f16.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f16);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f16);
    return false;
  }

  private boolean _jspx_meth_webwork_005furl_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fiterator_005f2, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:url
    com.atlassian.jira.web.tags.URLTag _jspx_th_webwork_005furl_005f0 = (com.atlassian.jira.web.tags.URLTag) _005fjspx_005ftagPool_005fwebwork_005furl_0026_005fvalue_005fatltoken.get(com.atlassian.jira.web.tags.URLTag.class);
    _jspx_th_webwork_005furl_005f0.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005furl_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fiterator_005f2);
    // /secure/views/browser/browseproject.jsp(51,253) name = value type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005furl_005f0.setValue("'/browse/' + /project/key");
    // /secure/views/browser/browseproject.jsp(51,253) name = atltoken type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005furl_005f0.setAtltoken(false);
    int _jspx_eval_webwork_005furl_005f0 = _jspx_th_webwork_005furl_005f0.doStartTag();
    if (_jspx_eval_webwork_005furl_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      if (_jspx_eval_webwork_005furl_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.pushBody();
        _jspx_th_webwork_005furl_005f0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
        _jspx_th_webwork_005furl_005f0.doInitBody();
      }
      do {
        if (_jspx_meth_webwork_005fparam_005f0(_jspx_th_webwork_005furl_005f0, _jspx_page_context))
          return true;
        int evalDoAfterBody = _jspx_th_webwork_005furl_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
      if (_jspx_eval_webwork_005furl_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.popBody();
      }
    }
    if (_jspx_th_webwork_005furl_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005furl_0026_005fvalue_005fatltoken.reuse(_jspx_th_webwork_005furl_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005furl_0026_005fvalue_005fatltoken.reuse(_jspx_th_webwork_005furl_005f0);
    return false;
  }

  private boolean _jspx_meth_webwork_005fparam_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005furl_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:param
    webwork.view.taglib.ParamTag _jspx_th_webwork_005fparam_005f0 = (webwork.view.taglib.ParamTag) _005fjspx_005ftagPool_005fwebwork_005fparam_0026_005fvalue_005fname_005fnobody.get(webwork.view.taglib.ParamTag.class);
    _jspx_th_webwork_005fparam_005f0.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fparam_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005furl_005f0);
    // /secure/views/browser/browseproject.jsp(51,317) name = name type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fparam_005f0.setName("'selectedTab'");
    // /secure/views/browser/browseproject.jsp(51,317) name = value type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fparam_005f0.setValue("completeKey");
    int _jspx_eval_webwork_005fparam_005f0 = _jspx_th_webwork_005fparam_005f0.doStartTag();
    if (_jspx_th_webwork_005fparam_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fparam_0026_005fvalue_005fname_005fnobody.reuse(_jspx_th_webwork_005fparam_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fparam_0026_005fvalue_005fname_005fnobody.reuse(_jspx_th_webwork_005fparam_005f0);
    return false;
  }

  private boolean _jspx_meth_webwork_005fproperty_005f17(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fiterator_005f2, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:property
    webwork.view.taglib.PropertyTag _jspx_th_webwork_005fproperty_005f17 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_webwork_005fproperty_005f17.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fproperty_005f17.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fiterator_005f2);
    // /secure/views/browser/browseproject.jsp(51,408) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f17.setValue("label");
    int _jspx_eval_webwork_005fproperty_005f17 = _jspx_th_webwork_005fproperty_005f17.doStartTag();
    if (_jspx_th_webwork_005fproperty_005f17.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f17);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f17);
    return false;
  }

  private boolean _jspx_meth_webwork_005fproperty_005f18(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:property
    webwork.view.taglib.PropertyTag _jspx_th_webwork_005fproperty_005f18 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fescape_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_webwork_005fproperty_005f18.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fproperty_005f18.setParent(null);
    // /secure/views/browser/browseproject.jsp(56,8) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f18.setValue("/tabHtml");
    // /secure/views/browser/browseproject.jsp(56,8) name = escape type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f18.setEscape(false);
    int _jspx_eval_webwork_005fproperty_005f18 = _jspx_th_webwork_005fproperty_005f18.doStartTag();
    if (_jspx_th_webwork_005fproperty_005f18.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fescape_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f18);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fescape_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f18);
    return false;
  }
}
