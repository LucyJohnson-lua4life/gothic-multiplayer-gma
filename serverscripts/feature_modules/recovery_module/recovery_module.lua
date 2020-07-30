require "serverscripts/player_globals"
local recovery_module = {}

local function getRecoveryValue(current_val, max_val)
    local new_summed_val = current_val + math.floor(max_val / 100 * 5)

    if new_summed_val > max_val then
       return max_val   
    end

    return new_summed_val
end

local function recoverPlayer(playerid)
    if PLAYER_ID_NAME_MAP[playerid] ~= nil then
        local current_health = GetPlayerHealth(playerid)
        local max_health = GetPlayerMaxHealth(playerid)
        local current_mana = GetPlayerMana(playerid)
        local max_mana = GetPlayerMaxMana(playerid)

        if current_health < max_health then
            SetPlayerHealth(playerid, getRecoveryValue(current_health, max_health))
        end
        if current_mana < max_mana then
            SetPlayerMana(playerid, getRecoveryValue(current_mana, max_mana))
        end
    end
end

function CheckForRecovery()
    for k,v in pairs(PLAYER_ID_NAME_MAP) do
        if IsPlayerConnected(k) == 1 and IsDead(k) == 0 and IsUnconscious(k) == 0 then 
            recoverPlayer(k)
        end
    end

end

function recovery_module.OnGamemodeInit()
    SetTimer("CheckForRecovery",5000,1)
end


return recovery_module