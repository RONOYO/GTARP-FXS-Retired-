RegisterServerEvent("chatCommandEntered")
RegisterServerEvent('chatMessageEntered')

AddEventHandler("chatMessage", function(p, color, msg)
    if msg:sub(1, 1) == "/" then
        cmd = stringSplit(msg, " ")
        cmd = fullcmd[1]
        
        if cmd == "/l" then
            TriggerClientEvent("CGC:lockdoors", p)
            CancelEvent()
        end
    end
end)

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
