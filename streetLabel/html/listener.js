window.onload = (e) => {
	window.addEventListener('message', onMessageRecieved);
};

var direction;
var zone;
var street;

function onMessageRecieved(event){
	var item = event.data;
	if(item !== undefined && item.type === "streetLabelMSG"){	
		if(item.active === false){
			$("#container").hide();
		} else {
			$("#container").show();
			direction	= "| "+item.direction+" |";
			zone		= item.zone;
			street		= item.street;
			$('#direction').text(direction);
			$(document.getElementById("zone").innerHTML			= zone);
			$(document.getElementById("street").innerHTML		= street);
		}
	}
}