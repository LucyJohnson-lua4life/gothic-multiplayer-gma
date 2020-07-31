require "serverscripts/item_maps"
require "serverscripts/has_item_globals"
require "serverscripts/player_globals"
local inventory_dao = require "serverscripts/daos/inventory_dao"


local alchemy_module = {}
local flaskContent = {}
local check_id = ALCHEMY_CHECK_ID


local function printFlaskContent(playerid)

    local msg = "Laborflascheninhalt: "
    for _, value in pairs(flaskContent[playerid]) do
        msg = msg .. ITEM_NAME_MAP[value] .. ", "
    end

    SendPlayerMessage(playerid,230,230,230, msg)
end

local function matchesIngredients(playerid, i1, i2,i3)
    if flaskContent[playerid][1] == i1 and flaskContent[playerid][2] == i2 and flaskContent[playerid][3] == i3 then
        return true
    else
        return false
    end
end

local function brewFlaskContent(playerid)

    if matchesIngredients(playerid, "ITPL_HEALTH_HERB_01","ITPL_HEALTH_HERB_01","ITPL_HEALTH_HERB_01") then
        SendPlayerMessage(playerid,0,255,0, "Heiltrank hergestellt!")
    else
        SendPlayerMessage(playerid,230,230,230, "Schade... nichts brauchbares entstanden.")
    end

end

local function handlePutAction(playerid, params)
    local item_id = tonumber(params)

    if item_id >= 1000 and item_id <= 1003 then
        HasItem(playerid,ITEM_ID_MAP[item_id], check_id)
    else
        SendPlayerMessage(playerid,230,230,230, "Du kannst diesen Gegenstand nicht in die Laborwasserflasche tun.")
    end

end

function alchemy_module.OnPlayerUseItem(playerid, itemInstance, amount, hand)
    local anim = GetPlayerAnimationName(playerid)   
    print(anim)
    if itemInstance == "ITMI_FLASK" and anim == "T_LAB_S0_2_S1" then
        --T_LAB_S0_2_S0 happens on quit
        SendPlayerMessage(playerid,230,230,230,"Nutze folgende Befehle fuer das Brauen von Traenken.")
        SendPlayerMessage(playerid,230,230,230,"'/inspect' - ueberpruefe Laborflascheninhalt, '/put <item id>' - fuege Zutat hinzu, '/brew' -> braue das Gemisch")
        flaskContent[playerid] = {}
    elseif itemInstance == "ITMI_FLASK" and anim == "T_LAB_S0_2_S0" then    
        flaskContent[playerid] = nil
    end

end

function alchemy_module.OnPlayerCommandText(playerid, cmdtext)
    if flaskContent[playerid] ~= nil then

        local cmd,params = GetCommand(cmdtext);

        if cmd == "/inspect" then
            printFlaskContent(playerid)
        elseif cmd == "/put" and table.getn(flaskContent[playerid]) < 3 then
            handlePutAction(playerid, params)
        elseif cmd == "/put" and table.getn(flaskContent[playerid]) >= 3 then
            SendPlayerMessage(playerid,230,230,230, "Du kannst nicht mehr als 3 Zutaten hinzufuegen.")
        elseif cmd == "/brew" and table.getn(flaskContent[playerid]) < 3 then
            SendPlayerMessage(playerid,230,230,230,"Du musst insgesamt 3 Zutaten einfuegen")
        elseif cmd == "/brew" and table.getn(flaskContent[playerid]) == 3 then
            brewFlaskContent(playerid)
        end

    end

end


function alchemy_module.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)

    if checkid == check_id and amount > 0 then
        table.insert(flaskContent[playerid], item_instance)
        SendPlayerMessage(playerid,230,230,230, ITEM_NAME_MAP[item_instance].. " hinzugefuegt.")
        RemoveItem(playerid, item_instance, 1)
        inventory_dao.updateItemOrDeleteIfAmountIsZero(PLAYER_HANDLER_MAP[playerid], PLAYER_ID_NAME_MAP[playerid], item_instance, 1)
    elseif checkid == check_id then
        SendPlayerMessage(playerid,230,230,230, "Du hast den Gegenstand nicht im Inventar.")
    end
end

return alchemy_module
