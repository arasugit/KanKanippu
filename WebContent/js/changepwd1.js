function checkSubmit(e) {
	if (e && e.keyCode == 13) {
		submitForm();
	}
}
function submitForm() {

	removeBeforeEventHandler();
	document.getElementById("txt_oldPassword").value = document
			.getElementById("txt_oldPasswordtoshow").value;
	document.getElementById("txt_newPassword").value = document
			.getElementById("txt_newPasswordtoshow").value;
	document.getElementById("txt_newPasswordConfirm").value = document
			.getElementById("txt_newPasswordConfirmtoshow").value;
	var authServerJS = document.getElementById("txt_authServer").value;
	if (authServerJS.length > 0 && authServerJS == "oassrv") {
		var oldPwd = document.getElementById("txt_oldPassword").value;
		var newPwd = document.getElementById("txt_newPassword").value;
		var newPwdConfirm = document.getElementById("txt_newPasswordConfirm").value;

		var keyForJS = document.getElementById("txt_keyForJS").value;
		var rsa = new RSAKey();
		rsa.setPublic(keyForJS, '10001');
		var encryptData = rsa.encrypt(oldPwd);
		document.getElementById("txt_oldPassword").value = encryptData;

		var encryptData = rsa.encrypt(newPwd);
		document.getElementById("txt_newPassword").value = encryptData;

		var encryptData = rsa.encrypt(newPwdConfirm);
		document.getElementById("txt_newPasswordConfirm").value = encryptData;
	}
	document.getElementById("changepwd1form").submit();
}
function resetForm() {
	document.getElementById("txt_oldPasswordtoshow").value = "";
	document.getElementById("txt_newPasswordtoshow").value = "";
	document.getElementById("txt_newPasswordConfirmtoshow").value = "";
	document.getElementById("changepwd1form").reset();
}
document.addEventListener('DOMContentLoaded', function() {
	document.getElementById("txt_oldPasswordtoshow").addEventListener(
			"keypress", checkSubmit);
	document.getElementById("txt_newPasswordtoshow").addEventListener(
			"keypress", checkSubmit);
	document.getElementById("txt_newPasswordConfirmtoshow").addEventListener(
			"keypress", checkSubmit);
	document.getElementById("submit_button").addEventListener("click",
			submitForm);
	document.getElementById("reset_button")
			.addEventListener("click", resetForm);
	document.getElementById("cancel_button").addEventListener("click",
			function() {
				window.location.href = 'appSelect.jsp';
				removeBeforeEventHandler();
			});
});