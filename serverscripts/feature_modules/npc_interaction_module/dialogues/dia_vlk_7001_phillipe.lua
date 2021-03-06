require "serverscripts/utils/script_functions"
require "serverscripts/player_globals"
require "serverscripts/has_item_globals"
require "serverscripts/price_table"
local inventory_dao = require "serverscripts/daos/inventory_dao"
local check_id = DIA_PHILLIPE_BOWQUEST_CHECKID
local goldsell_id = DIA_PHILLIPE_GOLDSELL_CHECKID
local magic_material_id = DIA_PHILLIPE_MAGICMATERIAL_CHECKID
local dia_vlk_7001_phillipe = {}
local buy_dia_helper = require "serverscripts/feature_modules/npc_interaction_module/dialogues/buy_dia_helper"
local items_to_sell = {}
items_to_sell[5000] = true
items_to_sell[5001] = true
items_to_sell[5002] = true
items_to_sell[5003] = true


local function handleLoverquestDia(playerid, text)
    if string.match(text, "seltenen Bogen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Ah du hast von meiner neusten Errungenschaft erfahren! War ja klar, dass diese Nachricht schnell die Kenner erreicht. Da du so flink mich aufgesucht hast mache ich dir einen <besonderen Preis>.")
        return true
    elseif string.match(text, "besonderen Preis") then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Fuer <1000 Goldstuecke> ueberlasse ich dir dieses Prachtstueck.")
        return true
    elseif string.match(text, "1000 Goldstuecke") then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Tut mir Leid aber der Preis ist nicht <verhandelbar>. Weisst du eigentlich wie viel Wert der Bogen ist?")
        return true
    elseif string.match(text, "verhandelbar") then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: (seufzt) Und ich dachte ich habe es mit einem Kenner zu tun... nun denn. Wenn ich so Recht ueberlege, dann gaebe es durchaus eine <Sache> mit der sich der Preis reduzieren lassen wuerde...")
        return true
    elseif string.match(text, "Sache") then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Seit einigen Wochen ruinieren <Banditen> meine Handelswege. Ich kann meine Boten nicht mehr ohne Soeldner rausschicken.")
        return true

        -- since Banditenkoepfe contains the word 'Banditen', it has to be processed first, otherwise the 'Banditenkoepfe' branch is not reachable.... should think about a solution to fix it
    elseif string.match(text, "Banditenkoepfe") then
        HasItem(playerid, "ITMI_ADDON_BLOODWYN_KOPF", check_id)
        return true
    elseif string.match(text, "Banditen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Wenn du mir 5 <Banditenkoepfe> bringen koenntest, dann schaetze ich wuerde der ersparte Schaden den Preis des Bogens ausgleichen.")
        return true
    else
        return false
    end
end

local function handleMagicMaterialDia(playerid, text)
    if string.match(text, "magischen Stoffen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Ah! Noch ein Abenteurer auf der Suche nachdem <geheimnisvollen Material>!")
        return true
    elseif string.match(text, "geheimnisvollen Material") then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: In der Tat ist das ein grosses Mysterium. Fuer einige Zeit hatte ich die Theorie, dass es sich dabei nur um <verzauberten Stoff> handelt. Doch nach laengerem Ueberlegen muss es doch was anderes sein.")
        return true
    elseif string.match(text, "verzauberten Stoff") then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Zauber halten nur eine kurze Periode an. Die Stoffe selbst schienen nach all den Tagen ihre <Beschaffenheit> nicht verloren zu haben. Kein Zauber der Welt haelt so lange ohne einen magischen Speicher.")
        return true
    elseif string.match(text, "Beschaffenheit") then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Es muss sich um wahrhaftig seltenes Material handeln! Ich wuenschte ich koennte mir die Stoffe <genauer ansehen>.")
        return true
    elseif string.match(text, "genauer ansehen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Ich habe einen aeusserst wertvollen Trank in meinem Inventar. Wenn du mir das <Ding> organisieren koenntest, wuerde ich dich grosszuegig damit entlohnen!")
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
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Wunderbar! Das Material hat genau die selben Eigenschaften wie beschrieben! Hier nimm das, du hast es dir verdient!")
        SendPlayerMessage(playerid, 0, 255, 0, "Quest abgeschlossen!")
        SendPlayerMessage(playerid, 0, 255, 0, "Ahornbogen erhalten.")
        GiveItem(playerid, "ITRW_BOW_L_01", 1)
    elseif checkid == magic_material_id then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Hast du was neues vom magischen Stoff erfahren?");
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


local function handleGoldSellDialogue(playerid, text)
    if string.match(text, "Edelmetallen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Bei mir kann man <Goldbrocken> gegen Goldmuenzen eintauschen. Ich behalte selbstverstaendlich eine gewisse Provision fuers einschmelzen. Aber der Preis ist fair.")
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
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Sehr schoen. Hier bekommst du das entsprechende Gold.")
        local goldToAdd = PRICE_TABLE[item_instance] * amount
        SetPlayerGold(playerid, GetPlayerGold(playerid) + goldToAdd)
        SendPlayerMessage(playerid, 0, 255, 0, tostring(goldToAdd) .. " Gold erhalten.")
    elseif checkid == goldsell_id then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Tut mir Leid, aber es sieht nicht so aus als ob du Goldbrocken dabei hast.")
    end

end

local function handleTradeDia(playerid, text)
    if string.match(text, "begeistern") then
        buy_dia_helper.handleTradeDia(playerid, items_to_sell, "Phillipe")
        return true
    else 
        return false
    end
end

function dia_vlk_7001_phillipe.handleDialogue(playerid, text)
    
    if handleLoverquestDia(playerid, text) == true then
        return
    elseif handleMagicMaterialDia(playerid, text) == true then
        return
    elseif handleGoldSellDialogue(playerid, text) == true then
        return
    elseif handleTradeDia(playerid, text) == true then
        return
    elseif buy_dia_helper.handleBuyDia(playerid, text, items_to_sell) == true then
        return
    else
        -- INIT DIALOGUE
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Hallo Fremder. Kann ich dich fuer meine Waren <begeistern>? Oder moechtest du mit <Edelmetallen> handeln?")
    end

end

function dia_vlk_7001_phillipe.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)
    handleLoverPresentDia(playerid, item_instance, amount, equipped, checkid)
    handleGoldSellRewardDialogue(playerid, item_instance, amount, equipped, checkid)
    handleMagicMaterialRewardDia(playerid, item_instance, amount, equipped, checkid)
end


return dia_vlk_7001_phillipe
