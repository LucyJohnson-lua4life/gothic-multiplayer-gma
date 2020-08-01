require "serverscripts/item_maps"
require "serverscripts/has_item_globals"
require "serverscripts/player_globals"
local inventory_dao = require "serverscripts/daos/inventory_dao"

local cooking_handler = {}
local potContent = {}
local check_id = COOKING_CHECK_ID


local function printPotContent(playerid)

    local msg = "Kochtopfinhalt: "
    for _, value in pairs(potContent[playerid]) do
        msg = msg .. ITEM_NAME_MAP[value] .. ", "
    end

    SendPlayerMessage(playerid,230,230,230, msg)
end

local function matchesIngredients(playerid, i1, i2,i3)
    if potContent[playerid][1] == i1 and potContent[playerid][2] == i2 and potContent[playerid][3] == i3 then
        return true
    else
        return false
    end
end

local function cookPotContent(playerid)

    if matchesIngredients(playerid, "ITPL_HEALTH_HERB_01","ITPL_HEALTH_HERB_01","ITPL_HEALTH_HERB_01") then
        SendPlayerMessage(playerid,0,255,0, "Heiltrank hergestellt!")
        potContent[playerid] = nil
    else
        SendPlayerMessage(playerid,230,230,230, "Schade... nichts brauchbares entstanden.")
    end

end

local function handlePutAction(playerid, params)
    local item_id = tonumber(params)

    if item_id >= 1000 and item_id <= 1003 then
        HasItem(playerid,ITEM_ID_MAP[item_id], check_id)
    else
        SendPlayerMessage(playerid,230,230,230, "Du kannst diesen Gegenstand nicht in den Kochtopf tun.")
    end

end

function cooking_handler.OnPlayerUseItem(playerid, itemInstance, amount, hand)
    local anim = GetPlayerAnimationName(playerid)   
    if itemInstance == "ITMI_SCOOP" and anim == "T_CAULDRON_STAND_2_S0" then
        SendPlayerMessage(playerid,230,230,230,"Nutze folgende Befehle fuer das Kochen von Gerichten.")
        SendPlayerMessage(playerid,230,230,230,"'/inspect' - ueberpruefe Kochtopfinhalt, '/put <item id>' - fuege Zutat hinzu, '/cook' - koche das Gericht")
        potContent[playerid] = {}
    elseif anim == "T_CAULDRON_S0_2_STAND" then    
        potContent[playerid] = nil
    end

end

function cooking_handler.OnPlayerCommandText(playerid, cmdtext)
    if potContent[playerid] ~= nil then

        local cmd,params = GetCommand(cmdtext);

        if cmd == "/inspect" then
            printPotContent(playerid)
        elseif cmd == "/put" and table.getn(potContent[playerid]) < 3 then
            handlePutAction(playerid, params)
        elseif cmd == "/put" and table.getn(potContent[playerid]) >= 3 then
            SendPlayerMessage(playerid,230,230,230, "Du kannst nicht mehr als 3 Zutaten hinzufuegen.")
        elseif cmd == "/cook" and table.getn(potContent[playerid]) < 3 then
            SendPlayerMessage(playerid,230,230,230,"Du musst insgesamt 3 Zutaten einfuegen")
        elseif cmd == "/cook" and table.getn(potContent[playerid]) == 3 then
            cookPotContent(playerid)
        end

    end

end


function cooking_handler.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)

    if checkid == check_id and amount > 0 then
        table.insert(potContent[playerid], item_instance)
        SendPlayerMessage(playerid,230,230,230, ITEM_NAME_MAP[item_instance].. " hinzugefuegt.")
        RemoveItem(playerid, item_instance, 1)
        inventory_dao.updateItemOrDeleteIfAmountIsZero(PLAYER_HANDLER_MAP[playerid], PLAYER_ID_NAME_MAP[playerid], item_instance, 1)
    elseif checkid == check_id then
        SendPlayerMessage(playerid,230,230,230, "Du hast den Gegenstand nicht im Inventar.")
    end
end

function cooking_handler.OnPlayerDisconnect(playerid, reason)
    potContent[playerid] = nil
end

return cooking_handler