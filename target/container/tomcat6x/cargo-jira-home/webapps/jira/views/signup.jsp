
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'signup.title'"/></title>
        <meta name="decorator" content="frontpage">
</head>

<body>
    <h2><webwork:text name="'signup.heading'"/></h2>
	<page:applyDecorator name="auiform">
		<page:param name="description">
			<webwork:text name="'signup.desc'"/>
		</page:param>
		<page:param name="notable">true</page:param>
		<page:param name="action">Signup.jspa</page:param>
		<page:param name="submitId">signup_submit</page:param>
		<page:param name="submitName"><webwork:text name="'signup.heading'"/></page:param>
		<page:param name="cancelURI">default.jsp</page:param>

        <webwork:textfield label="text('common.words.username')" name="'username'" theme="'aui'" maxlength="255">
            <webwork:param name="'id'">username</webwork:param>
            <webwork:param name="'mandatory'">true</webwork:param>
        </webwork:textfield>

        <webwork:password label="text('common.words.password')" name="'password'" theme="'aui'">
            <webwork:param name="'id'">password</webwork:param>
            <webwork:param name="'mandatory'">true</webwork:param>
        </webwork:password>

        <webwork:password label="text('signup.confirmPassword')" name="'confirm'" theme="'aui'">
            <webwork:param name="'id'">confirm</webwork:param>
            <webwork:param name="'mandatory'">true</webwork:param>
        </webwork:password>

        <webwork:textfield label="text('common.words.fullname')" name="'fullname'" theme="'aui'" maxlength="255">
            <webwork:param name="'id'">fullname</webwork:param>
            <webwork:param name="'mandatory'">true</webwork:param>
        </webwork:textfield>


        <webwork:textfield label="text('common.words.email')" name="'email'" theme="'aui'" maxlength="255">
            <webwork:param name="'id'">email</webwork:param>
            <webwork:param name="'mandatory'">true</webwork:param>
        </webwork:textfield>


        <webwork:if test="applicationProperties/option('jira.option.captcha.on.signup') == true">
            <div id="captcha">
            <ui:component label="text('signup.captcha.text')" name="'captcha'" template="captcha.jsp">
                <ui:param name="'size'">40</ui:param>
                <ui:param name="'url'"><%= request.getContextPath() %>/captcha</ui:param>
            </ui:component>
            </div>
        </webwork:if>
    </page:applyDecorator>
</body>
</html>



