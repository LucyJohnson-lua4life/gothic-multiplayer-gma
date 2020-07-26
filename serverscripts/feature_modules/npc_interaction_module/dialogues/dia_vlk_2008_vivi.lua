require "serverscripts/utils/script_functions"
require "serverscripts/player_globals"
require "serverscripts/has_item_globals"
local inventory_dao = require "serverscripts/daos/inventory_dao"
local check_id = DIA_VIVI_BANDITHEADS_CHECKID
local dia_vlk_2008_vivi = {}

local function handleBanditDialogue(playerid, text)
    if string.match(text, "Arbeit") then
        SendPlayerMessage(playerid, 255, 255, 255, "Vivi sagt: Das trifft sich gut. Ich brauche ein paar faehige Soeldner die sich um die <Banditen> hier in der Gegend kuemmern.")
        return true
    elseif string.match(text, "Banditen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Vivi sagt: Es ist gleich wie ihr die Banditen zur Rechenschaft zieht. Fuer jeden ihrer <Koepfe> zahle ich euch 100 Goldmuenzen aus.")
        return true
    elseif string.match(text, "Koepfe") then
        HasItem(playerid, "ITMI_ADDON_BLOODWYN_KOPF", check_id)
        return true
    else
        return false
    end
end

local function handleBanditRewardDialogue(playerid,item_instance, amount, equipped, checkid)
    if checkid == check_id and item_instance == "ITMI_ADDON_BLOODWYN_KOPF" and amount >= 1 then
        RemoveItem(playerid, "ITMI_ADDON_BLOODWYN_KOPF", amount)
        inventory_dao.deleteItemByInstance(PLAYER_HANDLER_MAP[playerid], PLAYER_ID_NAME_MAP[playerid], "ITMI_ADDON_BLOODWYN_KOPF")
        SendPlayerMessage(playerid, 255, 255, 255, "Vivi sagt: Gute Arbeit! Fuer euren Mut sollt ihr belohnt werden.")
        local goldToAdd = 100*amount
        SetPlayerGold(playerid, GetPlayerGold(playerid)+goldToAdd)
        SendPlayerMessage(playerid, 0, 255, 0, tostring(goldToAdd).." Gold erhalten.")
    elseif checkid == check_id then
        SendPlayerMessage(playerid, 255, 255, 255, "Vivi sagt: Tut mir Leid, aber es sieht nicht so aus als haettest ihr die <Koepfe>. Kommt wieder wenn ihr welche habt.")
    end

end


function dia_vlk_2008_vivi.handleDialogue(playerid, text)
    
    if handleBanditDialogue(playerid, text) == true then
        return
    else
        -- INIT DIALOGUE
        SendPlayerMessage(playerid, 255, 255, 255, "Vivi sagt: Was ist euer Anliegen Fremder? Sucht ihr <Arbeit>?")
    end

end


function dia_vlk_2008_vivi.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)
    handleBanditRewardDialogue(playerid,item_instance, amount, equipped, checkid)
end


return dia_vlk_2008_vivi