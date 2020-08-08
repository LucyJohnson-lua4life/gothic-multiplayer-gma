require "serverscripts/item_maps"
require "serverscripts/price_table"
local dia_vlk_2002_jock = {}
local buy_dia_helper = require "serverscripts/feature_modules/npc_interaction_module/dialogues/buy_dia_helper"
local items_to_sell = {}
items_to_sell[2008] = true
items_to_sell[2009] = true
items_to_sell[2010] = true

local function handleBuddlertruppDia(playerid, text)
    if string.match(text, "Buddlertrupp") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jock sagt: Mhm ja ich kann mich an die Jungs erinnern. Die sind staendig durch die Strassen gezogen und haben versucht Helfer anzuwerben. Fragst du wegen <Zek>?")
        return true
    elseif string.match(text, "Zek") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jock sagt: Ich weiss nicht genau was Zek mit den Buddlern wollte. Aber von dem was er erzaehlte war er sehr unzufrieden in seiner <Beziehung>.")
        return true
    elseif string.match(text, "Beziehung") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jock sagt: Er erzaehlte mir, dass Rose die letzten Tage sehr abweisend ihm gegenueber war. Das letzte mal als sie Intim waren sei einige <Wochen> her gewesen.")
        return true
    elseif string.match(text, "Wochen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jock sagt: Keine Ahnung was sich in Ihrer Beziehung veraendert hat. Eigentlich war alles genau so wie immer. Gut moeglich, dass die <Routine> sie einfach getroffen hat.")
        return true
    elseif string.match(text, "Routine") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jock sagt: Ach du weisst doch wie das laeuft. Am Anfang ist alles schoen und <rosig>. Doch nach einiger Zeit kannst du einfach nicht mehr den Furz des Anderen riechen.")
        return true
    elseif string.match(text, "rosig") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jock sagt: Bestimmt ist das nur eine Phase. Nach etwas <Abstand> werden sich die Beiden bestimmt wieder vermissen.")
        return true
    elseif string.match(text, "Abstand") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jock sagt: Bezuglich des Buddlertrupps wuerde ich vorschlagen fragst du mal in der Hafenkneipe nach. Dort waren die Typen auch.")
        return true
    else
        return false
    end
end

local function handleTavernRest(playerid, text) 
    if string.match(text, "ausruhen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jock sagt: Natuerlich. Schnapp dir einen Platz.")
        SetPlayerHealth(playerid, GetPlayerMaxHealth(playerid))
        return true
    else 
        return false
    end
end

local function handleMagicMaterialDia(playerid, text)
    if string.match(text, "magischen Stoffen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jock sagt: Magischer was? Nie davon gehoert. Tut mir Leid aber da musst du wen anderes fragen.")
        return true
    end
end

local function handleTradeDia(playerid, text)
    if string.match(text, "bestellen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jock sagt: Schau dir das Angebot an.")
        SendPlayerMessage(playerid, 255,228,181, "Tippe '/i buy <item id> <Anzahl>' um den Gegenstand zu kaufen.")
        SendPlayerMessage(playerid, 255,228,181, "Zu verkaufen:")
        for key, _ in pairs(items_to_sell) do
            local item_instance = ITEM_ID_MAP[key]
            SendPlayerMessage(playerid, 255,228,181, ITEM_NAME_MAP[item_instance].. " (id: " .. key ..") ---> Gold: ".. PRICE_TABLE[item_instance])
        end

        return true
    else 
        return false
    end
end


function dia_vlk_2002_jock.handleDialogue(playerid, text)
    
    if handleBuddlertruppDia(playerid, text) == true then
        return
    elseif handleTavernRest(playerid, text) == true then
        return
    elseif handleMagicMaterialDia(playerid, text) then
        return
    elseif handleTradeDia(playerid, text) == true then
        return
    elseif buy_dia_helper.handleBuyDia(playerid, text, items_to_sell) == true then
        return
    else
        -- INIT DIALOGUE
        SendPlayerMessage(playerid, 255, 255, 255, "Jock sagt: Hallo Fremder! Wie kann ich dir helfen? Willst du dich <ausruhen> oder etwas <bestellen>?")
    end

end


return dia_vlk_2002_jock
