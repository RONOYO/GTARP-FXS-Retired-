-- Health/Armor bars (WIP)
--[[function GetMinimapAnchor()
    -- Safezone goes from 1.0 (no gap) to 0.9 (5% gap (1/20))
    -- 0.05 * ((safezone - 0.9) * 10)
    local safezone = GetSafeZoneSize()
    local safezone_x = 1.0 / 20.0
    local safezone_y = 1.0 / 20.0
    local aspect_ratio = GetAspectRatio(0)
    local res_x, res_y = GetActiveScreenResolution()
    local xscale = 1.0 / res_x
    local yscale = 1.0 / res_y
    local Minimap = {}
    Minimap.width = xscale * (res_x / (4 * aspect_ratio))
    Minimap.height = yscale * (res_y / 5.674)
    Minimap.left_x = xscale * (res_x * (safezone_x * ((math.abs(safezone - 1.0)) * 10)))
    Minimap.bottom_y = 1.0 - yscale * (res_y * (safezone_y * ((math.abs(safezone - 1.0)) * 10)))
    Minimap.right_x = Minimap.left_x + Minimap.width
    Minimap.top_y = Minimap.bottom_y - Minimap.height
    Minimap.x = Minimap.left_x
    Minimap.y = Minimap.top_y
    Minimap.xunit = xscale
    Minimap.yunit = yscale
    return Minimap
end

function drawRct(x, y, width, height, r, g, b, a)
    DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ui = GetMinimapAnchor()
        local thickness = 20 -- Defines how many pixels wide the border is
        drawRct(ui.x, ui.y + ui.height, ui.width, -thickness * ui.yunit, 71,71, 71, 175)
    end
end)

--]]


