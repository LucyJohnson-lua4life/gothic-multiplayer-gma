require "serverscripts/utils/script_functions"
require "serverscripts/player_globals"
require "serverscripts/has_item_globals"
require "serverscripts/price_table"
local inventory_dao = require "serverscripts/daos/inventory_dao"
local check_id = DIA_GOFFREY_ARMORQUEST_CHECKID
local buy_dia_helper = require "serverscripts/feature_modules/npc_interaction_module/dialogues/buy_dia_helper"
local dia_vlk_7000_goffrey = {}

local items_to_sell = {}
items_to_sell[1000] = true
items_to_sell[1001] = true

local function handleArmorquestDia(playerid, text)
    if string.match(text, "Anderem") then
        SendPlayerMessage(playerid, 255, 255, 255, "Goffrey sagt: Dann weisst du ueber die Suche nach dem <magischen Stoff> bescheid?")
        return true
    elseif string.match(text, "magischen Stoff") then
        SendPlayerMessage(playerid, 255, 255, 255, "Goffrey sagt: Sag mal lebst du unter einem Stein? Seit Tagen gehen die Markthaendler hier drunter und drueber wegen diesem <Geruecht>!")
        return true
    elseif string.match(text, "Geruecht") then
        SendPlayerMessage(playerid, 255, 255, 255, "Goffrey sagt: Vor ein paar Tagen hat jemand dem Ruestungsbauer ein <Paket> mit seltsamen Stoffen abgelegt.")
        return true
    elseif string.match(text, "Paket") then
        SendPlayerMessage(playerid, 255, 255, 255, "Goffrey sagt: Es heisst diese Stoffe haetten <magische Eigenschaften>. Sie sollen sehr leicht sein, aber sind absolut reiss-, schlag- und stichfest.")
        return true
    elseif string.match(text, "magische Eigenschaften") then
        SendPlayerMessage(playerid, 255, 255, 255, "Goffrey sagt: Keiner weiss woher diese 'magischen Stoffe' kommen. Aber jeder Haendler ist auf der <Suche> nach ihnen!")
        return true
    elseif string.match(text, "Suche") then
        SendPlayerMessage(playerid, 255, 255, 255, "Goffrey sagt: Ich habe zufaellig gute Kontakte zum Ruestungsschmied und wuerde der Person, die mir mehr von diesen <Stoffen besorgen> kann eine Ruestung aus diesem Stoff anfertigen lassen.")
        return true
    elseif string.match(text, "Stoffen besorgen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Goffrey sagt: Die beste Anlaufstelle sind vermutlich die Tavernen. Informationen verbreiten sich dort schnell. Und am besten ignorierst du die <Haendler> auf dem Marktplatz.")
        return true
    elseif string.match(text, "Haendler") then
        SendPlayerMessage(playerid, 255, 255, 255, "Goffrey sagt: Die meisten von denen sind verlogene Schweine. Versuch erst gar nicht mit ihnen zu reden! Kommt direkt her wenn du das <Ding> in die Finger bekommen konntest.")
        return true
    elseif string.match(text, "Banditenkoepfe") then
        --HasItem(playerid, "ITMI_ADDON_BLOODWYN_KOPF", check_id)
        return true
    elseif string.match(text, "Banditen") then
        --SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Wenn du mir 5 <Banditenkoepfe> bringen koenntest, dann schaetze ich wuerde der ersparte Schaden den Preis des Bogens ausgleichen.")
        return true
    else
        return false
    end
end




local function handleLoverPresentDia(playerid, item_instance, amount, equipped, checkid)
    if checkid == check_id and item_instance == "ITMI_ADDON_BLOODWYN_KOPF" and amount >= 5 then
        RemoveItem(playerid, "ITMI_ADDON_BLOODWYN_KOPF", 5)
        inventory_dao.updateItemOrDeleteIfAmountIsZero(PLAYER_HANDLER_MAP[playerid], PLAYER_ID_NAME_MAP[playerid], "ITMI_ADDON_BLOODWYN_KOPF", 5)
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Wunderbar! Das sollte meinen Boten einige Tage Ruhe geben. Na gut fuer deine Fleissarbeit sollst du den Bogen bekommen.")
        SendPlayerMessage(playerid, 0, 255, 0, "Ahornbogen erhalten.")
        GiveItem(playerid, "ITRW_BOW_L_01", 1)
    elseif checkid == check_id then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Hast du die <Banditenkoepfe> dabei?");
    end
end

local function handleTradeDia(playerid, text)
    if string.match(text, "Angebot") then
        SendPlayerMessage(playerid, 255, 255, 255, "Goffrey sagt: Schau dir das Angebot an.")
        SendPlayerMessage(playerid, 255,228,181, "Tippe '/i buy <item id> <Anzahl>' um den Gegenstand zu kaufen.")
        SendPlayerMessage(playerid, 255,228,181, "Zu verkaufen:")
        for key, _ in pairs(items_to_sell) do
            local item_instance = ITEM_ID_MAP[key]
            SendPlayerMessage(playerid, 255,228,181, ITEM_NAME_MAP[item_instance].. " (id: " .. key .." ) ---> Gold: ".. PRICE_TABLE[item_instance])
        end

        return true
    else 
        return false
    end
end

function dia_vlk_7000_goffrey.handleDialogue(playerid, text)
    
    if handleTradeDia(playerid, text) == true then
        return
    elseif buy_dia_helper.handleBuyDia(playerid, text, items_to_sell) == true then
        return
    elseif handleArmorquestDia(playerid, text) == true then
        return
    else
        -- INIT DIALOGUE
        SendPlayerMessage(playerid, 255, 255, 255, "Goffrey sagt: Willkommen! Moechtest du das <Angebot> sichten oder bist du wegen etwas <Anderem> hier?")
    end

end

function dia_vlk_7000_goffrey.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)
    handleLoverPresentDia(playerid, item_instance, amount, equipped, checkid)
end


return dia_vlk_7000_goffrey