--PLD

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextScale(0.37, 0.37)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

local zones = { ['AIRP'] = "Los Santos International Airport", ['ALAMO'] = "Alamo Sea", ['ALTA'] = "Alta", ['ARMYB'] = "Fort Zancudo", ['BANHAMC'] = "Banham Canyon Dr", ['BANNING'] = "Banning", ['BEACH'] = "Vespucci Beach", ['BHAMCA'] = "Banham Canyon", ['BRADP'] = "Braddock Pass", ['BRADT'] = "Braddock Tunnel", ['BURTON'] = "Burton", ['CALAFB'] = "Calafia Bridge", ['CANNY'] = "Raton Canyon", ['CCREAK'] = "Cassidy Creek", ['CHAMH'] = "Chamberlain Hills", ['CHIL'] = "Vinewood Hills", ['CHU'] = "Chumash", ['CMSW'] = "Chiliad Mountain State Wilderness", ['CYPRE'] = "Cypress Flats", ['DAVIS'] = "Davis", ['DELBE'] = "Del Perro Beach", ['DELPE'] = "Del Perro", ['DELSOL'] = "La Puerta", ['DESRT'] = "Grand Senora Desert", ['DOWNT'] = "Downtown", ['DTVINE'] = "Downtown Vinewood", ['EAST_V'] = "East Vinewood", ['EBURO'] = "El Burro Heights", ['ELGORL'] = "El Gordo Lighthouse", ['ELYSIAN'] = "Elysian Island", ['GALFISH'] = "Galilee", ['GOLF'] = "GWC and Golfing Society", ['GRAPES'] = "Grapeseed", ['GREATC'] = "Great Chaparral", ['HARMO'] = "Harmony", ['HAWICK'] = "Hawick", ['HORS'] = "Vinewood Racetrack", ['HUMLAB'] = "Humane Labs and Research", ['JAIL'] = "Bolingbroke Penitentiary", ['KOREAT'] = "Little Seoul", ['LACT'] = "Land Act Reservoir", ['LAGO'] = "Lago Zancudo", ['LDAM'] = "Land Act Dam", ['LEGSQU'] = "Legion Square", ['LMESA'] = "La Mesa", ['LOSPUER'] = "La Puerta", ['MIRR'] = "Mirror Park", ['MORN'] = "Morningwood", ['MOVIE'] = "Richards Majestic", ['MTCHIL'] = "Mount Chiliad", ['MTGORDO'] = "Mount Gordo", ['MTJOSE'] = "Mount Josiah", ['MURRI'] = "Murrieta Heights", ['NCHU'] = "North Chumash", ['NOOSE'] = "N.O.O.S.E", ['OCEANA'] = "Pacific Ocean", ['PALCOV'] = "Paleto Cove", ['PALETO'] = "Paleto Bay", ['PALFOR'] = "Paleto Forest", ['PALHIGH'] = "Palomino Highlands", ['PALMPOW'] = "Palmer-Taylor Power Station", ['PBLUFF'] = "Pacific Bluffs", ['PBOX'] = "Pillbox Hill", ['PROCOB'] = "Procopio Beach", ['RANCHO'] = "Rancho", ['RGLEN'] = "Richman Glen", ['RICHM'] = "Richman", ['ROCKF'] = "Rockford Hills", ['RTRAK'] = "Redwood Lights Track", ['SANAND'] = "San Andreas", ['SANCHIA'] = "San Chianski Mountain Range", ['SANDY'] = "Sandy Shores", ['SKID'] = "Mission Row", ['SLAB'] = "Stab City", ['STAD'] = "Maze Bank Arena", ['STRAW'] = "Strawberry", ['TATAMO'] = "Tataviam Mountains", ['TERMINA'] = "Terminal", ['TEXTI'] = "Textile City", ['TONGVAH'] = "Tongva Hills", ['TONGVAV'] = "Tongva Valley", ['VCANA'] = "Vespucci Canals", ['VESP'] = "Vespucci", ['VINE'] = "Vinewood", ['WINDF'] = "Ron Alternates Wind Farm", ['WVINE'] = "West Vinewood", ['ZANCUDO'] = "Zancudo River", ['ZP_ORT'] = "Port of South Los Santos", ['ZQ_UAR'] = "Davis Quartz" }

