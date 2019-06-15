function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
	if not HideHud then
		SetTextFont(4)
		SetTextProportional(0)
		SetTextScale(scale, scale)
		SetTextColour(r, g, b, a)
		SetTextDropShadow(0, 0, 0, 0,255)
		SetTextEdge(1, 0, 0, 0, 255)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry("STRING")
		AddTextComponentString(text)
		DrawText(x - width/2, y - height/2 + 0.005)
	end
end

function drawTxt2(x,y ,width,height,scale, text, r,g,b,a)
	if not HideHud then
		SetTextFont(6)
		SetTextProportional(0)
		SetTextScale(scale, scale)
		SetTextColour(r, g, b, a)
		SetTextDropShadow(0, 0, 0, 0,255)
		SetTextEdge(1, 0, 0, 0, 255)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry("STRING")
		AddTextComponentString(text)
		DrawText(x - width/2, y - height/2 + 0.005)
	end
end

local directions = { [0] = 'N', [45] = 'NW', [90] = 'W', [135] = 'SW', [180] = 'S', [225] = 'SE', [270] = 'E', [315] = 'NE', [360] = 'N', } 
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)

		local ped = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(ped, false)
		local directions = { [0] = 'N', [45] = 'NW', [90] = 'W', [135] = 'SW', [180] = 'S', [225] = 'SE', [270] = 'E', [315] = 'NE', [360] = 'N', } 
		
		local pos = GetEntityCoords(PlayerPedId())
		local var1, var2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
		local current_zone = GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z))
		
		for k,v in pairs(directions)do
			direction = GetEntityHeading(PlayerPedId())
			if(math.abs(direction - k) < 22.5)then
				direction = v
				break
			end
		end

		if (checkForVehicle == false) then 
			if GetStreetNameFromHashKey(var1) and GetNameOfZone(pos.x, pos.y, pos.z) then
				if GetStreetNameFromHashKey(var1) then
					if direction == 'N' then
							drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.306, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
						if GetStreetNameFromHashKey(var2) == "" then
							drawTxt2(x-0.285, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
						else 
							drawTxt2(x-0.285, y+0.45, 1.0,1.0,0.45, GetStreetNameFromHashKey(var2) .. ", " .. GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z)), str_around_r, str_around_g, str_around_b, str_around_a)
						end
							drawTxt2(x-0.285, y+0.42, 1.0,1.0,0.55, GetStreetNameFromHashKey(var1), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
					elseif direction == 'NE' then 
							drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.298, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
						if GetStreetNameFromHashKey(var2) == "" then
							drawTxt2(x-0.277, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
						else 
							drawTxt2(x-0.277, y+0.45, 1.0,1.0,0.45, GetStreetNameFromHashKey(var2) .. ", " .. GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z)), str_around_r, str_around_g, str_around_b, str_around_a)
						end
						drawTxt2(x-0.277, y+0.42, 1.0,1.0,0.55, GetStreetNameFromHashKey(var1),curr_street_r, curr_street_g, curr_street_b, curr_street_a)
					elseif direction == 'E' then 
							drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.309, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
						if GetStreetNameFromHashKey(var2) == "" then
							drawTxt2(x-0.288, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
						else 
							drawTxt2(x-0.288, y+0.45, 1.0,1.0,0.45, GetStreetNameFromHashKey(var2) .. ", " .. GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z)), str_around_r, str_around_g, str_around_b, str_around_a)
						end
						drawTxt2(x-0.288, y+0.42, 1.0,1.0,0.55, GetStreetNameFromHashKey(var1), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
					elseif direction == 'SE' then 
							drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.298, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
						if GetStreetNameFromHashKey(var2) == "" then
							drawTxt2(x-0.275, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
						else 
							drawTxt2(x-0.275, y+0.45, 1.0,1.0,0.45, GetStreetNameFromHashKey(var2) .. ", " .. GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z)), str_around_r, str_around_g, str_around_b, str_around_a)
						end
							drawTxt2(x-0.275, y+0.42, 1.0,1.0,0.55, GetStreetNameFromHashKey(var1), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
					elseif direction == 'S' then
							drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.307, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
						if GetStreetNameFromHashKey(var2) == "" then
							drawTxt2(x-0.285, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
						else 
							drawTxt2(x-0.285, y+0.45, 1.0,1.0,0.45, GetStreetNameFromHashKey(var2) .. ", " .. GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z)), str_around_r, str_around_g, str_around_b, str_around_a)
						end
							drawTxt2(x-0.285, y+0.42, 1.0,1.0,0.55, GetStreetNameFromHashKey(var1), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
					elseif direction == 'SW' then
							drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.292, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
						if GetStreetNameFromHashKey(var2) == "" then
							drawTxt2(x-0.270, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
						else 
							drawTxt2(x-0.270, y+0.45, 1.0,1.0,0.45, GetStreetNameFromHashKey(var2) .. ", " .. GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z)), str_around_r, str_around_g, str_around_b, str_around_a)
						end
							drawTxt2(x-0.270, y+0.42, 1.0,1.0,0.55, GetStreetNameFromHashKey(var1), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
					elseif direction == 'W' then 
							drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.303, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
						if GetStreetNameFromHashKey(var2) == "" then 
							drawTxt2(x-0.280, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
						else
							drawTxt2(x-0.280, y+0.45, 1.0,1.0,0.45, GetStreetNameFromHashKey(var2) .. ", " .. GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z)), str_around_r, str_around_g, str_around_b, str_around_a)
						end
							drawTxt2(x-0.280, y+0.42, 1.0,1.0,0.55, GetStreetNameFromHashKey(var1), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
					elseif direction == 'NW' then
							drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.290, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
						if GetStreetNameFromHashKey(var2) == "" then
							drawTxt2(x-0.266, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
						else 
							drawTxt2(x-0.266, y+0.45, 1.0,1.0,0.45, GetStreetNameFromHashKey(var2) .. ", " .. GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z)), str_around_r, str_around_g, str_around_b, str_around_a)
						end 
							drawTxt2(x-0.266, y+0.42, 1.0,1.0,0.55, GetStreetNameFromHashKey(var1), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
					end
				end
			end
		else 
			if (vehicle ~= 0) then 
				if GetStreetNameFromHashKey(var1) and GetNameOfZone(pos.x, pos.y, pos.z) then
					if GetStreetNameFromHashKey(var1) then
						if direction == 'N' then
								drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
								drawTxt(x-0.306, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
								drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
							if GetStreetNameFromHashKey(var2) == "" then
								drawTxt2(x-0.285, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
							else 
								drawTxt2(x-0.285, y+0.45, 1.0,1.0,0.45, GetStreetNameFromHashKey(var2) .. ", " .. GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z)), str_around_r, str_around_g, str_around_b, str_around_a)
							end
								drawTxt2(x-0.285, y+0.42, 1.0,1.0,0.55, GetStreetNameFromHashKey(var1), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
						elseif direction == 'NE' then 
								drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
								drawTxt(x-0.298, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
								drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
							if GetStreetNameFromHashKey(var2) == "" then
								drawTxt2(x-0.277, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
							else 
								drawTxt2(x-0.277, y+0.45, 1.0,1.0,0.45, GetStreetNameFromHashKey(var2) .. ", " .. GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z)), str_around_r, str_around_g, str_around_b, str_around_a)
							end
							drawTxt2(x-0.277, y+0.42, 1.0,1.0,0.55, GetStreetNameFromHashKey(var1),curr_street_r, curr_street_g, curr_street_b, curr_street_a)
						elseif direction == 'E' then 
								drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
								drawTxt(x-0.309, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
								drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
							if GetStreetNameFromHashKey(var2) == "" then
								drawTxt2(x-0.288, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
							else 
								drawTxt2(x-0.288, y+0.45, 1.0,1.0,0.45, GetStreetNameFromHashKey(var2) .. ", " .. GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z)), str_around_r, str_around_g, str_around_b, str_around_a)
							end
							drawTxt2(x-0.288, y+0.42, 1.0,1.0,0.55, GetStreetNameFromHashKey(var1), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
						elseif direction == 'SE' then 
								drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
								drawTxt(x-0.298, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
								drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
							if GetStreetNameFromHashKey(var2) == "" then
								drawTxt2(x-0.275, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
							else 
								drawTxt2(x-0.275, y+0.45, 1.0,1.0,0.45, GetStreetNameFromHashKey(var2) .. ", " .. GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z)), str_around_r, str_around_g, str_around_b, str_around_a)
							end
								drawTxt2(x-0.275, y+0.42, 1.0,1.0,0.55, GetStreetNameFromHashKey(var1), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
						elseif direction == 'S' then
								drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
								drawTxt(x-0.307, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
								drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
							if GetStreetNameFromHashKey(var2) == "" then
								drawTxt2(x-0.285, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
							else 
								drawTxt2(x-0.285, y+0.45, 1.0,1.0,0.45, GetStreetNameFromHashKey(var2) .. ", " .. GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z)), str_around_r, str_around_g, str_around_b, str_around_a)
							end
								drawTxt2(x-0.285, y+0.42, 1.0,1.0,0.55, GetStreetNameFromHashKey(var1), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
						elseif direction == 'SW' then
								drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
								drawTxt(x-0.292, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
								drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
							if GetStreetNameFromHashKey(var2) == "" then
								drawTxt2(x-0.270, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
							else 
								drawTxt2(x-0.270, y+0.45, 1.0,1.0,0.45, GetStreetNameFromHashKey(var2) .. ", " .. GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z)), str_around_r, str_around_g, str_around_b, str_around_a)
							end
								drawTxt2(x-0.270, y+0.42, 1.0,1.0,0.55, GetStreetNameFromHashKey(var1), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
						elseif direction == 'W' then 
								drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
								drawTxt(x-0.303, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
								drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
							if GetStreetNameFromHashKey(var2) == "" then 
								drawTxt2(x-0.280, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
							else
								drawTxt2(x-0.280, y+0.45, 1.0,1.0,0.45, GetStreetNameFromHashKey(var2) .. ", " .. GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z)), str_around_r, str_around_g, str_around_b, str_around_a)
							end
								drawTxt2(x-0.280, y+0.42, 1.0,1.0,0.55, GetStreetNameFromHashKey(var1), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
						elseif direction == 'NW' then
								drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
								drawTxt(x-0.290, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
								drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
							if GetStreetNameFromHashKey(var2) == "" then
								drawTxt2(x-0.266, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
							else 
								drawTxt2(x-0.266, y+0.45, 1.0,1.0,0.45, GetStreetNameFromHashKey(var2) .. ", " .. GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z)), str_around_r, str_around_g, str_around_b, str_around_a)
							end 
								drawTxt2(x-0.266, y+0.42, 1.0,1.0,0.55, GetStreetNameFromHashKey(var1), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
						end
					end
				end
			end
		end
	end
end)