--PLD

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
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
function drawTxt2(x,y ,width,height,scale, text, r,g,b,a)
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
local zones = { ['AIRP'] = "Los Santos International Airport", ['ALAMO'] = "Alamo Sea", ['ALTA'] = "Alta", ['ARMYB'] = "Fort Zancudo", ['BANHAMC'] = "Banham Canyon Dr", ['BANNING'] = "Banning", ['BEACH'] = "Vespucci Beach", ['BHAMCA'] = "Banham Canyon", ['BRADP'] = "Braddock Pass", ['BRADT'] = "Braddock Tunnel", ['BURTON'] = "Burton", ['CALAFB'] = "Calafia Bridge", ['CANNY'] = "Raton Canyon", ['CCREAK'] = "Cassidy Creek", ['CHAMH'] = "Chamberlain Hills", ['CHIL'] = "Vinewood Hills", ['CHU'] = "Chumash", ['CMSW'] = "Chiliad Mountain State Wilderness", ['CYPRE'] = "Cypress Flats", ['DAVIS'] = "Davis", ['DELBE'] = "Del Perro Beach", ['DELPE'] = "Del Perro", ['DELSOL'] = "La Puerta", ['DESRT'] = "Grand Senora Desert", ['DOWNT'] = "Downtown", ['DTVINE'] = "Downtown Vinewood", ['EAST_V'] = "East Vinewood", ['EBURO'] = "El Burro Heights", ['ELGORL'] = "El Gordo Lighthouse", ['ELYSIAN'] = "Elysian Island", ['GALFISH'] = "Galilee", ['GOLF'] = "GWC and Golfing Society", ['GRAPES'] = "Grapeseed", ['GREATC'] = "Great Chaparral", ['HARMO'] = "Harmony", ['HAWICK'] = "Hawick", ['HORS'] = "Vinewood Racetrack", ['HUMLAB'] = "Humane Labs and Research", ['JAIL'] = "Bolingbroke Penitentiary", ['KOREAT'] = "Little Seoul", ['LACT'] = "Land Act Reservoir", ['LAGO'] = "Lago Zancudo", ['LDAM'] = "Land Act Dam", ['LEGSQU'] = "Legion Square", ['LMESA'] = "La Mesa", ['LOSPUER'] = "La Puerta", ['MIRR'] = "Mirror Park", ['MORN'] = "Morningwood", ['MOVIE'] = "Richards Majestic", ['MTCHIL'] = "Mount Chiliad", ['MTGORDO'] = "Mount Gordo", ['MTJOSE'] = "Mount Josiah", ['MURRI'] = "Murrieta Heights", ['NCHU'] = "North Chumash", ['NOOSE'] = "N.O.O.S.E", ['OCEANA'] = "Pacific Ocean", ['PALCOV'] = "Paleto Cove", ['PALETO'] = "Paleto Bay", ['PALFOR'] = "Paleto Forest", ['PALHIGH'] = "Palomino Highlands", ['PALMPOW'] = "Palmer-Taylor Power Station", ['PBLUFF'] = "Pacific Bluffs", ['PBOX'] = "Pillbox Hill", ['PROCOB'] = "Procopio Beach", ['RANCHO'] = "Rancho", ['RGLEN'] = "Richman Glen", ['RICHM'] = "Richman", ['ROCKF'] = "Rockford Hills", ['RTRAK'] = "Redwood Lights Track", ['SANAND'] = "San Andreas", ['SANCHIA'] = "San Chianski Mountain Range", ['SANDY'] = "Sandy Shores", ['SKID'] = "Mission Row", ['SLAB'] = "Stab City", ['STAD'] = "Maze Bank Arena", ['STRAW'] = "Strawberry", ['TATAMO'] = "Tataviam Mountains", ['TERMINA'] = "Terminal", ['TEXTI'] = "Textile City", ['TONGVAH'] = "Tongva Hills", ['TONGVAV'] = "Tongva Valley", ['VCANA'] = "Vespucci Canals", ['VESP'] = "Vespucci", ['VINE'] = "Vinewood", ['WINDF'] = "Ron Alternates Wind yellm", ['WVINE'] = "West Vinewood", ['ZANCUDO'] = "Zancudo River", ['ZP_ORT'] = "Port of South Los Santos", ['ZQ_UAR'] = "Davis Quartz" }
local directions = { [0] = '~b~N', [45] = '~b~NW', [90] = '~b~W', [135] = '~b~SW', [180] = '~b~S', [225] = '~b~SE', [270] = '~b~E', [315] = '~b~NE', [360] = '~b~N', } 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local pos = GetEntityCoords(GetPlayerPed(-1))
        local var1, var2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
        local current_zone = zones[GetNameOfZone(pos.x, pos.y, pos.z)]

        for k,v in pairs(directions)do
            direction = GetEntityHeading(GetPlayerPed(-1))
            if(math.abs(direction - k) < 22.5)then
                direction = v
                break;
            end
        end
        
        if(GetStreetNameFromHashKey(var1) and GetNameOfZone(pos.x, pos.y, pos.z))then
            if(zones[GetNameOfZone(pos.x, pos.y, pos.z)] and tostring(GetStreetNameFromHashKey(var1)))then
                if direction == '~b~N' then
                        drawTxt(x-0.338, y+0.68, 1.0,1.5,0.9, " | ", border_r, border_g, border_b, border_a)
                        drawTxt(x-0.319, y+0.68, 1.0,1.5,0.9, " | ", border_r, border_g, border_b, border_a)
                        drawTxt(x-0.326, y+0.435, 1.0,1.0,0.74, direction, dir_r, dir_g, dir_b, dir_a)
                    if tostring(GetStreetNameFromHashKey(var2)) == "" then
                        drawTxt2(x-0.305, y+0.4545, 1.0,1.0,0.38, current_zone, town_r, town_g, town_b, town_a)
                    else 
                        drawTxt2(x-0.305, y+0.4545, 1.0,1.0,0.38, tostring(GetStreetNameFromHashKey(var2)) .. " ~b~/~w~ " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], str_around_r, str_around_g, str_around_b, str_around_a)
                    end
                        drawTxt2(x-0.305, y+0.434, 1.0,1.0,0.42, "~b~" .. tostring(GetStreetNameFromHashKey(var1)), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
                elseif direction == '~b~NE' then 
                        drawTxt(x-0.338, y+0.68, 1.0,1.5,0.9, " | ", border_r, border_g, border_b, border_a)
                        drawTxt(x-0.312, y+0.68, 1.0,1.5,0.9, " | ", border_r, border_g, border_b, border_a)
                        drawTxt(x-0.326, y+0.435, 1.0,1.0,0.74, direction, dir_r, dir_g, dir_b, dir_a)
                    if tostring(GetStreetNameFromHashKey(var2)) == "" then
                        drawTxt2(x-0.30, y+0.4545, 1.0,1.0,0.38, current_zone, town_r, town_g, town_b, town_a)
                    else 
                        drawTxt2(x-0.30, y+0.4545, 1.0,1.0,0.38, tostring(GetStreetNameFromHashKey(var2)) .. " ~b~/~w~ " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], str_around_r, str_around_g, str_around_b, str_around_a)
                    end
                        drawTxt2(x-0.30, y+0.434, 1.0,1.0,0.42, "~b~" .. tostring(GetStreetNameFromHashKey(var1)), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
                elseif direction == '~b~E' then 
                        drawTxt(x-0.338, y+0.68, 1.0,1.5,0.9, " | ", border_r, border_g, border_b, border_a)
                        drawTxt(x-0.319, y+0.68, 1.0,1.5,0.9, " | ", border_r, border_g, border_b, border_a)
                        drawTxt(x-0.324, y+0.435, 1.0,1.0,0.74, direction, dir_r, dir_g, dir_b, dir_a)
                    if tostring(GetStreetNameFromHashKey(var2)) == "" then
                        drawTxt2(x-0.305, y+0.4545, 1.0,1.0,0.38, current_zone, town_r, town_g, town_b, town_a)
                    else 
                        drawTxt2(x-0.305, y+0.4545, 1.0,1.0,0.38, tostring(GetStreetNameFromHashKey(var2)) .. " ~b~/~w~ " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], str_around_r, str_around_g, str_around_b, str_around_a)
                    end
                        drawTxt2(x-0.305, y+0.434, 1.0,1.0,0.42, "~b~" .. tostring(GetStreetNameFromHashKey(var1)), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
                elseif direction == '~b~SE' then 
                        drawTxt(x-0.338, y+0.68, 1.0,1.5,0.9, " | ", border_r, border_g, border_b, border_a)
                        drawTxt(x-0.312, y+0.68, 1.0,1.5,0.9, " | ", border_r, border_g, border_b, border_a)
                        drawTxt(x-0.325, y+0.435, 1.0,1.0,0.74, direction, dir_r, dir_g, dir_b, dir_a)
                    if tostring(GetStreetNameFromHashKey(var2)) == "" then
                        drawTxt2(x-0.30, y+0.4545, 1.0,1.0,0.38, current_zone, town_r, town_g, town_b, town_a)
                    else 
                        drawTxt2(x-0.30, y+0.4545, 1.0,1.0,0.38, tostring(GetStreetNameFromHashKey(var2)) .. " ~b~/~w~ " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], str_around_r, str_around_g, str_around_b, str_around_a)
                    end
                        drawTxt2(x-0.30, y+0.434, 1.0,1.0,0.42, "~b~" .. tostring(GetStreetNameFromHashKey(var1)), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
                elseif direction == '~b~S' then
                        drawTxt(x-0.338, y+0.68, 1.0,1.5,0.9, " | ", border_r, border_g, border_b, border_a)
                        drawTxt(x-0.319, y+0.68, 1.0,1.5,0.9, " | ", border_r, border_g, border_b, border_a)
                        drawTxt(x-0.325, y+0.435, 1.0,1.0,0.74, direction, dir_r, dir_g, dir_b, dir_a)
                    if tostring(GetStreetNameFromHashKey(var2)) == "" then
                        drawTxt2(x-0.305, y+0.4545, 1.0,1.0,0.38, current_zone, town_r, town_g, town_b, town_a)
                    else 
                        drawTxt2(x-0.305, y+0.4545, 1.0,1.0,0.38, tostring(GetStreetNameFromHashKey(var2)) .. " ~b~/~w~ " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], str_around_r, str_around_g, str_around_b, str_around_a)
                    end
                        drawTxt2(x-0.305, y+0.434, 1.0,1.0,0.42, "~b~" .. tostring(GetStreetNameFromHashKey(var1)), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
                elseif direction == '~b~SW' then
                        drawTxt(x-0.338, y+0.68, 1.0,1.5,0.9, " | ", border_r, border_g, border_b, border_a)
                        drawTxt(x-0.308, y+0.68, 1.0,1.5,0.9, " | ", border_r, border_g, border_b, border_a)
                        drawTxt(x-0.325, y+0.435, 1.0,1.0,0.74, direction, dir_r, dir_g, dir_b, dir_a)
                    if tostring(GetStreetNameFromHashKey(var2)) == "" then
                        drawTxt2(x-0.294, y+0.4545, 1.0,1.0,0.38, current_zone, town_r, town_g, town_b, town_a)
                    else 
                        drawTxt2(x-0.294, y+0.4545, 1.0,1.0,0.38, tostring(GetStreetNameFromHashKey(var2)) .. " ~b~/~w~ " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], str_around_r, str_around_g, str_around_b, str_around_a)
                    end
                        drawTxt2(x-0.294, y+0.434, 1.0,1.0,0.42, "~b~" .. tostring(GetStreetNameFromHashKey(var1)), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
                elseif direction == '~b~W' then 
                        drawTxt(x-0.338, y+0.68, 1.0,1.5,0.9, " | ", border_r, border_g, border_b, border_a)
                        drawTxt(x-0.317, y+0.68, 1.0,1.5,0.9, " | ", border_r, border_g, border_b, border_a)
                        drawTxt(x-0.326, y+0.435, 1.0,1.0,0.74, direction, dir_r, dir_g, dir_b, dir_a)
                    if tostring(GetStreetNameFromHashKey(var2)) == "" then
                        drawTxt2(x-0.303, y+0.4545, 1.0,1.0,0.38, current_zone, town_r, town_g, town_b, town_a)
                    else 
                        drawTxt2(x-0.303, y+0.4545, 1.0,1.0,0.38, tostring(GetStreetNameFromHashKey(var2)) .. " ~b~/~w~ " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], str_around_r, str_around_g, str_around_b, str_around_a)
                    end
                        drawTxt2(x-0.303, y+0.434, 1.0,1.0,0.42, "~b~" .. tostring(GetStreetNameFromHashKey(var1)), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
                elseif direction == '~b~NW' then
                        drawTxt(x-0.338, y+0.68, 1.0,1.5,0.9, " | ", border_r, border_g, border_b, border_a)
                        drawTxt(x-0.306, y+0.68, 1.0,1.5,0.9, " | ", border_r, border_g, border_b, border_a)
                        drawTxt(x-0.325, y+0.435, 1.0,1.0,0.74, direction, dir_r, dir_g, dir_b, dir_a)
                    if tostring(GetStreetNameFromHashKey(var2)) == "" then
                        drawTxt2(x-0.292, y+0.4545, 1.0,1.0,0.38, current_zone, town_r, town_g, town_b, town_a)
                    else 
                        drawTxt2(x-0.292, y+0.4545, 1.0,1.0,0.38, tostring(GetStreetNameFromHashKey(var2)) .. " ~b~/~w~ " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], str_around_r, str_around_g, str_around_b, str_around_a)
                    end
                        drawTxt2(x-0.292, y+0.434, 1.0,1.0,0.42, "~b~" .. tostring(GetStreetNameFromHashKey(var1)), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
                end
            end
        end
    end
end)
--Top Info

