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
  
  if (item && item.type === 'data') {
		/* color customization */
		let direction = [item.direction.r, item.direction.g, item.direction.b, item.direction.a];
		let zone = [item.zone.r, item.zone.g, item.zone.b, item.zone.a];
		let street = [item.street.r, item.street.g, item.street.b, item.street.a];
		let directionDOM = $('#direction'); let zoneDOM = $('#zone'); let streetDOM = $('#street');
		
		// Initialize DOM-elements with proper styling elements!
		directionDOM.css('color', 'rgba('+direction.join(', ')+')');
		zoneDOM.css('color', 'rgba('+zone.join(', ')+')');
		streetDOM.css('color', 'rgba('+street.join(', ')+')');
		
		if (directionDOM.css('color').toString() !=='rgba('+direction.join(', ')+')'.toString()) {
			console.log('ERROR => directionDOM styles are not configured properly :(');
			console.log('CONFIGURED => rgba('+direction.join(', ')+')'.toString());
			console.log('SET =>', directionDOM.css('color').toString());
			
			directionDOM.css('color', 'rgba('+direction.join(', ')+')');
		} else { console.log('SUCCESS! => direction is properly configured!'); }
		
		if (zoneDOM.css('color').toString() !== 'rgba('+zone.join(', ')+')'.toString()) {
			console.log('ERROR => zoneDOM styles are not configured properly :(');
			console.log('CONFIGURED => rgba('+zone.join(', ')+')'.toString());
			console.log('SET =>', zoneDOM.css('color').toString());
			
			zoneDOM.css('color', 'rgba('+zone.join(', ')+')');
		} else { console.log('SUCCESS! => zone is properly configured!'); }
		
		if (streetDOM.css('color').toString() !== 'rgba('+street.join(', ')+')'.toString()) {
			console.log('ERROR => zoneDOM styles are not configured properly :(');
			console.log('CONFIGURED => rgba('+street.join(', ')+')'.toString());
			console.log('SET =>', streetDOM.css('color').toString());
			
			streetDOM.css('color', 'rgba('+street.join(', ')+')');
		} else { console.log('SUCCESS! => street is properly configured!'); }
		
		/* position/sizing */
		
		/* view */
	}
}