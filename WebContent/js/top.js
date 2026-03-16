if( self == top ) {
	document.documentElement.style.display = 'block';	
} else {
	const url = getSafeUrl(self.location.href);
	if(url !== '' && decodeURIComponent(url) !== top.location.href){
		top.location.assign(decodeURIComponent(url));
	}
}

function getSafeUrl(location) {
	try {
		const url = new URL(location);
		const originValues = document.getElementById("origins").value;
		const origins = originValues.split(',').map(origin => origin.trim());
		if((url.protocol !== 'https:' || url.protocol !== 'http:') && url.origin !== window.location.origin && !origins.includes(url.origin)) return '';
		const sanitizedUri = encodeURIComponent(url.href);
		return sanitizedUri;
	}
	catch(error) {
		return '';
	}
}

var unloadEvent = function (e) {

       var xhr = new XMLHttpRequest();
       xhr.open("POST", "j_spring_security_logout", false);
       xhr.send();
};

window.onbeforeunload = unloadEvent;

function customDateString(arg) {
  var dayNames  =new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
  var monthNames=new Array("January","February","March","April","May","June","July","August","September","October","November","December");
  var defaultDate = dayNames[arg.getDay()] + ", " + monthNames[arg.getMonth()] + " " + arg.getDate() + ", " + arg.getFullYear();
  
  const day = String(arg.getDate()).padStart(2, '0');
  const month = String(arg.getMonth() + 1).padStart(2, '0');
  const year = arg.getFullYear();
  
  let dateFormat = document.getElementById("dateFormat").value;
  switch(dateFormat.toUpperCase()) {
  	case 'DD/MM/YYYY':
	  return `${day}/${month}/${year}`;
  	case 'DD-MM-YYYY':
  	  return `${day}-${month}-${year}`;
  	case 'MM/DD/YYYY':
  	  return `${month}/${day}/${year}`;
  	case 'MM-DD-YYYY':
  	  return `${month}-${day}-${year}`;
  	default:
  	  return defaultDate;
  }
}

function removeBeforeEventHandler(){
	window.onbeforeunload = function (){};
}

document.addEventListener('DOMContentLoaded', function() {
	var DateLayerText=customDateString(new Date());
	document.getElementById("top_current_date").innerHTML = DateLayerText + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
});