local displayTime = true
local useMilitaryTime = false

local displayDayOfWeek = false
local displayDate = false

local timeAndDateString = nil
local hour
local minute
local dayOfWeek
local month
local dayOfMonth
local year

Citizen.CreateThread(function()
	while true do
		Wait(1)
		timeAndDateString = "|"
		
		if displayTime == true then
			CalculateTimeToDisplay()
			timeAndDateString = "" .. hour .. "~b~:~w~" .. minute .. ""
		end
		if displayDayOfWeek == true then
			CalculateDayOfWeekToDisplay()
			timeAndDateString = timeAndDateString .. " " .. dayOfWeek .. " |"
		end
		if displayDate == true then
			CalculateDateToDisplay()
			timeAndDateString = timeAndDateString .. " " .. month .. "~b~/~w~" .. dayOfMonth .. "~b~/~w~" .. year .. ""
		end
		
		SetTextFont(4)
		SetTextProportional(1)
		SetTextScale(0.30, 0.30)
		SetTextColour(255, 255, 255, 255)
		SetTextEdge(1, 0, 0, 0, 255)
		SetTextOutline()
		SetTextWrap(0,0.95)
		SetTextEntry("STRING")
		
		AddTextComponentString(timeAndDateString)
		DrawText(0.175, 0.93)
	end
end)

