RegisterCommand("dblueballs", function(source, args, rawCommand)
	if #args == 1 then
		if GetPlayerName(args[1]) then
			if args[1] ~= source then
				TriggerClientEvent("drag", args[1], source)
			else
				TriggerClientEvent("chatMessage", source, "Error: ", {255, 0, 0}, "You cannot drag yourself.")
			end
		else
			TriggerClientEvent("chatMessage", source, "Error: ", {255, 0, 0}, "/drag [id]")
		end
	else
		TriggerClientEvent("chatMessage", source, "Error: ", {255, 0, 0}, "/drag [id]")
	end
end, false)