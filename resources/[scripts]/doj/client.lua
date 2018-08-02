local draggedBy = -1
local drag = false
local wasDragged = false

RegisterNetEvent("drag")
AddEventHandler("drag", function(_source)
    draggedBy = _source
    drag = not drag
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if drag then
            wasDragged = true
            AttachEntityToEntity(PlayerPedId(), GetPlayerPed(GetPlayerFromServerId(draggedBy)), 4103, 11816, 0.48, 0.00, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
        else
            if not IsPedInParachuteFreeFall(PlayerPedId()) and wasDragged then
                wasDragged = false
                DetachEntity(PlayerPedId(), true, false)    
            end
        end
    end
end)