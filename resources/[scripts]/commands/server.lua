AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/ayoungballs" and enable_core_commands == true then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "^*ANNOUNCEMENT: ^r^7[" .. name .. "] " .. string.sub(msg,13), { 255, 0, 0 })
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/tweet" and enable_core_commands == true then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "^*TWEET: ^r^7[" .. name .. "] " .. string.sub(msg,7), { 66, 215, 244 })
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/TWEET" and enable_core_commands == true then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "^*TWEET: ^r^7[" .. name .. "] " .. string.sub(msg,5), { 66, 215, 244 })
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/me" and enable_core_commands == true then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "^*ME: ^r^7[" .. name .. "] " .. string.sub(msg,5), { 0, 145, 255 })
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/ME" and enable_core_commands == true then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "^*ME: ^r^7[" .. name .. "] " .. string.sub(msg,5), { 0, 145, 255 })
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/help" and enable_core_commands == true then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "^*HELP:^r^7 [" .. name .. "] " .. string.sub(msg,6), { 252, 68, 172 })
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/HELP" and enable_core_commands == true then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "^*HELP:^r^7 [" .. name .. "] " .. string.sub(msg,6), { 252, 68, 172 })
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/911" and enable_core_commands == true then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "^*911:^r^7 [" .. name .. "] " .. string.sub(msg,6), { 255, 15, 25 })
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/311" and enable_core_commands == true then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "^*311:^r^7 [" .. name .. "] " .. string.sub(msg,6), { 255, 112, 50 })
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/ooc" and enable_core_commands == true then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "^*OOC:^r^7 [" .. name .. "] " .. string.sub(msg,6), { 23, 255, 50 })
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/OOC" and enable_core_commands == true then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "^*OOC:^r^7 [" .. name .. "] " .. string.sub(msg,6), { 23, 255, 50 })
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/OOC" and enable_core_commands == true then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "^*OOC:^r^7 [" .. name .. "] " .. string.sub(msg,6), { 23, 255, 50 })
	end
end)

RegisterServerEvent('chatEvent')
AddEventHandler('chatEvent', function(string)
  TriggerClientEvent('chatMessage', -1, string)
end)

AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/panic" and enable_police_commands == true then
		CancelEvent()
		--------------
		TriggerClientEvent('PanicLocation', s)
	end
end)

AddEventHandler( 'chatMessage', function( source, n, msg )  

    msg = string.lower( msg )
    
    -- Check to see if a client typed in /dv
    if ( msg == "/dv" or msg == "/delveh" or msg == "/DV" or msg == "/DELVEH") then 
    
        -- Cancel the chat message event (stop the server from posting the message)
        CancelEvent() 

        -- Trigger the client event 
        TriggerClientEvent( 'wk:deleteVehicle', source )
    end

    if ( msg == "/tow" or msg == "/impound" or msg == "/TOW" or msg == "/IMPOUND" ) then 
    
        CancelEvent() 

        TriggerClientEvent( 'wk:deleteVehicle2', source )
    end
end )

-- STRING SPLIT FUNCTION
function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end