require "serverscripts/utils/script_functions"
require "serverscripts/player_globals"
require "serverscripts/has_item_globals"

local dia_vlk_2001_olga = {}
local drunk_calmed_by = {}
 
local function handleBuddlertruppDia(playerid, text)
    if string.match(text, "Buddlertrupp") and drunk_calmed_by[playerid] == nil then
        SendPlayerMessage(playerid, 255, 255, 255, "Olga sagt: Ich wuerde dir gerne helfen, aber ich befuerchte der Betrunkene da drueben macht gleich Aerger. Wenn du dich um ihn kuemmerst erzahl ich dir uber den 'Buddlertrupp'.")
        return true
    elseif string.match(text, "Buddlertrupp") and drunk_calmed_by[playerid] == true then
        SendPlayerMessage(playerid, 255, 255, 255, "Olga sagt: Danke fuer die Hilfe! Also ja der Buddlertruppe hat vor ein paar Tagen hier <Rast> gemacht.")
        return true
    elseif string.match(text, "Rast") then
        SendPlayerMessage(playerid, 255, 255, 255, "Olga sagt: Sie haben nicht erzaehlt wo sie hin wollen. Alle waren sehr ruhig. Insgesamt wirkten sie schon sehr <verdaechtig>.")
        return true
    elseif string.match(text, "verdaechtig") then
        SendPlayerMessage(playerid, 255, 255, 255, "Olga sagt: Einer von den Typen hat sich staendig mit einem <vermummten Mann> draussen unterhalten. Der vermummte Mann selbst ist aber nie in die Taverne gekommen.")
        return true
    elseif string.match(text, "vermummten Mann") then
        SendPlayerMessage(playerid, 255, 255, 255, "Olga sagt: Genaueres kann ich dir nicht erzaehlen. Der Kerl ist ja nie reingekommen. Was den <Rest> betrifft...")
        return true
    elseif string.match(text, "Rest") then
        SendPlayerMessage(playerid, 255, 255, 255, "Olga sagt: Waren ganz normale Jungs schaetze ich. <Einer von denen> ist aber den Abend besonders betrunken geworden. (lacht)");
        return true
    elseif string.match(text, "Einer von denen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Olga sagt: Er erzaehlte davon, dass er vorhat aus dem Geld dass er machen wird seiner Freundin etwas ganz besonderes zu <schenken>.");
        return true
    elseif string.match(text, "schenken") then
        SendPlayerMessage(playerid, 255, 255, 255, "Olga sagt: Mehr hat er nicht erzaehlt. Er ist irgendwann wie ein kleiner Junge eingeschlafen und am naechsten Morgen mit den Anderen Richtung Grossbauer verschwunden.");
        return true
    else
        return false
    end
end

local function handleTavernRest(playerid, text) 
    if string.match(text, "ausruhen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Olga sagt: Natuerlich. Schnapp dir einen Platz.")
        SetPlayerHealth(playerid, GetPlayerMaxHealth(playerid))
        return true
    else 
        return false
    end
end




function dia_vlk_2001_olga.handleDialogue(playerid, text)
    
    if handleBuddlertruppDia(playerid, text) == true then
        return
    elseif handleTavernRest(playerid, text) == true then
        return
    else
        -- INIT DIALOGUE
        SendPlayerMessage(playerid, 255, 255, 255, "Olga sagt: Hallo Fremder! Was kann ich fuer dich tun? Willst du dich <ausruhen> oder etwas bestellen?")
    end

end


function dia_vlk_2001_olga.OnPlayerDeath(playerid, p_classid, killerid, k_classid)
    if IsNPC(playerid) and string.match(GetPlayerName(playerid), "^Betrunkener Schlaeger.*") ~= nil then
        drunk_calmed_by[killerid] = true
    end
end

function dia_vlk_2001_olga.OnPlayerDisconnect(playerid, reason)
    drunk_calmed_by[playerid] = nil
end




return dia_vlk_2001_olga
