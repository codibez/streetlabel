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
      if (item.color) { $('#street').css('color', item.color); }
      /* Position/Scale HUD according to configuration file */
      if (item.offsetX) { container.style.left = item.offsetX + '%'; }
      if (item.offsetY) { container.style.bottom = item.offsetY + '%'; }
      if (item.scale) { container.style.transform = `scale(${item.scale})`; }

      /* Dynamic stylesheet control */
      if (item.dynamic) {
        document.getElementById('style').href = 'dynamic.css';
      } else {
        document.getElementById('style').href = 'styles.css';
      }
	}
}