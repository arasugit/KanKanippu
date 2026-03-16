<jsp:directive.include file="/WEB-INF/jsp/top.jsp" />
<%-- $Id$ --%>
<script src="js/app_select.js" defer></script>
<link rel="stylesheet" type="text/css" href="css/app_select.css" />
<a
	href="oauth2/authorization/<%=ConfigParams.getInstance().getProperty("ist.oidc.registration_id")%>"><%=ConfigParams.getInstance().getProperty("ist.oidc.registration_id")%></a>
<p id="jump_to_launcher"
	data-url="oauth2/authorization/<%=ConfigParams.getInstance().getProperty("ist.oidc.registration_id")%>"
	data-launcher-application="_self"></p>
<script src="js/app_select_2.js" defer> </script>
<jsp:directive.include file="/WEB-INF/jsp/bottom.jsp" />