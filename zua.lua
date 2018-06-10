-- Made by Zua @ https://github.com/thatziv -> https://discord.gg/yWddFpQ Join for support.
local myPed = PlayerPedId()
local localPed = PlayerId()
    -- Find @ https://wiki.fivem.net/wiki/DrawNotification
    function notify(string)
        SetNotificationTextEntry("STRING")
        AddTextComponentString(string)
        DrawNotification(true, false)
    end

    -- Find hashes at https://wiki.fivem.net/wiki/Peds
    function loadModel(modelHash)
        local model = GetHashKey(modelHash)
        RequestModel(model)
        while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
        end
        SetPlayerModel(localPed, model)
        SetModelAsNoLongerNeeded(model)
    end

    -- Find hashes at https://wiki.fivem.net/wiki/Weapons
    function giveWeapon(weaponHash)
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(weaponHash), 999, false)
    end

    -- Find at hashes https://wiki.fivem.net/wiki/Weapon_Components
    function weaponComponent(weaponHash, component)
        if HasPedGotWeapon(PlayerPedId(), GetHashKey(weaponHash), false) then
            GiveWeaponComponentToPed(PlayerPedId(), GetHashKey(weaponHash), GetHashKey(component))
         end
    end

    RegisterCommand('sheriff', function()
        --Loads Player model
        loadModel("s_m_y_sheriff_01")
        --Gives the player weapons
        giveWeapon("weapon_pistol50")
        giveWeapon("weapon_tazer")
        giveWeapon("weapon_carbinerifle")
            weaponComponent("weapon_carbinerifle", "COMPONENT_CARBINERIFLE_CLIP_03")
        giveWeapon("weapon_flare")
        giveWeapon("weapon_pumpshotgun")
            weaponComponent("weapon_pumpshotgun", "COMPONENT_AT_AR_FLSH")
        giveWeapon("weapon_stungun")
        giveWeapon("weapon_nightstick")
        giveWeapon("weapon_flashlight")
        --Native Notification function usage
        notify("~b~~h~Sheriff~h~~w~ Loadout Loaded.")
    end, false)
    TriggerEvent('chat:addSuggestion', '/sheriff', 'Loads the Sheriff Police loadout')

    RegisterCommand('cop', function()
        --Loads Player model
        loadModel("s_m_y_cop_01")
        --Gives the player weapons
        giveWeapon("weapon_combatpistol")
            weaponComponent("weapon_combatpistol", "COMPONENT_AT_PI_FLSH")
        giveWeapon("weapon_carbinerifle")
            weaponComponent("weapon_carbinerifle", "COMPONENT_AT_AR_FLSH")
            weaponComponent("weapon_carbinerifle", "COMPONENT_AT_AR_AFGRIP")
            weaponComponent("weapon_carbinerifle", "COMPONENT_AT_SCOPE_MEDIUM")
        giveWeapon("weapon_flare")
        giveWeapon("weapon_pumpshotgun")
            weaponComponent("weapon_pumpshotgun", "COMPONENT_AT_AR_FLSH")
        giveWeapon("weapon_stungun")
        giveWeapon("weapon_nightstick")
        giveWeapon("weapon_flashlight")
        --Native Notification
        notify("~b~~h~Police~h~~w~ Loadout Loaded.")
    end, false)
    TriggerEvent('chat:addSuggestion', '/cop', 'Loads the City Police loadout')

    RegisterCommand('swat', function()
        --Loads Player model (Came with armor during testing)
        loadModel("S_M_Y_Swat_01")
        --Gives the player weapons
        giveWeapon("weapon_combatpistol")
            weaponComponent("weapon_combatpistol", "COMPONENT_AT_PI_FLSH")
        giveWeapon("weapon_carbinerifle")
            weaponComponent("weapon_carbinerifle", "COMPONENT_AT_AR_FLSH")
            weaponComponent("weapon_carbinerifle", "COMPONENT_AT_AR_AFGRIP")
            weaponComponent("weapon_carbinerifle", "COMPONENT_AT_SCOPE_MEDIUM")
        giveWeapon("weapon_specialcarbine")
            weaponComponent("weapon_specialcarbine", "COMPONENT_SPECIALCARBINE_CLIP_03")
            weaponComponent("weapon_specialcarbine", "COMPONENT_AT_AR_FLSH")
            weaponComponent("weapon_specialcarbine", "COMPONENT_AT_AR_AFGRIP")
            weaponComponent("weapon_specialcarbine", "COMPONENT_AT_SCOPE_MEDIUM")
        giveWeapon("weapon_assaultshotgun")
            weaponComponent("weapon_assaultshotgun", "COMPONENT_ASSAULTSHOTGUN_CLIP_02")
            weaponComponent("weapon_assaultshotgun", "COMPONENT_AT_AR_FLSH")
            weaponComponent("weapon_assaultshotgun", "COMPONENT_AT_AR_AFGRIP")
        giveWeapon("weapon_flare")
        giveWeapon("weapon_pumpshotgun")
            weaponComponent("weapon_pumpshotgun", "COMPONENT_AT_AR_FLSH")
        giveWeapon("weapon_flashlight")
        --Native Notification
        notify("~b~~h~SWAT~h~~w~ Loadout Loaded.")
    end, false)
    TriggerEvent('chat:addSuggestion', '/swat', 'Loads the SWAT Team loadout')

    RegisterCommand('thug', function()
        loadModel("G_M_Y_MexGoon_03")
        giveWeapon("weapon_pistol")
        giveWeapon("weapon_microsmg")
        notify("~y~~h~Thug~h~~w~ Loadout Loaded.")
    end, false)
    TriggerEvent('chat:addSuggestion', '/thug', 'Loads the Thug loadout')

    RegisterCommand('prisoner', function()
        loadModel("S_M_Y_Prisoner_01")
        --I did this instead of the function becuase I wanted the prisoner only have a couple of shots
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_pistol"), 7, false)
        giveWeapon("WEAPON_BAT")
        giveWeapon("WEAPON_CROWBAR")
        notify("~r~~h~Prisoner~h~~w~ Loadout Loaded.")
    end, false)
    TriggerEvent('chat:addSuggestion', '/prisoner', 'Loads the Prisoner loadout')

    RegisterCommand('agent', function()
        loadModel('S_M_M_HighSec_02')
        giveWeapon("weapon_combatpistol")
            weaponComponent("weapon_combatpistol", "COMPONENT_AT_PI_SUPP")
            weaponComponent("weapon_combatpistol", "COMPONENT_COMBATPISTOL_CLIP_02")
            weaponComponent("weapon_combatpistol", "COMPONENT_AT_PI_FLSH")
        giveWeapon("weapon_heavypistol")
            weaponComponent("weapon_heavypistol", "COMPONENT_HEAVYPISTOL_CLIP_02")
            weaponComponent("weapon_heavypistol", "COMPONENT_AT_PI_SUPP")
            weaponComponent("weapon_heavypistol", "COMPONENT_AT_PI_FLSH")
        giveWeapon("weapon_marksmanrifle")
            weaponComponent("weapon_marksmanrifle", "COMPONENT_AT_AR_SUPP")
            weaponComponent("weapon_marksmanrifle", "COMPONENT_AT_AR_FLSH")
            notify("~p~~h~Agent~h~~w~ Loadout Loaded.")
    end, false)
    TriggerEvent('chat:addSuggestion', '/agent', 'Loads the Secret Agent loadout')

    RegisterCommand('security', function()
        loadModel('S_M_M_Security_01')
        giveWeapon('weapon_pistol50')
            weaponComponent("weapon_pistol50", "COMPONENT_PISTOL50_VARMOD_LUXE")
            weaponComponent("weapon_pistol50", "COMPONENT_PISTOL50_CLIP_02")
        giveWeapon("weapon_pumpshotgun")
        giveWeapon("weapon_flashlight")
        notify("~o~~h~Security~h~~w~ Loadout Loaded.")
    end, false)
    TriggerEvent('chat:addSuggestion', '/security', 'Loads the Security Guard loadout')

    RegisterCommand('Bouncer', function()
        loadModel('S_M_M_Bouncer_01')
        giveWeapon('weapon_pistol50')
            weaponComponent("weapon_pistol50", "COMPONENT_PISTOL50_VARMOD_LUXE")
            weaponComponent("weapon_pistol50", "COMPONENT_PISTOL50_CLIP_02")
        giveWeapon("weapon_microsmg")
        giveWeapon("weapon_flashlight")
        notify("~p~~h~Bouncer~h~~w~ Loadout Loaded.")
    end, false)
    TriggerEvent('chat:addSuggestion', '/bouncer', 'Loads the Bouncer loadout')

    RegisterCommand('ems', function()
        loadModel('S_M_M_Paramedic_01')
        giveWeapon("weapon_stungun")
        giveWeapon("weapon_flashlight")
        giveWeapon("weapon_switchblade")
        notify("~b~~h~EMS~h~~w~ Loadout Loaded.")
    end, false)
    TriggerEvent('chat:addSuggestion', '/ems', 'Loads the Paramedic loadout')

    RegisterCommand('mechanic', function()
        loadModel('S_M_Y_XMech_01')
        giveWeapon("weapon_pistol")
        giveWeapon("weapon_flashlight")
        giveWeapon("weapon_hammer")
        giveWeapon("weapon_crowbar")
        notify("~o~~h~Mechanic~h~~w~ Loadout Loaded.")
    end, false)
    TriggerEvent('chat:addSuggestion', '/mechanic', 'Loads the Mechanic loadout')

    RegisterCommand('fire', function()
        loadModel('S_M_Y_Fireman_01')
        giveWeapon('WEAPON_FIREEXTINGUISHER')
        giveWeapon('WEAPON_HATCHET')
        giveWeapon('WEAPON_FLASHLIGHT')
        giveWeapon('WEAPON_FLARE')
        giveWeapon('WEAPON_CROWBAR')
    end, false)
    TriggerEvent('chat:addSuggestion', '/fire', 'Loads the Firefighter loadout')

 RegisterCommand('removeall', function() -- Terbium's Idea
        RemoveAllPedWeapons(myPed, true)
        notify("~g~All Guns Removed")
    end, false)
    TriggerEvent('chat:addSuggestion', '/removeall', 'Removes all weapons')

    --  Clears the model and weapons here
    RegisterCommand('clear', function()
        loadModel("A_M_M_BevHills_02")
        RemoveAllPedWeapons(myPed, true)
        notify("~g~Cleared.")
    end, false)
    TriggerEvent('chat:addSuggestion', '/clear', 'Cleares Player Model and Weapons')

