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

local veh = 0;
local streetHash1, streetHash2, playerDirection;

Citizen.CreateThread(function()
	while true do
		local ped = GetPlayerPed(-1);
    local veh = GetVehiclePedIsIn(ped, false);
    
		local coords = GetEntityCoords(PlayerPedId());
		local zone = GetNameOfZone(coords.x, coords.y, coords.z);
		local zoneLabel = GetLabelText(zone);

		if(checkForVehicle == false or veh ~= 0) then 
			local var1, var2 = GetStreetNameAtCoord(coords.x, coords.y, coords.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
			streetHash1 = GetStreetNameFromHashKey(var1);
			streetHash2 = GetStreetNameFromHashKey(var2);
			playerDirection = GetEntityHeading(PlayerPedId());
			
			for k, v in pairs(directions) do
				if (math.abs(playerDirection - v) < 22.5) then
					playerDirection = k;
					break;
				end
			end

			local street2 = '';
			if (streetHash2 == '') then
				street2 = zoneLabel;
			else
				street2 = streetHash2..', '..zoneLabel;
			end

			SendNUIMessage({
        type = 'msg',
        active = true,
        direction = playerDirection,
        zone = streetHash1,
        street = street2
      });
		else
			SendNUIMessage({
        type = 'msg',
        active = false
      });
		end
		-- Wait for half a second.
		Citizen.Wait(500);
  end
end)