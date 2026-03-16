<%@page import="com.fis.ist.log.ISTLogger"%>
<%@page import="org.owasp.esapi.errors.ValidationException"%>
<%@page import="org.owasp.esapi.Validator"%>
<%@page import="org.owasp.esapi.ESAPI"%>
<%@page import="org.owasp.esapi.Encoder"%>
<jsp:directive.include file="/WEB-INF/jsp/top.jsp" />
<%@ page import="com.fis.ist.cfg.ConfigParams" %>
<%! 
	private static final ISTLogger log = ISTLogger.getLogger("com.fis.ist.jsp.preauth-logout");
	Encoder encoder = ESAPI.encoder();
	Validator validator = ESAPI.validator();
	public String SM_WEBAGENT_SERVER;
	
	public void jspInit()
	{
		try
		{
			SM_WEBAGENT_SERVER = validator.getValidInput(
				"URL of the siteminder webagent server",
				ConfigParams.getInstance().getProperty("ist.sm_webagent_http.server"),
				"URL", 250, false);
		}
		catch (ValidationException e)
		{
			log.error("Invalid value for ist.sm_webagent_http.server");
		}
	}

%>

<table width="100%" border="0" cellspacing="0" cellpadding="10" 
		 background="images/background3.gif" >
	<tr>
		<td width="1%" background="images/background_noline.gif">&nbsp; 
		</td>
		<td>
			<table width="600" border="0"  cellpadding="10" cellspacing="0" border="0" >			
				 <tr>
						 <td width="34" height="34" class="leftTopBg"> &nbsp; </td>
 						 <td width="526" height="34"  class="middleTopBg"> &nbsp; </td>
						 <td width="40" height="34" class="rightTopBg"> &nbsp; </td>
				 </tr>
				 <tr>
          			<td width="34" class="leftMiddleBg"> &nbsp;</td>
					<td width="526" >
						<%-- Message block --%>
						<table width="100%"  cellpadding="0" cellspacing="0">
							<tr>
								<td>
									<table width="100%" border="0" cellpadding="2" cellspacing="5">
										<tr>
											<td width="100%" height="20" valign="middle">
												Do you want to log out?
											</td>
										</tr>
										<tr>
											<td width="100%" height="20" valign="middle">
												  <a href="<%=encoder.encodeForHTMLAttribute(SM_WEBAGENT_SERVER)%>logout.html?app=IST-Launcher"> Logout</a>
											</td>
											<td width="100%" height="20" valign="middle">
												  <a href="main.html"> Cancel</a>
											</td>											
										</tr>
									</table>
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

<jsp:directive.include file="/WEB-INF/jsp/bottom.jsp" />