resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_script 'client/utils/entity.lua'
client_script 'client/utils/entityiter.lua'
client_script 'client/utils/graphics.lua'
client_script 'client/utils/misc.lua'
client_script 'client/utils/pad.lua'
client_script 'client/utils/shapetest.lua'
client_script 'client/utils/system.lua'
client_script 'client/utils/water.lua'
client_script 'client/main.lua'

export 'IsEditorEnabled'
export 'SetEditorEnabled'

export 'IsCrosshairVisible'
export 'SetCrosshairVisible'

dependency 'freecam'
-- dependency 'editor-stream'
