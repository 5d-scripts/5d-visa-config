-- This script demonstrates how to use the visa stages to disallow new players from using violence.
local Player = {
    visa = {
        stage = 0,
        label = "NONE"
    }
}
local MIN_VISA_FOR_VIOLENCE = 1 -- Minimum visa stage needed for player to use violence.
local UNARMED_HASH = GetHashKey("WEAPON_UNARMED")

-- Hearbeat is triggered every sync interval. If there is a change in the players visa stage, we will be notified.
RegisterNetEvent("5d-visa:heartbeat", function(visaStage, stageLabel)
    if (visaStage == Player.visa.stage) then
        return
    end
    Player.visa.stage = visaStage
    Player.visa.label = stageLabel
end)

function disablePlayerViolence()
    local playerPed = PlayerPedId()
    HudWeaponWheelIgnoreSelection()
    DisableControlAction(0, 24) --  INPUT_ATTACK
    DisableControlAction(0, 37) --  INPUT_SELECT_WEAPON
    DisableControlAction(0, 69) --  INPUT_VEH_ATTACK
    DisableControlAction(0, 70) --  INPUT_VEH_ATTACK2
    DisableControlAction(0, 92) --  INPUT_VEH_PASSENGER_ATTACK
    DisableControlAction(0, 114) -- INPUT_VEH_FLY_ATTACK
    DisableControlAction(0, 140) -- INPUT_MELEE_ATTACK_LIGHT
    DisableControlAction(0, 141) -- INPUT_MELEE_ATTACK_HEAVY
    DisableControlAction(0, 142) -- INPUT_MELEE_ATTACK_ALTERNATE
    DisableControlAction(0, 257) -- INPUT_ATTACK2
    DisableControlAction(0, 263) -- INPUT_MELEE_ATTACK1
    DisableControlAction(0, 264) -- INPUT_MELEE_ATTACK2
    DisableControlAction(0, 331) -- INPUT_VEH_FLY_ATTACK2

    local _, currentWeaponHash = GetCurrentPedWeapon(playerPed)
    if (currentWeaponHash ~= UNARMED_HASH) then
        SetCurrentPedWeapon(playerPed, UNARMED_HASH, true)
    end
end

Citizen.CreateThread(function()
    while (Player.visa.stage < MIN_VISA_FOR_VIOLENCE) do
        disablePlayerViolence()
        Citizen.Wait(0)
    end
end)

RegisterCommand("getvisa", function()
    print(string.format("Your Visa Stage: %s", Player.visa.label))
end)
