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
		   if(e && e.keyCode == 13) {
			   submitForm();
		   }
		}
	function submitForm()
	{
		removeBeforeEventHandler();
		document.getElementById("txt_password").value	= document.getElementById("txt_passwordtoshow").value;
		document.getElementById("j_username").value = document.getElementById("j_usernametoshow").value;
		var authServerJS = document.getElementById("loginForm").getAttribute("data-auth-server");
		if (authServerJS.length > 0 && authServerJS == "oassrv") {
			var inputString=document.getElementById("txt_password").value;
			var keyForJS= document.getElementById("loginForm").getAttribute("data-rsa-public-key");
			var rsa = new RSAKey();
			rsa.setPublic(keyForJS,'10001');
 			var encryptData = rsa.encrypt(inputString);
 			document.getElementById("txt_password").value=encryptData;
		}
		 document.getElementById("loginForm").submit();
 	}
	function resetForm()
	{
		document.getElementById("j_usernametoshow").value = "";
		document.getElementById("txt_passwordtoshow").value = "";
		document.getElementById("loginForm").reset();
	}
	function onFocus(event)
	{
		valid(event.target);
	}
	document.addEventListener('DOMContentLoaded', function() {
		document.getElementById("j_usernametoshow").addEventListener("keypress", checkSubmit);
		document.getElementById("j_usernametoshow").addEventListener("focus", onFocus);
		document.getElementById("txt_passwordtoshow").addEventListener("keypress", checkSubmit);
		document.getElementById("login_button").addEventListener("click", submitForm);
		document.getElementById("reset_button").addEventListener("click", resetForm);
		document.getElementById("j_usernametoshow").focus();
	});
			