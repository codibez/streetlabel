window.addEventListener('message', (event) => {
	let item = event.data;
  
	if (item.type === 'open') {
    if (!item.active) {
			$(".compass").hide();
		} else {
			$(".compass").show();

			$('span.direction').text(item.direction);
			$('span.street').text(item.street);
			$('span.street').css('color', item.color);
      $('span.zone').text(item.zone);
		}
	}  
})