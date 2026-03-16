document.getElementById("j_usernametoshow").focus();
function valid(obj) {
	var user = obj.value;
	if (user != "") {
		user = user.replace('&#95;', '_');
		user = user.replace('&#33;', '!');
		user = user.replace('&#34;', '"');
		user = user.replace('&#35;', '#');
		user = user.replace('&#36;', '$');
		user = user.replace('&#37;', '%');
		user = user.replace('&#38;', '&');
		user = user.replace('&#40;', '(');
		user = user.replace('&#41;', ')');
		user = user.replace('&#42;', '*');
		user = user.replace('&#43;', '+');
		user = user.replace('&#45;', '-');
		user = user.replace('&#46;', '.');
		user = user.replace('&#47;', '/');
		user = user.replace('&#58;', ':');
		user = user.replace('&#59;', ';');
		user = user.replace('&#60;', '<');
		user = user.replace('&#61;', '=');
		user = user.replace('&#62;', '>');
		user = user.replace('&#63;', '?');
		user = user.replace('&#64;', '@');
		user = user.replace('&#91;', '[');
		user = user.replace('&#92;', '\\');
		user = user.replace('&#93;', ']');
		user = user.replace('&#96;', '`');
		user = user.replace('&#123;', '{');
		user = user.replace('&#124;', '|');
		user = user.replace('&#125;', '}');
		user = user.replace('&#126;', '~');
		user = user.replace('&#130;', ',');
		document.getElementById("j_usernametoshow").value = user;
	}
}
function checkSubmit(e) {
	if (e && e.keyCode == 13) {
		submitForm();
	}
}
function submitForm() {
	removeBeforeEventHandler();
	document.getElementById("j_username").value = document
			.getElementById("j_usernametoshow").value;
	document.getElementById("txt_oldPassword").value = document
			.getElementById("txt_oldPasswordtoshow").value;
	document.getElementById("txt_newPassword").value = document
			.getElementById("txt_newPasswordtoshow").value;
	document.getElementById("txt_newPasswordConfirm").value = document
			.getElementById("txt_newPasswordConfirmtoshow").value;
	var authServerJS = document.getElementById("changepwdForm").getAttribute("data-auth-server");
	if (authServerJS.length > 0 && authServerJS == "oassrv") {
		var oldPwd = document.getElementById("txt_oldPassword").value;
		var newPwd = document.getElementById("txt_newPassword").value;
		var newPwdConfirm = document.getElementById("txt_newPasswordConfirm").value;
		var keyForJS = document.getElementById("changepwdForm").getAttribute("data-rsa-public-key");
		var rsa = new RSAKey();
		rsa.setPublic(keyForJS, '10001');
		var encryptData = rsa.encrypt(oldPwd);
		document.getElementById("txt_oldPassword").value = encryptData;

		encryptData = rsa.encrypt(newPwd);
		document.getElementById("txt_newPassword").value = encryptData;

		encryptData = rsa.encrypt(newPwdConfirm);
		document.getElementById("txt_newPasswordConfirm").value = encryptData;
	}
	document.getElementById("changepwdForm").submit();
}
function resetForm() {
	document.getElementById("j_usernametoshow").value = "";
	document.getElementById("txt_oldPasswordtoshow").value = "";
	document.getElementById("txt_newPasswordtoshow").value = "";
	document.getElementById("txt_newPasswordConfirmtoshow").value = "";
	document.getElementById("changepwdForm").reset();
}
function onFocus(event) {
	valid(event.target);
}
document.addEventListener('DOMContentLoaded', function() {
	document.getElementById("j_usernametoshow").addEventListener("keypress",
			checkSubmit);
	document.getElementById("j_usernametoshow").addEventListener("focus",
			onFocus);
	document.getElementById("txt_oldPasswordtoshow").addEventListener("keypress",
			checkSubmit);
	document.getElementById("txt_newPasswordtoshow").addEventListener("keypress",
			checkSubmit);
	document.getElementById("txt_newPasswordConfirmtoshow").addEventListener("keypress",
			checkSubmit);
	document.getElementById("submit_button").addEventListener("click",
			submitForm);
	document.getElementById("reset_button")
			.addEventListener("click", resetForm);
	document.getElementById("j_usernametoshow").focus();
});