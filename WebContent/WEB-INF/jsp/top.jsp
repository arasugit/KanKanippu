<%@page import="com.fis.ist.common.AppConstants"%>
<%@page import="com.fis.ist.services.MenuService"%>
<%@page import="com.efunds.t21.common.util.StringUtil"%>
<%@page import="com.fis.ist.cfg.ConfigParams"%>
<%@page import="org.owasp.esapi.ESAPI" %>
<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="CACHE-CONTROL" content="NO-CACHE">
<meta http-equiv="CACHE-CONTROL" content="NO-STORE">
<meta http-equiv="CACHE-CONTROL" content="MAX-AGE=0">
<meta http-equiv="PRAGMA" content="NO-CACHE">
<meta http-equiv="X-UA-Compatible" content="IE=edge" >
<meta http-equiv="EXPIRES" content="0">
<meta http-equiv="X-Content-Type-Options" content="nosniff">

<base href="${ESAPI.encoder().encodeForHTML(pageContext.servletContext.contextPath)}/"/>
<title>PayMon - IST Monitoring</title>
<link rel="icon" type="image/x-icon" href="images/favicon.ico" />
<link href="css/top.css" rel="stylesheet" type="text/css" />
<script src="js/top.js" defer></script>

<link href="css/FIS_Head.css" rel="stylesheet" type="text/css" />
<link href="css/FIS_Container.css" rel="stylesheet" type="text/css" />
<link href="css/FIS_body.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr height="125">

			<td class="headerCenter">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td width="10%">
							<table width="203" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td class="logo"><img src="images/logo.gif" width="130"
										height="63" /></td>
									<%
										if (ConfigParams.getInstance().getCustomerLogo()) {
									%>
									<td class="Customerlogo"><img
										src="images/customerLogo.gif" width="130" height="63" /></td>
									<%
										}
									%>
								</tr>
							</table>
						</td>
						<td width="90%">
							<table width="100%" cellpadding="0" cellspacing="0" border="0">

								<%-- END temp spacer row --%>
								<tr height="105">
									<td class="appTitleBgLft"></td>
									<td class="appTitleBgCtr">
										<table width="100%" cellpadding="0" cellspacing="0" border="0">
											<tr height="10">
												<td></td>
											</tr>
											<tr>
												<%
													String appName = MenuService.getMainAppName();
													String appImage = MenuService.getMainAppImage();
													if(StringUtil.isNotEmpty(appImage)) {
												%>
												<td><img src="images/<%=appImage%>" /></td>
												<%
													} else {
												%>
												<td><img src="images/ISTSwitchLogo.gif" /></td>
												<%
													}
												%>
											</tr>
										</table>
									</td>
									<td class="appTitleBgRt">
										<table width="100%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td>
													<table width="265" cellpadding="0" cellspacing="0"
														border="0">

														<tr>
															<td align="center">
																<table width="220" cellpadding="0" cellspacing="0"
																	border="0">
																	<tr>
																		<td></td>
																		<td>
																			<table width="100%" cellpadding="0" cellspacing="0"
																				border="0">

																			</table>

																		</td>


																	</tr>
																	<tr height="5">
																		<td></td>
																	</tr>
																</table>
															</td>
														</tr>

													</table>

												</td>
											</tr>
											<tr height="20">
												<td></td>
											</tr>
											<tr height="60">
												<td align="right"></td>

											</tr>
										</table>

									</td>
									<td width="5"></td>
								</tr>
								<tr height="1">
									<td></td>
								</tr>
							</table>
						</td>
					</tr>

				</table>

			</td>
		</tr>
	</table>
	
	<table width="100%" border="0" background="images/background3.gif">
		<tr>
			<td align="right">
				<table border="0" align="right">
					<tr>
						<td class="current_date">
							<span id="top_current_date"></span>
							<input type="hidden" id="dateFormat" name="dateFormat" value="<%=ConfigParams.getInstance().getProperty("ist.paymon.responseDateFormat")%>" />
							<input type="hidden" id="origins" name="origins" value="<%=ConfigParams.getInstance().getProperty("ist.paymon.trustedOrigins")%>" />
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>