require "serverscripts/utils/script_functions"
require "serverscripts/player_globals"
require "serverscripts/has_item_globals"
require "serverscripts/price_table"
local inventory_dao = require "serverscripts/daos/inventory_dao"
local check_id = DIA_BRAD_FURSELL_CHECKID
local magic_material_id = DIA_BRAD_MAGICMATERIAL_CHECKID
local dia_vlk_7002_brad = {}
 
local function handleFurSellDialogue(playerid, text)
    if string.match(text, "Arbeit") then
        SendPlayerMessage(playerid, 255, 255, 255, "Brad sagt: Sehr gut. Zurzeit kann ich nicht rausgehen zum jagen. Also brauche ich jemanden der mir <Felle> besorgt.")
        return true
    elseif string.match(text, "Felle") then
        SendPlayerMessage(playerid, 255, 255, 255, "Brad sagt: Egal ob <Wolfsfell>, <Keilerfell>, <Wargfell>, <Schattenlaeuferfell>, oder <Trollfell>. Ich zahle fuer jedes Stueck nen guten Preis.")
        return true
    elseif string.match(text, "Wolfsfell") then
        HasItem(playerid, "ITAT_WOLFFUR", check_id)
        return true
    elseif string.match(text, "Keilerfell") then
        HasItem(playerid, "ITAT_ADDON_KEILERFUR", check_id)
        return true
    elseif string.match(text, "Wargfell") then
        HasItem(playerid, "ITAT_WARGFUR", check_id)
        return true
    elseif string.match(text, "Schattenlaeuferfell") then
        HasItem(playerid, "ITAT_SHADOWFUR", check_id)
        return true
    elseif string.match(text, "Trollfell") then
        HasItem(playerid, "ITAT_TROLLFUR", check_id)
        return true
    else
        return false
    end
end

local function handleFurSellRewardDialogue(playerid, item_instance, amount, equipped, checkid)
    if checkid == check_id and item_instance == "ITAT_WOLFFUR" and amount >= 1 then
        RemoveItem(playerid, "ITAT_WOLFFUR", amount)
        inventory_dao.deleteItemByInstance(PLAYER_HANDLER_MAP[playerid], PLAYER_ID_NAME_MAP[playerid], "ITAT_WOLFFUR")
        SendPlayerMessage(playerid, 255, 255, 255, "Brad sagt: Ah Wolfsfelle! Die gehen immer gut weg. Nimm das Gold.")
        local goldToAdd = PRICE_TABLE["ITAT_WOLFFUR"] * amount
        SetPlayerGold(playerid, GetPlayerGold(playerid) + goldToAdd)
        SendPlayerMessage(playerid, 0, 255, 0, tostring(goldToAdd) .. " Gold erhalten.")
    elseif checkid == check_id and item_instance == "ITAT_ADDON_KEILERFUR" and amount >= 1 then
        RemoveItem(playerid, "ITAT_ADDON_KEILERFUR", amount)
        inventory_dao.deleteItemByInstance(PLAYER_HANDLER_MAP[playerid], PLAYER_ID_NAME_MAP[playerid], "ITAT_ADDON_KEILERFUR")
        SendPlayerMessage(playerid, 255, 255, 255, "Brad sagt: Ah Keilerfelle. Fuer die kriegst du ein bisschen mehr.")
        local goldToAdd = PRICE_TABLE["ITAT_ADDON_KEILERFUR"] * amount
        SetPlayerGold(playerid, GetPlayerGold(playerid) + goldToAdd)
        SendPlayerMessage(playerid, 0, 255, 0, tostring(goldToAdd) .. " Gold erhalten.")
    elseif checkid == check_id and item_instance == "ITAT_WARGFUR" and amount >= 1 then
        RemoveItem(playerid, "ITAT_WARGFUR", amount)
        inventory_dao.deleteItemByInstance(PLAYER_HANDLER_MAP[playerid], PLAYER_ID_NAME_MAP[playerid], "ITAT_WARGFUR")
        SendPlayerMessage(playerid, 255, 255, 255, "Brad sagt: Oha Wargfelle. Du solltest aufpassen wenn du die Viecher jagst. Sie sind gefaehrlich.")
        local goldToAdd = PRICE_TABLE["ITAT_WARGFUR"] * amount
        SetPlayerGold(playerid, GetPlayerGold(playerid) + goldToAdd)
        SendPlayerMessage(playerid, 0, 255, 0, tostring(goldToAdd) .. " Gold erhalten.")
    elseif checkid == check_id and item_instance == "ITAT_SHADOWFUR" and amount >= 1 then
        RemoveItem(playerid, "ITAT_SHADOWFUR", amount)
        inventory_dao.deleteItemByInstance(PLAYER_HANDLER_MAP[playerid], PLAYER_ID_NAME_MAP[playerid], "ITAT_SHADOWFUR")
        SendPlayerMessage(playerid, 255, 255, 255, "Brad sagt: Ein Schattenlaeuferfell! Die Biester sind STARK! Du hast echt was drauf.")
        local goldToAdd = PRICE_TABLE["ITAT_SHADOWFUR"] * amount
        SetPlayerGold(playerid, GetPlayerGold(playerid) + goldToAdd)
        SendPlayerMessage(playerid, 0, 255, 0, tostring(goldToAdd) .. " Gold erhalten.")
    elseif checkid == check_id and item_instance == "ITAT_TROLLFUR" and amount >= 1 then
        RemoveItem(playerid, "ITAT_TROLLFUR", amount)
        inventory_dao.deleteItemByInstance(PLAYER_HANDLER_MAP[playerid], PLAYER_ID_NAME_MAP[playerid], "ITAT_TROLLFUR")
        SendPlayerMessage(playerid, 255, 255, 255, "Brad sagt: Wow, du erlegst sogar Trolle? Hier nimm es, du hast es dir wirklich verdient.")
        local goldToAdd = PRICE_TABLE["ITAT_TROLLFUR"] * amount
        SetPlayerGold(playerid, GetPlayerGold(playerid) + goldToAdd)
        SendPlayerMessage(playerid, 0, 255, 0, tostring(goldToAdd) .. " Gold erhalten.")
    elseif checkid == check_id then
        SendPlayerMessage(playerid, 255, 255, 255, "Brad sagt: Tut mir Leid, aber es sieht nicht so aus als ob du brauchbare Felle hast.")
    end

