require "serverscripts/utils/script_functions"
require "serverscripts/player_globals"
require "serverscripts/has_item_globals"
local inventory_dao = require "serverscripts/daos/inventory_dao"
local check_id = DIA_BRYAN_BANDITHEADS_CHECKID
local goldsell_id = DIA_BRYAN_GOLDSELL_CHECKID
local dia_vlk_7005_bryan = {}
local buy_dia_helper = require "serverscripts/feature_modules/npc_interaction_module/dialogues/buy_dia_helper"
local items_to_sell = {}
items_to_sell[5000] = true
items_to_sell[5001] = true
items_to_sell[5002] = true
items_to_sell[5003] = true

local function handleBanditDialogue(playerid, text)
    if string.match(text, "Arbeit") then
        SendPlayerMessage(playerid, 255, 255, 255, "Bryan sagt: Seit Monaten lungern in der Gegend Banditen rum und runieren meine Handelswege. Wenn das so weiter geht, dann kann ich mein Geschaeft bald schliessen! Ich brauche jemanden der diese <Mistkerle> erledigt.")
        return true
    elseif string.match(text, "Mistkerle") then
        SendPlayerMessage(playerid, 255, 255, 255, "Bryan sagt: Genau Mistkerle! Spuere so viele von den Typen auf und bring mir ihre <Koepfe>. Fuer jeden Kopf zahle ich dir 100 Goldmuenzen!")
        return true
    elseif string.match(text, "Koepfe") then
        HasItem(playerid, "ITMI_ADDON_BLOODWYN_KOPF", DIA_BRYAN_BANDITHEADS_CHECKID)
        return true
    else
        return false
    end
end

local function handleBanditRewardDialogue(playerid,item_instance, amount, equipped, checkid)
    if checkid == goldsell_id and item_instance == "ITMI_ADDON_BLOODWYN_KOPF" and amount >= 1 then
        RemoveItem(playerid, "ITMI_ADDON_BLOODWYN_KOPF", amount)
        inventory_dao.deleteItemByInstance(PLAYER_HANDLER_MAP[playerid], PLAYER_ID_NAME_MAP[playerid], "ITMI_ADDON_BLOODWYN_KOPF")
        SendPlayerMessage(playerid, 255, 255, 255, "Bryan sagt: Auf dich ist Verlass! Hier nimm das Gold, du hast es dir verdient!")
        local goldToAdd = 100*amount
        SetPlayerGold(playerid, GetPlayerGold(playerid)+goldToAdd)
        SendPlayerMessage(playerid, 0, 255, 0, tostring(goldToAdd).." Gold erhalten.")
    elseif checkid == check_id then
        SendPlayerMessage(playerid, 255, 255, 255, "Bryan sagt: Tut mir Leid, aber es sieht nicht so aus als haettest du die <Koepfe>. Komm wieder wenn du welche hast.")
    end

end

local function handleGoldSellDialogue(playerid, text)
    if string.match(text, "Goldtauschen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Bryan sagt: Du kannst bei mir <Goldbrocken> gegen Goldmuenzen eintauschen. Ich werde eine kleine Provision fuers Einschmelzen beanspruchen, aber das ist nur ein geringer Preis.")
        return true
    elseif string.match(text, "Goldbrocken") then
        HasItem(playerid, "ITMI_GOLDNUGGET_ADDON", goldsell_id)
        return true
    else
        return false
    end
end

local function handleGoldSellRewardDialogue(playerid, item_instance, amount, equipped, checkid)
    if checkid == goldsell_id and item_instance == "ITMI_GOLDNUGGET_ADDON" and amount >= 1 then
        RemoveItem(playerid, item_instance, amount)
        inventory_dao.deleteItemByInstance(PLAYER_HANDLER_MAP[playerid], PLAYER_ID_NAME_MAP[playerid], item_instance)
        SendPlayerMessage(playerid, 255, 255, 255, "Bryan sagt: Gut. Hier bekommst du das Gold.")
        local goldToAdd = PRICE_TABLE[item_instance] * amount
        SetPlayerGold(playerid, GetPlayerGold(playerid) + goldToAdd)
        SendPlayerMessage(playerid, 0, 255, 0, tostring(goldToAdd) .. " Gold erhalten.")
    elseif checkid == goldsell_id then
        SendPlayerMessage(playerid, 255, 255, 255, "Bryan sagt: Tut mir Leid, aber es sieht nicht so aus als ob du Goldbrocken dabei hast.")
    end

end

local function handleTradeDia(playerid, text)
    if string.match(text, "kaufen") then
        buy_dia_helper.handleTradeDia(playerid, items_to_sell, "Bryan")
        return true
    else 
        return false
    end
end


function dia_vlk_7005_bryan.handleDialogue(playerid, text)
    
    if handleBanditDialogue(playerid, text) == true then
        return
    elseif handleGoldSellDialogue(playerid, text) == true then
        return
    elseif handleTradeDia(playerid, text) == true then
        return
    elseif buy_dia_helper.handleBuyDia(playerid, text, items_to_sell) == true then
        return
    else
        -- INIT DIALOGUE
        SendPlayerMessage(playerid, 255, 255, 255, "Bryan sagt: Hm? Willst du was <kaufen>, <Goldtauschen> oder suchst du <Arbeit>?")
    end

end


function dia_vlk_7005_bryan.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)
    handleBanditRewardDialogue(playerid,item_instance, amount, equipped, checkid)
    handleGoldSellRewardDialogue(playerid, item_instance, amount, equipped, checkid)
end


return dia_vlk_7005_bryan