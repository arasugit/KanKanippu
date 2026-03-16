<%@ page language="java" %>
<%@ page import="com.fis.ist.springsecurity.oassrv.ISTAuthenticationProvider2" %>
<%
ISTAuthenticationProvider2 authProvider = new ISTAuthenticationProvider2();
authProvider.changePasswordAfterExpiry(request, response, "appSelect.jsp", "ist_auth_msg=1", "changepwd1.jsp", "change_pwd_error=2");
%>
