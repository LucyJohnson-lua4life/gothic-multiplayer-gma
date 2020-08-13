local custom_potions = {}

local shrink_mode_start_time = {}
local SHRINK_MODE_COOLDOWN_SECS = 5

local giant_mode_start_time = {}
local GIANT_MODE_COOLDOWN_SECS = 5

local strength_pot_start_time = {}
local STRENGTH_POT_COOLDOWN_SECS = 5
local STRENGTH_ADDED = 25

local dex_pot_start_time = {}
local DEX_POT_COOLDOWN_SECS = 5
local DEX_ADDED = 25

local in_emberblood_mode = {}
local emberblood_start_time = {}
local EMBERBLOOD_COOLDOWN_SECS = 10
local DMG_IN_EMBERBLOOD_MODE = 50

function ExecuteOnShrinkmodeCooldownOver() 

    for k, v in pairs(shrink_mode_start_time) do
        if(os.clock() - v > SHRINK_MODE_COOLDOWN_SECS) then
            shrink_mode_start_time[k] = nil;
            SetPlayerScale(k,1.0,1.0,1.0);   
            SendPlayerMessage(k, 255,228,181, "Normalitaet kehrt wieder ein...")
        end
    end

end

function ExecuteOnGiantmodeCooldownOver() 

    for k, v in pairs(giant_mode_start_time) do
        if(os.clock() - v > GIANT_MODE_COOLDOWN_SECS) then
            giant_mode_start_time[k] = nil;
            SetPlayerScale(k,1.0,1.0,1.0);   
            SendPlayerMessage(k, 255,228,181, "Normalitaet kehrt wieder ein...")
        end
    end

end


function ExecuteOnStrengthPotCooldownOver() 

    for k, v in pairs(strength_pot_start_time) do
        if(os.clock() - v > STRENGTH_POT_COOLDOWN_SECS) then
            strength_pot_start_time[k] = nil;
            SetPlayerStrength(k, GetPlayerStrength(k)-STRENGTH_ADDED)
            SendPlayerMessage(k, 255,228,181, "Normalitaet kehrt wieder ein...")
        end
    end

end

function ExecuteOnDexPotCooldownOver() 

    for k, v in pairs(dex_pot_start_time) do
        if(os.clock() - v > DEX_POT_COOLDOWN_SECS) then
            dex_pot_start_time[k] = nil;
            SetPlayerDexterity(k, GetPlayerDexterity(k)-DEX_ADDED)
            SendPlayerMessage(k, 255,228,181, "Normalitaet kehrt wieder ein...")
        end
    end

end


function ExecuteOnEmberbloodCooldownOver() 

    for k, v in pairs(emberblood_start_time) do
        if(os.clock() - v > EMBERBLOOD_COOLDOWN_SECS) then
            emberblood_start_time[k] = nil;
            in_emberblood_mode[k] = nil
            SendPlayerMessage(k, 255,228,181, "Dein Koerper hat sich abgekuehlt.")
        end
    end

end

local function shrinkPlayer(playerid)
    SetPlayerScale(playerid,0.1,0.1,0.1);
    shrink_mode_start_time[playerid] = os.clock()
    SetTimer("ExecuteOnShrinkmodeCooldownOver", (SHRINK_MODE_COOLDOWN_SECS*1000)+100, 0);
    SendPlayerMessage(playerid, 255,228,181, "Du spuerst wie eine unsichtbare Macht dich veraendert...")
end 

local function sizePlayerUp(playerid)
    SetPlayerScale(playerid,2.0,3.0,2.0);
    giant_mode_start_time[playerid] = os.clock()
    SetTimer("ExecuteOnGiantmodeCooldownOver", (GIANT_MODE_COOLDOWN_SECS*1000)+100, 0);
    SendPlayerMessage(playerid, 255,228,181, "Du spuerst wie eine unsichtbare Macht dich veraendert...")
end 

local function increasePlayerStrength(playerid)
    SetPlayerStrength(playerid, GetPlayerStrength(playerid)+STRENGTH_ADDED)
    strength_pot_start_time[playerid] = os.clock()
    SetTimer("ExecuteOnStrengthPotCooldownOver", (STRENGTH_POT_COOLDOWN_SECS*1000)+100, 0);
    SendPlayerMessage(playerid, 255,228,181, "Du fuehlst dich vorruebergehend kraeftiger.")
end

local function increasePlayerDex(playerid)
    SetPlayerDexterity(playerid, GetPlayerDexterity(playerid)+DEX_ADDED)
    dex_pot_start_time[playerid] = os.clock()
    SetTimer("ExecuteOnDexPotCooldownOver", (DEX_POT_COOLDOWN_SECS*1000)+100, 0);
    SendPlayerMessage(playerid, 255,228,181, "Du fuehlst dich vorruebergehend geschickter.")
end


local function increasePlayerHpAboveMax(playerid)
    SetPlayerHealth(playerid, GetPlayerMaxHealth(playerid)+250)
    SendPlayerMessage(playerid, 255,228,181, "Du fuehlst dich vitaler als normal!")
end

local function increasePlayerMpAboveMax(playerid)
    SetPlayerMana(playerid, GetPlayerMaxMana(playerid)+250)
    SendPlayerMessage(playerid, 255,228,181, "Du fuehlst dich spiritueller als normal!")
end

local function setPlayerInEmberBloodMode(playerid)
    in_emberblood_mode[playerid] = true
    emberblood_start_time[playerid] = os.clock()
    SetTimer("ExecuteOnEmberbloodCooldownOver", (EMBERBLOOD_COOLDOWN_SECS*1000)+100, 0);
    SendPlayerMessage(playerid, 255,228,181, "Du fuehlst eine gewaltige Hitze in deinem Koerper.")
end


function custom_potions.OnPlayerUseItem(playerid, itemInstance, amount, hand)
    if itemInstance == "ITPO_MANA_01" then
        shrinkPlayer(playerid)
    elseif itemInstance == "ITPO_MANA_02" then
        sizePlayerUp(playerid)
    elseif itemInstance == "ITPO_MANA_03" then
        increasePlayerStrength(playerid)
    elseif itemInstance == "ITPO_HEALTH_01" then
        increasePlayerDex(playerid)
    elseif itemInstance == "ITPO_HEALTH_02" then
        increasePlayerHpAboveMax(playerid)
    elseif itemInstance == "ITPO_HEALTH_03" then
        setPlayerInEmberBloodMode(playerid)
    end
end

function custom_potions.OnPlayerHit(playerid, killerid)
    if in_emberblood_mode[playerid] then
        SetPlayerHealth(killerid, GetPlayerHealth(killerid)-DMG_IN_EMBERBLOOD_MODE)
        SendPlayerMessage(killerid, 255,0,0, "Du hast dich beim Angriff verbrannt!")
    end

end


function custom_potions.OnPlayerDisconnect(playerid, reason)
    shrink_mode_start_time[playerid] = nil
    giant_mode_start_time[playerid] = nil
    strength_pot_start_time[playerid] = nil
    dex_pot_start_time[playerid] = nil
    emberblood_start_time[playerid] = nil
end



return custom_potions