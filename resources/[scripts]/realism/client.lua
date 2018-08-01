-- Script by Lyrad for LEFR

local scopedWeapons = 
{
    100416529,  -- WEAPON_SNIPERRIFLE
    205991906,  -- WEAPON_HEAVYSNIPER
    3342088282, -- WEAPON_MARKSMANRIFLE
	177293209,   -- WEAPON_HEAVYSNIPER MKII
	1785463520  -- WEAPON_MARKSMANRIFLE_MK2
}

function HashInTable( hash )
    for k, v in pairs( scopedWeapons ) do 
        if ( hash == v ) then 
            return true 
        end 
    end 

    return false 
end 

function ManageReticle()
    local ped = GetPlayerPed( -1 )
    local _, hash = GetCurrentPedWeapon( ped, true )
        if not HashInTable( hash ) then 
            HideHudComponentThisFrame( 14 )
		end 
end 


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = GetPlayerPed( -1 )
		local weapon = GetSelectedPedWeapon(ped)
		--print(weapon) -- To get the weapon hash by pressing F8 in game
		
		-- Disable reticle
		
		ManageReticle()
		
		-- Disable melee while aiming (may be not working)
		
		if IsPedArmed(ped, 6) then
        	DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
		
		-- Disable ammo HUD
		
		DisplayAmmoThisFrame(false)
		
		-- Shakycam
		
		-- Pistol
		if weapon == GetHashKey("WEAPON_STUNGUN") then
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.01)
			end
		end
		
		if weapon == GetHashKey("WEAPON_FLAREGUN") then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.01)
			end
		end
		
		if weapon == GetHashKey("WEAPON_SNSPISTOL") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.02)
			end
		end
		
		if weapon == GetHashKey("WEAPON_SNSPISTOL_MK2") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.025)
			end
		end
		
		if weapon == GetHashKey("WEAPON_PISTOL") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.025)
			end
		end
		
		if weapon == GetHashKey("WEAPON_PISTOL_MK2") then
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.03)
			end
		end
		
		if weapon == GetHashKey("WEAPON_APPISTOL") then
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
			end
		end
		
		if weapon == GetHashKey("WEAPON_COMBATPISTOL") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.03)
			end
		end
		
		if weapon == GetHashKey("WEAPON_PISTOL50") then
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
			end
		end
		
		if weapon == GetHashKey("WEAPON_HEAVYPISTOL") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.03)
			end
		end
		
		if weapon == GetHashKey("WEAPON_VINTAGEPISTOL") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.025)
			end
		end
		
		if weapon == GetHashKey("WEAPON_MARKSMANPISTOL") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.03)
			end
		end
		
		if weapon == GetHashKey("WEAPON_REVOLVER") then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.045)
			end
		end
		
		if weapon == GetHashKey("WEAPON_REVOLVER_MK2") then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.055)
			end
		end
		
		if weapon == GetHashKey("WEAPON_DOUBLEACTION") then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.025)
			end
		end
		-- SMG
		
		if weapon == GetHashKey("WEAPON_MICROSMG") then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.035)
			end
		end
		
		if weapon == GetHashKey("WEAPON_COMBATPDW") then			
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.045)
			end
		end
		
		if weapon == GetHashKey("WEAPON_SMG") then
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.045)
			end
		end
		
		if weapon == GetHashKey("WEAPON_SMG_MK2") then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.055)
			end
		end
		
		if weapon == GetHashKey("WEAPON_ASSAULTSMG") then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.050)
			end
		end
		
		if weapon == GetHashKey("WEAPON_MACHINEPISTOL") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.035)
			end
		end
		
		if weapon == GetHashKey("WEAPON_MINISMG") then
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.035)
			end
		end
		
		if weapon == GetHashKey("WEAPON_MG") then
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.07)
			end
		end
		
		if weapon == GetHashKey("WEAPON_COMBATMG") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
			end
		end
		
		if weapon == GetHashKey("WEAPON_COMBATMG_MK2") then			
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.085)
			end
		end
		
		-- Rifles
		
		if weapon == GetHashKey("WEAPON_ASSAULTRIFLE") then			
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.07)
			end
		end
		
		if weapon == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then			
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.075)
			end
		end
		
		if weapon == GetHashKey("WEAPON_CARBINERIFLE") then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.06)
			end
		end
		
		if weapon == GetHashKey("WEAPON_CARBINERIFLE_MK2") then			
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.065)
			end
		end
		
		if weapon == GetHashKey("WEAPON_ADVANCEDRIFLE") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.06)
			end
		end
		
		if weapon == GetHashKey("WEAPON_GUSENBERG") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
			end
		end
		
		if weapon == GetHashKey("WEAPON_SPECIALCARBINE") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.06)
			end
		end
		
		if weapon == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.075)
			end
		end
		
		if weapon == GetHashKey("WEAPON_BULLPUPRIFLE") then			
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
			end
		end
		
		if weapon == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then			
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.065)
			end
		end
		
		if weapon == GetHashKey("WEAPON_COMPACTRIFLE") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
			end
		end
		
		-- Shotgun
		
		if weapon == GetHashKey("WEAPON_PUMPSHOTGUN") then
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.07)
			end
		end
		
		if weapon == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.085)
			end
		end
		
		if weapon == GetHashKey("WEAPON_SAWNOFFSHOTGUN") then
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.06)
			end
		end
		
		if weapon == GetHashKey("WEAPON_ASSAULTSHOTGUN") then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.12)
			end
		end
		
		if weapon == GetHashKey("WEAPON_BULLPUPSHOTGUN") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
			end
		end
		
		if weapon == GetHashKey("WEAPON_DBSHOTGUN") then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
			end
		end
		
		if weapon == GetHashKey("WEAPON_AUTOSHOTGUN") then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
			end
		end
		
		if weapon == GetHashKey("WEAPON_MUSKET") then
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.04)
			end
		end
		
		if weapon == GetHashKey("WEAPON_HEAVYSHOTGUN") then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.13)
			end
		end
		
		-- Sniper
		
		if weapon == GetHashKey("WEAPON_SNIPERRIFLE") then
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.2)
			end
		end
		
		if weapon == GetHashKey("WEAPON_HEAVYSNIPER") then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.3)
			end
		end
		
		if weapon == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.35)
			end
		end
		
		if weapon == GetHashKey("WEAPON_MARKSMANRIFLE") then			
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.1)
			end
		end
		
		if weapon == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then			
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.1)
			end
		end
		
		-- Launcher
		
		if weapon == GetHashKey("WEAPON_GRENADELAUNCHER") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
			end
		end
		
		if weapon == GetHashKey("WEAPON_RPG") then
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.9)
			end
		end
		
		if weapon == GetHashKey("WEAPON_HOMINGLAUNCHER") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.9)
			end
		end
		
		if weapon == GetHashKey("WEAPON_MINIGUN") then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.20)
			end
		end
		
		if weapon == GetHashKey("WEAPON_RAILGUN") then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 1.0)
				
			end
		end
		
		if weapon == GetHashKey("WEAPON_COMPACTLAUNCHER") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
			end
		end
		
		if weapon == GetHashKey("WEAPON_FIREWORK") then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.5)
			end
		end
		
		-- Infinite FireExtinguisher
		
		if weapon == GetHashKey("WEAPON_FIREEXTINGUISHER") then		
			if IsPedShooting(ped) then
				SetPedInfiniteAmmo(ped, true, GetHashKey("WEAPON_FIREEXTINGUISHER"))
			end
		end
	end
