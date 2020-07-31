local npc_drop = {}

local DROP_EARTH_TITAN = {"ITMI_AQUAMARINE", "ITMI_SILVERNECKLACE"}
local DROP_DEAD_PIRATE_CAPTN = {"ITAT_TEETH","ITAT_SKELETONBONE"}
local DROP_LIBRARY_DEMON = {"ITMI_DARKPEARL"}
local DROP_XARDAS_DEMON = {"ITMI_SILVERRING", "ITMI_AQUAMARINE"}
local DROP_BLACK_TROLL = {"ITMI_GOLDRING", "ITAT_SKELETONBONE"}

local DROP_ORC_ELITE = {"ITFO_MILK", "ITFO_WINE", "ITFO_BOOZE","ITFO_STEW", "ITFO_APPLE"}
local DROP_ORC_WARRIOR = {"ITFO_MILK", "ITFO_WINE", "ITFO_BOOZE", "ITFO_BEER", "ITFO_HONEY", "ITFO_SAUSAGE", "ITFO_FISHSOUP", "ITFO_BREAD"
, "ITFO_STEW", "ITFO_APPLE", "ITFO_CHEESE", "ITFO_BACON"}
local DROP_TROLL = { "ITFO_WINE", "ITFO_BOOZE", "ITFO_HONEY", "ITFO_BREAD", "ITMW_2H_AXE_L_01", "ITMI_RAKE"}
local DROP_CRAWLER_WARRIOR = {"ITFO_BEER", "ITFO_BREAD", "ITFO_STEW", "ITFO_APPLE"}
local DROP_SHADOW_BEAST = {"ItAt_ShadowHorn"}

local DROP_GOBBO = {"ITMI_LUTE", "ITMI_BRUSH", "ITMI_BROOM", "ITMI_SAW", "ITMI_SCOOP", "ITMW_2H_AXE_L_01", "ITMI_RAKE"}
local DROP_SKELETON_LORD = {"ITAM_PROT_FIRE_01", "ITSC_BREATHOFDEATH", "ITSC_TRFSHEEP", "ITSC_TRFSCAVENGER", "ITSC_TRFSHADOWBEAST", "ITSC_TRFDRAGONSNAPPER", "ITSC_WHIRLWIND"}


local function getRandomDrop(drop_collection)
    local number_of_drops = table.getn(drop_collection)
    local index = math.random(number_of_drops)
    return drop_collection[index]
end

local function getDropForName(name)
    if (string.match(name, "^Minecrawler Warrior.*")) then
        return {getRandomDrop(DROP_CRAWLER_WARRIOR)}
    elseif (string.match(name, "^Molerat.*")) then
        return {"ITFOMUTTON", "ITFOMUTTON"}
    elseif (string.match(name, "^Dragon Snapper.*")) then
        return { "ITRW_ARROW"}
    elseif (string.match(name, "^Warg.*")) then
        return {"ITFOMUTTON", "ITRW_ARROW", "ITAT_WARGFUR"}
    elseif (string.match(name, "^Orc Elite.*")) then
        return {"ITFO_BOOZE", "ITFO_STEW", getRandomDrop(DROP_ORC_ELITE)}
    elseif (string.match(name, "^Orc Scout.*")) then
        return {"ITFOMUTTON", "ITFO_WATER"}
    elseif (string.match(name, "^Orc Shaman.*")) then
        return {getRandomDrop(DROP_ORC_WARRIOR)}
    elseif (string.match(name, "^Orc Warrior.*")) then
        return {"ITFO_BEER", "ITFO_BACON", getRandomDrop(DROP_ORC_WARRIOR)}
    elseif (string.match(name, "^Razor.*")) then
        return {"ITRW_ARROW"}
    elseif (string.match(name, "^Scavenger.*")) then
        return {"ITFOMUTTON", "ITFO_WATER"}
    elseif (string.match(name, "^Shadowbeast.*")) then
        return {"ITAT_SHADOWFUR", "ITRW_ARROW"}
    elseif (string.match(name, "^Sheep.*")) then
        return {"ITFOMUTTON", "ITFO_WATER"}
    elseif (string.match(name, "^Skeleton Lord.*")) then
        return {getRandomDrop(DROP_SKELETON_LORD)}
    elseif (string.match(name, "^Skeleton.*")) then
        return {"ITFO_MILK"}
    elseif (string.match(name, "^Snapper.*")) then
        return {"ITRW_ARROW", "ITFO_BOOZE", "ITRW_ARROW"}
    elseif (string.match(name, "^Swamp Rat.*")) then
        return {"ITFOMUTTON", "ITFO_WATER"}
    elseif (string.match(name, "^Swamp Shark.*")) then
        return {"ITFO_FISH"}
    elseif (string.match(name, "^Troll.*")) then
        return {"ITFO_STEW", "ITAT_TROLLFUR", "ITRW_ARROW", getRandomDrop(DROP_TROLL)}
    elseif (string.match(name, "^Waran.*")) then
        return {"ITFO_FISH"}
    elseif (string.match(name, "^Wolf.*")) then
        return {"ITFOMUTTON", "ITFO_WATER", "ITAT_WOLFFUR"}
    elseif (string.match(name, "^Keiler.*")) then
        return {"ITFO_SAUSAGE", "ITRW_ARROW", "ITAT_ADDON_KEILERFUR"}
    elseif (string.match(name, "^Lurker.*")) then
        return {"ITFO_FISH", "ITFO_FISHSOUP"}
    elseif (string.match(name, "^Strong Bandit.*")) then
        return {"ITMI_ADDON_BLOODWYN_KOPF"}
    elseif (string.match(name, "^Bandit.*")) then
        return {"ITMI_ADDON_BLOODWYN_KOPF"}
    elseif (string.match(name, "^Black Goblin.*")) then
        return {"ITFO_BEER","ITFO_CHEESE", getRandomDrop(DROP_GOBBO)}
    elseif (string.match(name, "^Demon Lord.*")) then
        return {getRandomDrop(DROP_LIBRARY_DEMON)}
    elseif (string.match(name, "^Black Troll.*")) then
        return {getRandomDrop(DROP_BLACK_TROLL)}
    elseif (string.match(name, "^Captn Hook.*")) then
        return {getRandomDrop(DROP_DEAD_PIRATE_CAPTN)}
    elseif (string.match(name, "^Earth Titan.*")) then
        return {getRandomDrop(DROP_EARTH_TITAN)}
    elseif (string.match(name, "^Demon.*")) then
        return {getRandomDrop(DROP_XARDAS_DEMON)}
    elseif (string.match(name, "^Keymaster.*")) then
        return {"ITKE_MONASTARYSECRETLIBRARY_MIS"}
    elseif (string.match(name, "^Zek.*")) then
        return {"STANDARDBRIEF"}
    else
        return {"ITFOMUTTON", "ITFOMUTTON"}
    end
