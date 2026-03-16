function redirectToChgPwd(urlPath){
	removeBeforeEventHandler();
	window.location.href=urlPath;
    return false ;
}
document.addEventListener('DOMContentLoaded', function() {
	document.getElementById("yes_button")
			.addEventListener("click", function() {
				redirectToChgPwd('changepwd1.jsp');
			});
	document.getElementById("no_button")
	.addEventListener("click", function() {
		redirectToChgPwd('appSelect.jsp');
	});
});