RegisterCommand('cop', function()
    --Loads Player model
    local model = GetHashKey("S_M_Y_Cop_01")
    RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(0)
    end
    --Sets the player modelto the ped
    SetPlayerModel(myPed, model)
    SetModelAsNoLongerNeeded(model)
    --Gives the player weapons
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_combatpistol"), 299, false)
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_carbinerifle"), 299, false)
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_flare"), 299, false)
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_pumpshotgun"), 299, false)
    --Native Notification
    SetNotificationTextEntry("STRING")
    AddTextComponentString("~b~Police Loadout Loaded.")
    DrawNotification(true, false)
end, false)
