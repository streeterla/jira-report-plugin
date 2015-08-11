package org.apache.jsp.decorators;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.atlassian.jira.config.properties.ApplicationProperties;
import com.atlassian.jira.config.properties.APKeys;
import com.atlassian.jira.ManagerFactory;
import com.atlassian.plugin.webresource.WebResourceManager;
import com.atlassian.jira.ComponentManager;
import com.atlassian.jira.config.properties.LookAndFeelBean;
import com.opensymphony.util.TextUtils;
import com.atlassian.jira.plugin.keyboardshortcut.KeyboardShortcutManager;
import com.atlassian.jira.ComponentManager;
import com.atlassian.jira.security.xsrf.XsrfTokenGenerator;
import com.atlassian.jira.ComponentManager;
import com.atlassian.jira.config.properties.APKeys;
import com.atlassian.jira.config.properties.LookAndFeelBean;
import com.atlassian.jira.plugin.navigation.PluggableTopNavigation;
import com.atlassian.jira.plugin.navigation.TopNavigationModuleDescriptor;
import com.atlassian.jira.plugin.util.ModuleDescriptorComparator;
import com.atlassian.jira.web.action.admin.EditAnnouncementBanner;
import com.atlassian.plugin.PluginAccessor;
import com.atlassian.seraph.util.SecurityUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import com.atlassian.jira.ComponentManager;
import com.atlassian.jira.plugin.navigation.FooterModuleDescriptor;
import com.atlassian.jira.plugin.navigation.PluggableFooter;
import com.atlassian.jira.plugin.util.ModuleDescriptorComparator;
import com.atlassian.jira.web.filters.accesslog.AccessLogImprinter;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public final class notitle_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(8);
    _jspx_dependants.add("/includes/decorators/header-deprecated.jsp");
    _jspx_dependants.add("/includes/decorators/xsrftoken.jsp");
    _jspx_dependants.add("/includes/decorators/bodytop-deprecated.jsp");
    _jspx_dependants.add("/includes/decorators/footer.jsp");
    _jspx_dependants.add("/WEB-INF/tld/sitemesh-decorator.tld");
    _jspx_dependants.add("/WEB-INF/tld/sitemesh-page.tld");
    _jspx_dependants.add("/WEB-INF/tld/webwork.tld");
    _jspx_dependants.add("/WEB-INF/tld/atlassian-jira-tags.tld");
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fdecorator_005fusePage_0026_005fid_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fdecorator_005ftitle_0026_005fdefault_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fdecorator_005fhead_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fwriteEntireProperty_005fproperty_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fdecorator_005fbody_005fnobody;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fdecorator_005fusePage_0026_005fid_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fdecorator_005ftitle_0026_005fdefault_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fdecorator_005fhead_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fwriteEntireProperty_005fproperty_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fdecorator_005fbody_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fdecorator_005fusePage_0026_005fid_005fnobody.release();
    _005fjspx_005ftagPool_005fdecorator_005ftitle_0026_005fdefault_005fnobody.release();
    _005fjspx_005ftagPool_005fdecorator_005fhead_005fnobody.release();
    _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fwriteEntireProperty_005fproperty_005fnobody.release();
    _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.release();
    _005fjspx_005ftagPool_005fdecorator_005fbody_005fnobody.release();
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

      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write('\n');

