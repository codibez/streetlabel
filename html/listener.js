window.onload = (e) => {
  window.addEventListener('message', onMessageRecieved);
};

function onMessageRecieved(event){
	let item = event.data;
	if (item && item.type === 'msg') {
		if (!item.active) {
			$("#container").hide();
		} else {
			$("#container").show();
			let direction	= `| ${item.direction} |`;
      let zone = item.zone;
      let street = item.street;

			$('#direction').text(direction);
      $('#zone').text(zone);
      $('#street').text(street);
		}
	}
}