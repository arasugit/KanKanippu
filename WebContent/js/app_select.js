var wins = new Array();
var product_set_path = "product/set";
function NewWindow(pageopen, winname) {

    LeftPosition=0;
    TopPosition=0;

    w = screen.width - 10;
    h = screen.height - 80;
    settings = 'width=' + w + ',height=' + h + ',top=' + TopPosition + ',left=' + LeftPosition 
    		+ ',scrollbars=yes,location=no,directories=no,status=no,menubar=no,toolbar=no,resizable=yes';

    win = window.open(pageopen, winname, settings);
    //wins.push(window.open(pageopen, '_blank', settings));
    wins.push(win);
    win.focus();
}

function SameWindow(pageopen, winname) {

	removeBeforeEventHandler();
    LeftPosition=0;
    TopPosition=0;

    w = screen.width - 10;
    h = screen.height - 80;
    settings = 'width=' + w + ',height=' + h + ',top=' + TopPosition + ',left=' + LeftPosition 
    		+ ',scrollbars=yes,location=no,directories=no,status=no,menubar=no,toolbar=no,resizable=yes';

    win = window.open(pageopen, winname, settings);
    wins.push(win);
    win.focus();
}



function closeChildWindow() {
	removeBeforeEventHandler();
	for(var j = 0; j < wins.length; j++){
		if (wins[j] && !wins[j].closed) {
			//alert(wins[j].location.href);
			wins[j].close();
		}
	}
}
function appSelectForm(path,p_id,productname)
{	
	var xmlHttpRequest = new XMLHttpRequest();
	var product={productId:p_id,name:productname};	
	xmlHttpRequest.open('POST', `${path}/${product_set_path}`,true);
	xmlHttpRequest.setRequestHeader('Content-Type', 'application/json');
	xmlHttpRequest.send(JSON.stringify(product));
}
document.addEventListener('DOMContentLoaded', function() {
	var links = document.getElementsByName("application_launch_link");	
	if (links && links.length > 0) {
		for (var i = 0; i < links.length;i++) {
			var lnk = links[i];			
			lnk.addEventListener("click", function(e) {	
				var currentLink=e.currentTarget;
				var launcher_application =currentLink.getAttribute("data-launcher-application");
				var app_context_path=currentLink.getAttribute("data-url-path"); 
				var selected_product_id=currentLink.getAttribute("data-product-id");
				var selected_product_name=currentLink.getAttribute("data-product-name");
				appSelectForm(app_context_path,selected_product_id,selected_product_name);				
				SameWindow(currentLink.getAttribute("href"), launcher_application);
			});
			
		}
	}
	var logout_button = document.getElementById("logout_button");
	if (logout_button) {
		logout_button.addEventListener('click', function() {
			closeChildWindow();
			window.location.href='j_spring_security_logout';
		});
	}
});
