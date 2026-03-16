<jsp:directive.include file="/WEB-INF/jsp/top.jsp" />

<table width="100%" border="0" cellspacing="0" cellpadding="10" 
		 background="images/background3.gif" >
	<tr>
		<td width="1%" background="images/background_noline.gif">&nbsp; 
		</td>
		<td>
			<table  cellpadding="10" cellspacing="0" border="0" width="600" >			
				<tr>
					 <td width="34" height="34" class="leftTopBg"> &nbsp; </td>
					 <td width="526" height="34"  class="middleTopBg"> &nbsp; </td>
					 <td width="40" height="34" class="rightTopBg"> &nbsp; </td>
				</tr>
				<tr>
				    <td width="34" class="leftMiddleBg"> &nbsp;</td>
						 
          			<td  width="526" >
						<%-- Error msg block --%>
							<table   cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table width="100%" border="0" cellpadding="2" cellspacing="5">
											<tr>
												<td width="100%" height="20" valign="middle">
													Your session has been logged out. 
												</td>
											</tr>
											<tr>
												<td width="100%" height="20" valign="middle">
													Please <a href="<c:url value='/'/>">re-login</a>.
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

<script src="js/logoff.js" defer></script>

<jsp:directive.include file="/WEB-INF/jsp/bottom.jsp" />