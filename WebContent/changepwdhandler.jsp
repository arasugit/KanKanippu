<%@ page language="java" %>
<%@ page import="com.fis.ist.springsecurity.oassrv.ISTAuthenticationProvider2" %>

<%

ISTAuthenticationProvider2 authProvider = 
	new ISTAuthenticationProvider2();
authProvider.changePassword(request, response, 
		"/login.jsp", "ist_auth_msg=1", "/changepwd.jsp", "change_pwd_error=2");

%>