end

local function giveItemForInstance(playerid, instance)
    if instance == "ITRW_ARROW" then
        GiveItem(playerid, instance, 10)
    else
        GiveItem(playerid, instance, 1)
    end
end

local function sendMessageOnSpecialItem(playerid, item_instance)
    if item_instance == "ITMI_GOLDRING" then
        SendPlayerMessage(playerid, 0, 0, 255, "Du hast ein legendaeres Artefakt gefunden!")
        SendPlayerMessage(playerid, 0, 0, 255, "Tippe '/goldring help' ein fuer naehere Informationen.")
    elseif item_instance == "ITMI_SILVERNECKLACE" then
        SendPlayerMessage(playerid, 0, 0, 255, "Du hast ein legendaeres Artefakt gefunden!")
        SendPlayerMessage(playerid, 0, 0, 255, "Tippe '/silvernecklace help' ein fuer naehere Informationen.")
    elseif item_instance == "ITMI_AQUAMARINE" then
        SendPlayerMessage(playerid, 0, 0, 255, "Du hast ein legendaeres Artefakt gefunden!")
        SendPlayerMessage(playerid, 0, 0, 255, "Tippe '/aquamarine help' ein fuer naehere Informationen.")
    elseif item_instance == "ITMI_SILVERRING" then
        SendPlayerMessage(playerid, 0, 0, 255, "Du hast ein legendaeres Artefakt gefunden!")
        SendPlayerMessage(playerid, 0, 0, 255, "Tippe '/silverring help' ein fuer naehere Informationen.")
    elseif item_instance == "ITAT_TEETH" then
        SendPlayerMessage(playerid, 0, 0, 255, "Du hast ein legendaeres Artefakt gefunden!")
        SendPlayerMessage(playerid, 0, 0, 255, "Tippe '/teeth help' ein fuer naehere Informationen.")
    elseif item_instance == "ITAT_SKELETONBONE" then
        SendPlayerMessage(playerid, 0, 0, 255, "Du hast ein legendaeres Artefakt gefunden!")
        SendPlayerMessage(playerid, 0, 0, 255, "Tippe '/bone help' ein fuer naehere Informationen.")
    elseif item_instance == "ITMI_DARKPEARL" then
        SendPlayerMessage(playerid, 0, 0, 255, "Du hast ein legendaeres Artefakt gefunden!")
        SendPlayerMessage(playerid, 0, 0, 255, "Tippe '/darkperl help' ein fuer naehere Informationen.")
    end
end

local function giveDrop(playerid, killerid)
    if IsNPC(playerid) == 1 and IsNPC(killerid) == 0 then
        local items = getDropForName(GetPlayerName(playerid))
        for _, value in pairs(items) do
            giveItemForInstance(killerid, value)
            SendPlayerMessage(killerid, 255,228,181, value.." gefunden.")
            sendMessageOnSpecialItem(killerid, value)
        end
    end
end

function npc_drop.OnPlayerDeath(playerid, p_classid, killerid, k_classid)
    giveDrop(playerid,killerid)
end

function npc_drop.OnPlayerUnconscious(playerid, p_classid, killerid, k_classid)
    giveDrop(playerid,killerid)
end


return npc_drop;