function CalculateTimeToDisplay()
	hour = GetClockHours()
	minute = GetClockMinutes()

	if useMilitaryTime == false then
		if hour == 0 or hour == 24 then
			hour = 12
		elseif hour >= 13 then
			hour = hour - 12
		end
	end

	if hour <= 9 then
		hour = "0" .. hour
	end
	if minute <= 9 then
		minute = "0" .. minute
	end
end

function CalculateDayOfWeekToDisplay()
	dayOfWeek = GetClockDayOfWeek()

	
	if dayOfWeek == 0 then
		dayOfWeek = "Sunday"
	elseif dayOfWeek == 1 then
		dayOfWeek = "Monday"
	elseif dayOfWeek == 2 then
		dayOfWeek = "Tuesday"
	elseif dayOfWeek == 3 then
		dayOfWeek = "Wednesday"
	elseif dayOfWeek == 4 then
		dayOfWeek = "Thursday"
	elseif dayOfWeek == 5 then
		dayOfWeek = "Friday"
	elseif dayOfWeek == 6 then
		dayOfWeek = "Saturday"
	end
end

function CalculateDateToDisplay()
	month = GetClockMonth()
	dayOfMonth = GetClockDayOfMonth()
	year = GetClockYear()
	
	if month == 0 then
		month = "1"
	elseif month == 1 then
		month = "1"
	elseif month == 2 then
		month = "3"
	elseif month == 3 then
		month = "4"
	elseif month == 4 then
		month = "5"
	elseif month == 5 then
		month = "6"
	elseif month == 6 then
		month = "7"
	elseif month == 7 then
		month = "8"
	elseif month == 8 then
		month = "9"
	elseif month == 9 then
		month = "10"
	elseif month == 10 then
		month = "11"
	elseif month == 11 then
		month = "12"
	end
end

--Carhud

-- ################################### --
--									   --
--        C   O   N   F   I   G        --
--									   --
-- ################################### --

