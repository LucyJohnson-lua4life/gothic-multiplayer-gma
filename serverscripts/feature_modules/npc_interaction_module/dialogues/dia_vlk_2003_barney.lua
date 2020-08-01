local dia_vlk_2003_barney = {}
 
local function handleBuddlertruppDia(playerid, text)
    if string.match(text, "Buddlertrupp") then
        SendPlayerMessage(playerid, 255, 255, 255, "Barney sagt: Ja ich kann mich an die Penner erinnern. Sind einfach hier reingestuermt und haben meine <Gaeste vollgelabert>.")
        return true
    elseif string.match(text, "vollgelabert") then
        SendPlayerMessage(playerid, 255, 255, 255, "Barney sagt: Die wuselten hier rum und faselten irgendwas von einer geheimen Ader mit <magischem Erz>")
        return true
    elseif string.match(text, "Erz") then
        SendPlayerMessage(playerid, 255, 255, 255, "Barney sagt: Ach das ist doch alles Scavenger-Shiet. Selbst wenn sie ein geheimes Erzvorkommen gefunden haetten, spaetestens nach der <Erschliessung> haetten sich die <Stadtverwalter> alles unter den Nagel gerissen.")
        return true
    elseif string.match(text, "Erschliessung") then
        SendPlayerMessage(playerid, 255, 255, 255, "Barney sagt: Ich weiss nicht wo dieses Erzvorkommen sein soll. Die habens ziemlich geheim gehalten. Es scheint aber so als seien sie in die Richtung zur Taverne der toten Harpie gezogen. Vielleicht haben sie ja dort Halt gemacht um noch mehr Idioten fuer ihre Sache zu finden.")
        return true
    elseif string.match(text, "Stadtverwalter") then
        SendPlayerMessage(playerid, 255, 255, 255, "Barney sagt: Du kannst in Khorinis kein Land betreten, ohne dass die Stadtverwaltung dir ihre <Zustimmung> gibt.")
        return true
    elseif string.match(text, "Zustimmung") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jock sagt: Offiziell gehoert erstmal alles Land in Khorinis der Stadtverwaltung. Mit genug Kohle kannst du dir dann Land erkaufen. Viel Spass aber die Kohle dafuer zusammen zu bekommen.")
        return true
    else
        return false
    end
end

local function handleTavernRest(playerid, text) 
    if string.match(text, "ausruhen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Barney sagt: Natuerlich. Schnapp dir einen Platz.")
        SetPlayerHealth(playerid, GetPlayerMaxHealth(playerid))
        return true
    else 
        return false
    end
end

function dia_vlk_2003_barney.handleDialogue(playerid, text)
    
    if handleBuddlertruppDia(playerid, text) == true then
        return
    elseif handleTavernRest(playerid,text) then
        return
    else
        -- INIT DIALOGUE
        SendPlayerMessage(playerid, 255, 255, 255, "Jock sagt: Hallo Fremder! Wie kann ich dir helfen? Willst du dich <ausruhen> oder etwas bestellen?")
    end

end


return dia_vlk_2003_barney
