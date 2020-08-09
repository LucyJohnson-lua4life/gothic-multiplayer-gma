require "serverscripts/item_maps"
require "serverscripts/has_item_globals"
require "serverscripts/player_globals"
local inventory_dao = require "serverscripts/daos/inventory_dao"

local cooking_handler = {}
local pot_content = {}
local check_id = COOKING_CHECK_ID

local ingredients_for_stew = {["ITFOMUTTON"] = 2, ["ITFO_WATER"] = 1}

local function matchesIngredients(playerid, ingredients)
    for item_instance, _ in pairs(ingredients) do
        if pot_content[playerid][item_instance] == nil or pot_content[playerid][item_instance] ~= ingredients[item_instance] then
            return false
        end
    end
    return true
end

local function cookPotContent(playerid)

    if matchesIngredients(playerid, ingredients_for_stew) then
        SendPlayerMessage(playerid,0,255,0, "Eintopf gekocht!")
        GiveItem(playerid, "ITFO_STEW",1)
        pot_content[playerid] = nil
    else
        SendPlayerMessage(playerid,230,230,230, "Schade... nichts brauchbares entstanden.")
    end

end

local function handlePutAction(playerid, params)
    local item_id = tonumber(params)

    if item_id >= 2000 and item_id <= 2015 then
        HasItem(playerid,ITEM_ID_MAP[item_id], check_id)
    else
        SendPlayerMessage(playerid,230,230,230, "Du kannst diesen Gegenstand nicht in den Kochtopf tun.")
    end

end

function cooking_handler.OnPlayerUseItem(playerid, itemInstance, amount, hand)
    local anim = GetPlayerAnimationName(playerid)   
    if itemInstance == "ITMI_SCOOP" and anim == "T_CAULDRON_STAND_2_S0" then
        SendPlayerMessage(playerid,255,228,181,"Nutze folgende Befehle fuer das Kochen von Gerichten.")
        SendPlayerMessage(playerid,255,228,181,"''/put <item id>' - fuege Zutat hinzu, '/cook' - koche das Gericht")
        pot_content[playerid] = {}
        pot_content[playerid]["total"] = 0
    elseif anim == "T_CAULDRON_S0_2_STAND" then    
        pot_content[playerid] = nil
    end

end

function cooking_handler.OnPlayerCommandText(playerid, cmdtext)
    if pot_content[playerid] ~= nil then

        local cmd,params = GetCommand(cmdtext);

        if cmd == "/put" and pot_content[playerid]["total"] < 3 then
            handlePutAction(playerid, params)
        elseif cmd == "/put" and pot_content[playerid]["total"] >= 3 then
            SendPlayerMessage(playerid,230,230,230, "Du kannst nicht mehr als 3 Zutaten hinzufuegen.")
        elseif cmd == "/cook" and pot_content[playerid]["total"] < 3 then
            SendPlayerMessage(playerid,230,230,230,"Du musst insgesamt 3 Zutaten einfuegen")
        elseif cmd == "/cook" and pot_content[playerid]["total"] == 3 then
            cookPotContent(playerid)
        end

    end

end


function cooking_handler.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)

    if checkid == check_id and amount > 0 then
        if pot_content[playerid][item_instance] then 
            pot_content[playerid][item_instance] = pot_content[playerid][item_instance]+1
        else 
            pot_content[playerid][item_instance] = 1 
        end
        pot_content[playerid]["total"] = pot_content[playerid]["total"] + 1
        SendPlayerMessage(playerid,230,230,230, ITEM_NAME_MAP[item_instance].. " hinzugefuegt.")
        RemoveItem(playerid, item_instance, 1)
        inventory_dao.updateItemOrDeleteIfAmountIsZero(PLAYER_HANDLER_MAP[playerid], PLAYER_ID_NAME_MAP[playerid], item_instance, 1)
    elseif checkid == check_id then
        SendPlayerMessage(playerid,230,230,230, "Du hast den Gegenstand nicht im Inventar.")
    end
end

function cooking_handler.OnPlayerDisconnect(playerid, reason)
    pot_content[playerid] = nil
end

return cooking_handler