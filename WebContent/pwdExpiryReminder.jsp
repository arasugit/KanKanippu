<%@page import="org.owasp.esapi.ESAPI"%>
<%@page import="org.owasp.esapi.Validator"%>
<%@page import="org.owasp.esapi.Encoder"%>
<jsp:directive.include file="/WEB-INF/jsp/top.jsp" />
<jsp:useBean id="pwdExpiryReminder" class="com.fis.ist.services.PwdExpiryReminder" scope="session"/>
<script src="js/pwdExpiryReminder.js" defer> </script>
<link rel="stylesheet" type="text/css" href="css/pwdExpiryReminder.css"/>
  <table  width="100%" border="0" cellspacing="0" cellpadding="10" 
		height="247" background="images/background3.gif" >
	<tr>
		<td width="1%" background="images/background_noline.gif">&nbsp; 
		</td>
		<td>
			<table width="100%" border="0">			
				<tr>
					<td valign="bottom"  >
						<b>
							<span class="changepwd_reminder_title">Change Password Reminder</span>
						</b>
					</td>

				</tr>		
				<tr>
          			<td>
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
													<span class="will_expire_message">
													 Your password will expire in <%=pwdExpiryReminder.numberOfDaysToExpiry()%> days. Would you like to change the password now?<br/><br/>
													 </span>
													 <input type="button" value="Yes" id="yes_button">&nbsp;&nbsp;
													 <input type="button" value="No" id="no_button">
												</td>
											</tr>

										</table>
									</td>
								</tr>
							</table>
					</td>
				</tr>
						

				</table>					
			</td>
		</tr>
	</table>
</td>
</tr>
</table>

<jsp:directive.include file="/WEB-INF/jsp/bottom.jsp" />