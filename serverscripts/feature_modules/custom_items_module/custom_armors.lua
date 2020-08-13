local custom_armors = {}

local beastarmor_ability_start_time = {}
local BEASTARMOR_ABILITY_COOLDOWN_SECS = 10
local BEASTARMOR_STR_ADDED = 25


local witcharmor_charge = {}
local witcharmor_enemies = {}
local WITCHARMOR_MAXIMUM_CHARGE = 400
local WITCHARMOR_DMG = 200
local WITCHARMOR_REFLECTION_DISTANCE =  1000
local WITCH_ARMOR_REFLECTION_SOUND = CreateSound("MFX_FIREBALL_COLLIDE4.WAV")




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
        if GetPlayerHealth(playerid) <= math.floor(GetPlayerMaxHealth(playerid)/100)*40 then
            activateBeastArmorAbility(playerid, killerid)
        end
    end

end



---- witcharmor logic

local function hitAllPlayerWithWitchArmorSpell(playerid)

    for enemyid, value in pairs(witcharmor_enemies[playerid]) do

        local distance = GetDistancePlayers(playerid, enemyid)

        if distance < WITCHARMOR_REFLECTION_DISTANCE then
            local hp_after_dmg = GetPlayerHealth(enemyid)-WITCHARMOR_DMG

            if hp_after_dmg > 0 then
                SetPlayerHealth(enemyid, hp_after_dmg)
            else  
                SetPlayerHealth(enemyid, 0)
            end

            PlayPlayerSound(enemyid, WITCH_ARMOR_REFLECTION_SOUND)
            SendPlayerMessage(enemyid,255,0,0, "Schaden wird auf dich reflektiert!")
            
        end

    end
    
end


local function chargeWitchArmor(playerid, current_dmg)
    witcharmor_charge[playerid] = witcharmor_charge[playerid]+current_dmg

    if witcharmor_charge[playerid] >= WITCHARMOR_MAXIMUM_CHARGE then
        SendPlayerMessage(playerid,0,255,0, "Deine Ruestung strahlt den aufgesogenen Schaden aus!")
        PlayPlayerSound(playerid, WITCH_ARMOR_REFLECTION_SOUND)
        hitAllPlayerWithWitchArmorSpell(playerid)
        witcharmor_enemies[playerid] = {}
        witcharmor_charge[playerid] = 0
    end
   

end

function custom_armors.OnPlayerHit(playerid, killerid)
    
    if IsNPC(playerid) == 0 and GetEquippedArmor(playerid) == "ITAR_THORUS_ADDON" then
        activateBeastArmorOnEmergency(playerid, killerid)
    end

    if IsNPC(playerid) == 0 and GetEquippedArmor(playerid) == "ITAR_DJG_H" then
        if witcharmor_enemies[playerid] ~= nil and witcharmor_enemies[playerid][killerid] == nil then
            witcharmor_enemies[playerid][killerid] = true
        end
    end

end

function custom_armors.OnPlayerChangeArmor(playerid, currArmor, oldArmor)
    if IsNPC(playerid) == 0 and currArmor == "ITAR_DJG_H" then
        if witcharmor_enemies[playerid] == nil then
            witcharmor_enemies[playerid] = {}
            witcharmor_charge[playerid] = 0
        end
    elseif IsNPC(playerid) == 0 and currArmor ~= "ITAR_DJG_H" then
        if witcharmor_enemies[playerid] ~= nil then
            witcharmor_enemies[playerid] = nil
            witcharmor_charge[playerid] = nil
        end
    end
end

function custom_armors.OnPlayerChangeHealth(playerid, currHealth, oldHealth)
    if IsNPC(playerid) == 0 and GetEquippedArmor(playerid) == "ITAR_DJG_H" then
        local charge_to_add = oldHealth-currHealth
        if charge_to_add > 0 then
            chargeWitchArmor(playerid, oldHealth-currHealth)
        end
    end
end

function custom_armors.OnPlayerWeaponMode(playerid, weaponmode)

    if IsNPC(playerid) == 0 and witcharmor_charge[playerid] ~= nil then

        if weaponmode == WEAPON_FIST 
        or weaponmode == WEAPON_1H  
        or weaponmode == WEAPON_2H 
        or weaponmode == WEAPON_BOW 
        or weaponmode == WEAPON_CBOW 
        or weaponmode == WEAPON_MAGIC then
            SendPlayerMessage(playerid,0,255,0, "Ladung der Ruestung: "..witcharmor_charge[playerid].."/"..WITCHARMOR_MAXIMUM_CHARGE..".")
        end
    end


end

function custom_armors.OnPlayerDisconnect(playerid, reason)
    beastarmor_ability_start_time[playerid] = nil
    witcharmor_enemies[playerid] = nil
    witcharmor_charge[playerid] = nil
end



return custom_armors