require "serverscripts/utils/script_functions"
require "serverscripts/player_globals"
require "serverscripts/has_item_globals"
require "serverscripts/price_table"
local inventory_dao = require "serverscripts/daos/inventory_dao"
local check_id = DIA_ROSE_QUEST_CHECKID
local dia_vlk_2000_rose = {}
 
local function handleMissingBoyfriendDia(playerid, text)
    if string.match(text, "Gefallen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Rose sagt: Seit einigen Tagen habe ich nichts mehr von meinem <Freund> gehoert, ich mache mir langsam sorgen.")
        return true
    elseif string.match(text, "Freund") then
        SendPlayerMessage(playerid, 255, 255, 255, "Rose sagt: Sein Name is Zek. Es ist eine lange <Geschichte> auf jeden Fall hatte er sich vor ein paar Tagen einem <Buddlertrupp> angeschlossen.")
        return true
    elseif string.match(text, "Geschichte") then
        SendPlayerMessage(playerid, 255, 255, 255, "Rose sagt: Nun ja, wir hatten in letzter Zeit immer haeufiger Streits gehabt. Ich hatte mit einigen persoenlichen Problemen zu kaempfen gehabt und konnte ihm nicht die <Aufmerksamkeit> geben, die er vermutlich wollte.")
        return true
    elseif string.match(text, "Aufmerksamkeit") then
        SendPlayerMessage(playerid, 255, 255, 255, "Rose sagt: Ich hatte meine Unzufriedenheit an Ihm ausgelassen und nach einem grossen Streit hatte er mich verlassen. Ich war so ein Dummkopf...")
        return true
    elseif string.match(text, "Buddlertrupp") then
        SendPlayerMessage(playerid, 255, 255, 255, "Rose sagt: Ja...das war ein seltsamer Haufen. Sie lungerten in allen Tavernen der Stadt herum und suchten nach Helfern um anscheinend eine neu erschlossene <magische Erzader> auszuheben.")
        return true
    elseif string.match(text, "Erzader") then
        SendPlayerMessage(playerid, 255, 255, 255, "Rose sagt: Genaueres weiss ich nicht darueber. Wenn du aber in den <Tavernen> der Stadt nach dem 'Buddlertrupp' rumfragst, koennen die Leute bestimmt mehr sagen.")
        return true
    elseif string.match(text, "Tavernen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Rose sagt: Wenn du Zek siehst, kannst du ihm bitte sagen, dass es mir Leid tut und dass ich ihn schrecklich <vermisse>?")
        return true
    elseif string.match(text, "vermisse") then
        HasItem(playerid, "STANDARDBRIEF", check_id)
        return true
    else
        return false
    end
end

local function handleZekLetterDia(playerid, item_instance, amount, equipped, checkid)
    if checkid == check_id and item_instance == "STANDARDBRIEF" and amount >= 1 then
        RemoveItem(playerid, "STANDARDBRIEF", amount)
        inventory_dao.deleteItemByInstance(PLAYER_HANDLER_MAP[playerid], PLAYER_ID_NAME_MAP[playerid], "STANDARDBRIEF")
        SendPlayerMessage(playerid, 255, 255, 255, "Rose sagt: Ein Brief? Von Zek?")
        SendPlayerMessage(playerid, 0, 0, 255, "Rose liest den Brief und bricht zusammen...")
        SendPlayerMessage(playerid, 255, 255, 255, "Rose sagt: Das darf nicht war sein... Das ist alles meine Schuld...")
        SendPlayerMessage(playerid, 0, 255, 0, "Du hast die Quest beendet!")
        local goldToAdd = 500
        SetPlayerGold(playerid, GetPlayerGold(playerid) + goldToAdd)
        SendPlayerMessage(playerid, 0, 255, 0, tostring(goldToAdd) .. " Gold erhalten.")
    elseif checkid == check_id then
        SendPlayerMessage(playerid, 255, 255, 255, "Rose sagt: Hast du Zek gefunden und ihm gesagt dass ich ihn <vermisse>?");
    end
end

function dia_vlk_2000_rose.handleDialogue(playerid, text)
    
    if handleMissingBoyfriendDia(playerid, text) == true then
        return
    else
        -- INIT DIALOGUE
        SendPlayerMessage(playerid, 255, 255, 255, "Rose sagt: Hallo Fremder! Darf ich dich um einen <Gefallen> bitten?")
    end

end

function dia_vlk_2000_rose.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)
    handleZekLetterDia(playerid, item_instance, amount, equipped, checkid)
end


return dia_vlk_2000_rose
