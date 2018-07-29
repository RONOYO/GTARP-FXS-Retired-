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