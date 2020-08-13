local custom_armors = {}

local beastarmor_ability_start_time = {}
local BEASTARMOR_ABILITY_COOLDOWN_SECS = 10
local BEASTARMOR_STR_ADDED = 25




function ExecuteOnBeastarmorCooldownOver() 

    for k, v in pairs(beastarmor_ability_start_time) do
        if(os.clock() - v > BEASTARMOR_ABILITY_COOLDOWN_SECS) then
            beastarmor_ability_start_time[k] = nil;
            SetPlayerStrength(k, GetPlayerStrength(k)-BEASTARMOR_STR_ADDED)
            SendPlayerMessage(k, 0,255,0, "Dein Blutrausch verfaellt...")
        end
    end

end


local function activateBeastArmorAbility(playerid, killerid)
    SetPlayerStrength(playerid, GetPlayerStrength(playerid)+BEASTARMOR_STR_ADDED)
    beastarmor_ability_start_time[playerid] = os.clock()
    SetTimer("ExecuteOnBeastarmorCooldownOver", (BEASTARMOR_ABILITY_COOLDOWN_SECS*1000)+100, 0);

    if IsNPC(playerid) == 0 then
        SendPlayerMessage(killerid, 255,0,0, "Dein Gegner verfaellt in einen Blutrausch!")
    end

    SendPlayerMessage(playerid, 255,0,0, "Du verfaellst in einen Blutrausch!")
end 


local function activateBeastArmorOnEmergency(playerid, killerid)
    if beastarmor_ability_start_time[playerid] == nil then
        if GetPlayerHealth(playerid) <= (GetPlayerMaxHealth(playerid)/100)*40 then
            activateBeastArmorAbility(playerid, killerid)
        end
    end

end

function custom_armors.OnPlayerHit(playerid, killerid)
    
    if IsNPC(playerid) == 0 and GetEquippedArmor(playerid) == "ITAR_THORUS_ADDON" then
        activateBeastArmorOnEmergency(playerid, killerid)
    end

end


function custom_armors.OnPlayerDisconnect(playerid, reason)
    beastarmor_ability_start_time[playerid] = nil
end



return custom_armors