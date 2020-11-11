-- Variables
local directions = {
  N = 360,
  NE = 315,
  E = 270,
  SE = 225,
  S = 180,
  SW = 135,
  W = 90,
  NW = 45,
  N = 0,
}

Citizen.CreateThread(function()
  while true do
    local ped = PlayerPedId();
    local veh = GetVehiclePedIsIn(ped);
    local pos = GetEntityCoords(ped);
    local zone = GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z));

    if (checkForVehicle == false or localVehicle ~= 0) then
			local var1, var2	= GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
			local street = GetStreetNameFromHashKey(var1);
			local crossing = GetStreetNameFromHashKey(var2);
			local direction = GetEntityHeading(ped);
			
			for k, v in pairs(directions) do
				if (math.abs(direction - v) < 22.5) then
					direction = k
					break
				end
			end

			SendNuiMessage({
        type = 'open',
        active = true,
        direction,
        zone,
        street
      })
    
    else
      if (veh) then
        SendNuiMessage({
          type = 'open',
          active = true,
          direction,
          zone,
          street
        })
      else
        SendNuiMessage({
          type = 'close',
          active = false
        })
      end
		end

		-- Wait for half a second.
		Citizen.Wait(500);

	end
end)