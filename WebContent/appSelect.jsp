<%@page import="org.owasp.esapi.Validator"%>
<%@page import="org.owasp.esapi.ESAPI"%>
<%@page import="org.owasp.esapi.Encoder,com.fis.ist.services.PwdExpiryReminder"%>
<jsp:directive.include file="/WEB-INF/jsp/top.jsp" />
<%-- $Id$ --%>
<jsp:useBean id="pwdExpiryReminder" class="com.fis.ist.services.PwdExpiryReminder" scope="session">
	<%
		String authServer= ConfigParams.getInstance().getProperty("ist.authentication");	
		if (pwdExpiryReminder.needsReminder() && StringUtil.isNotEmpty(authServer) && authServer.equalsIgnoreCase("oassrv"))
			ESAPI.httpUtilities().sendRedirect(response, "pwdExpiryReminder.jsp");
	%>
</jsp:useBean>
<!-- The  ChangeSecuredInfoJS class must be in session scope. App Select page is first page after successfull login for Non Oassrv Users-->
<jsp:useBean id="changeSecuredInfoJS" class="com.fis.ist.common.ChangeSecuredInfoJS" scope="session"/>

<script src="js/app_select.js" defer></script>
<jsp:useBean id="authorizedApps" class="com.fis.ist.monitoring.common.services.MonitorAuthorizedApps" scope="session">
	<%
		authorizedApps.setContext(pageContext.getServletContext());
	%>
</jsp:useBean>
<%!
	Encoder encoder = ESAPI.encoder();
	Validator validator = ESAPI.validator();
%>
<link rel="stylesheet" type="text/css" href="css/app_select.css"/>
<table border="0" cellspacing="0" cellpadding="10" 
	background="images/background3.gif">
	<tr align="center">
		<td width="1%" colspan="3" background="images/background_noline.gif">&nbsp;</td>
		
		
		<td width="94%" valign="middle">
		<table cellpadding="0" cellspacing="0" border="0" width="640">
					<tr>
						<td colspan="3" style="font-size: 20px;">
							<c:if test="${not empty param.ist_auth_msg}">
							<table width="100%" border="0" cellpadding="0" cellspacing="0"
									bordercolor="#00FF00">

								<tr>
								
									<td>
										<table width="100%" border="0" cellpadding="2" cellspacing="0">
											<tr>
												<td width="2%" height="30" valign="top">
												
												</td>
												<td width="98%" height="30" valign="middle">
													<span class="app_select_msg">
													 <c:out value="${IST_AUTH_LAST_MSG}"/>.<br/><br/>
													 </span>
												</td>
											</tr>

										</table>
									</td>
								</tr>
							</table>
	 					</c:if>
						</td>
						</tr>
						
					

						<tr>
							<td colspan="3"><p><b>PayMon&trade; is a Payments Monitoring & Management Solution </b>
							that provides complete enterprise class solutions in enabling Banks, Retailers and Financial Institutions to proactively monitor & manage their payments Infrastructure.
							</p>
						</td>
						</tr>
				
			<tr>
				<td width="34" height="34" class="leftTopBg">&nbsp;</td>
				<td width="526" height="34" class="middleTopBg">&nbsp;</td>
				<td width="40" height="34" class="rightTopBg">&nbsp;</td>
			</tr>
			<tr>
				<td width="34" class="leftMiddleBg">&nbsp;</td>
				<td width="526">

				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td width="100%">
						<table width="100%" border="0" cellpadding="2" cellspacing="5">
							<c:choose>
								<c:when test="${authorizedApps.permitAppsSize le 0}">
									<tr>
										<td width="100%" height="20" valign="middle">Don't have
										permission for any application!</td>
									</tr>
								</c:when>
								<c:when test="${authorizedApps.permitAppsSize eq 1 and authorizedApps.singleAppAutoPopup}">
										<%
										String url = authorizedApps.getApplicationUrl(0);
										if (!url.startsWith("http://") && !url.startsWith("https://"))
										{
											url = validator.getValidInput("URL of the application", url, "RelativeURL", 250, false);
										}
										else
										{
											url = validator.getValidInput("URL of the application", url, "URL", 250, false);
										}
										%>
										<tr id="jump_to_launcher" 
											data-url="<%=encoder.encodeForHTMLAttribute(url)%>"
											data-launcher-application="<%=encoder.encodeForHTMLAttribute(ConfigParams.getInstance().getProperty("ist.launchapplication"))%>"
										>
										</tr>
										<script src="js/app_select_2.js" defer> </script>
								</c:when>
								<c:otherwise>
									<tr>
										<td width="100%" height="10" valign="top"><b><span class="app_select_prompt">Select an application:</span></b></td>
									</tr>
									<%
										for (int i = 0; i < authorizedApps.getPermitAppsSize(); i++) {
											String url = authorizedApps.getApplicationUrl(i);
											if(authorizedApps.getApplicationId(i).equalsIgnoreCase("customapp"))
												continue;
											if(!url.startsWith("http://") && !url.startsWith("https://"))
											{
												url = validator.getValidInput("URL of the application", url, "RelativeURL", 250, false);
											}
											else
											{
												url = validator.getValidInput("URL of the application", url, "URL", 250, false);
											}
									%>
									<tr align="left">
										<td width="100%" height="10" valign="bottom"><a name="application_launch_link"  
											href="<%=encoder.encodeForHTMLAttribute(url)%>"  data-url-path="<%=request.getContextPath()%>" 
											data-product-name="<%=encoder.encodeForHTMLAttribute(authorizedApps.getApplicationName(i))%>" 
											data-product-id="<%=encoder.encodeForHTMLAttribute(ConfigParams.getInstance().getProperty("ist.application."+authorizedApps.getApplicationId(i)+".product_name"))%>" 
											data-launcher-application="<%=encoder.encodeForHTMLAttribute(ConfigParams.getInstance().getProperty("ist.launchapplication"))%>">
											<b><%=encoder.encodeForHTML(authorizedApps.getApplicationName(i))%></b>
											</a>
										</td>
									</tr>
									<tr align="left">
										<td width="100%" height="10" valign="top"><p> <%=encoder.encodeForHTML(ConfigParams.getInstance().getProperty("ist.applicationDescription."+i))%>  </p> 
										</td>
									</tr>
									<tr>
										<td width="100%" height="10" valign="middle">
										   &nbsp;&nbsp; &nbsp; 
										</td>
									</tr>			

									<%
										}
									%>
								</c:otherwise>
							</c:choose>
	
							<tr>
								<td>&nbsp;</td>
							</tr>
						</table>
						</td>
						<td width="100%" height="20" valign="top">
						<c:choose>
							<c:when test="${(authorizedApps.permitAppsSize le 0) or (authorizedApps.permitAppsSize gt 1) or (authorizedApps.permitAppsSize eq 1 and !authorizedApps.singleAppAutoPopup)}">
								 <input type="BUTTON" value="Logout" id="logout_button" />
							</c:when>
						</c:choose>
						</td>
					</tr>
				</table>

				</td>
				<td width="40" class="rightMiddleBg">&nbsp;</td>
			</tr>
			<tr>
				<td width="34" height="34" class="leftBottomBg">&nbsp;</td>
				<td width="526" height="34" class="middleBottomBg">&nbsp;</td>
				<td width="40" height="34" class="rightBottomBg">&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<jsp:directive.include file="/WEB-INF/jsp/bottom.jsp" />