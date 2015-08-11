<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
  <head>
    <title><webwork:text name="'admin.issuefields.customfields.create.type'"/></title>
  </head>
  <body>
    <page:applyDecorator name="jiraform">
      <page:param name="title"><webwork:text name="'admin.issuefields.customfields.create.type'"/></page:param>
      <page:param name="width">100%</page:param>
      <page:param name="action">CreateCustomFieldType.jspa</page:param>
      <page:param name="cancelURI">ViewCustomFieldTypes.jspa</page:param>
      <page:param name="submitId">custom_field_types_submit</page:param>
      <page:param name="submitName"><webwork:text name="'admin.common.words.submit'"/></page:param>
      <page:param name="helpURL">customfieldtypes</page:param>

    <%@ include file="/includes/admin/customfields/customfieldtypefields.jsp" %>

  </page:applyDecorator>
  </body>
</html>