end)

-- recoil script by bluethefurry / Blumlaut https://forum.fivem.net/t/betterrecoil-better-3rd-person-recoil-for-fivem/82894
-- I just added some missing weapons because of the doomsday update adding some MK2.
-- I can't manage to make negative hashes works, if someone make it works, please let me know =)

local recoils = {
	[453432689] = 0.4, -- PISTOL
	[3219281620] = 0.3, -- PISTOL MK2
	[1593441988] = 0.2, -- COMBAT PISTOL
	[584646201] = 0.1, -- AP PISTOL
	[2578377531] = 0.6, -- PISTOL .50
	[324215364] = 0.2, -- MICRO SMG
	[736523883] = 0.1, -- SMG
	[2024373456] = 0.1, -- SMG MK2
	[4024951519] = 0.1, -- ASSAULT SMG
	[3220176749] = 0.2, -- ASSAULT RIFLE
	[961495388] = 0.2, -- ASSAULT RIFLE MK2
	[2210333304] = 0.1, -- CARBINE RIFLE
	[4208062921] = 0.1, -- CARBINE RIFLE MK2
	[2937143193] = 0.1, -- ADVANCED RIFLE
	[2634544996] = 0.1, -- MG
	[2144741730] = 0.1, -- COMBAT MG
	[3686625920] = 0.1, -- COMBAT MG MK2
	[487013001] = 0.4, -- PUMP SHOTGUN
	[1432025498] = 0.4, -- PUMP SHOTGUN MK2
	[2017895192] = 0.7, -- SAWNOFF SHOTGUN
	[3800352039] = 0.4, -- ASSAULT SHOTGUN
	[2640438543] = 0.2, -- BULLPUP SHOTGUN
	[911657153] = 0.1, -- STUN GUN
	[100416529] = 0.5, -- SNIPER RIFLE
	[205991906] = 0.7, -- HEAVY SNIPER
	[177293209] = 0.7, -- HEAVY SNIPER MK2
	[856002082] = 1.2, -- REMOTE SNIPER
	[2726580491] = 1.0, -- GRENADE LAUNCHER
	[1305664598] = 1.0, -- GRENADE LAUNCHER SMOKE
	[2982836145] = 0.0, -- RPG
	[1752584910] = 0.0, -- STINGER
	[1119849093] = 0.01, -- MINIGUN
	[3218215474] = 0.2, -- SNS PISTOL
	[2009644972] = 0.25, -- SNS PISTOL MK2
	[1627465347] = 0.1, -- GUSENBERG
	[3231910285] = 0.2, -- SPECIAL CARBINE
	[-1768145561] = 0.25, -- SPECIAL CARBINE MK2
	[3523564046] = 0.5, -- HEAVY PISTOL
	[2132975508] = 0.2, -- BULLPUP RIFLE
	[-2066285827] = 0.25, -- BULLPUP RIFLE MK2
	[137902532] = 0.4, -- VINTAGE PISTOL
	[-1746263880] = 0.4, -- DOUBLE ACTION REVOLVER
	[2828843422] = 0.7, -- MUSKET
	[984333226] = 0.2, -- HEAVY SHOTGUN
	[3342088282] = 0.3, -- MARKSMAN RIFLE
	[1785463520] = 0.35, -- MARKSMAN RIFLE MK2
	[1672152130] = 0, -- HOMING LAUNCHER
	[1198879012] = 0.9, -- FLARE GUN
	[171789620] = 0.2, -- COMBAT PDW
	[3696079510] = 0.9, -- MARKSMAN PISTOL
  	[1834241177] = 2.4, -- RAILGUN
	[3675956304] = 0.3, -- MACHINE PISTOL
	[3249783761] = 0.6, -- REVOLVER
	[-879347409] = 0.65, -- REVOLVER MK2
	[4019527611] = 0.7, -- DOUBLE BARREL SHOTGUN
	[1649403952] = 0.3, -- COMPACT RIFLE
	[317205821] = 0.2, -- AUTO SHOTGUN
	[125959754] = 0.5, -- COMPACT LAUNCHER
	[3173288789] = 0.1, -- MINI SMG		
}



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedShooting(PlayerPedId()) and not IsPedDoingDriveby(PlayerPedId()) then
			local _,wep = GetCurrentPedWeapon(PlayerPedId())
			_,cAmmo = GetAmmoInClip(PlayerPedId(), wep)
			if recoils[wep] and recoils[wep] ~= 0 then
				tv = 0
				repeat 
					Wait(0)
					p = GetGameplayCamRelativePitch()
					if GetFollowPedCamViewMode() ~= 4 then
						SetGameplayCamRelativePitch(p+0.1, 0.2)
					end
					tv = tv+0.1
				until tv >= recoils[wep]
			end
			
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		SetCanAttackFriendly(GetPlayerPed(-1), true, false)
		NetworkSetFriendlyFireOption(true)
	end
