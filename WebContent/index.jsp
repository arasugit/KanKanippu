<%@page import="org.owasp.esapi.Validator"%>
<%@page import="org.owasp.esapi.ESAPI"%>
<%@ page language="java" session="false" %>
<%
	ESAPI.httpUtilities().sendRedirect(response, "appSelect.jsp");
%>

