require "serverscripts/item_maps"
require "serverscripts/price_table"

local buy_dia_helper = require "serverscripts/feature_modules/npc_interaction_module/dialogues/buy_dia_helper"
local items_to_sell = {}
items_to_sell[2008] = true
items_to_sell[2009] = true
items_to_sell[2010] = true
local dia_vlk_2007_hugo = {}
 
local function handleBuddlertruppDia(playerid, text)
    if string.match(text, "Buddlertrupp") then
        SendPlayerMessage(playerid, 255, 255, 255, "Hugo sagt: Du gehoerst doch etwa nicht zu ihnen oder? Diese Jungs haben uns ziemlichen <Aerger> bereitet.")
        return true
    elseif string.match(text, "Aerger") then
        SendPlayerMessage(playerid, 255, 255, 255, "Hugo sagt: Die Jungs waren ein seltsamer Haufen. Sie behaupteten, dass es hier in der Naehe eine <magische Erzader> geben soll. Wir haben ein paar <unserer Maenner> losgeschickt, aber es ist niemand zurueckgekommen.")
        return true
    elseif string.match(text, "magische Erzader") then
        SendPlayerMessage(playerid, 255, 255, 255, "Hugo sagt: Wenn du aus der Taverne gehst Richtung Scheune gehst, dann siehst du dort einen Berg mit einem Turm drauf. Dort befindet sich unsere <Goldmine>. Angeblich soll es irgendwo dort auch eine Erzader geben.")
        return true
    elseif string.match(text, "Goldmine") then
        SendPlayerMessage(playerid, 255, 255, 255, "Hugo sagt: Wenn du bei der Goldmine bist gibt es dort ein vergittertes Tor. Das ist der Haupteingang. Das ist aber defenitiv NICHT der Zugang zum Erz. Unsere Jungs haben dort alles durchsucht. Bis auf Minecrawler gabs dort nichts.")
        return true
    elseif string.match(text, "unserer Maenner") then
        SendPlayerMessage(playerid, 255, 255, 255, "Hugo sagt: Fuer mich stinkt diese Geschichte zum Himmel. Wenn du mich fragst waren das Banditen die unsere Maenner entfuehrt haben um unsere Verteidigung auf dem Hof zu <destablisieren>!")
        return true
    elseif string.match(text, "destabilisieren") then
        SendPlayerMessage(playerid, 255, 255, 255, "Hugo sagt: Wenn ich so Recht ueberlege dann war einer der Maenner auch sehr <verdaechtig gekleidet>.")
        return true
    elseif string.match(text, "verdaechtig gekleidet") then
        SendPlayerMessage(playerid, 255, 255, 255, "Hugo sagt: Ja er war vermummt. Wenn das nicht der Beweis ist! Das war bestimmt ein bekannter Bandit der sich nicht zu erkennen geben wollte.")
        return true
    elseif string.match(text, "vermummten Mann") then
        SendPlayerMessage(playerid, 255, 255, 255, "Hugo sagt: Ja der war hier! Wenn du mich fragst, war das ein Verbrecher der sein Gesicht nicht zeigen wollte. Da der Trupp durch die ganze Stadt zog bin ich mir sicher, dass Andere ihn auch gesehen haben!")
        return true
    else
        return false
    end
end

local function handleTavernRest(playerid, text) 
    if string.match(text, "ausruhen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Hugo sagt: Natuerlich. Schnapp dir einen Platz.")
        SetPlayerHealth(playerid, GetPlayerMaxHealth(playerid))
        return true
    else 
        return false
    end
end

local function handleTradeDia(playerid, text)
    if string.match(text, "bestellen") then
        buy_dia_helper.handleTradeDia(playerid, items_to_sell, "Hugo")
        return true
    else 
        return false
    end
end


function dia_vlk_2007_hugo.handleDialogue(playerid, text)
    
    if handleBuddlertruppDia(playerid, text) == true then
        return
    elseif handleTavernRest(playerid, text) then
        return
    elseif handleTradeDia(playerid, text) == true then
        return
    elseif buy_dia_helper.handleBuyDia(playerid, text, items_to_sell) == true then
        return
    else
        -- INIT DIALOGUE
        SendPlayerMessage(playerid, 255, 255, 255, "Hugo sagt: Willkommen Fremder! Wie kann ich dir helfen? Willst du dich <ausruhen> oder etwas <bestellen>?")
    end

end


return dia_vlk_2007_hugo
