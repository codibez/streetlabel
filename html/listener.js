window.onload = (e) => {
  window.addEventListener('message', onMessageRecieved);
};

function onMessageRecieved(event){
  let item = event.data;
  
	if (item && item.type === 'streetLabel:MSG') {
		if (!item.active) {
			$("#container").hide();
		} else {
      $("#container").show();
      
			let direction	= item.direction;
      let zone = item.zone;
      let street = item.street;

			$('#direction').text(direction);
      $('#zone').text(zone);
      $('#street').text(street);
		}
  }
  
  if (item && item.type === 'streetLabel:DATA') {
    let container = document.getElementById('container');
    
    /* color customization */
    let border = [item.border.r, item.border.g, item.border.b, item.border.a];
    let borderDOM = document.querySelectorAll('#border');
    
    let direction = [item.direction.r, item.direction.g, item.direction.b, item.direction.a];
    let zone = [item.zone.r, item.zone.g, item.zone.b, item.zone.a];
		let street = [item.street.r, item.street.g, item.street.b, item.street.a];
    
    // jQuery #direction to proper color & font-size configuration
    $('#direction').css('color', 'rgba('+direction.join(', ')+')');
		$('#direction').css('font-size', item.direction.size + 'vw');

    // jQuery #street to proper color & font-size configuration
    $('#street').css('color', 'rgba('+street.join(', ')+')');
    $('#street').css('font-size', item.street.size + 'vw');
    
    // jQuery #zone to proper color & font-size configuration
    $('#zone').css('color', 'rgba('+zone.join(', ')+')');
		$('#zone').css('font-size', item.zone.size + 'vw');
    
    for (let i=0; i < borderDOM.length; i++) {
      borderDOM[i].style.color = 'rgba('+border.join(', ')+')';
      borderDOM[i].style.fontSize = item.border.size + 'vw';
    }
    
    /* HUD position */
    if (item.offsetX) { container.style.left = item.offsetX + '%' }
    if (item.offsetY) { container.style.bottom = item.offsetY + '%' }
    
    /* view */
	}
}