RegisterCommand("saw", function(source, args, raw)
    local src = source
    TriggerClientEvent("Saw:ToggleSaw", src)
end)

RegisterServerEvent("Saw:SyncStartParticles")
AddEventHandler("Saw:SyncStartParticles", function(sawid)
    TriggerClientEvent("Saw:StartParticles", -1, sawid)
end)

RegisterServerEvent("Saw:SyncStopParticles")
AddEventHandler("Saw:SyncStopParticles", function(sawid)
    TriggerClientEvent("Saw:StopParticles", -1, sawid)
end)