local custom_potions = require "serverscripts/feature_modules/custom_items_module/custom_potions"
local custom_items_module = {}

local function getRecoveryValue(current_health, max_health, percent)
    local new_summed_health = current_health + math.floor(max_health / 100 * percent)

    if new_summed_health > max_health then
       return max_health   
    end

    return new_summed_health
end

function custom_items_module.OnPlayerUseItem(playerid, itemInstance, amount, hand)
    if itemInstance == "ITFOMUTTONRAW" then
       SetPlayerHealth(playerid, getRecoveryValue(GetPlayerHealth(playerid), GetPlayerMaxHealth(playerid), 20));  
    elseif itemInstance == "ITFOMUTTON"  then
        SetPlayerHealth(playerid, getRecoveryValue(GetPlayerHealth(playerid), GetPlayerMaxHealth(playerid), 25));  
    elseif itemInstance == "ITFO_APPLE"  then
        SetPlayerHealth(playerid, getRecoveryValue(GetPlayerHealth(playerid), GetPlayerMaxHealth(playerid), 25));
        SetPlayerMana(playerid, getRecoveryValue(GetPlayerMana(playerid), GetPlayerMaxMana(playerid), 25));
    end
    custom_potions.OnPlayerUseItem(playerid, itemInstance, amount, hand)
end

function custom_items_module.OnPlayerHit(playerid, killerid)
    custom_potions.OnPlayerHit(playerid, killerid)
end

function custom_items_module.OnPlayerDisconnect(playerid, reason)
    custom_potions.OnPlayerDisconnect(playerid, reason)
end

return custom_items_module