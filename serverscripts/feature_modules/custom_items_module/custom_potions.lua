local custom_potions = {}
local shrink_mode_start_time = {}
local SHRINK_MODE_COOLDOWN_SECS = 5

function ExecuteOnShrinkmodeCooldownOver() 

    for k, v in pairs(shrink_mode_start_time) do
        if(os.clock() - v > SHRINK_MODE_COOLDOWN_SECS) then
            shrink_mode_start_time[k] = nil;
            SetPlayerScale(k,1.0,1.0,1.0);   
            SendPlayerMessage(k, 255,228,181, "Normalitaet kehrt wieder ein...")
        end
    end

end

local function shrinkPlayer(playerid)
    SetPlayerScale(playerid,0.1,0.1,0.1);
    shrink_mode_start_time[playerid] = os.clock()
    SetTimer("ExecuteOnShrinkmodeCooldownOver", (SHRINK_MODE_COOLDOWN_SECS+1)*1000, 0);
    SendPlayerMessage(playerid, 255,228,181, "Du spuerst wie eine unsichtbare Macht dich veraendert...")
end

function custom_potions.OnPlayerUseItem(playerid, itemInstance, amount, hand)
    if itemInstance == "ITPO_MANA_01" then
        shrinkPlayer(playerid)
    end
end


function custom_potions.OnPlayerDisconnect(playerid, reason)
    if shrink_mode_start_time[playerid] ~= nil then
        shrink_mode_start_time[playerid] = nil
    end
end


return custom_potions