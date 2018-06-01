-- Made by Zua @ https://github.com/thatziv

local myPed = PlayerPedId()
local localPed = PlayerId()

    function notify(string) 
        SetNotificationTextEntry("STRING")
        AddTextComponentString(string)
        DrawNotification(true, false)
    end 
    
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
    
    function giveWeapon(weaponHash) 
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(weaponHash), 999, false)
    end
    
    RegisterCommand('sheriff', function()
        --Loads Player model
        loadModel("s_m_y_sheriff_01")
        --Gives the player weapons
        giveWeapon("weapon_pistol50")
        giveWeapon("weapon_tazer")
        giveWeapon("weapon_carbinerifle")
        giveWeapon("weapon_flare")
        giveWeapon("weapon_pumpshotgun")
        giveWeapon("weapon_stungun")
        --Native Notification function usage
        notify("~b~~h~Sheriff~h~~w~ Loadout Loaded.")
    end, false)
    TriggerEvent('chat:addSuggestion', '/sheriff', 'Loads the Sheriff Police loadout')
    
    RegisterCommand('cop', function()
        --Loads Player model
        loadModel("s_m_y_cop_01")
        --Gives the player weapons
        giveWeapon("weapon_combatpistol")
        giveWeapon("weapon_carbinerifle")
        giveWeapon("weapon_flare")
        giveWeapon("weapon_pumpshotgun")
        giveWeapon("weapon_stungun")
        --Native Notification
        notify("~b~~h~Police~h~~w~ Loadout Loaded.")
    end, false)
    TriggerEvent('chat:addSuggestion', '/cop', 'Loads the City Police loadout')
    
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
    TriggerEvent('chat:addSuggestion', '/prisoner', 'Loads the Convict loadout')
    
    
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
        