ApplicationProperties ap = ManagerFactory.getApplicationProperties();
LookAndFeelBean lAndF = LookAndFeelBean.getInstance(ap);

      out.write('\n');
      //  decorator:usePage
      com.opensymphony.module.sitemesh.taglib.decorator.UsePageTag _jspx_th_decorator_005fusePage_005f0 = (com.opensymphony.module.sitemesh.taglib.decorator.UsePageTag) _005fjspx_005ftagPool_005fdecorator_005fusePage_0026_005fid_005fnobody.get(com.opensymphony.module.sitemesh.taglib.decorator.UsePageTag.class);
      _jspx_th_decorator_005fusePage_005f0.setPageContext(_jspx_page_context);
      _jspx_th_decorator_005fusePage_005f0.setParent(null);
      // /includes/decorators/header-deprecated.jsp(20,0) name = id type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_decorator_005fusePage_005f0.setId("originalPage");
      int _jspx_eval_decorator_005fusePage_005f0 = _jspx_th_decorator_005fusePage_005f0.doStartTag();
      if (_jspx_th_decorator_005fusePage_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fdecorator_005fusePage_0026_005fid_005fnobody.reuse(_jspx_th_decorator_005fusePage_005f0);
        return;
      }
      _005fjspx_005ftagPool_005fdecorator_005fusePage_0026_005fid_005fnobody.reuse(_jspx_th_decorator_005fusePage_005f0);
      com.opensymphony.module.sitemesh.Page originalPage = null;
      originalPage = (com.opensymphony.module.sitemesh.Page) _jspx_page_context.findAttribute("originalPage");
      out.write('\n');

    //this is all to ensure that the title prefix is not the same as the title.
    //See JRA-404
    String origTitle = originalPage.getTitle();
    String titlePrefix = ap.getDefaultBackedString(APKeys.JIRA_TITLE);
    if (origTitle != null && origTitle.equals(titlePrefix))
    {
        titlePrefix = null;
    }

    final WebResourceManager webResourceManager = ComponentManager.getInstance().getWebResourceManager();
    final KeyboardShortcutManager shortcutManager = (KeyboardShortcutManager) ComponentManager.getComponentInstanceOfType(KeyboardShortcutManager.class);

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>");
      if (_jspx_meth_decorator_005ftitle_005f0(_jspx_page_context))
        return;
 if (titlePrefix != null) { 
      out.write(' ');
      out.write('-');
      out.write(' ');
      out.print( TextUtils.htmlEncode(titlePrefix) );
      out.write(' ');
 } 
      out.write("</title>\n");
      out.write("\n");
      out.write("    ");
      if (_jspx_meth_decorator_005fhead_005f0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"");
      out.print( ap.getContentType() );
      out.write("\" />\n");
      out.write("    <meta http-equiv=\"Pragma\" content=\"no-cache\" />\n");
      out.write("    <meta http-equiv=\"Expires\" content=\"-1\" />\n");
      out.write("    ");
      out.write('\n');
      out.write('\n');

    XsrfTokenGenerator xsrfTokenGenerator = (XsrfTokenGenerator) ComponentManager.getComponentInstanceOfType(XsrfTokenGenerator.class);

      out.write("    \n");
      out.write("<meta id=\"atlassian-token\" name=\"atlassian-token\" content=\"");
      out.print(xsrfTokenGenerator.generateToken(request));
      out.write("\">\n");
      out.write("\n");
      out.write("\n");
      out.write("    <link rel=\"shortcut icon\" href=\"");
      out.print( webResourceManager.getStaticResourcePrefix());
      out.write("/favicon.ico\">\n");
      out.write("    <link rel=\"icon\" type=\"image/png\" href=\"");
      out.print( webResourceManager.getStaticResourcePrefix());
      out.write("/images/icons/favicon.png\">\n");
      out.write("    ");
      out.write("\n");
      out.write("    <script type=\"text/javascript\">var contextPath = '");
      out.print(request.getContextPath());
      out.write("';</script>\n");

    webResourceManager.requireResource("jira.webresources:global-static");
    webResourceManager.requireResource("jira.webresources:jira-global");
    webResourceManager.requireResource("jira.webresources:key-commands");
    webResourceManager.requireResource("jira.webresources:header");
    webResourceManager.includeResources(out);

      out.write("\n");
      out.write("    <script type=\"text/javascript\" src=\"");
      out.print(request.getContextPath() + shortcutManager.includeShortcuts());
      out.write("\"></script>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write('\n');
      out.write('\n');
      //  decorator:usePage
      com.opensymphony.module.sitemesh.taglib.decorator.UsePageTag _jspx_th_decorator_005fusePage_005f1 = (com.opensymphony.module.sitemesh.taglib.decorator.UsePageTag) _005fjspx_005ftagPool_005fdecorator_005fusePage_0026_005fid_005fnobody.get(com.opensymphony.module.sitemesh.taglib.decorator.UsePageTag.class);
      _jspx_th_decorator_005fusePage_005f1.setPageContext(_jspx_page_context);
      _jspx_th_decorator_005fusePage_005f1.setParent(null);
      // /includes/decorators/bodytop-deprecated.jsp(21,0) name = id type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_decorator_005fusePage_005f1.setId("p");
      int _jspx_eval_decorator_005fusePage_005f1 = _jspx_th_decorator_005fusePage_005f1.doStartTag();
      if (_jspx_th_decorator_005fusePage_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fdecorator_005fusePage_0026_005fid_005fnobody.reuse(_jspx_th_decorator_005fusePage_005f1);
        return;
      }
      _005fjspx_005ftagPool_005fdecorator_005fusePage_0026_005fid_005fnobody.reuse(_jspx_th_decorator_005fusePage_005f1);
      com.opensymphony.module.sitemesh.Page p = null;
      p = (com.opensymphony.module.sitemesh.Page) _jspx_page_context.findAttribute("p");
      out.write('\n');

    final Logger log = Logger.getLogger("includes.decorators.bodytop");
    LookAndFeelBean lookAndFeelBean = LookAndFeelBean.getInstance(ap);
    String linkColour = lookAndFeelBean.getTextLinkColour();
    String linkAColour = lookAndFeelBean.getTextActiveLinkColour();
    String applicationID = lookAndFeelBean.getApplicationID();
    String alertHeader = ap.getDefaultBackedText(APKeys.JIRA_ALERT_HEADER);
    String alertHeaderVisibility = ap.getDefaultBackedString(APKeys.JIRA_ALERT_HEADER_VISIBILITY);

    boolean userLoggedIn = false;
    try
    {
        userLoggedIn = (SecurityUtils.getAuthenticator(pageContext.getServletContext()).getUser((HttpServletRequest) pageContext.getRequest()) != null);
    }
    catch (Exception e)
    {
        log.error(e);
        throw new RuntimeException(e);
    }

      out.write("\n");
      out.write("\n");
      out.write("<body id=\"");
      out.print( applicationID);
      out.write('"');
      out.write(' ');
      if (_jspx_meth_decorator_005fgetProperty_005f0(_jspx_page_context))
        return;
      out.write(" >\n");
      out.write("\n");

    PluginAccessor pluginAccessor = ComponentManager.getInstance().getPluginAccessor();

    // Get all the top nav module descriptions and sort them by order
    List topNavPlugins = pluginAccessor.getEnabledModuleDescriptorsByClass(TopNavigationModuleDescriptor.class);
    Collections.sort(topNavPlugins, ModuleDescriptorComparator.COMPARATOR);

    String selectedSection = p.getProperty("page.section");
    if (StringUtils.isNotBlank(selectedSection))
    {
        request.setAttribute("jira.selected.section", selectedSection);
    }

    // Render all the top nav plugins
    for (Iterator iterator = topNavPlugins.iterator(); iterator.hasNext();) {
        TopNavigationModuleDescriptor topNavModuleDescriptor = (TopNavigationModuleDescriptor) iterator.next();
        PluggableTopNavigation pluggableTopNavigation = (PluggableTopNavigation) topNavModuleDescriptor.getModule();


      out.write('\n');
      out.print( pluggableTopNavigation.getHtml(request) );
      out.write('\n');

    }

      out.write("\n");
      out.write("\n");
      out.write("<fieldset class=\"hidden parameters\">\n");
      out.write("    <input type=\"hidden\" id=\"dirtyMessage\" value=\"");
      if (_jspx_meth_webwork_005ftext_005f0(_jspx_page_context))
        return;
      out.write("\">\n");
      out.write("    <input type=\"hidden\" id=\"keyType\" value=\"");
      if (_jspx_meth_webwork_005ftext_005f1(_jspx_page_context))
        return;
      out.write("\">\n");
      out.write("    <input type=\"hidden\" id=\"keyThen\" value=\"");
      if (_jspx_meth_webwork_005ftext_005f2(_jspx_page_context))
        return;
      out.write("\">\n");
      out.write("    <input type=\"hidden\" id=\"dblClickToExpand\" value=\"");
      if (_jspx_meth_webwork_005ftext_005f3(_jspx_page_context))
        return;
      out.write("\">\n");
      out.write("</fieldset>\n");
      out.write("\n");
      out.write('\n');
 if (alertHeader != null && alertHeader.trim().length() > 0 && ("public".equals(alertHeaderVisibility) || userLoggedIn)) { 
      out.write("\n");
      out.write("<div class=\"alertHeader\">\n");
      out.print( alertHeader );
      out.write("\n");
      out.write("</div>\n");
 } 
      out.write('\n');
      out.write('\n');
      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("<table cellspacing=0 cellpadding=10 border=0 width=100% bgcolor=#ffffff><tr><td>\n");
      out.write("    ");
      if (_jspx_meth_decorator_005fbody_005f0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("</td></tr></table>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    // Get all the footer module descriptions and sort them by order
    List footerPlugins = ComponentManager.getInstance().getPluginAccessor().getEnabledModuleDescriptorsByClass(FooterModuleDescriptor.class);
    Collections.sort(footerPlugins, ModuleDescriptorComparator.COMPARATOR);

    // Render all the footer plugins
    for (Iterator iterator = footerPlugins.iterator(); iterator.hasNext();)
    {
        FooterModuleDescriptor footerModuleDescriptor = (FooterModuleDescriptor) iterator.next();
        PluggableFooter pluggableFooter = (PluggableFooter) footerModuleDescriptor.getModule();

      out.write('\n');
      out.print( pluggableFooter.getFullFooterHtml(request) );
      out.write('\n');

    }

      out.write('\n');
      out.write('\n');
      out.print( new AccessLogImprinter(request).imprintHTMLComment());
      out.write('\n');
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write('\n');
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

  private boolean _jspx_meth_decorator_005ftitle_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  decorator:title
    com.opensymphony.module.sitemesh.taglib.decorator.TitleTag _jspx_th_decorator_005ftitle_005f0 = (com.opensymphony.module.sitemesh.taglib.decorator.TitleTag) _005fjspx_005ftagPool_005fdecorator_005ftitle_0026_005fdefault_005fnobody.get(com.opensymphony.module.sitemesh.taglib.decorator.TitleTag.class);
    _jspx_th_decorator_005ftitle_005f0.setPageContext(_jspx_page_context);
    _jspx_th_decorator_005ftitle_005f0.setParent(null);
    // /includes/decorators/header-deprecated.jsp(36,11) name = default type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_decorator_005ftitle_005f0.setDefault("Welcome");
    int _jspx_eval_decorator_005ftitle_005f0 = _jspx_th_decorator_005ftitle_005f0.doStartTag();
    if (_jspx_th_decorator_005ftitle_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fdecorator_005ftitle_0026_005fdefault_005fnobody.reuse(_jspx_th_decorator_005ftitle_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fdecorator_005ftitle_0026_005fdefault_005fnobody.reuse(_jspx_th_decorator_005ftitle_005f0);
    return false;
  }

  private boolean _jspx_meth_decorator_005fhead_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  decorator:head
    com.opensymphony.module.sitemesh.taglib.decorator.HeadTag _jspx_th_decorator_005fhead_005f0 = (com.opensymphony.module.sitemesh.taglib.decorator.HeadTag) _005fjspx_005ftagPool_005fdecorator_005fhead_005fnobody.get(com.opensymphony.module.sitemesh.taglib.decorator.HeadTag.class);
    _jspx_th_decorator_005fhead_005f0.setPageContext(_jspx_page_context);
    _jspx_th_decorator_005fhead_005f0.setParent(null);
    int _jspx_eval_decorator_005fhead_005f0 = _jspx_th_decorator_005fhead_005f0.doStartTag();
    if (_jspx_th_decorator_005fhead_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fdecorator_005fhead_005fnobody.reuse(_jspx_th_decorator_005fhead_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fdecorator_005fhead_005fnobody.reuse(_jspx_th_decorator_005fhead_005f0);
    return false;
  }

  private boolean _jspx_meth_decorator_005fgetProperty_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  decorator:getProperty
    com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag _jspx_th_decorator_005fgetProperty_005f0 = (com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag) _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fwriteEntireProperty_005fproperty_005fnobody.get(com.opensymphony.module.sitemesh.taglib.decorator.PropertyTag.class);
    _jspx_th_decorator_005fgetProperty_005f0.setPageContext(_jspx_page_context);
    _jspx_th_decorator_005fgetProperty_005f0.setParent(null);
    // /includes/decorators/bodytop-deprecated.jsp(43,31) name = property type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_decorator_005fgetProperty_005f0.setProperty("body.class");
    // /includes/decorators/bodytop-deprecated.jsp(43,31) name = writeEntireProperty type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_decorator_005fgetProperty_005f0.setWriteEntireProperty("true");
    int _jspx_eval_decorator_005fgetProperty_005f0 = _jspx_th_decorator_005fgetProperty_005f0.doStartTag();
    if (_jspx_th_decorator_005fgetProperty_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fwriteEntireProperty_005fproperty_005fnobody.reuse(_jspx_th_decorator_005fgetProperty_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fdecorator_005fgetProperty_0026_005fwriteEntireProperty_005fproperty_005fnobody.reuse(_jspx_th_decorator_005fgetProperty_005f0);
    return false;
  }

  private boolean _jspx_meth_webwork_005ftext_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:text
    com.atlassian.jira.web.tags.TextTag _jspx_th_webwork_005ftext_005f0 = (com.atlassian.jira.web.tags.TextTag) _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.get(com.atlassian.jira.web.tags.TextTag.class);
    _jspx_th_webwork_005ftext_005f0.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005ftext_005f0.setParent(null);
    // /includes/decorators/bodytop-deprecated.jsp(70,50) name = name type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005ftext_005f0.setName("'common.forms.dirty.message'");
    int _jspx_eval_webwork_005ftext_005f0 = _jspx_th_webwork_005ftext_005f0.doStartTag();
    if (_jspx_th_webwork_005ftext_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.reuse(_jspx_th_webwork_005ftext_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.reuse(_jspx_th_webwork_005ftext_005f0);
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
    // /includes/decorators/bodytop-deprecated.jsp(71,45) name = name type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005ftext_005f1.setName("'keyboard.shortcuts.type'");
    int _jspx_eval_webwork_005ftext_005f1 = _jspx_th_webwork_005ftext_005f1.doStartTag();
    if (_jspx_th_webwork_005ftext_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.reuse(_jspx_th_webwork_005ftext_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.reuse(_jspx_th_webwork_005ftext_005f1);
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
    // /includes/decorators/bodytop-deprecated.jsp(72,45) name = name type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005ftext_005f2.setName("'keyboard.shortcuts.then'");
    int _jspx_eval_webwork_005ftext_005f2 = _jspx_th_webwork_005ftext_005f2.doStartTag();
    if (_jspx_th_webwork_005ftext_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.reuse(_jspx_th_webwork_005ftext_005f2);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.reuse(_jspx_th_webwork_005ftext_005f2);
    return false;
  }

  private boolean _jspx_meth_webwork_005ftext_005f3(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  webwork:text
    com.atlassian.jira.web.tags.TextTag _jspx_th_webwork_005ftext_005f3 = (com.atlassian.jira.web.tags.TextTag) _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.get(com.atlassian.jira.web.tags.TextTag.class);
    _jspx_th_webwork_005ftext_005f3.setPageContext(_jspx_page_context);
    _jspx_th_webwork_005ftext_005f3.setParent(null);
    // /includes/decorators/bodytop-deprecated.jsp(73,54) name = name type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_webwork_005ftext_005f3.setName("'tooltip.dblclick.expand'");
    int _jspx_eval_webwork_005ftext_005f3 = _jspx_th_webwork_005ftext_005f3.doStartTag();
    if (_jspx_th_webwork_005ftext_005f3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.reuse(_jspx_th_webwork_005ftext_005f3);
      return true;
    }
    _005fjspx_005ftagPool_005fwebwork_005ftext_0026_005fname_005fnobody.reuse(_jspx_th_webwork_005ftext_005f3);
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
}
