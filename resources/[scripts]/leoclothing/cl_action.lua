--[[------------------------------------------------------------------------

	ActionMenu - v1.0.1
	Created by WolfKnight
	Additional help from lowheartrate, TheStonedTurtle, and Briglair.

------------------------------------------------------------------------]]--

-- Define the variable used to open/close the menu
local menuEnabled = false

--[[------------------------------------------------------------------------
	ActionMenu Toggle
	Calling this function will open or close the ActionMenu.
------------------------------------------------------------------------]]--
function ToggleActionMenu()
	-- Make the menuEnabled variable not itself
	-- e.g. not true = false, not false = true
	menuEnabled = not menuEnabled

	if ( menuEnabled ) then
		-- Focuses on the NUI, the second parameter toggles the
		-- onscreen mouse cursor.
		SetNuiFocus( true, true )

		-- Sends a message to the JavaScript side, telling it to
		-- open the menu.
		SendNUIMessage({
			showmenu = true
		})
	else
		-- Bring the focus back to the game
		SetNuiFocus( false )

		-- Sends a message to the JavaScript side, telling it to
		-- close the menu.
		SendNUIMessage({
			hidemenu = true
		})
	end
end

function InMenuMovements()
	local ped = GetPlayerPed(-1)
	FreezeEntityPosition(ped, true)
	DisableControlAction( 0, 1, true ) -- LookLeftRight
	DisableControlAction( 0, 2, true ) -- LookUpDown
	DisableControlAction( 0, 24, true ) -- Attack
	DisablePlayerFiring( ped, true ) -- Disable weapon firing
	DisableControlAction( 0, 142, true ) -- MeleeAttackAlternate
	DisableControlAction( 0, 106, true ) -- VehicleMouseControlOverride
end

function NotInMenuMovements()
	local ped = GetPlayerPed(-1)
	FreezeEntityPosition(ped, false)
end

--[[------------------------------------------------------------------------
	ActionMenu HTML Callbacks
	This will be called every single time the JavaScript side uses the
	sendData function. The name of the data-action is passed as the parameter
	variable data.
------------------------------------------------------------------------]]--
RegisterNUICallback( "ButtonClick", function( data, cb )
	if ( data == "mbutton1" ) then
		LongSleeveUniformLSPD()
	elseif ( data == "mbutton2" ) then
		ShortSleeveUniformLSPD()
	elseif ( data == "mbutton3" ) then
		JacketUniformLSPD()
	elseif ( data == "fbutton1" ) then
		ShortSleeveUniformLSPD2()
	elseif ( data == "fbutton2" ) then
		JacketUniformLSPD2()
	elseif ( data == "button5" ) then

	elseif ( data == "button6" ) then

	elseif ( data == "exit" ) then
		ToggleActionMenu()
		return
	end

	-- This will only be called if any button other than the exit button is pressed
	ToggleActionMenu()
end )


--[[------------------------------------------------------------------------
	ActionMenu Control and Input Blocking
	This is the main while loop that opens the ActionMenu on keypress. It
	uses the input blocking found in the ES Banking resource, credits to
	the authors.
------------------------------------------------------------------------]]--
Citizen.CreateThread( function()
	-- This is just in case the resources restarted whilst the NUI is focused.
	SetNuiFocus( false )

	while true do
		-- Control ID 20 is the 'Z' key by default
		-- Use https://wiki.fivem.net/wiki/Controls to find a different key
		if ( IsControlJustPressed( 1, 20 ) ) then
			ToggleActionMenu()
		end

	    if ( menuEnabled ) then
            local ped = GetPlayerPed( -1 )

            DisableControlAction( 0, 1, true ) -- LookLeftRight
            DisableControlAction( 0, 2, true ) -- LookUpDown
            DisableControlAction( 0, 24, true ) -- Attack
            DisablePlayerFiring( ped, true ) -- Disable weapon firing
            DisableControlAction( 0, 142, true ) -- MeleeAttackAlternate
            DisableControlAction( 0, 106, true ) -- VehicleMouseControlOverride
        end

		Citizen.Wait( 0 )
	end
end )



