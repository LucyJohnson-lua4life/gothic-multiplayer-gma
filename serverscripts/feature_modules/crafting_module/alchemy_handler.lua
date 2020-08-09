require "serverscripts/item_maps"
require "serverscripts/has_item_globals"
require "serverscripts/player_globals"
local inventory_dao = require "serverscripts/daos/inventory_dao"

local alchemy_handler = {}
local flask_content = {}
local check_id = ALCHEMY_CHECK_ID


local ingredients_for_healpot = {["ITPL_HEALTH_HERB_01"] = 2, ["ITPL_HEALTH_HERB_03"] = 1}
local ingredients_for_manapot = {["ITPL_MANA_HERB_01"] = 2, ["ITPL_MANA_HERB_03"] = 1}
local ingredients_for_healpot = {["ITPL_HEALTH_HERB_01"] = 2, ["ITPL_HEALTH_HERB_03"] = 1}
local ingredients_for_healpot = {["ITPL_HEALTH_HERB_01"] = 2, ["ITPL_HEALTH_HERB_03"] = 1}

local function matchesIngredients(playerid, ingredients)
    for item_instance, _ in pairs(ingredients) do
        if flask_content[playerid][item_instance] == nil or flask_content[playerid][item_instance] ~= ingredients[item_instance] then
            return false
        end
    end
    return true
end

local function brewFlaskContent(playerid)

    if matchesIngredients(playerid, ingredients_for_healpot) then
        SendPlayerMessage(playerid,0,255,0, "Reine Lebensenergie hergestellt!")
        GiveItem(playerid, "ITPO_HEALTH_ADDON_04",1)
        flask_content[playerid] = nil
    elseif matchesIngredients(playerid, ingredients_for_manapot) then
        SendPlayerMessage(playerid,0,255,0, "Reine Mana hergestellt!")
        GiveItem(playerid, "ITPO_MANA_ADDON_04",1)
        flask_content[playerid] = nil
    else
        SendPlayerMessage(playerid,230,230,230, "Schade... nichts brauchbares entstanden.")
    end

end

local function handlePutAction(playerid, params)
    local item_id = tonumber(params)

    if item_id >= 3000 and item_id <= 3003 then
        HasItem(playerid,ITEM_ID_MAP[item_id], check_id)
    else
        SendPlayerMessage(playerid,230,230,230, "Du kannst diesen Gegenstand nicht in die Laborwasserflasche tun.")
    end

end

function alchemy_handler.OnPlayerUseItem(playerid, itemInstance, amount, hand)
    local anim = GetPlayerAnimationName(playerid)   
    if itemInstance == "ITMI_FLASK" and anim == "T_LAB_S0_2_S1" then
        SendPlayerMessage(playerid,255,228,181,"Nutze folgende Befehle fuer das Brauen von Traenken.")
        SendPlayerMessage(playerid,255,228,181,"'/put <item id>' - fuege Zutat hinzu, '/brew' - braue das Gemisch")
        flask_content[playerid] = {}
        flask_content[playerid]["total"] = 0
    elseif anim == "T_LAB_S1_2_S0" then    
        flask_content[playerid] = nil
    end

end

function alchemy_handler.OnPlayerCommandText(playerid, cmdtext)
    if flask_content[playerid] ~= nil then

        local cmd,params = GetCommand(cmdtext);

        if cmd == "/put" and flask_content[playerid]["total"] < 3 then
            handlePutAction(playerid, params)
        elseif cmd == "/put" and flask_content[playerid]["total"] >= 3 then
            SendPlayerMessage(playerid,230,230,230, "Du kannst nicht mehr als 3 Zutaten hinzufuegen.")
        elseif cmd == "/brew" and flask_content[playerid]["total"] < 3 then
            SendPlayerMessage(playerid,230,230,230,"Du musst insgesamt 3 Zutaten einfuegen")
        elseif cmd == "/brew" and flask_content[playerid]["total"] == 3 then
            brewFlaskContent(playerid)
        end

    end

end


function alchemy_handler.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)

    if checkid == check_id and amount > 0 then

        if flask_content[playerid][item_instance] then 
            flask_content[playerid][item_instance] = flask_content[playerid][item_instance]+1
        else 
            flask_content[playerid][item_instance] = 1 
        end
        flask_content[playerid]["total"] = flask_content[playerid]["total"] + 1

        SendPlayerMessage(playerid,230,230,230, ITEM_NAME_MAP[item_instance].. " hinzugefuegt.")
        RemoveItem(playerid, item_instance, 1)
        inventory_dao.updateItemOrDeleteIfAmountIsZero(PLAYER_HANDLER_MAP[playerid], PLAYER_ID_NAME_MAP[playerid], item_instance, 1)
    elseif checkid == check_id then
        SendPlayerMessage(playerid,230,230,230, "Du hast den Gegenstand nicht im Inventar.")
    end
end

function alchemy_handler.OnPlayerDisconnect(playerid, reason)
    flask_content[playerid] = nil
end

return alchemy_handler