end)

--- DO NOT EDIT THIS
local holstered = true

-- RESTRICTED PEDS --
-- I've only listed peds that have a remote speaker mic, but any ped listed here will do the animations.
local skins = {
	"s_m_y_cop_01",
	"s_f_y_cop_01",
	"s_m_y_hwaycop_01",
	"s_m_y_sheriff_01",
	"s_f_y_sheriff_01",
	"s_m_y_ranger_01",
	"s_f_y_ranger_01",
}

-- Add/remove weapon hashes here to be added for holster checks.
local weapons = {
	"WEAPON_PISTOL",
	"WEAPON_COMBATPISTOL",
}

-- RADIO ANIMATIONS --

Citizen.CreateThread(function()
	while true do
		Citizen.Wait( 0 )
		local ped = PlayerPedId()
		if DoesEntityExist( ped ) and not IsEntityDead( ped ) and CheckSkin(ped) then
			if not IsPauseMenuActive() then 
				loadAnimDict( "random@arrests" )
				if IsControlJustReleased( 0, 19 ) then -- INPUT_CHARACTER_WHEEL (LEFT ALT)
					TriggerServerEvent('InteractSound_SV:PlayOnSource', 'off', 0.1)
					ClearPedTasks(ped)
					SetEnableHandcuffs(ped, false)
				else
					if IsControlJustPressed( 0, 19 ) and CheckSkin(ped) and not IsPlayerFreeAiming(PlayerId()) then -- INPUT_CHARACTER_WHEEL (LEFT ALT)
						TriggerServerEvent('InteractSound_SV:PlayOnSource', 'on', 0.1)
						TaskPlayAnim(ped, "random@arrests", "generic_radio_enter", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
						SetEnableHandcuffs(ped, true)
					elseif IsControlJustPressed( 0, 19 ) and CheckSkin(ped) and IsPlayerFreeAiming(PlayerId()) then -- INPUT_CHARACTER_WHEEL (LEFT ALT)
						TriggerServerEvent('InteractSound_SV:PlayOnSource', 'on', 0.1)
						TaskPlayAnim(ped, "random@arrests", "radio_chatter", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
						SetEnableHandcuffs(ped, true)
					end 
					if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests", "generic_radio_enter", 3) then
						DisableActions(ped)
					elseif IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests", "radio_chatter", 3) then
						DisableActions(ped)
					end
				end
			end 
		end 
	end
end )

-- HOLD WEAPON HOLSTER ANIMATION --

Citizen.CreateThread( function()
	while true do 
		Citizen.Wait( 0 )
		local ped = PlayerPedId()
		if DoesEntityExist( ped ) and not IsEntityDead( ped ) and not IsPedInAnyVehicle(PlayerPedId(), true) and CheckSkin(ped) then 
			DisableControlAction( 0, 20, true ) -- INPUT_MULTIPLAYER_INFO (Z)
			if not IsPauseMenuActive() then 
				loadAnimDict( "reaction@intimidation@cop@unarmed" )		
				if IsDisabledControlJustReleased( 0, 20 ) then -- INPUT_MULTIPLAYER_INFO (Z)
					ClearPedTasks(ped)
					SetEnableHandcuffs(ped, false)
					SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
				else
					if IsDisabledControlJustPressed( 0, 20 ) and CheckSkin(ped) then -- INPUT_MULTIPLAYER_INFO (Z)
						SetEnableHandcuffs(ped, true)
						SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true) 
						TaskPlayAnim(ped, "reaction@intimidation@cop@unarmed", "intro", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
					end
					if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "reaction@intimidation@cop@unarmed", "intro", 3) then 
						DisableActions(ped)
					end	
				end
			end 
		end 
	end
end )

-- HOLSTER/UNHOLSTER PISTOL --
 
 Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		if DoesEntityExist( ped ) and not IsEntityDead( ped ) and not IsPedInAnyVehicle(PlayerPedId(), true) and not CheckSkin(ped) then
			loadAnimDict( "combat@reaction_aim@pistol" )
			loadAnimDict( "reaction@intimidation@1h" )
			if CheckWeapon(ped) then
				if holstered then
					TaskPlayAnim(ped, "reaction@intimidation@1h", "outro", 20.0, 0.4, -1, 50, 0, false, false, false)		
					TaskPlayAnim(ped, "combat@reaction_aim@pistol", "-0", 20.0, 0.4, -1, 50, 0, false, false, false)	
					Citizen.Wait(400)
					ClearPedTasks(ped)
					holstered = false
				end
			elseif not CheckWeapon(ped) then
				if not holstered then
					TaskPlayAnim(ped, "reaction@intimidation@1h", "intro", 20.0, 0.4, -1, 50, 0, false, false, false)
					Citizen.Wait(400)
					ClearPedTasks(ped)
					holstered = true
				end
			end
		end
	end
end)

 Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		if DoesEntityExist( ped ) and not IsEntityDead( ped ) and not IsPedInAnyVehicle(PlayerPedId(), true) and CheckSkin(ped) then
			loadAnimDict( "rcmjosh4" )
			loadAnimDict( "weapons@pistol@" )
			if CheckWeapon(ped) then
				if holstered then
					TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 20.0, 0.4, -1, 50, 0, false, false, false)
					Citizen.Wait(600)
					ClearPedTasks(ped)
					holstered = false
				end
				SetPedComponentVariation(ped, 9, 0, 0, 0)
			elseif not CheckWeapon(ped) then
				if not holstered then
					TaskPlayAnim(ped, "weapons@pistol@", "aim_2_holster", 20.0, 0.4, -1, 50, 0, false, false, false)
					Citizen.Wait(500)
					ClearPedTasks(ped)
					holstered = true
				end
				SetPedComponentVariation(ped, 9, 1, 0, 0)
			end
		end
	end
end)
-- DO NOT REMOVE THESE! --

function CheckSkin(ped)
	for i = 1, #skins do
		if GetHashKey(skins[i]) == GetEntityModel(ped) then
			return true
		end
	end
	return false
end

function CheckWeapon(ped)
	for i = 1, #weapons do
		if GetHashKey(weapons[i]) == GetSelectedPedWeapon(ped) then
			return true
		end
	end
	return false
end

function ResetMovements(ped)
	ResetPedWeaponMovementClipset(GetPlayerPed( -1 ))
	ResetPedMovementClipset(GetPlayerPed( -1 ))
	ResetPedStrafeClipset(GetPlayerPed( -1 ))
end

function DisableActions(ped)
	DisableControlAction(1, 140, true)
	DisableControlAction(1, 141, true)
	DisableControlAction(1, 142, true)
	DisableControlAction(1, 37, true) -- Disables INPUT_SELECT_WEAPON (TAB)
	DisablePlayerFiring(ped, true) -- Disable weapon firing
end

function loadAnimDict( dict )
	while ( not HasAnimDictLoaded( dict ) ) do
		RequestAnimDict( dict )
		Citizen.Wait( 0 )
	end
end