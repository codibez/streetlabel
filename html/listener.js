window.onload = (e) => {
  let item = event.data;

  if (item && item.type === 'open') {
    // ternary operator to display container depending on item.active value
    if (!item.active) {
      $("#container").hide();
    } else {
      $("#container").show();

      const direction = `| ${item.direction} |`;
      const zone = item.zone;
      const street = item.street;
      
      $("#direction").textContent = direction;
      $("#street").textContent = street;
      $("#zone").textContent = zone;
    }
  }
  // window.addEventListener('message', onMessageRecieved);
};

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