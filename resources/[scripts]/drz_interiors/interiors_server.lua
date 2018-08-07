-- Huge server file.

local interiors = {
	[1] = { ["xe"] = 1828.5078125, ["ye"] = 3692.13671875, ["ze"] = 34.224269866943, ["he"] = 0.0, ["xo"] = -456.03396606445, ["yo"] = -367.43572998047, ["zo"] = -186.46212768555, ["ho"] = 234.62, ["name"] = 'Sandy Shores Hospital'},
	[2] = { ["xe"] = 1838.9565429688, ["ye"] = 3673.2937011719, ["ze"] = 34.276718139648, ["he"] = 0.0, ["xo"] = -456.03396606445, ["yo"] = -367.43572998047, ["zo"] = -186.46212768555, ["ho"] = 234.62, ["name"] = 'Sandy Shores Hospital'},
}

RegisterServerEvent("interiors:sendData_s")
AddEventHandler("interiors:sendData_s", function()
    TriggerClientEvent("interiors:f_sendData", source, interiors)
end)



x = 1838.9565429688
y = 3673.2937011719
z = 34.276718139648