package org.apache.jsp.decorators.panels;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.commons.lang.StringUtils;

public final class jirapanel_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(3);
    _jspx_dependants.add("/includes/decorators/helplink.jsp");
    _jspx_dependants.add("/WEB-INF/tld/webwork.tld");
    _jspx_dependants.add("/WEB-INF/tld/sitemesh-decorator.tld");
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fdecorator_005fusePage_0026_005fid_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fwebwork_005fcomponent_0026_005ftemplate_005fname;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fwebwork_005fparam_0026_005fname;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fwebwork_005fiterator_0026_005fvalue;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fwebwork_005fproperty_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fdecorator_005fbody_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fwebwork_005felse;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fdecorator_005fusePage_0026_005fid_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fwebwork_005fcomponent_0026_005ftemplate_005fname = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fwebwork_005fparam_0026_005fname = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fwebwork_005fiterator_0026_005fvalue = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fwebwork_005fproperty_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fdecorator_005fbody_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fwebwork_005felse = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fdecorator_005fusePage_0026_005fid_005fnobody.release();
    _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.release();
    _005fjspx_005ftagPool_005fwebwork_005fcomponent_0026_005ftemplate_005fname.release();
    _005fjspx_005ftagPool_005fwebwork_005fparam_0026_005fname.release();
    _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.release();
    _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.release();
    _005fjspx_005ftagPool_005fwebwork_005fiterator_0026_005fvalue.release();
    _005fjspx_005ftagPool_005fwebwork_005fproperty_005fnobody.release();
    _005fjspx_005ftagPool_005fdecorator_005fbody_005fnobody.release();
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.release();
    _005fjspx_005ftagPool_005fwebwork_005felse.release();
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
      out.write("\n");
      out.write("\n");
      out.write('\n');
      //  decorator:usePage
      com.opensymphony.module.sitemesh.taglib.decorator.UsePageTag _jspx_th_decorator_005fusePage_005f0 = (com.opensymphony.module.sitemesh.taglib.decorator.UsePageTag) _005fjspx_005ftagPool_005fdecorator_005fusePage_0026_005fid_005fnobody.get(com.opensymphony.module.sitemesh.taglib.decorator.UsePageTag.class);
      _jspx_th_decorator_005fusePage_005f0.setPageContext(_jspx_page_context);
      _jspx_th_decorator_005fusePage_005f0.setParent(null);
      // /decorators/panels/jirapanel.jsp(11,0) name = id type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_decorator_005fusePage_005f0.setId("p");
      int _jspx_eval_decorator_005fusePage_005f0 = _jspx_th_decorator_005fusePage_005f0.doStartTag();
      if (_jspx_th_decorator_005fusePage_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fdecorator_005fusePage_0026_005fid_005fnobody.reuse(_jspx_th_decorator_005fusePage_005f0);
        return;
      }
      _005fjspx_005ftagPool_005fdecorator_005fusePage_0026_005fid_005fnobody.reuse(_jspx_th_decorator_005fusePage_005f0);
      com.opensymphony.module.sitemesh.Page p = null;
      p = (com.opensymphony.module.sitemesh.Page) _jspx_page_context.findAttribute("p");
      out.write("\n");
      out.write("\n");
      out.write("<table class=\"jiraform ");
      if (_jspx_meth_decorator_005fgetProperty_005f0(_jspx_page_context))
        return;
 if (!p.isPropertySet("width") || (p.isPropertySet("width") && p.getProperty("width").equals("100%"))){
      out.write(" maxWidth");
}
      out.write("\"\n");
      out.write("       ");
 if (p.isPropertySet("width") && !p.getProperty("width").equals("100%")){
      out.write("width=\"");
      if (_jspx_meth_decorator_005fgetProperty_005f1(_jspx_page_context))
        return;
      out.write('"');
}
      out.write("\n");
      out.write(">\n");
      out.write("\n");
 if (p.isPropertySet("title") && StringUtils.isNotBlank(p.getProperty("title"))) { 
      out.write("\n");
      out.write("<tr>\n");
      out.write("    <td class=\"jiraformheader\">\n");
      out.write("    ");
 if (p.isPropertySet("localHelpAction")) {
    String action = p.getProperty("localHelpAction");
 
      out.write("\n");
      out.write(" <a class=\"help-lnk\" href=");
      out.print(action);
      out.write("> <img src=\"");
      out.print( request.getContextPath() );
      out.write("/images/icons/help_blue.gif\"\n");
      out.write("    width=16 height=16 align=right border=0 alt=\"Test\"\n");
      out.write("    title=\"Get local help\"></a>\n");

}
if (p.isPropertySet("helpURL")) {
    String helpUrl = "'" + p.getProperty("helpURL") + "'";
    String helpURLFragment = "";
    if (p.isPropertySet("helpURLFragment"))
        helpURLFragment = p.getProperty("helpURLFragment"); 
      out.write("\n");
      out.write("    ");
      //  webwork:component
      webwork.view.taglib.ui.ComponentTag _jspx_th_webwork_005fcomponent_005f0 = (webwork.view.taglib.ui.ComponentTag) _005fjspx_005ftagPool_005fwebwork_005fcomponent_0026_005ftemplate_005fname.get(webwork.view.taglib.ui.ComponentTag.class);
      _jspx_th_webwork_005fcomponent_005f0.setPageContext(_jspx_page_context);
      _jspx_th_webwork_005fcomponent_005f0.setParent(null);
      // /includes/decorators/helplink.jsp(14,4) name = template type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_webwork_005fcomponent_005f0.setTemplate("help.jsp");
      // /includes/decorators/helplink.jsp(14,4) name = name type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_webwork_005fcomponent_005f0.setName( helpUrl );
      int _jspx_eval_webwork_005fcomponent_005f0 = _jspx_th_webwork_005fcomponent_005f0.doStartTag();
      if (_jspx_eval_webwork_005fcomponent_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        if (_jspx_eval_webwork_005fcomponent_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
          out = _jspx_page_context.pushBody();
          _jspx_th_webwork_005fcomponent_005f0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
          _jspx_th_webwork_005fcomponent_005f0.doInitBody();
        }
        do {
          out.write("\n");
          out.write("        ");
          //  webwork:param
          webwork.view.taglib.ParamTag _jspx_th_webwork_005fparam_005f0 = (webwork.view.taglib.ParamTag) _005fjspx_005ftagPool_005fwebwork_005fparam_0026_005fname.get(webwork.view.taglib.ParamTag.class);
          _jspx_th_webwork_005fparam_005f0.setPageContext(_jspx_page_context);
          _jspx_th_webwork_005fparam_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fcomponent_005f0);
          // /includes/decorators/helplink.jsp(15,8) name = name type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
          _jspx_th_webwork_005fparam_005f0.setName("'helpURLFragment'");
          int _jspx_eval_webwork_005fparam_005f0 = _jspx_th_webwork_005fparam_005f0.doStartTag();
          if (_jspx_eval_webwork_005fparam_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            if (_jspx_eval_webwork_005fparam_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
              out = _jspx_page_context.pushBody();
              _jspx_th_webwork_005fparam_005f0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
              _jspx_th_webwork_005fparam_005f0.doInitBody();
            }
            do {
              out.print( helpURLFragment );
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
          out.write("    ");
          int evalDoAfterBody = _jspx_th_webwork_005fcomponent_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
        if (_jspx_eval_webwork_005fcomponent_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
          out = _jspx_page_context.popBody();
        }
      }
      if (_jspx_th_webwork_005fcomponent_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fwebwork_005fcomponent_0026_005ftemplate_005fname.reuse(_jspx_th_webwork_005fcomponent_005f0);
        return;
      }
      _005fjspx_005ftagPool_005fwebwork_005fcomponent_0026_005ftemplate_005fname.reuse(_jspx_th_webwork_005fcomponent_005f0);
      out.write('\n');
 } 
      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("    <h3 class=\"formtitle\">");
      if (_jspx_meth_decorator_005fgetProperty_005f2(_jspx_page_context))
        return;
      out.write("</h3></td>\n");
      out.write("</tr>\n");
 } 
      out.write('\n');
 if (p.isPropertySet("description") && StringUtils.isNotBlank(p.getProperty("description"))) { 
      out.write("\n");
      out.write("<tr>\n");
      out.write("    <td class=\"jiraformheader\">");
      if (_jspx_meth_decorator_005fgetProperty_005f3(_jspx_page_context))
        return;
      out.write("</td>\n");
      out.write("</tr>\n");
 } 
      out.write('\n');
      out.write('	');
 if (p.isPropertySet("instructions") && StringUtils.isNotBlank(p.getProperty("instructions"))) { 
      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td class=\"instructions\">\n");
      out.write("        ");
      if (_jspx_meth_decorator_005fgetProperty_005f4(_jspx_page_context))
        return;
      out.write("\n");
      out.write("        </td>\n");
      out.write("\t</tr>\n");
      out.write("\t");
 } 
      out.write('\n');
      out.write('\n');
      if (_jspx_meth_webwork_005fif_005f0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("\n");
      out.write("    <tr>\n");
      out.write("    <td class=\"jiraformbody\">\n");
      out.write("        ");
      if (_jspx_meth_decorator_005fbody_005f0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("    </td>\n");
      out.write("    </tr>\n");
 if (p.isPropertySet("footerHtml")) { 
      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td class=\"darkFooter\">\n");
      out.write("            ");
      if (_jspx_meth_decorator_005fgetProperty_005f5(_jspx_page_context))
        return;
      out.write("\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
 }  else if (p.isPropertySet("cancelURI") || p.isPropertySet("buttons")){
      out.write("\n");
      out.write("    <tr>\n");
      out.write("        <td class=\"fullyCentered jiraformfooter\" >\n");
      out.write("\t\t\t");
 if (p.isPropertySet("buttons")) { 
      out.write("\n");
      out.write("                ");
      if (_jspx_meth_decorator_005fgetProperty_005f6(_jspx_page_context))
        return;
      out.write("\n");
      out.write("\t\t\t");
 } 
      out.write("\n");
      out.write("\t\t\t");
 if (p.isPropertySet("cancelURI")) { 
      out.write("\n");
      out.write("                <input id=\"cancelButton\"  type=\"button\"\n");
      out.write("                       accesskey=\"");
      if (_jspx_meth_webwork_005ftext_005f1(_jspx_page_context))
        return;
      out.write("\"\n");
      out.write("                       title=\"");
      if (_jspx_meth_webwork_005fproperty_005f1(_jspx_page_context))
        return;
      out.write(" (Alt + ");
      if (_jspx_meth_webwork_005ftext_005f2(_jspx_page_context))
        return;
      out.write(")\"\n");
      out.write("                       name=\"");
      if (_jspx_meth_decorator_005fgetProperty_005f7(_jspx_page_context))
        return;
      out.write("\"\n");
      out.write("                       value=\"");
      if (_jspx_meth_webwork_005fproperty_005f2(_jspx_page_context))
        return;
      out.write("\"\n");
      out.write("                       onclick=\"location.href='");
      if (_jspx_meth_webwork_005fif_005f1(_jspx_page_context))
        return;
      if (_jspx_meth_webwork_005felse_005f0(_jspx_page_context))
        return;
      out.write("'\"\n");
      out.write("                />\n");
      out.write("\t\t\t");
 } 
      out.write("\n");
      out.write("        </td>\n");
      out.write("    </tr>\n");
 } 
      out.write("\n");
      out.write("\n");
      out.write("</table>\n");
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

  private boolean _jspx_meth_decorator_005fgetProperty_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  decorator:getProperty
    com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag _jspx_th_decorator_005fgetProperty_005f0 = (com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag) _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.get(com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag.class);
    _jspx_th_decorator_005fgetProperty_005f0.setPageContext(_jspx_page_context);
    _jspx_th_decorator_005fgetProperty_005f0.setParent(null);
    // /decorators/panels/jirapanel.jsp(13,23) name = property type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_decorator_005fgetProperty_005f0.setProperty("class");
    int _jspx_eval_decorator_005fgetProperty_005f0 = _jspx_th_decorator_005fgetProperty_005f0.doStartTag();
    if (_jspx_th_decorator_005fgetProperty_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.reuse(_jspx_th_decorator_005fgetProperty_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.reuse(_jspx_th_decorator_005fgetProperty_005f0);
    return false;
  }

  private boolean _jspx_meth_decorator_005fgetProperty_005f1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  decorator:getProperty
    com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag _jspx_th_decorator_005fgetProperty_005f1 = (com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag) _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.get(com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag.class);
    _jspx_th_decorator_005fgetProperty_005f1.setPageContext(_jspx_page_context);
    _jspx_th_decorator_005fgetProperty_005f1.setParent(null);
    // /decorators/panels/jirapanel.jsp(14,91) name = property type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_decorator_005fgetProperty_005f1.setProperty("width");
    int _jspx_eval_decorator_005fgetProperty_005f1 = _jspx_th_decorator_005fgetProperty_005f1.doStartTag();
    if (_jspx_th_decorator_005fgetProperty_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.reuse(_jspx_th_decorator_005fgetProperty_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.reuse(_jspx_th_decorator_005fgetProperty_005f1);
    return false;
  }

  private boolean _jspx_meth_decorator_005fgetProperty_005f2(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  decorator:getProperty
    com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag _jspx_th_decorator_005fgetProperty_005f2 = (com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag) _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.get(com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag.class);
    _jspx_th_decorator_005fgetProperty_005f2.setPageContext(_jspx_page_context);
    _jspx_th_decorator_005fgetProperty_005f2.setParent(null);
    // /decorators/panels/jirapanel.jsp(22,26) name = property type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_decorator_005fgetProperty_005f2.setProperty("title");
    int _jspx_eval_decorator_005fgetProperty_005f2 = _jspx_th_decorator_005fgetProperty_005f2.doStartTag();
    if (_jspx_th_decorator_005fgetProperty_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.reuse(_jspx_th_decorator_005fgetProperty_005f2);
      return true;
    }
    _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.reuse(_jspx_th_decorator_005fgetProperty_005f2);
    return false;
  }

  private boolean _jspx_meth_decorator_005fgetProperty_005f3(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  decorator:getProperty
    com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag _jspx_th_decorator_005fgetProperty_005f3 = (com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag) _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.get(com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag.class);
    _jspx_th_decorator_005fgetProperty_005f3.setPageContext(_jspx_page_context);
    _jspx_th_decorator_005fgetProperty_005f3.setParent(null);
    // /decorators/panels/jirapanel.jsp(27,31) name = property type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_decorator_005fgetProperty_005f3.setProperty("description");
    int _jspx_eval_decorator_005fgetProperty_005f3 = _jspx_th_decorator_005fgetProperty_005f3.doStartTag();
    if (_jspx_th_decorator_005fgetProperty_005f3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.reuse(_jspx_th_decorator_005fgetProperty_005f3);
      return true;
    }
    _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.reuse(_jspx_th_decorator_005fgetProperty_005f3);
    return false;
  }

  private boolean _jspx_meth_decorator_005fgetProperty_005f4(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  decorator:getProperty
    com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag _jspx_th_decorator_005fgetProperty_005f4 = (com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag) _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.get(com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag.class);
    _jspx_th_decorator_005fgetProperty_005f4.setPageContext(_jspx_page_context);
    _jspx_th_decorator_005fgetProperty_005f4.setParent(null);
    // /decorators/panels/jirapanel.jsp(33,8) name = property type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_decorator_005fgetProperty_005f4.setProperty("instructions");
    int _jspx_eval_decorator_005fgetProperty_005f4 = _jspx_th_decorator_005fgetProperty_005f4.doStartTag();
    if (_jspx_th_decorator_005fgetProperty_005f4.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.reuse(_jspx_th_decorator_005fgetProperty_005f4);
      return true;
    }
    _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.reuse(_jspx_th_decorator_005fgetProperty_005f4);
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
    // /decorators/panels/jirapanel.jsp(38,0) name = test type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fif_005f0.setTest("hasErrorMessages == 'true'");
    int _jspx_eval_webwork_005fif_005f0 = _jspx_th_webwork_005fif_005f0.doStartTag();
    if (_jspx_eval_webwork_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("<tr>\n");
        out.write("    <td class=\"formErrors\">\n");
        out.write("    <div class=\"errorArea\">\n");
        out.write("        <h4>");
        if (_jspx_meth_webwork_005ftext_005f0(_jspx_th_webwork_005fif_005f0, _jspx_page_context))
          return true;
        out.write("</h4>\n");
        out.write("        <ul>\n");
        out.write("        ");
        if (_jspx_meth_webwork_005fiterator_005f0(_jspx_th_webwork_005fif_005f0, _jspx_page_context))
          return true;
        out.write("\n");
        out.write("        </ul>\n");
        out.write("    </div>\n");
        out.write("    </td>\n");
        out.write("</tr>\n");
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

  private boolean _jspx_meth_webwork_005ftext_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fif_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:text
    com.atlassian.jira.web.tags.TextTag _jspx_th_webwork_005ftext_005f0 = (com.atlassian.jira.web.tags.TextTag) _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.get(com.atlassian.jira.web.tags.TextTag.class);
    _jspx_th_webwork_005ftext_005f0.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005ftext_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fif_005f0);
    // /decorators/panels/jirapanel.jsp(42,12) name = name type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005ftext_005f0.setName("'panel.errors'");
    int _jspx_eval_webwork_005ftext_005f0 = _jspx_th_webwork_005ftext_005f0.doStartTag();
    if (_jspx_th_webwork_005ftext_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.reuse(_jspx_th_webwork_005ftext_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.reuse(_jspx_th_webwork_005ftext_005f0);
    return false;
  }

  private boolean _jspx_meth_webwork_005fiterator_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fif_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:iterator
    webwork.view.taglib.IteratorTag _jspx_th_webwork_005fiterator_005f0 = (webwork.view.taglib.IteratorTag) _005fjspx_005ftagPool_005fwebwork_005fiterator_0026_005fvalue.get(webwork.view.taglib.IteratorTag.class);
    _jspx_th_webwork_005fiterator_005f0.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fiterator_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fif_005f0);
    // /decorators/panels/jirapanel.jsp(44,8) name = value type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fiterator_005f0.setValue("flushedErrorMessages");
    int _jspx_eval_webwork_005fiterator_005f0 = _jspx_th_webwork_005fiterator_005f0.doStartTag();
    if (_jspx_eval_webwork_005fiterator_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      if (_jspx_eval_webwork_005fiterator_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.pushBody();
        _jspx_th_webwork_005fiterator_005f0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
        _jspx_th_webwork_005fiterator_005f0.doInitBody();
      }
      do {
        out.write("\n");
        out.write("        <li>");
        if (_jspx_meth_webwork_005fproperty_005f0(_jspx_th_webwork_005fiterator_005f0, _jspx_page_context))
          return true;
        out.write("</li>\n");
        out.write("        ");
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
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fiterator_0026_005fvalue.reuse(_jspx_th_webwork_005fiterator_005f0);
    return false;
  }

  private boolean _jspx_meth_webwork_005fproperty_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fiterator_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:property
    webwork.view.taglib.PropertyTag _jspx_th_webwork_005fproperty_005f0 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fwebwork_005fproperty_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_webwork_005fproperty_005f0.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fproperty_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fiterator_005f0);
    int _jspx_eval_webwork_005fproperty_005f0 = _jspx_th_webwork_005fproperty_005f0.doStartTag();
    if (_jspx_th_webwork_005fproperty_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fproperty_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fproperty_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f0);
    return false;
  }

  private boolean _jspx_meth_decorator_005fbody_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  decorator:body
    com.opensymphony.module.sitemesh.taglib.decorator.BodyTag _jspx_th_decorator_005fbody_005f0 = (com.opensymphony.module.sitemesh.taglib.decorator.BodyTag) _005fjspx_005ftagPool_005fdecorator_005fbody_005fnobody.get(com.opensymphony.module.sitemesh.taglib.decorator.BodyTag.class);
    _jspx_th_decorator_005fbody_005f0.setPageContext(_jspx_page_context);
    _jspx_th_decorator_005fbody_005f0.setParent(null);
    int _jspx_eval_decorator_005fbody_005f0 = _jspx_th_decorator_005fbody_005f0.doStartTag();
    if (_jspx_th_decorator_005fbody_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fdecorator_005fbody_005fnobody.reuse(_jspx_th_decorator_005fbody_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fdecorator_005fbody_005fnobody.reuse(_jspx_th_decorator_005fbody_005f0);
    return false;
  }

  private boolean _jspx_meth_decorator_005fgetProperty_005f5(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  decorator:getProperty
    com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag _jspx_th_decorator_005fgetProperty_005f5 = (com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag) _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.get(com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag.class);
    _jspx_th_decorator_005fgetProperty_005f5.setPageContext(_jspx_page_context);
    _jspx_th_decorator_005fgetProperty_005f5.setParent(null);
    // /decorators/panels/jirapanel.jsp(61,12) name = property type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_decorator_005fgetProperty_005f5.setProperty("footerHtml");
    int _jspx_eval_decorator_005fgetProperty_005f5 = _jspx_th_decorator_005fgetProperty_005f5.doStartTag();
    if (_jspx_th_decorator_005fgetProperty_005f5.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.reuse(_jspx_th_decorator_005fgetProperty_005f5);
      return true;
    }
    _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.reuse(_jspx_th_decorator_005fgetProperty_005f5);
    return false;
  }

  private boolean _jspx_meth_decorator_005fgetProperty_005f6(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  decorator:getProperty
    com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag _jspx_th_decorator_005fgetProperty_005f6 = (com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag) _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.get(com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag.class);
    _jspx_th_decorator_005fgetProperty_005f6.setPageContext(_jspx_page_context);
    _jspx_th_decorator_005fgetProperty_005f6.setParent(null);
    // /decorators/panels/jirapanel.jsp(68,16) name = property type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_decorator_005fgetProperty_005f6.setProperty("buttons");
    int _jspx_eval_decorator_005fgetProperty_005f6 = _jspx_th_decorator_005fgetProperty_005f6.doStartTag();
    if (_jspx_th_decorator_005fgetProperty_005f6.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.reuse(_jspx_th_decorator_005fgetProperty_005f6);
      return true;
    }
    _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.reuse(_jspx_th_decorator_005fgetProperty_005f6);
    return false;
  }

  private boolean _jspx_meth_webwork_005ftext_005f1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:text
    com.atlassian.jira.web.tags.TextTag _jspx_th_webwork_005ftext_005f1 = (com.atlassian.jira.web.tags.TextTag) _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.get(com.atlassian.jira.web.tags.TextTag.class);
    _jspx_th_webwork_005ftext_005f1.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005ftext_005f1.setParent(null);
    // /decorators/panels/jirapanel.jsp(72,34) name = name type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005ftext_005f1.setName("'common.forms.cancel.accesskey'");
    int _jspx_eval_webwork_005ftext_005f1 = _jspx_th_webwork_005ftext_005f1.doStartTag();
    if (_jspx_th_webwork_005ftext_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.reuse(_jspx_th_webwork_005ftext_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.reuse(_jspx_th_webwork_005ftext_005f1);
    return false;
  }

  private boolean _jspx_meth_webwork_005fproperty_005f1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:property
    webwork.view.taglib.PropertyTag _jspx_th_webwork_005fproperty_005f1 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_webwork_005fproperty_005f1.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fproperty_005f1.setParent(null);
    // /decorators/panels/jirapanel.jsp(73,30) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f1.setValue("text('common.forms.cancel')");
    int _jspx_eval_webwork_005fproperty_005f1 = _jspx_th_webwork_005fproperty_005f1.doStartTag();
    if (_jspx_th_webwork_005fproperty_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f1);
    return false;
  }

  private boolean _jspx_meth_webwork_005ftext_005f2(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:text
    com.atlassian.jira.web.tags.TextTag _jspx_th_webwork_005ftext_005f2 = (com.atlassian.jira.web.tags.TextTag) _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.get(com.atlassian.jira.web.tags.TextTag.class);
    _jspx_th_webwork_005ftext_005f2.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005ftext_005f2.setParent(null);
    // /decorators/panels/jirapanel.jsp(73,93) name = name type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005ftext_005f2.setName("'common.forms.cancel.accesskey'");
    int _jspx_eval_webwork_005ftext_005f2 = _jspx_th_webwork_005ftext_005f2.doStartTag();
    if (_jspx_th_webwork_005ftext_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.reuse(_jspx_th_webwork_005ftext_005f2);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.reuse(_jspx_th_webwork_005ftext_005f2);
    return false;
  }

  private boolean _jspx_meth_decorator_005fgetProperty_005f7(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  decorator:getProperty
    com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag _jspx_th_decorator_005fgetProperty_005f7 = (com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag) _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.get(com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag.class);
    _jspx_th_decorator_005fgetProperty_005f7.setPageContext(_jspx_page_context);
    _jspx_th_decorator_005fgetProperty_005f7.setParent(null);
    // /decorators/panels/jirapanel.jsp(74,29) name = property type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_decorator_005fgetProperty_005f7.setProperty("cancelURI");
    int _jspx_eval_decorator_005fgetProperty_005f7 = _jspx_th_decorator_005fgetProperty_005f7.doStartTag();
    if (_jspx_th_decorator_005fgetProperty_005f7.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.reuse(_jspx_th_decorator_005fgetProperty_005f7);
      return true;
    }
    _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.reuse(_jspx_th_decorator_005fgetProperty_005f7);
    return false;
  }

  private boolean _jspx_meth_webwork_005fproperty_005f2(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:property
    webwork.view.taglib.PropertyTag _jspx_th_webwork_005fproperty_005f2 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_webwork_005fproperty_005f2.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fproperty_005f2.setParent(null);
    // /decorators/panels/jirapanel.jsp(75,30) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f2.setValue("text('common.forms.cancel')");
    int _jspx_eval_webwork_005fproperty_005f2 = _jspx_th_webwork_005fproperty_005f2.doStartTag();
    if (_jspx_th_webwork_005fproperty_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f2);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f2);
    return false;
  }

  private boolean _jspx_meth_webwork_005fif_005f1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:if
    webwork.view.taglib.IfTag _jspx_th_webwork_005fif_005f1 = (webwork.view.taglib.IfTag) _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.get(webwork.view.taglib.IfTag.class);
    _jspx_th_webwork_005fif_005f1.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fif_005f1.setParent(null);
    // /decorators/panels/jirapanel.jsp(76,47) name = test type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fif_005f1.setTest("/returnUrl != null");
    int _jspx_eval_webwork_005fif_005f1 = _jspx_th_webwork_005fif_005f1.doStartTag();
    if (_jspx_eval_webwork_005fif_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        if (_jspx_meth_webwork_005fproperty_005f3(_jspx_th_webwork_005fif_005f1, _jspx_page_context))
          return true;
        int evalDoAfterBody = _jspx_th_webwork_005fif_005f1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_webwork_005fif_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.reuse(_jspx_th_webwork_005fif_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fif_0026_005ftest.reuse(_jspx_th_webwork_005fif_005f1);
    return false;
  }

  private boolean _jspx_meth_webwork_005fproperty_005f3(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005fif_005f1, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:property
    webwork.view.taglib.PropertyTag _jspx_th_webwork_005fproperty_005f3 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_webwork_005fproperty_005f3.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005fproperty_005f3.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005fif_005f1);
    // /decorators/panels/jirapanel.jsp(76,85) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005fproperty_005f3.setValue("/returnUrl");
    int _jspx_eval_webwork_005fproperty_005f3 = _jspx_th_webwork_005fproperty_005f3.doStartTag();
    if (_jspx_th_webwork_005fproperty_005f3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f3);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_webwork_005fproperty_005f3);
    return false;
  }

  private boolean _jspx_meth_webwork_005felse_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:else
    webwork.view.taglib.ElseTag _jspx_th_webwork_005felse_005f0 = (webwork.view.taglib.ElseTag) _005fjspx_005ftagPool_005fwebwork_005felse.get(webwork.view.taglib.ElseTag.class);
    _jspx_th_webwork_005felse_005f0.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005felse_005f0.setParent(null);
    int _jspx_eval_webwork_005felse_005f0 = _jspx_th_webwork_005felse_005f0.doStartTag();
    if (_jspx_eval_webwork_005felse_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        if (_jspx_meth_decorator_005fgetProperty_005f8(_jspx_th_webwork_005felse_005f0, _jspx_page_context))
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

  private boolean _jspx_meth_decorator_005fgetProperty_005f8(javax.servlet.jsp.tagext.JspTag _jspx_th_webwork_005felse_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  decorator:getProperty
    com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag _jspx_th_decorator_005fgetProperty_005f8 = (com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag) _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.get(com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag.class);
    _jspx_th_decorator_005fgetProperty_005f8.setPageContext(_jspx_page_context);
    _jspx_th_decorator_005fgetProperty_005f8.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_webwork_005felse_005f0);
    // /decorators/panels/jirapanel.jsp(76,151) name = property type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_decorator_005fgetProperty_005f8.setProperty("cancelURI");
    int _jspx_eval_decorator_005fgetProperty_005f8 = _jspx_th_decorator_005fgetProperty_005f8.doStartTag();
    if (_jspx_th_decorator_005fgetProperty_005f8.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.reuse(_jspx_th_decorator_005fgetProperty_005f8);
      return true;
    }
    _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fproperty_005fnobody.reuse(_jspx_th_decorator_005fgetProperty_005f8);
    return false;
  }
}
