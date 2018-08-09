local cooldown = 0
local ispriority = false
local ishold = false

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
		if ishold == true and IsPedInAnyVehicle(PlayerPedId(), true) then
			DrawText2("Priority Cooldown: ~b~Priorities Are On Hold")
		elseif ispriority == false and IsPedInAnyVehicle(PlayerPedId(), true) then
			DrawText2("Priority Cooldown: ~r~".. cooldown .." ~w~Mins")
		elseif ispriority == true and IsPedInAnyVehicle(PlayerPedId(), true) then
			DrawText2("Priority Cooldown: ~g~Priority In Progress")
        elseif ishold == true and not IsPedInAnyVehicle(PlayerPedId(), true) then
            DrawText3("Priority Cooldown: ~b~Priorities Are On Hold")
        elseif ispriority == false and not IsPedInAnyVehicle(PlayerPedId(), true) then
            DrawText3("Priority Cooldown: ~r~".. cooldown .." ~w~Mins")
        elseif ispriority == true and not IsPedInAnyVehicle(PlayerPedId(), true) then
            DrawText3("Priority Cooldown: ~g~Priority In Progress")        
		end
	end
end)

	function DrawText2(text)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextScale(0.37, 0.37)
        SetTextColour(255, 255, 255, 255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextOutline()
        SetTextWrap(0,0.95)
        SetTextEntry("STRING")
        
        AddTextComponentString(text)
        DrawText(0.220, 0.931)
    end

    function DrawText3(text)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextScale(0.37, 0.37)
        SetTextColour(255, 255, 255, 255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextOutline()
        SetTextWrap(0,0.95)
        SetTextEntry("STRING")
        
        AddTextComponentString(text)
        DrawText(0.076, 0.928)
    end