-- UNIFORM FUNCTIONS
function LongSleeveUniformLSPD()
	local ped = GetPlayerPed(-1)
	Citizen.Wait(1)
	SetPedPropIndex(ped, 0, 0 - 1, 0 - 1, true)
	SetPedPropIndex(ped, 1, 0 - 1, 0 - 1, true)
	SetPedPropIndex(ped, 2, 0 - 1, 0 - 1, true)
	SetPedPropIndex(ped, 3, 0 - 1, 0 - 1, true)
	SetPedComponentVariation(ped, 1, 1 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 3, 5 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 4, 36 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 5, 49 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 6, 52 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 7, 9 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 8, 58 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 9, 15 - 1, 2 - 1, 0)
	SetPedComponentVariation(ped, 10, 1 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 11, 144 - 1, 1 - 1, 0)
end

function JacketUniformLSPD()
	local ped = GetPlayerPed(-1)
	Citizen.Wait(1)
	SetPedPropIndex(ped, 0, 47 - 1, 1 - 1, true)
	SetPedPropIndex(ped, 1, 1 - 1, 1 - 1, true)
	SetPedPropIndex(ped, 2, 0 - 1, 0 - 1, true)
	SetPedPropIndex(ped, 3, 0 - 1, 0 - 1, true)
	SetPedComponentVariation(ped, 1, 1 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 3, 5 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 4, 36 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 5, 49 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 6, 52 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 7, 9 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 8, 52 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 9, 3 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 10, 1 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 11, 40 - 1, 1 - 1, 0)
end

function JacketUniformLSPD2()
	local ped = GetPlayerPed(-1)
	Citizen.Wait(1)
	SetPedPropIndex(ped, 0, 0 - 1, 0 - 1, true)
	SetPedPropIndex(ped, 1, 0 - 1, 0 - 1, true)
	SetPedPropIndex(ped, 2, 0 - 1, 0 - 1, true)
	SetPedPropIndex(ped, 3, 0 - 1, 0 - 1, true)
	SetPedComponentVariation(ped, 1, 1 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 3, 15 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 4, 35 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 5, 49 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 6, 53 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 7, 9 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 8, 54 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 9, 3 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 10, 1 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 11, 173 - 1, 1 - 1, 0)
end

function ShortSleeveUniformLSPD()
	local ped = GetPlayerPed(-1)
	Citizen.Wait(1)
	SetPedPropIndex(ped, 0, 0 - 1, 0 - 1, true)
	SetPedPropIndex(ped, 1, 0 - 1, 0 - 1, true)
	SetPedPropIndex(ped, 2, 0 - 1, 0 - 1, true)
	SetPedPropIndex(ped, 3, 4 - 1, 1 - 1, true)
	SetPedComponentVariation(ped, 1, 1 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 3, 1 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 4, 36 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 5, 49 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 6, 52 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 7, 9 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 8, 59 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 9, 14 - 1, 2 - 1, 0)
	SetPedComponentVariation(ped, 10, 1 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 11, 150 - 1, 1 - 1, 0)
end

function ShortSleeveUniformLSPD2()
	local ped = GetPlayerPed(-1)
	Citizen.Wait(1)
	SetPedPropIndex(ped, 0, 0 - 1, 0 - 1, true)
	SetPedPropIndex(ped, 1, 0 - 1, 0 - 1, true)
	SetPedPropIndex(ped, 2, 0 - 1, 0 - 1, true)
	SetPedPropIndex(ped, 3, 0 - 1, 0 - 1, true)
	SetPedComponentVariation(ped, 1, 1 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 3, 15 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 4, 49 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 5, 49 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 6, 53 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 7, 9 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 8, 36 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 9, 1 - 1, 2 - 1, 0)
	SetPedComponentVariation(ped, 10, 1 - 1, 1 - 1, 0)
	SetPedComponentVariation(ped, 11, 147 - 1, 1 - 1, 0)
end