-- Warmenu Code 
Citizen.CreateThread(function()
	local items = { "Item 1", "Item 2", "Item 3", "Item 4", "Item 5" }
	local currentItemIndex = 1
	local selectedItemIndex = 1
	local checkbox = true

    WarMenu.CreateMenu('loadout', 'Loadouts')
    WarMenu.SetTitleBackgroundColor('loadout', 75, 75, 75, 255)
	  WarMenu.CreateSubMenu('closeMenu', 'loadout', 'Are you sure?')
	while true do
		if WarMenu.IsMenuOpened('loadout') then
			if WarMenu.MenuButton('SWAT Officer', 'loadout')
				 then
           --Loads Player model (Came with armor during testing)
           loadModel("S_M_Y_Swat_01")
           --Gives the player weapons
           giveWeapon("weapon_combatpistol")
               weaponComponent("weapon_combatpistol", "COMPONENT_AT_PI_FLSH")
           giveWeapon("weapon_carbinerifle")
               weaponComponent("weapon_carbinerifle", "COMPONENT_AT_AR_FLSH")
               weaponComponent("weapon_carbinerifle", "COMPONENT_AT_AR_AFGRIP")
               weaponComponent("weapon_carbinerifle", "COMPONENT_AT_SCOPE_MEDIUM")
           giveWeapon("weapon_specialcarbine")
               weaponComponent("weapon_specialcarbine", "COMPONENT_SPECIALCARBINE_CLIP_03")
               weaponComponent("weapon_specialcarbine", "COMPONENT_AT_AR_FLSH")
               weaponComponent("weapon_specialcarbine", "COMPONENT_AT_AR_AFGRIP")
               weaponComponent("weapon_specialcarbine", "COMPONENT_AT_SCOPE_MEDIUM")
           giveWeapon("weapon_assaultshotgun")
               weaponComponent("weapon_assaultshotgun", "COMPONENT_ASSAULTSHOTGUN_CLIP_02")
               weaponComponent("weapon_assaultshotgun", "COMPONENT_AT_AR_FLSH")
               weaponComponent("weapon_assaultshotgun", "COMPONENT_AT_AR_AFGRIP")
           giveWeapon("weapon_flare")
           giveWeapon("weapon_pumpshotgun")
               weaponComponent("weapon_pumpshotgun", "COMPONENT_AT_AR_FLSH")
           giveWeapon("weapon_flashlight")
           --Native Notification
           notify("~b~~h~SWAT~h~~w~ Loadout Loaded.")
        elseif WarMenu.MenuButton('Police Officer', 'loadout')
        then
          --Loads Player model
              loadModel("s_m_y_cop_01")
              --Gives the player weapons
              giveWeapon("weapon_combatpistol")
                  weaponComponent("weapon_combatpistol", "COMPONENT_AT_PI_FLSH")
              giveWeapon("weapon_carbinerifle")
                  weaponComponent("weapon_carbinerifle", "COMPONENT_AT_AR_FLSH")
                  weaponComponent("weapon_carbinerifle", "COMPONENT_AT_AR_AFGRIP")
                  weaponComponent("weapon_carbinerifle", "COMPONENT_AT_SCOPE_MEDIUM")
              giveWeapon("weapon_flare")
              giveWeapon("weapon_pumpshotgun")
                  weaponComponent("weapon_pumpshotgun", "COMPONENT_AT_AR_FLSH")
              giveWeapon("weapon_stungun")
              giveWeapon("weapon_nightstick")
              giveWeapon("weapon_flashlight")
              --Native Notification
              notify("~b~~h~Police~h~~w~ Loadout Loaded.")

          elseif WarMenu.MenuButton('Sheriff', 'loadout')
          then
            --Loads Player model
            loadModel("s_m_y_sheriff_01")
            --Gives the player weapons
            giveWeapon("weapon_pistol50")
            giveWeapon("weapon_tazer")
            giveWeapon("weapon_carbinerifle")
                weaponComponent("weapon_carbinerifle", "COMPONENT_CARBINERIFLE_CLIP_03")
            giveWeapon("weapon_flare")
            giveWeapon("weapon_pumpshotgun")
                weaponComponent("weapon_pumpshotgun", "COMPONENT_AT_AR_FLSH")
            giveWeapon("weapon_stungun")
            giveWeapon("weapon_nightstick")
            giveWeapon("weapon_flashlight")
            --Native Notification function usage
            notify("~b~~h~Sheriff~h~~w~ Loadout Loaded.")

         elseif WarMenu.Button('Paramedic')
         then
            loadModel('S_M_M_Paramedic_01')
            giveWeapon("weapon_stungun")
            giveWeapon("weapon_flashlight")
            giveWeapon("weapon_switchblade")
            notify("~b~~h~EMS~h~~w~ Loadout Loaded.")
        elseif WarMenu.Button('Firefighter')
        then
            loadModel('S_M_Y_Fireman_01')
            giveWeapon('WEAPON_FIREEXTINGUISHER')
            giveWeapon('WEAPON_HATCHET')
            giveWeapon('WEAPON_FLASHLIGHT')
            giveWeapon('WEAPON_FLARE')
            giveWeapon('WEAPON_CROWBAR') 
          elseif WarMenu.Button('Thug')
          then
            loadModel("G_M_Y_MexGoon_03")
            giveWeapon("weapon_pistol")
            giveWeapon("weapon_microsmg")
            notify("~y~~h~Thug~h~~w~ Loadout Loaded.")

          elseif WarMenu.Button('Prisoner')
          then
              loadModel("S_M_Y_Prisoner_01")
            --I did this instead of the function becuase I wanted the prisoner only have a couple of shots
            GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_pistol"), 7, false)
            giveWeapon("WEAPON_BAT")
            giveWeapon("WEAPON_CROWBAR")
            notify("~r~~h~Prisoner~h~~w~ Loadout Loaded.")

            elseif WarMenu.Button('Agent')
            then
                loadModel('S_M_M_HighSec_02')
            giveWeapon("weapon_combatpistol")
                weaponComponent("weapon_combatpistol", "COMPONENT_AT_PI_SUPP")
                weaponComponent("weapon_combatpistol", "COMPONENT_COMBATPISTOL_CLIP_02")
                weaponComponent("weapon_combatpistol", "COMPONENT_AT_PI_FLSH")
            giveWeapon("weapon_heavypistol")
                weaponComponent("weapon_heavypistol", "COMPONENT_HEAVYPISTOL_CLIP_02")
                weaponComponent("weapon_heavypistol", "COMPONENT_AT_PI_SUPP")
                weaponComponent("weapon_heavypistol", "COMPONENT_AT_PI_FLSH")
            giveWeapon("weapon_marksmanrifle")
                weaponComponent("weapon_marksmanrifle", "COMPONENT_AT_AR_SUPP")
                weaponComponent("weapon_marksmanrifle", "COMPONENT_AT_AR_FLSH")
                notify("~p~~h~Agent~h~~w~ Loadout Loaded.")
            elseif WarMenu.Button('Security Guard') 
            then
                loadModel('S_M_M_Security_01')
                giveWeapon('weapon_pistol50')
                    weaponComponent("weapon_pistol50", "COMPONENT_PISTOL50_VARMOD_LUXE")
                    weaponComponent("weapon_pistol50", "COMPONENT_PISTOL50_CLIP_02")
                giveWeapon("weapon_pumpshotgun")
                giveWeapon("weapon_flashlight")
                notify("~o~~h~Security~h~~w~ Loadout Loaded.")
            elseif WarMenu.Button('Bouncer')
            then
                loadModel('S_M_M_Bouncer_01')
                giveWeapon('weapon_pistol50')
                    weaponComponent("weapon_pistol50", "COMPONENT_PISTOL50_VARMOD_LUXE")
                    weaponComponent("weapon_pistol50", "COMPONENT_PISTOL50_CLIP_02")
                giveWeapon("weapon_microsmg")
                giveWeapon("weapon_flashlight")
                notify("~p~~h~Bouncer~h~~w~ Loadout Loaded.")

            elseif WarMenu.Button('Mechanic')
            then
                loadModel('S_M_Y_XMech_01')
                giveWeapon("weapon_pistol")
                giveWeapon("weapon_flashlight")
                giveWeapon("weapon_hammer")
                giveWeapon("weapon_crowbar")
                notify("~o~~h~Mechanic~h~~w~ Loadout Loaded.")
            -----------------------END----------------------------
          elseif WarMenu.MenuButton('Clear Player', 'loadout') then
            -- Clears the model and weapons here
                loadModel("A_M_M_BevHills_02")
                RemoveAllPedWeapons(myPed, true)
                notify("~g~Cleared.")

			elseif WarMenu.MenuButton('Exit', 'closeMenu') then
			end

			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('closeMenu') then
			if WarMenu.Button('Yes') then
				WarMenu.CloseMenu()
			elseif WarMenu.MenuButton('No', 'loadout') then
			end

			WarMenu.Display()
		elseif IsControlJustReleased(0, 182) then -- L on keyboard
			WarMenu.OpenMenu('loadout')
		end

		Citizen.Wait(0)
	end
end)
