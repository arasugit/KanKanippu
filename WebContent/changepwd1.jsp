<%@page import="org.owasp.esapi.ESAPI"%>
<%@page import="org.owasp.esapi.Validator"%>
<%@page import="org.owasp.esapi.Encoder"%>
<jsp:directive.include file="/WEB-INF/jsp/top.jsp" />
<jsp:useBean id="changeSecuredInfoJS" class="com.fis.ist.common.ChangeSecuredInfoJS" scope="session"/>
<script src="js/jsbn.js"></script>
<script src="js/jsbn2.js"></script>
<script src="js/prng4.js"></script>
<script src="js/rng.js"></script>
<script src="js/rsa.js"></script>
<script src="js/rsa2.js"></script>
<link rel="stylesheet" type="text/css" href="css/changepwd1.css"/>
<%!
	Encoder encoder = ESAPI.encoder();
%>
<%String authServer= ConfigParams.getInstance().getProperty("ist.authentication"); %>
<%String RSAPublic = changeSecuredInfoJS.getClientKey(); %>

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
          				<c:if test="${not empty param.change_pwd_error}">
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
												<span class="change_pwd_err">
													<c:if test="${param.change_pwd_error=='2'}">
													 Your change password attempt was not successful, try again.<br/><br/>
        											 Reason: <c:out value="${IST_AUTH_LAST_ERROR}"/>.
        											 </c:if>
        											 <c:if test="${param.change_pwd_error=='1'}">
													 Your password is expired, please change password.<br/><br/>
        											 </c:if>
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
					<td>
					<c:if test="${not empty IST_CSRF_TOKEN_MSG}">
							<table width="100%" border="1" cellpadding="0" cellspacing="0"	bordercolor="#CC0000">
								<tr>
									<td>
										<table width="100%" border="0" cellpadding="2" cellspacing="0">
											<tr>
												<td width="5%" height="40" valign="top"><img
													src="images/error_icon.gif" width="28" height="27" /></td>
												<td width="95%" height="40" valign="middle">
												<span class="csrf_message">
													 <c:if
															test="${not empty IST_CSRF_TOKEN_MSG}">
															<c:out value="${IST_CSRF_TOKEN_MSG}" />.<br />
															<br />
													</c:if>
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
							<span class="changepwd_title">Change Password</span>
						</b>
					</td>

				</tr>
				<tr>
					<td  height="16"/>
				</tr>
				<tr>
					<td valign="top">
						<table border="0" cellspacing="0" cellpadding="0" >
						
							<tr>
								<td valign="top" class="body"> This secure site provides access to FIS services and information. 
								</td>
							</tr>
							<tr>
								<td  height="4"/>
							</tr>
							<tr>
								<td valign="top" > To obtain access to this site, contact your local administrator or your FIS representative. 
								</td>
							</tr>
							<tr>
								<td  height="10"/>
							</tr>
						</table>
					</td>
				</tr>
				<tr>				 
					<td>					
					<table  cellpadding="0" border="0" cellPadding="0" cellspacing="0" width="600" >
						<tr>
						 <td width="34" height="34" class="leftTopBg"> &nbsp; </td>
 						 <td width="526" height="34"  class="middleTopBg"> &nbsp; </td>
						 <td width="40" height="34" class="rightTopBg"> &nbsp; </td>
						</tr>
						<tr>
						 <td width="34" class="leftMiddleBg"> &nbsp;</td>
							<td width="526" >
							<form name="changepwd1" action="changepwdhandler1.jsp" method="POST"  id="changepwd1form"
								data-auth-server="<%=encoder.encodeForHTMLAttribute(authServer)%>"
								data-rsa-public-key="<%=encoder.encodeForHTMLAttribute(RSAPublic)%>"
							>
							<input type="hidden" name="j_old_password" id="txt_oldPassword" autocomplete="off">
							<input type="hidden" name="j_new_password" id="txt_newPassword" autocomplete="off">
							<input type="hidden" name="j_new_password_confirm" id="txt_newPasswordConfirm" autocomplete="off">
							<input type="hidden" name="CSRF_TOKEN" value="<c:if test="${not empty CSRF_TOKEN}"><c:out value='${CSRF_TOKEN}'/></c:if>"/>
							<input type="hidden" name="authServer" id="txt_authServer" value="<%=authServer%>" autocomplete="off">
							<input type="hidden" name="keyForJS" id="txt_keyForJS" value="<%=RSAPublic%>" autocomplete="off">
							</form>
							<table   border="0" cellSpacing="0" cellpadding="0" width="90%" align="center">
								<tr > <td colspan="3">&nbsp;  </td> </tr>
		
								<tr>
									<td width="40%">Old Password:</td>
		
									<td width="10%">&nbsp;</td>
									<td><input type="password" name="j_old_passwordtoshow" size="30"  class="inputWidth" id="txt_oldPasswordtoshow" maxlength="20">
								</tr>
								
								<tr>
									<td width="40%">New Password:</td>
		
									<td width="10%">&nbsp;</td>
									<td><input type="password" name="j_new_passwordtoshow" size="30"  class="inputWidth" id="txt_newPasswordtoshow" maxlength="20">
								</tr>
								
								<tr>
									<td width="40%">Confirm New Password:</td>
		
									<td width="10%">&nbsp;</td>
									<td><input type="password" name="j_new_password_confirm" size="30"  class="inputWidth" id="txt_newPasswordConfirmtoshow">
									</td>
								</tr>
		
								<tr> <td colspan="3">&nbsp;  </td> </tr>
		
								<tr>
									<td width="50%" colspan="2">&nbsp;</td>
		
									<td align="left">
										<input type="submit" value="Submit" id="submit_button">&nbsp;&nbsp;
										<input type="reset" value="Reset" id="reset_button">&nbsp;&nbsp;
										<input type="BUTTON" value="Cancel" id="cancel_button">
									</td>
								</tr>
								<tr> <td colspan="3">&nbsp;  </td> </tr>
								
							</table>
							
						</td>
						<td width="40" class="rightMiddleBg"> &nbsp;</td>
					</tr>
	 				<tr>
						 <td width="34" height="34" class="leftBottomBg">
						  &nbsp;
						 </td>
						 <td width="526" height="34" class="middleBottomBg">
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
<script src="js/changepwd1.js" defer> </script>
<jsp:directive.include file="/WEB-INF/jsp/bottom.jsp" />