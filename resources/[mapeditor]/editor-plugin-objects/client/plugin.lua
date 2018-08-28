_G['Editor'] = exports['editor-core']

-- stt_prop_ramp_jump_m
local function SpawnObject(model)
  local pos = Editor.GetCameraLookAt()
  local hash = LoadModel(model)

  return CreateObjectNoOffset(hash, pos.x, pos.y, pos.z, false, false, false)
end

RegisterCommand('setobject', function (source, args)
  local object = SpawnObject(args[1])
  FreezeEntityPosition(object, true)
end)