end

local function handleMagicMaterialDia(playerid, text)
    if string.match(text, "magischen Stoffen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Brad sagt: Du suchst auch nach diesem Ding? Tja ich kanns dir nicht veruebeln. Wirklich ALLE suchen nach diesem <seltenen Stoff>.")
        return true
    elseif string.match(text, "seltenen Stoff") then
        SendPlayerMessage(playerid, 255, 255, 255, "Brad sagt: Ich hab kein Plan aus was das Ding sein koennte. <Tierleder> denke ich mal nicht.")
        return true
    elseif string.match(text, "Tierleder") then
        SendPlayerMessage(playerid, 255, 255, 255, "Brad sagt: Ich kenne alle Biester der Gegend und deren Haeute sind einfach zu schwer. Mich wuerde es schon echt interessieren aus was das Material ist. Das waere mir einen <Batzen Goldmuenzen> wert.")
        return true
    elseif string.match(text, "Batzen Goldmuenzen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Brad sagt: Wenn du mir das <Ding> besorgen wuerdest, dann wuerde ich dir... 1000 Goldmuenzen geben!")
        return true
    elseif string.match(text, "Ding") then
        HasItem(playerid, "ITAR_VLK_H", magic_material_id)
        return true
    end
end

local function handleMagicMaterialRewardDia(playerid, item_instance, amount, equipped, checkid)
    if checkid == magic_material_id and item_instance == "ITAR_VLK_H" and amount >= 1 then
        RemoveItem(playerid, "ITAR_VLK_H", 1)
        inventory_dao.updateItemOrDeleteIfAmountIsZero(PLAYER_HANDLER_MAP[playerid], PLAYER_ID_NAME_MAP[playerid], "ITAR_VLK_H", 1)
        SendPlayerMessage(playerid, 255, 255, 255, "Brad sagt: Wow, so sieht also der seltene Stoff aus. Wirklich faszinierend. Hier das Gold hast du dir verdient.")
        SendPlayerMessage(playerid, 0, 255, 0, "Quest abgeschlossen!")
        SetPlayerGold(playerid, GetPlayerGold(playerid) + 1000)
        SendPlayerMessage(playerid, 0, 255, 0, tostring(1000) .. " Gold erhalten.")
    elseif checkid == magic_material_id then
        SendPlayerMessage(playerid, 255, 255, 255, "Brad sagt: Gibts Neuigkeiten zum Stoff?");
    end
end


function dia_vlk_7002_brad.handleDialogue(playerid, text)
    
    if handleFurSellDialogue(playerid, text) == true then
        return
    elseif handleMagicMaterialDia(playerid, text) == true then
        return
    else
        -- INIT DIALOGUE
        SendPlayerMessage(playerid, 255, 255, 255, "Brad sagt: Na kann ich dich fuer meine Ware begeistern? Oder suchst du <Arbeit>?")
    end

end


function dia_vlk_7002_brad.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)
    
    handleFurSellRewardDialogue(playerid, item_instance, amount, equipped, checkid)
    handleMagicMaterialRewardDia(playerid, item_instance, amount, equipped, checkid)
end


return dia_vlk_7002_brad
