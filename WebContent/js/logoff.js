if (window.opener && !window.opener.closed && window.opener!=self) {
	window.close();
	window.opener.location.href="logoff.jsp";
	window.opener.focus();
}