_G['Freecam'] = exports['freecam']

--------------------------------------------------------------------------------=

local INPUT_SCRIPTED_FLY_ZUP         = 10  -- pgup
local INPUT_SCRIPTED_FLY_ZDOWN       = 11  -- pgdown
local INPUT_ATTACK                   = 24  -- leftmouse
local INPUT_AIM                      = 25  -- rightmouse
local INPUT_DUCK                     = 36  -- left ctrl
local INPUT_PICKUP                   = 38  -- e
local INPUT_SELECT_CHARACTER_MICHAEL = 166 -- f5
local INPUT_CELLPHONE_UP             = 172 -- arrow up
local INPUT_CELLPHONE_DOWN           = 173 -- arrow down
local INPUT_CELLPHONE_LEFT           = 174 -- arrow left
local INPUT_CELLPHONE_RIGHT          = 175 -- arrow right

--------------------------------------------------------------------------------

local selectedEntity = nil
local isFreemoveEnabled = false
local isSensitiveModeEnabled = false
local isCrosshairVisible = true

--------------------------------------------------------------------------------

function IsEditorEnabled()
  return Freecam:IsEnabled()
end

function SetEditorEnabled(enabled)
  if enabled == IsEditorEnabled() then
    return
  end

  local player = PlayerPedId()
  FreezeEntityPosition(player, enabled)

  if enabled then
    Freecam:SetEnabled(true)
    TriggerEvent('editor:onEditorEnter')
  else
    Freecam:SetEnabled(false)
    TriggerEvent('editor:onEditorExit')
  end
end

--------------------------------------------------------------------------------

function IsCrosshairVisible()
  return isCrosshairVisible
end

function SetCrosshairVisible(visible)
  isCrosshairVisible = visible
end

--------------------------------------------------------------------------------

AddEventHandler('onResourceStop', function (resourceName)
  if resourceName ~= GetCurrentResourceName() then
    return
  end

  if IsEditorEnabled() then
    SetEditorEnabled(false)
  end
end)

--------------------------------------------------------------------------------

AddEventHandler('editor:onEditorEnter', function ()
  StartScreenEffect('SuccessNeutral', 500, false)
  PlaySoundFrontend(-1, 'Hit_In', 'PLAYER_SWITCH_CUSTOM_SOUNDSET', 1)
end)

AddEventHandler('editor:onEditorExit', function ()
  StartScreenEffect('SuccessNeutral', 500, false)
  PlaySoundFrontend(-1, 'Hit_Out', 'PLAYER_SWITCH_CUSTOM_SOUNDSET', 1)
end)

--------------------------------------------------------------------------------

AddEventHandler('freecam:onFreecamUpdate', function ()
  if not IsEditorEnabled() then
    return
  end

  if IsDisabledControlJustPressed(0, INPUT_PICKUP) then
    isSensitiveModeEnabled = not isSensitiveModeEnabled
  end

  if selectedEntity and not IsAnEntity(selectedEntity) then
    selectedEntity = nil
    isFreemoveEnabled = false
  end

  local ignoredEntity    =     isFreemoveEnabled and selectedEntity         or nil
  local checkBoundingBox = not isFreemoveEnabled and isSensitiveModeEnabled or false
  local checkWater       =     isFreemoveEnabled

  local point1 = vector3(table.unpack(Freecam:GetPosition()))
  local point2 = vector3(table.unpack(Freecam:GetTarget(100)))
  local hitPos, hitEntity = Raytrace(point1, point2, ignoredEntity, checkBoundingBox, checkWater)

  if isFreemoveEnabled then
    SetEntityCoordsNoOffset(selectedEntity, hitPos)

    if IsDisabledControlJustPressed(0, INPUT_ATTACK) then
      isFreemoveEnabled = false
    end
  else
    if IsDisabledControlJustPressed(0, INPUT_ATTACK) then
      FreezeEntityPosition(selectedEntity, false)
      selectedEntity = hitEntity
      FreezeEntityPosition(selectedEntity, true)
    end

    if selectedEntity and IsDisabledControlJustPressed(0, INPUT_AIM) then
      isFreemoveEnabled = true
    end
  end

  if selectedEntity then
    if not IsDisabledControlPressed(0, INPUT_DUCK) then
      if not isFreemoveEnabled then
        local multiplier = GetFrameTime() * 10

        local camRotZ   = Freecam:GetYaw()
        local angleSnap = SnapAngle(camRotZ, 4)

        local rad = math.rad(angleSnap)
        local cos = math.cos(rad)
        local sin = math.sin(rad)

        local movePosX = GetDisabledControlNormalBetween(0, INPUT_CELLPHONE_RIGHT, INPUT_CELLPHONE_LEFT)
        local movePosY = GetDisabledControlNormalBetween(0, INPUT_CELLPHONE_UP, INPUT_CELLPHONE_DOWN)
        local movePosZ = GetDisabledControlNormalBetween(0, INPUT_SCRIPTED_FLY_ZUP, INPUT_SCRIPTED_FLY_ZDOWN)

        local distanceX = multiplier * ((movePosX * cos) - (movePosY * sin))
        local distanceY = multiplier * ((movePosX * sin) + (movePosY * cos))
        local distanceZ = multiplier * movePosZ

        ApplyEntityPosition(selectedEntity, distanceX, distanceY, distanceZ, true)
      end
    else
      local multiplier = GetFrameTime() * 90

      local moveRotX = GetDisabledControlNormalBetween(0, INPUT_CELLPHONE_DOWN, INPUT_CELLPHONE_UP)
      local moveRotY = GetDisabledControlNormalBetween(0, INPUT_SCRIPTED_FLY_ZDOWN, INPUT_SCRIPTED_FLY_ZUP)
      local moveRotZ = GetDisabledControlNormalBetween(0, INPUT_CELLPHONE_LEFT, INPUT_CELLPHONE_RIGHT)

      local rotateX = multiplier * moveRotX
      local rotateY = multiplier * moveRotY
      local rotateZ = multiplier * moveRotZ

      ApplyEntityRotation(selectedEntity, rotateX, rotateY, rotateZ, false)
    end

    DrawEntityBoundingBox(selectedEntity, 255, 0, 0, 100)
    DrawEntityAxis(selectedEntity, 10)
  end

  if not isFreemoveEnabled and hitEntity and hitEntity ~= selectedEntity then
    DrawEntityBoundingBox(hitEntity, 0, 0, 0, 100)
  end

  if IsCrosshairVisible() then
    local alpha = hitEntity and 255 or 100
    DrawCrosshair(255, 255, 255, alpha)
  end
end)

--------------------------------------------------------------------------------

Citizen.CreateThread(function ()
  local function CheckInputLoop()
    if IsPauseMenuActive() then
      return
    end

    if IsDisabledControlJustPressed(0, INPUT_SELECT_CHARACTER_MICHAEL) then
      SetEditorEnabled(not IsEditorEnabled())
    end
  end

  while true do
    Citizen.Wait(0)
    CheckInputLoop()
  end
end)
