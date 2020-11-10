-- Variables
local directions = {[0] = 'N', [45] = 'NW', [90] = 'W', [135] = 'SW', [180] = 'S', [225] = 'SE', [270] = 'E', [315] = 'NE', [360] = 'N', } 

local playerPedID;
local localPed;
local localVehicle = 0;
local coords;
local zone;
local zoneLabel;

local streetHash1;
local streetHash2;

local playerDirection;

Citizen.CreateThread(function()

	while true do

		localPed		= GetPlayerPed(-1);
		playerPedID		= PlayerPedId();

		localVehicle	= GetVehiclePedIsIn(localPed, false);
		coords			= GetEntityCoords(playerPedID);
		zone			= GetNameOfZone(coords.x, coords.y, coords.z);
		zoneLabel		= GetLabelText(zone);

		if(checkForVehicle == false or localVehicle ~= 0) then 

			local var1, var2	= GetStreetNameAtCoord(coords.x, coords.y, coords.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
			streetHash1			= GetStreetNameFromHashKey(var1);
			streetHash2			= GetStreetNameFromHashKey(var2);
			playerDirection		= GetEntityHeading(playerPedID);
			
			for k,v in pairs(directions)do
				if(math.abs(playerDirection - k) < 22.5)then
					playerDirection = v
					break
				end
			end

			local street2 = "";
			if(streetHash2 == "") then	street2 = zoneLabel;
			else						street2 = streetHash2..", "..zoneLabel; end

			SendNUIMessage({type = 'streetLabelMSG', active = true, direction = playerDirection, zone = streetHash1, street = street2});
		else
			SendNUIMessage({type = 'streetLabelMSG', active = false});
		end

		-- Wait for half a second.
		Citizen.Wait(500);

	end
end)