local directions = { [0] = 'N', [45] = 'NW', [90] = 'W', [135] = 'SW', [180] = 'S', [225] = 'SE', [270] = 'E', [315] = 'NE', [360] = 'N', } 

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local pos = GetEntityCoords(GetPlayerPed(-1))
        local var1, var2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())

        for k,v in pairs(directions)do
            direction = GetEntityHeading(GetPlayerPed())
            if(math.abs(direction - k) < 22.5)then
                direction = v
                break;
            end
        end

        if(GetStreetNameFromHashKey(var1) and GetNameOfZone(pos.x, pos.y, pos.z)) and IsPedInAnyVehicle(PlayerPedId(), true) then
            if(zones[GetNameOfZone(pos.x, pos.y, pos.z)] and tostring(GetStreetNameFromHashKey(var1)))then
                drawTxt(0.66, 1.46, 1.0,1.0,0.4, direction .. "~w~ | ~w~" .. tostring(GetStreetNameFromHashKey(var1)) .. " ~w~| ~w~" .. zones[GetNameOfZone(pos.x, pos.y, pos.z)] .. " | " .. tostring(GetStreetNameFromHashKey(var2)), 255, 255, 255, 255)
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
        timeAndDateString = ""
        
        if displayTime == true and not IsPedInAnyVehicle(PlayerPedId(), true) and GetClockHours() < 12 then
            CalculateTimeToDisplay()
            timeAndDateString = "" .. hour .. "~w~:~w~" .. minute .. " AM                              AOP: Paleto Bay"
        end
        if displayTime == true and not IsPedInAnyVehicle(PlayerPedId(), true) and GetClockHours() >= 12 then
            CalculateTimeToDisplay()
            timeAndDateString = "" .. hour .. "~w~:~w~" .. minute .. " PM                              AOP: Paleto Bay"
        end        
        if displayDayOfWeek == true and not IsPedInAnyVehicle(PlayerPedId(), true) then
            CalculateDayOfWeekToDisplay()
            timeAndDateString = timeAndDateString .. "" .. dayOfWeek .. " |"
        end
        if displayDate == true and not IsPedInAnyVehicle(PlayerPedId(), true) then
            CalculateDateToDisplay()
            timeAndDateString = timeAndDateString .. "" .. month .. "~b~/~w~" .. dayOfMonth .. "~b~/~w~" .. year .. ""
        end
        
        SetTextFont(4)
        SetTextProportional(1)
        SetTextScale(0.37, 0.37)
        SetTextColour(255, 255, 255, 255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextOutline()
        SetTextWrap(0,0.95)
        SetTextEntry("STRING")
        
        AddTextComponentString(timeAndDateString)
        DrawText(0.016, 0.948)
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(1)
        timeAndDateString = ""
        
        if displayTime == true and IsPedInAnyVehicle(PlayerPedId(), true) and GetClockHours() < 12 then
            CalculateTimeToDisplay()
            timeAndDateString = "" .. hour .. "~w~:~w~" .. minute .. " AM   |   AOP: Paleto Bay"
        end
        if displayTime == true and IsPedInAnyVehicle(PlayerPedId(), true) and GetClockHours() >= 12 then
            CalculateTimeToDisplay()
            timeAndDateString = "" .. hour .. "~w~:~w~" .. minute .. " PM   |   AOP: Paleto Bay"
        end        
        if displayDayOfWeek == true and IsPedInAnyVehicle(PlayerPedId(), true) then
            CalculateDayOfWeekToDisplay()
            timeAndDateString = timeAndDateString .. "" .. dayOfWeek .. " |"
        end
        if displayDate == true and IsPedInAnyVehicle(PlayerPedId(), true) then
            CalculateDateToDisplay()
            timeAndDateString = timeAndDateString .. "" .. month .. "~b~/~w~" .. dayOfMonth .. "~b~/~w~" .. year .. ""
        end
        
        SetTextFont(4)
        SetTextProportional(1)
        SetTextScale(0.37, 0.37)
        SetTextColour(255, 255, 255, 255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextOutline()
        SetTextWrap(0,0.95)
        SetTextEntry("STRING")
        
        AddTextComponentString(timeAndDateString)
        DrawText(0.16, 0.90)
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
		hour = "" .. hour
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

Cfg             = {}
Cfg.DiffTrigger = 0.255 
Cfg.MinSpeed    = 19.25 --THIS IS IN m/s
Cfg.Strings     = { belt_on = 'Seatbelt On', belt_off = 'Seatbelt Off' }

local speedBuffer  = {}
local velBuffer    = {}
local beltOn       = false
local wasInCar     = false

IsCar = function(veh)
            local vc = GetVehicleClass(veh)
            return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
        end 

Fwv = function (entity)
            local hr = GetEntityHeading(entity) + 90.0
            if hr < 0.0 then hr = 360.0 + hr end
            hr = hr * 0.0174533
            return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
      end

Citizen.CreateThread(function()
    Citizen.Wait(500)
    while true do
        
        local ped = GetPlayerPed(-1)
        local car = GetVehiclePedIsIn(ped)
        
        if car ~= 0 and (wasInCar or IsCar(car)) then
        
            wasInCar = true
            
            if beltOn then DisableControlAction(0, 75) end
            
            speedBuffer[2] = speedBuffer[1]
            speedBuffer[1] = GetEntitySpeed(car)
            
            if speedBuffer[2] ~= nil 
               and not beltOn
               and GetEntitySpeedVector(car, true).y > 1.0  
               and speedBuffer[1] > Cfg.MinSpeed 
               and (speedBuffer[2] - speedBuffer[1]) > (speedBuffer[1] * Cfg.DiffTrigger) then
               
                local co = GetEntityCoords(ped)
                local fw = Fwv(ped)
                SetEntityCoords(ped, co.x + fw.x, co.y + fw.y, co.z - 0.47, true, true, true)
                SetEntityVelocity(ped, velBuffer[2].x, velBuffer[2].y, velBuffer[2].z)
                Citizen.Wait(1)
                SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
            end
                
            velBuffer[2] = velBuffer[1]
            velBuffer[1] = GetEntityVelocity(car)
                
            if IsControlJustReleased(0, 311) or IsControlJustReleased(0, 23) then
                beltOn = not beltOn               
                if beltOn then  TriggerEvent("pNotify:SendNotification", {text = "Seatbelt On", layout = "topRight", timeout = 2000, type = "info", progressBar = false})
                else TriggerEvent("pNotify:SendNotification", {text = "Seatbelt Off", layout = "topRight", timeout = 2000, type = "info", progressBar = false}) end 
            end    
        elseif wasInCar then
            wasInCar = false
            beltOn = false
            speedBuffer[1], speedBuffer[2] = 0.0, 0.0
        end
        Citizen.Wait(0)
    end
end)


-- Components
local HUD = {

    SpeedIndicator  = true,

}

local UI = { 

    x =  0.051 ,   -- Base Screen Coords   +    x
    y =  0.001 ,    -- Base Screen Coords   +   -y

}

Citizen.CreateThread(function()
    while true do Citizen.Wait(1)


        local MyPed = GetPlayerPed(-1)

        if(IsPedInAnyVehicle(MyPed, false))then
            local MyPedVeh = GetVehiclePedIsIn(GetPlayerPed(-1),false)
            local Speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.236936
            if HUD.SpeedIndicator then
                if HUD.SpeedIndicator then
                    drawTxt(UI.x + 0.61,    UI.y + 1.42, 1.0,1.0,0.54 , "~w~" .. math.ceil(Speed), 255, 255, 255, 255)
                    drawTxt(UI.x + 0.633,   UI.y + 1.427, 1.0,1.0,0.3, "~w~ mph", 255, 255, 255, 255)
                end
            end
        end     
    end
end)

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

-- The watermark text --
servername = "Blueline Gaming Network"

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

RegisterNetEvent('frfuel:fuelAdded')
AddEventHandler('frfuel:fuelAdded', function(amount)
    gallons = amount * 0.264172
    Wait(500)
    TriggerEvent("pNotify:SendNotification", {text = "Pumped " .. math.ceil(gallons) .. " gallons", layout = "topRight", timeout = 2000, type = "info", progressBar = false})
end)