-- Cruise Control and Engine Code wrote by TheMrDeivid(https://forum.fivem.net/u/David_Carneiro)
-- RPM and Gears code wrote by Cheleber(https://forum.fivem.net/u/Cheleber) and TheMrDeivid(https://forum.fivem.net/u/David_Carneiro)
-- Race Mode Wrote by TheMrDeivid(https://forum.fivem.net/u/David_Carneiro) and thanks for the 2 lines of code that saved me Ezy(https://forum.fivem.net/u/ezy/)
-- Race Mode 2 Wrote by TheMrDeivid(https://forum.fivem.net/u/David_Carneiro)
-- NOTE: The Cruise Control script it self its not here only the text fuction

-- show/hide compoent
local HUD = {
	
	Speed 			= 'mph', 	-- kmh or mph

	DamageSystem 	= false, 

	SpeedIndicator 	= false,

	ParkIndicator 	= false,

	Top 			= false,  	-- ALL TOP PANAL ( oil, dsc, plate, fluid, ac )

	Plate 			= false, 	-- only if Top is false and you want to keep Plate Number

	Engine			= false,  	-- Engine Status off/on
	
	Cruise			= false,  	-- Enables/Disables The CRUISE Control status (default key F9)
	
	CarRPM			= false,  	-- Enables/Disables The RPM status of the car
	
	CarGears		= true,  	-- Enables/Disables The status of the gears of the car
	
	RaceMode		= false, 	-- Enables/Disable The Race Mode HUD (NEW)
	
	RaceMode2		= false,		-- Enables/Disables the Race Mode HUD 2, only if the Racde Mode is false (NEW) 

}

-- Move the entire UI
local UI = { 

	x =  0.000 ,	-- Base Screen Coords 	+ 	 x
	y = -0.001 ,	-- Base Screen Coords 	+ 	-y

}

-- Move the entire Race Mode
local RM = { 

	x =  0.000 ,	-- Base Screen Coords 	+ 	 x
	y = -0.001 ,	-- Base Screen Coords 	+ 	-y

}

-- Change this if you want
local cruisekey = 56 -- F9
local EngineHpBroken = 110
local EngineHpAlmostBroken = 370

-- Don't touch this
local cruisecolor = false
local carspeed = nil


-- ################################### --
--									   --
--             C   O   D   E           --
--									   --
-- ################################### --



Citizen.CreateThread(function()
	while true do Citizen.Wait(1)


		local MyPed = GetPlayerPed(-1)
		
		if(IsPedInAnyVehicle(MyPed, false))then

			local MyPedVeh = GetVehiclePedIsIn(GetPlayerPed(-1),false)
			local PlateVeh = GetVehicleNumberPlateText(MyPedVeh)
			local VehStopped = IsVehicleStopped(MyPedVeh)
			local VehEngineHP = GetVehicleEngineHealth(MyPedVeh) 
			local VehBodyHP = GetVehicleBodyHealth(MyPedVeh)
			local VehBurnout = IsVehicleInBurnout(MyPedVeh)
	--  #### 		   EDITED IN			  ####  --
			local PedHeli = IsPedInAnyHeli(MyPed)										-- Checks if the PED is in any Heli
			local PedPlane = IsPedInAnyPlane(MyPed)										-- Checks if the PEd is in any Plane
			local PedBoat = IsPedInAnyBoat(MyPed)										-- Checks if the PED is in any Boat
			local PedBike = IsPedOnAnyBike(MyPed)										-- Checks if the PED is in any Bike or Bicycle
			local Gear = GetVehicleCurrentGear(MyPedVeh)								-- Check the current gear of the vehicle
            local RPM = GetVehicleCurrentRpm(MyPedVeh)									-- Check the rpm of the vehicle
			local model = GetVehicleClass(MyPedVeh)										-- Check the vehicle class/model
			local driverseat = IsVehicleSeatFree(MyPedVeh)								-- Driver Seat
			local _,llightson,lhighbeams = GetVehicleLightsState(MyPedVeh, 0)			-- Left Beams
			local _,rlightson,rhighbeams = GetVehicleLightsState(MyPedVeh, 1)			-- Right Beams
			local Passenger1 = GetVehicleNumberOfPassengers(MyPedVeh, 0)				-- Seat Right Front
			local Passenger2 = GetVehicleNumberOfPassengers(MyPedVeh, 1)				-- Seat Left Back
			local Passenger3 = GetVehicleNumberOfPassengers(MyPedVeh, 2)				-- Seat Right Back
			local DoorDamagef1 = IsVehicleDoorDamaged(MyPedVeh, 0)						-- Front Left Door
			local DoorDamagef2 = IsVehicleDoorDamaged(MyPedVeh, 1)						-- Front Right Door
			local DoorDamagef3 = IsVehicleDoorDamaged(MyPedVeh, 2)						-- Back Left Door
			local DoorDamagef4 = IsVehicleDoorDamaged(MyPedVeh, 3)						-- Back Right Door
			local HoodDamagef = IsVehicleDoorDamaged(MyPedVeh, 4)						-- Hood
			local TrunkDamagef = IsVehicleDoorDamaged(MyPedVeh, 5)						-- Trunk
			local WindowDamage1 = IsVehicleWindowIntact(MyPedVeh, 0)					-- Front Left Window
			local WindowDamage2 = IsVehicleWindowIntact(MyPedVeh, 1)					-- Front Right Window
			local WindowDamage3 = IsVehicleWindowIntact(MyPedVeh, 2)					-- Back Left Window
			local WindowDamage4 = IsVehicleWindowIntact(MyPedVeh, 3)					-- Back Right Window
			local WindowDamage5 = IsVehicleWindowIntact(MyPedVeh, 6)					-- Windshield
			local WindowDamage6 = IsVehicleWindowIntact(MyPedVeh, 7)					-- Back Window
			local TyreBurst1 = IsVehicleTyreBurst(MyPedVeh, 0)							-- Front Left Tyre
			local TyreBurst2 = IsVehicleTyreBurst(MyPedVeh, 1)							-- Front Right Tyre
			local TyreBurst3 = IsVehicleTyreBurst(MyPedVeh, 4)							-- Back Left Tyre
			local TyreBurst4 = IsVehicleTyreBurst(MyPedVeh, 5)							-- Back Right Tyre
			local Bumper1 = IsVehicleBumperBrokenOff(MyPedVeh, 0)						-- Back Broken Bumper
			local Bumper2 = IsVehicleBumperBrokenOff(MyPedVeh, 1)						-- Front Broken Bumper
			local Hangingbumper1 = Citizen.InvokeNative(0x27B926779DEB502D,MyPedVeh, 0) -- Back Hanging Bumper
			local Hangingbumper2 = Citizen.InvokeNative(0x27B926779DEB502D,MyPedVeh, 1) -- Front Hanging Bumper
			local LHeadlight = Citizen.InvokeNative(0x5EF77C9ADD3B11A3,MyPedVeh)		-- Left HeadLight
			local RHeadlight = Citizen.InvokeNative(0xA7ECB73355EB2F20,MyPedVeh)		-- Right HeadLight
			local EngineRunning = Citizen.InvokeNative(0xAE31E7DF9B5B132E,MyPedVeh)     -- Check if the engine is running
			local get_collision_veh = Citizen.InvokeNative(0x8BAD02F0368D9E14,MyPedVeh) -- Check if the vehicle hit something

	--  #### SOME STUFF THAT YOU CAN'T CHANGE ####  --
			
			if HUD.Speed == 'kmh' then
				Speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6
			elseif HUD.Speed == 'mph' then
				Speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.236936
			else
				Speed = 0.0
			end
			 
			if HUD.Cruise then
				if cruisecolor == false then
					drawTxt(UI.x + 0.514, UI.y + 1.245, 1.0,1.0,0.45, "CRUISE", 255, 0, 0,200) -- Red 
				else
					drawTxt(UI.x + 0.514, UI.y + 1.245, 1.0,1.0,0.45, "CRUISE", 0, 255, 0,200) -- Green
				end
				if IsControlJustPressed(0, cruisekey) and (Speed > 11) then -- F9
					cruisecolor = true
				elseif IsControlJustPressed( 0, 8) then -- S
					cruisecolor = false
				--elseif IsControlJustPressed( 0, 22) then -- SpaceBar
					--cruisecolor = false
				elseif (Speed > 0.0) and (Speed < 10) then -- Speed between 0 and 10 stays red
					cruisecolor = false
				elseif (VehEngineHP < 90) and (VehEngineHP > 101) then -- If the car is broken stays red
					cruisecolor = false
				elseif get_collision_veh then
					cruisecolor = false
				elseif carspeed ~= nil and (Speed < carspeed) then -- If you lose speed turns red, sometimes takes a little bit to detect
					cruisecolor = false
				end
			end
			
			if HUD.Top then
				drawTxt(UI.x + 0.563, 	UI.y + 1.2624, 1.0,1.0,0.55, "~w~" .. PlateVeh, 255, 255, 255, 255)
				drawTxt(UI.x + 0.619, UI.y + 1.245, 1.0,1.0,0.45, "ENG", 0, 255, 0,200)
  
				if VehBurnout then
					drawTxt(UI.x + 0.535, UI.y + 1.266, 1.0,1.0,0.44, "DSC", 255, 0, 0, 200)
				else
					drawTxt(UI.x + 0.535, UI.y + 1.266, 1.0,1.0,0.44, "DSC", 255, 255, 255, 150)
				end	

				if (VehEngineHP > 0) and (VehEngineHP < EngineHpBroken) then
					drawTxt(UI.x + 0.619, UI.y + 1.266, 1.0,1.0,0.45, "Fluid", 255, 0, 0, 200) -- red
					drawTxt(UI.x + 0.514, UI.y + 1.266, 1.0,1.0,0.45, "Oil", 255, 0, 0, 200)
					drawTxt(UI.x + 0.645, UI.y + 1.266, 1.0,1.0,0.45, "AC", 255, 0, 0, 200)
					drawTxt(UI.x + 0.619, UI.y + 1.245, 1.0,1.0,0.45, "ENG", 255, 0, 0, 200)
				elseif (VehEngineHP > 111) and (VehEngineHP < EngineHpAlmostBroken) then 
					drawTxt(UI.x + 0.645, UI.y + 1.266, 1.0,1.0,0.45, "AC", 255, 255, 0,200) -- yellow
					drawTxt(UI.x + 0.619, UI.y + 1.266, 1.0,1.0,0.45, "Fluid", 255, 255, 0,200)
					drawTxt(UI.x + 0.514, UI.y + 1.266, 1.0,1.0,0.45, "Oil", 255, 255, 0,200)
					drawTxt(UI.x + 0.645, UI.y + 1.266, 1.0,1.0,0.45, "AC", 255, 255, 0,200)
					drawTxt(UI.x + 0.619, UI.y + 1.245, 1.0,1.0,0.45, "ENG", 255, 255, 0,200)
				else
					drawTxt(UI.x + 0.619, UI.y + 1.266, 1.0,1.0,0.45, "Fluid", 255, 255, 255, 200)
					drawTxt(UI.x + 0.514, UI.y + 1.266, 1.0,1.0,0.45, "Oil", 255, 255, 255, 200)
					drawTxt(UI.x + 0.645, UI.y + 1.266, 1.0,1.0,0.45, "AC", 255, 255, 255, 200)
					drawTxt(UI.x + 0.619, UI.y + 1.245, 1.0,1.0,0.45, "ENG", 0, 255, 0,200)
				end
				if HUD.ParkIndicator then
					if VehStopped then
						drawTxt(UI.x + 0.6605, UI.y + 1.262, 1.0,1.0,0.6, "~r~P", 255, 255, 255, 200)
					else
						drawTxt(UI.x + 0.6605, UI.y + 1.262, 1.0,1.0,0.6, "P", 255, 255, 255, 150)
					end
				end
			else
				if HUD.Plate then
					drawTxt(UI.x + 0.61, 	UI.y + 1.385, 1.0,1.0,0.55, "~w~" .. PlateVeh, 255, 255, 255, 255) 
				end
				if HUD.ParkIndicator then

					if VehStopped then
						drawTxt(UI.x + 0.643, UI.y + 1.34, 1.0,1.0,0.6, "~r~P", 255, 255, 255, 200)
					else
						drawTxt(UI.x + 0.643, UI.y + 1.34, 1.0,1.0,0.6, "P", 255, 255, 255, 150)
					end
				end
			end
			
			if HUD.Engine then
				if EngineRunning then
					drawTxt(UI.x + 0.619, UI.y + 1.245, 1.0,1.0,0.45, "ENG", 0, 255, 0,200) -- ENG green
				else
					drawTxt(UI.x + 0.619, UI.y + 1.245, 1.0,1.0,0.45, "ENG", 255, 0, 0, 200) -- ENG red
					RPM = 0
				end
			end
			
			if HUD.SpeedIndicator then
				drawRct(UI.x + 0.11, 	UI.y + 0.932, 0.046,0.03,0,0,0,150) -- Speed panel
				if HUD.Speed == 'kmh' then
					drawTxt(UI.x + 0.61, 	UI.y + 1.42, 1.0,1.0,0.64 , "~w~" .. math.ceil(Speed), 255, 255, 255, 255)
					drawTxt(UI.x + 0.633, 	UI.y + 1.432, 1.0,1.0,0.4, "~w~ km/h", 255, 255, 255, 255)
				elseif HUD.Speed == 'mph' then
					drawTxt(UI.x + 0.61, 	UI.y + 1.42, 1.0,1.0,0.64 , "~w~" .. math.ceil(Speed), 255, 255, 255, 255)
					drawTxt(UI.x + 0.633, 	UI.y + 1.432, 1.0,1.0,0.4, "~w~ mph", 255, 255, 255, 255)
				else
					drawTxt(UI.x + 0.81, 	UI.y + 1.42, 1.0,1.0,0.64 , [[Carhud ~r~ERROR~w~ ~c~in ~w~HUD Speed~c~ config (something else than ~y~'kmh'~c~ or ~y~'mph'~c~)]], 255, 255, 255, 255)
				end
			end

			if HUD.DamageSystem then
				drawRct(UI.x + 0.159, 	UI.y + 0.809, 0.005,0.173,0,0,0,100)
				drawRct(UI.x + 0.1661, 	UI.y + 0.809, 0.005,0.173,0,0,0,100)
				drawRct(UI.x + 0.1661, 	UI.y + 0.809, 0.005,VehBodyHP/5800,0,0,0,100)
				drawRct(UI.x + 0.159, 	UI.y + 0.809, 0.005, VehEngineHP / 5800,0,0,0,100)
			end

			if RPM > 0.99 then
				RPM = RPM*100
				RPM = RPM+math.random(-2,2)
				RPM = RPM/100
			end
			if carspeed == nil and cruisecolor == true then
				carspeed = Speed
			end
			if HUD.CarGears then
				if VehStopped and (Speed == 0) then
					drawTxt(UI.x + 0.668, 	UI.y + 1.40, 1.0,1.0,0.5 , "~b~RPM ~w~" ..  math.ceil(round(RPM, GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.236936)*120) .. "  | ~b~MPH~w~ " .. math.ceil(Speed) .. "  | ~b~GEAR~g~ P", 255, 255, 255, 255)
				elseif Gear < 1 then
					drawTxt(UI.x + 0.668, 	UI.y + 1.40, 1.0,1.0,0.5 , "~b~RPM ~w~" ..  math.ceil(round(RPM, GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.236936)*120) .. "  | ~b~MPH~w~ " .. math.ceil(Speed) .. "  | ~b~GEAR~r~ R", 255, 255, 255, 255)						
				elseif Gear == 1 then
					drawTxt(UI.x + 0.668, 	UI.y + 1.40, 1.0,1.0,0.5 , "~b~RPM ~w~" ..  math.ceil(round(RPM, GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.236936)*120) .. "  | ~b~MPH~w~ " .. math.ceil(Speed) .. "  | ~b~GEAR~w~ 1", 255, 255, 255, 255)
				elseif Gear == 2 then
					drawTxt(UI.x + 0.668, 	UI.y + 1.40, 1.0,1.0,0.5 , "~b~RPM ~w~" ..  math.ceil(round(RPM, GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.236936)*120) .. "  | ~b~MPH~w~ " .. math.ceil(Speed) .. "  | ~b~GEAR~w~ 2", 255, 255, 255, 255)
				elseif Gear == 3 then
					drawTxt(UI.x + 0.668, 	UI.y + 1.40, 1.0,1.0,0.5 , "~b~RPM ~w~" ..  math.ceil(round(RPM, GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.236936)*120) .. "  | ~b~MPH~w~ " .. math.ceil(Speed) .. "  | ~b~GEAR~w~ 3", 255, 255, 255, 255)
				elseif Gear == 4 then
					drawTxt(UI.x + 0.668, 	UI.y + 1.40, 1.0,1.0,0.5 , "~b~RPM ~w~" ..  math.ceil(round(RPM, GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.236936)*120) .. "  | ~b~MPH~w~ " .. math.ceil(Speed) .. "  | ~b~GEAR~w~ 4", 255, 255, 255, 255)
				elseif Gear == 5 then
					drawTxt(UI.x + 0.668, 	UI.y + 1.40, 1.0,1.0,0.5 , "~b~RPM ~w~" ..  math.ceil(round(RPM, GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.236936)*120) .. "  | ~b~MPH~w~ " .. math.ceil(Speed) .. "  | ~b~GEAR~w~ 5", 255, 255, 255, 255)
				elseif Gear == 6 then
					drawTxt(UI.x + 0.668, 	UI.y + 1.40, 1.0,1.0,0.5 , "~b~RPM ~w~" ..  math.ceil(round(RPM, GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.236936)*120) .. "  | ~b~MPH~w~ " .. math.ceil(Speed) .. "  | ~b~GEAR~w~ 6", 255, 255, 255, 255)
				elseif Gear == 7 then
					drawTxt(UI.x + 0.668, 	UI.y + 1.40, 1.0,1.0,0.5 , "~b~RPM ~w~" ..  math.ceil(round(RPM, GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.236936)*120) .. "  | ~b~MPH~w~ " .. math.ceil(Speed) .. "  | ~b~GEAR~w~ 7", 255, 255, 255, 255)
				elseif Gear == 8 then
					drawTxt(UI.x + 0.668, 	UI.y + 1.40, 1.0,1.0,0.5 , "~b~RPM ~w~" ..  math.ceil(round(RPM, GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.236936)*120) .. "  | ~b~MPH~w~ " .. math.ceil(Speed) .. "  | ~b~GEAR~w~ 8", 255, 255, 255, 255)
				end	
			end			
		end		
	end
end)

--local function tyrebusrthud
	--local numWheels = GetVehicleNumberOfWheels(MyPedVeh)
	--local tyreBurst = GetVehicleTyresCanBurst(MyPedVeh)
--end

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function drawRct(x,y,width,height,r,g,b,a)
	DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end


-- CONFIG --

-- The watermark text --
servername = "San Francisco RP"

-- The x and y offset (starting at the top left corner) --
-- Default: 0.005, 0.001
offset = {x = 0.005, y = 0.001}

-- Text RGB Color --
-- Default: 64, 64, 64 (gray)
rgb = {r = 100, g = 100, b = 100}

-- Text transparency --
-- Default: 255
alpha = 255

-- Text scale
-- Default: 0.4
-- NOTE: Number needs to be a float (so instead of 1 do 1.0)
scale = 0.4

-- Text Font --
-- 0 - 5 possible
-- Default: 1
font = 4

-- Rainbow Text --
-- false: Turn off
-- true: Activate rainbow text (overrides color)
bringontherainbows = false

-- CODE --
Citizen.CreateThread(function()
	while true do
		Wait(1)

		if bringontherainbows then
			rgb = RGBRainbow(1)
		end
		SetTextColour(rgb.r, rgb.g, rgb.b, alpha)

		SetTextFont(font)
		SetTextScale(scale, scale)
		SetTextWrap(0.0, 1.0)
		SetTextCentre(false)
		SetTextDropshadow(2, 2, 0, 0, 0)
		SetTextEdge(1, 0, 0, 0, 205)
		SetTextEntry("STRING")
		AddTextComponentString(servername)
		DrawText(offset.x, offset.y)
	end
end)

-- By ash
function RGBRainbow(frequency)
    local result = {}
    local curtime = GetGameTimer() / 1000

    result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
    result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
    result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

    return result
end

-- Voice

local voiceChatProximity = "whisper"
local voiceEnabled = true
local allowProximityChange = false
local allowVoiceToggle = false




function sendUsageMessage()
    TriggerEvent('chatMessage', '', {255,255,255}, "^8^*Usage: ^r^0/voice range <whisper, normal, yell>")
end

local prox = 0.01

RegisterNetEvent("changeProximity")
AddEventHandler('changeProximity', function(vprox)
    if vprox == "whisper" then
        prox = 10.00
    elseif vprox == "normal" then
        prox = 200.01
    elseif vprox == "yell" then
        prox = 500.01
    end
end)

function getProximity()
    if voiceChatProximity == "whisper" then
        prox = 10.00
    elseif voiceChatProximity == "normal" then
        prox = 200.01
    elseif voiceChatProximity == "yell" then
        prox = 500.01
    end
end
getProximity()

function displayText(text, justification, red, green, blue, alpha, posx, posy)
    SetTextFont(4)
    SetTextWrap(0.0, 1.0)
    SetTextScale(1.0, 0.5)
    SetTextJustification(justification)
    SetTextColour(red, green, blue, alpha)
    SetTextOutline()

    BeginTextCommandDisplayText("STRING") -- old: SetTextEntry()
    AddTextComponentSubstringPlayerName(text) -- old: AddTextComponentString
    EndTextCommandDisplayText(posx, posy) -- old: DrawText()
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        NetworkSetTalkerProximity(prox)
        NetworkClearVoiceChannel()
        NetworkSetVoiceActive(voiceEnabled)
        local playersTalking = {'empty'}
        if voiceEnabled then
            local count = 1
            for i=0,31 do
                if NetworkIsPlayerTalking(i) then
                    playersTalking[count] = GetPlayerName(i)
                    count = count + 1
                end
            end
            if playersTalking[1] ~= "empty" then
                displayText("Currently talking:", 0, 255, 255, 255, 255, 0.5, 0.0)
                count = 0
                for k,v in pairs(playersTalking) do
                    displayText("~f~" .. v, 0, 255, 255, 255, 255, 0.5, 0.025 + (0.025*(count)))
                    count = count + 1
                end
            end
        end
    end
end)

-- Priority
local cooldown = 0
local ispriority = false
local ishold = false
-- Reset Clock
RegisterCommand("resetpcd", function()
    TriggerServerEvent("cancelcooldown")
end, false)

RegisterNetEvent('UpdateCooldown')
AddEventHandler('UpdateCooldown', function(newCooldown)
    cooldown = newCooldown
end)

RegisterNetEvent('UpdatePriority')
AddEventHandler('UpdatePriority', function(newispriority)
    ispriority = newispriority
end)

RegisterNetEvent('UpdateHold')
AddEventHandler('UpdateHold', function(newishold)
    ishold = newishold
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if ishold == true then
            DrawText2("Priority Cooldown: ~b~Priorities Are On Hold")
        elseif cooldown == 0 then
            DrawText2("")
        elseif ispriority == false then
            DrawText2("Priority Cooldown: ~r~".. cooldown .." ~w~Mins")
        elseif ispriority == true then
            DrawText2("Priority Cooldown: ~g~Priority In Progress")
        end
    end
end)

    function DrawText2(text)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextScale(0.0, 0.45)
        SetTextDropshadow(1, 0, 0, 0, 255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(0.174, 0.855)
    end