require "serverscripts/utils/script_functions"
require "serverscripts/player_globals"
require "serverscripts/has_item_globals"
require "serverscripts/price_table"
local inventory_dao = require "serverscripts/daos/inventory_dao"
local check_id = DIA_JACK_LOVERQUEST_CHECKID
local dia_vlk_2010_jack = {}

local function handleLoverquestDia(playerid, text)
    if string.match(text, "Geld") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jack sagt: Weisst du. Die meisten kennen meinen Namen nur aus den <Seeschlachten> die ich geschlagen habe.")
        return true
    elseif string.match(text, "Seeschlachten") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jack sagt: Ich persoenlich sehe mein Talent aber nicht in der Eroberung von Schaetzen oder irgendwelchen materiellen Besitztuemern. Sondern in der Eroberung von <Herzen>.")
        return true
    elseif string.match(text, "Herzen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jack sagt: Ich bin von Weit hergereist, weil ich hoerte dass es in Khorinis die schoensten <Maenner> gibt. Doch wenn ich mich hier so umsehe, gibts hier nur ungepflegte Saeufer...")
        return true
    elseif string.match(text, "Maenner") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jack sagt: Es gibt jedoch eine Person die mich in der Stadt hier schon interessiert. Sein Name ist <Astren>. Er ist der Besitzer des Jagdtgeschaefts im Handwerkerviertel.")
        return true
    elseif string.match(text, "Astren") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jack sagt: Ich brauche jemanden der zu ihm geht und ihn fuer mich auskundschaftet. Ich will wissen was seine 'Interessen' sind. Wenn du mir hilfst, dann gebe ich dir einen Anteil von meinem Schatz aus der letzten Schlacht.")
        return true
    elseif string.match(text, "Natur") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jack sagt: Ein Freund der Natur also ... Dann habe ich zwei Ideen wie ich das <Eis brechen> kann.")
        return true
    elseif string.match(text, "Eis brechen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jack sagt: Du musst mir helfen eines von diesen zwei Dingen zu besorgen. Entweder eine seltene <Rose> oder einen edlen <Bogen>")
        return true
    elseif string.match(text, "Rose") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jack sagt: Die <Mondrose> ist eine wunderschoene Pflanze die seltsamerweise in der Naehe von Untoten waechst. Ich koennte sie als Geschenk verwenden um mit Astren in Kontakt zu kommen.")
        return true
    elseif string.match(text, "Bogen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jack sagt: Phillipe auf dem Marktplatz verkauft einen 'seltenen Bogen' von hoechster Qualitaet. Den <Ahornbogen>. Ich koennte ihn als Geschenk verwenden um mit Astren in Kontakt zu kommen.")
        return true
    elseif string.match(text, "Mondrose") then
        HasItem(playerid, "ITPL_HEALTH_HERB_03", check_id)
        return true
    elseif string.match(text, "Ahornbogen") then
        HasItem(playerid, "ITRW_BOW_L_01", check_id)
        return true
    else
        return false
    end
end


local function giveRewardForLoverPresent(playerid, present_name, amount)
    RemoveItem(playerid, present_name, amount)
    inventory_dao.deleteItemByInstance(PLAYER_HANDLER_MAP[playerid], PLAYER_ID_NAME_MAP[playerid], present_name)
    SendPlayerMessage(playerid, 255, 255, 255, "Jack sagt: Haha wunderbar! Gute Arbeit Fremder. Das ist alles was ich brauche um Astrens Herz zu erobern. Von hier an uebernehme ich. Nimm das hier. Du hast es dir redlich verdient.")
    SendPlayerMessage(playerid, 0, 255, 0, "Du hast die Quest beendet!")
    local goldToAdd = 2000
    SetPlayerGold(playerid, GetPlayerGold(playerid) + goldToAdd)
    SendPlayerMessage(playerid, 0, 255, 0, tostring(goldToAdd) .. " Gold erhalten.")
end

local function handleLoverPresentDia(playerid, item_instance, amount, equipped, checkid)
    if checkid == check_id and item_instance == "ITPL_HEALTH_HERB_03" and amount >= 1 then
        giveRewardForLoverPresent(playerid, "ITPL_HEALTH_HERB_03", amount)
    elseif checkid == check_id and item_instance == "ITRW_BOW_L_01" and amount >= 1 then
        giveRewardForLoverPresent(playerid, "ITRW_BOW_L_01", amount)
    elseif checkid == check_id then
        SendPlayerMessage(playerid, 255, 255, 255, "Jack sagt: Hast du die <Mondrose> oder den <Ahornbogen> gefunden?");
    end
end

function dia_vlk_2010_jack.handleDialogue(playerid, text)
    
    if handleLoverquestDia(playerid, text) == true then
        return
    else
        -- INIT DIALOGUE
        SendPlayerMessage(playerid, 255, 255, 255, "Jack sagt: Hallo Fremder. Bist du interessiert daran ehrliches <Geld> zu verdienen?")
    end

end

function dia_vlk_2010_jack.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)
    handleLoverPresentDia(playerid, item_instance, amount, equipped, checkid)
end


return dia_vlk_2010_jack
