_G['Editor'] = exports['editor-core']

local INPUT_ENTER = 23

--------------------------------------------------------------------------------

local function IsCurrentResource(resourceName)
  return resourceName == GetCurrentResourceName()
end

local function WhileSafe(handler)
  while true do
    local status, retval = pcall(handler)
    if not status then
      print(retval)
    elseif retval == false then
      return
    end
  end
end

local function LoadingQueue(name)
  local stages = {}
  local handlers = {}

  local function Stage(name, precondition)
    stages[name] = false

    return function (...)
      if not precondition or precondition(...) then
        stages[name] = true

        for _, done in pairs(stages) do
          if not done then
            return
          end
        end

        for _, callback in pairs(handlers) do
          callback()
        end
      end
    end
  end

  local function OnComplete(callback)
    table.insert(handlers, callback)
  end

  return { Stage=Stage, OnComplete=OnComplete }
end

--------------------------------------------------------------------------------

local function SetGuiVisible(visible)
  SendNuiMessage(json.encode({
    command = 'setVisible',
    args = { visible }
  }))
end

local function SetGuiActive(active)
  Editor:SetCrosshairVisible(not active)

  SetNuiFocus(active, active)
  SendNuiMessage(json.encode({
    command = 'setActive',
    args = { active }
  }))
end

--------------------------------------------------------------------------------

local function CheckInputLoop()
  local isEnabled = Editor:IsEditorEnabled()
  local isPressed = IsDisabledControlJustPressed(0, INPUT_ENTER)

  if isEnabled and isPressed then
    SetGuiActive(true)
  end
end

local function InputChecker()
  WhileSafe(function ()
    Citizen.Wait(0)
    CheckInputLoop()
  end)
end

--------------------------------------------------------------------------------

local function CheckPauseMenuLoop(wasActive)
  local isEnabled = Editor:IsEditorEnabled()
  local isActive = IsPauseMenuActive() == 1

  if isEnabled and wasActive ~= isVisible then
    SetGuiVisible(not isActive)
    return isActive
  end

  return false
end

local function PauseChecker()
  local isActive = false

  WhileSafe(function ()
    Citizen.Wait(0)
    isActive = CheckPauseMenuLoop(isActive)
  end)
end

--------------------------------------------------------------------------------

local Queue = LoadingQueue()
local NuiLoad = Queue.Stage('NuiLoad')
local ResLoad = Queue.Stage('ResLoad', IsCurrentResource)

Queue.OnComplete(function ()
  if Editor:IsEditorEnabled() then
    SetGuiActive(false)
    SetGuiVisible(true)
  end

  Citizen.CreateThread(InputChecker)
  Citizen.CreateThread(PauseChecker)
end)

RegisterNUICallback('ready', NuiLoad)
AddEventHandler('onClientResourceStart', ResLoad)

--------------------------------------------------------------------------------

RegisterNUICallback('blur', function ()
  SetGuiActive(false)
end)

RegisterNUICallback('quit', function ()
  Editor:SetEditorEnabled(false)
end)

RegisterNUICallback('playSound', function (data)
  PlaySoundFrontend(-1, data.soundName, data.soundBank)
end)

--------------------------------------------------------------------------------

AddEventHandler('onResourceStop', function (resourceName)
  if resourceName ~= GetCurrentResourceName() then
    return
  end

  SetGuiActive(false)
  SetGuiVisible(false)
end)

--------------------------------------------------------------------------------

AddEventHandler('editor:onEditorEnter', function ()
  SetGuiActive(false)
  SetGuiVisible(true)
end)

AddEventHandler('editor:onEditorExit', function ()
  SetGuiActive(false)
  SetGuiVisible(false)
end)
