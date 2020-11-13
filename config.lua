config = {
	-- Color customization options
	colours = {
		current = {
			r=255;
			g=255;
			b=255;
			a=0.9;
		};
		crossing = {
			r=240;
			g=220;
			b=80;
			a=0.9;
		};
		direction = {
			r=240;
			g=220;
			b=80;
			a=0.9;
		};
	};
	
	-- General HUD positioning/sizing
	position = {
		offsetX = 0; -- Recommended to increment by x
		offsetY = 0; -- Recommended to increment by x
		size = 100;
	};

	vehicleCheck = true; -- Rather or not to display HUD when player(s) are inside a vehicle
	view = 'classic'; -- classic: original Street Label look -- dynamic: new dynamic inline HUD 
}