<%@page import="org.owasp.esapi.Validator"%>
<%@page import="org.owasp.esapi.ESAPI"%>
<%@page import="org.owasp.esapi.Encoder"%>
<jsp:useBean id="changeSecuredInfoJS" class="com.fis.ist.common.ChangeSecuredInfoJS" scope="session">
</jsp:useBean>
<jsp:directive.include file="/WEB-INF/jsp/top.jsp" />
<%!
	Encoder encoder = ESAPI.encoder();
%>
<%String authServer= ConfigParams.getInstance().getProperty("ist.authentication"); %>
<%String RSAPublic = changeSecuredInfoJS.getClientKey(); %>
<script src="js/jsbn.js"></script>
<script src="js/jsbn2.js"></script>
<script src="js/prng4.js"></script>
<script src="js/rng.js"></script>
<script src="js/rsa.js"></script>
<script src="js/rsa2.js"></script>
<link rel="stylesheet" type="text/css" href="css/login.css"/>
  <table  width="100%" border="0" cellspacing="0" cellpadding="10" 
		height="247" background="images/background3.gif" >
	<tr>
		<td width="1%" background="images/background_noline.gif">&nbsp; 
		</td>
		<td>
			<table width="100%" border="0">			
				<tr>
          			<td>
						<%-- Error message block here --%>
          				<c:if test="${not empty param.login_error}">
							<table width="100%" border="1" cellpadding="0" cellspacing="0"
									bordercolor="#CC0000">

								<tr>
									<td>
										<table width="100%" border="0" cellpadding="2" cellspacing="0">
											<tr>
												<td width="5%" height="40" valign="top">
													<img src="images/error_icon.gif" width="28" height="27" />
												</td>
												<td width="95%" height="40" valign="middle">
													<span class="login_error_msg">
													 Your login attempt was not successful, try again.<br/><br/>
        											 Reason: <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>.
													</span>
												</td>
											</tr>

										</table>
									</td>
								</tr>
							</table>
	 					</c:if>					
	 					<c:if test="${not empty param.ist_auth_msg}">
							<table width="100%" border="1" cellpadding="0" cellspacing="0"
									bordercolor="#00FF00">

								<tr>
									<td>
										<table width="100%" border="0" cellpadding="2" cellspacing="0">
											<tr>
												<td width="2%" height="30" valign="top">
												</td>
												<td width="98%" height="30" valign="middle">

													<span class="auth_message">
													 <c:out value="${IST_AUTH_LAST_MSG}"/>.<br/><br/>
													</span>
												</td>
											</tr>

										</table>
									</td>
								</tr>
							</table>
	 					</c:if>
	 					<c:if test="${not empty IST_CSRF_TOKEN_MSG}">
							<table width="100%" border="1" cellpadding="0" cellspacing="0"
									bordercolor="#CC0000">
								<tr>
									<td>
										<table width="100%" border="0" cellpadding="2" cellspacing="0">
											<tr>
												<td width="5%" height="40" valign="top">
													<img src="images/error_icon.gif" width="28" height="27" />
												</td>
												<td width="95%" height="40" valign="middle">
													<span class="csrf_message">
													 <c:out value="${IST_CSRF_TOKEN_MSG}"/>.<br/><br/>
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
					<td valign="bottom"  >
						<b>
							<span class="login-title">Login</span>
						</b>
					</td>

				</tr>
				<tr>
					<td  height="16"></td>
				</tr>
				<tr>
					<td valign="top">
						<table border="0" cellspacing="0" cellpadding="0" >
						
							<tr>
								<td valign="top" class="body"> This secure site provides access to FIS services and information. 
								</td>
							</tr>
							<tr>
								<td  height="4"></td>
							</tr>
							<tr>
								<td valign="top" > To obtain access to this site, contact your local administrator or your FIS representative. 
								</td>
							</tr>
							<tr>
								<td  height="10"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>				 
					<td>					
					<table  cellpadding="0" border="0" cellPadding="0" cellspacing="0" width="425" >
						<tr>
						 <td width="34" height="34" class="leftTopBg"> &nbsp; </td>
 						 <td width="351" height="34"  class="middleTopBg"> &nbsp; </td>
						 <td width="40" height="34" class="rightTopBg"> &nbsp; </td>
						</tr>
						<tr>
						 <td width="34" class="leftMiddleBg"> &nbsp;</td>
						 <td width="351" >

					<form name="login" method="POST" action="j_spring_security_check" accept-charset="utf-8" id="loginForm" 
						data-auth-server="<%=encoder.encodeForHTMLAttribute(authServer)%>"
						data-rsa-public-key="<%=encoder.encodeForHTMLAttribute(RSAPublic)%>"
					>
					<input type="hidden" name="j_username"  id="j_username" autocomplete="off" >
					<input type="hidden" name="j_password"  id="txt_password" autocomplete="off">
					<input type="hidden" name="CSRF_TOKEN" value="<c:if test="${not empty CSRF_TOKEN}"><c:out value='${CSRF_TOKEN}'/></c:if>"/>
					</form>
					<table   border="0" cellSpacing="0" cellpadding="0" width="90%" align="center">
						<tr > <td colspan="3">&nbsp;  </td> </tr>

						<tr>
							<td width="20%">User ID:</td>
							<td width="10%">&nbsp;</td>
							<td><input type="text" size="30" maxlength="20" name="j_usernametoshow"  id="j_usernametoshow" class="inputWidth" 
							value="<c:if test='${not empty param.login_error}'><c:out value='${SPRING_SECURITY_LAST_USERNAME}'/></c:if>"/>
						</tr>

						<tr>
							<td width="20%">Password:</td>

							<td width="10%">&nbsp;</td>
							<td><input type="password" name="j_passwordtoshow" size="30" class="inputWidth" id="txt_passwordtoshow" maxlength="20">
							
							</td>
						</tr>
						
						<tr> <td colspan="3">&nbsp;  </td> </tr>

						<tr>
							<td width="30%" colspan="2">&nbsp;</td>

							<td align="left">
								<input type="submit" value="Login"  id="login_button">&nbsp;&nbsp;
								<input type="reset" value="Reset" id="reset_button">
							</td>
						</tr>
						
						
					</table>
				 </td>
						<td width="40" class="rightMiddleBg"> &nbsp;</td>
						</tr>
						
						<tr>
						 <td width="34" height="34" class="leftBottomBg">
						  &nbsp;
						 </td>
						 <td width="351" height="34" class="middleBottomBg">
						  &nbsp;
						 </td>
						 <td width="40" height="34" class="rightBottomBg">
						  &nbsp;
						 </td>
				 	</tr>		
			</table>
					
			</td>
		</tr>
	</table>
</td>
</tr>
</table>
  
<script src="js/login.js" defer></script>
<jsp:directive.include file="/WEB-INF/jsp/bottom.jsp" />