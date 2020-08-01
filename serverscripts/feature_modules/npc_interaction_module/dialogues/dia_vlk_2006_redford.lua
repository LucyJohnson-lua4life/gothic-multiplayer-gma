local dia_vlk_2006_redford = {}
 
local function handleBuddlertruppDia(playerid, text)
    if string.match(text, "Buddlertrupp") then
        SendPlayerMessage(playerid, 255, 255, 255, "Redford sagt: Du gehoerst doch etwa nicht zu denen oder? Die Typen sind mit unseren Maennern <spurlos verschwunden>. Wir haben einen Spezialtrupp geschickt um Sie zu suchen, aber bisher ist niemand zurueckgekommen.")
        return true
    elseif string.match(text, "spurlos verschwunden") then
        SendPlayerMessage(playerid, 255, 255, 255, "Redford sagt: Vor ein paar Tagen sind diese verdammten Buddler hier aufgekreuzt und meinten es gaebe hier eine geheime magische Erzader. Allerdings braeuchten sie <Schutz vor den Minecrawlern> und haben uns angebettelt sie zu begleiten.")
        return true
    elseif string.match(text, "Schutz vor den Minecrawlern") then
        SendPlayerMessage(playerid, 255, 255, 255, "Redford sagt: Gegen Anteil an der Beute haben wir ein paar unserer Jungs mitgeschickt. Doch als wir die <Minen> aufgesucht haben war niemand da.")
        return true
    elseif string.match(text, "Minen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Redford sagt: Anscheinend soll es in der Naehe der Goldmine auf dem Bergturm hier irgendwo einen Zugang zur Erzmine geben. Wenn du aber genaueres wissen willst Frag Hugo in unserer Kneipe.")
        return true
    else
        return false
    end
end

function dia_vlk_2006_redford.handleDialogue(playerid, text)
    
    if handleBuddlertruppDia(playerid, text) == true then
        return
    else
        -- INIT DIALOGUE
        SendPlayerMessage(playerid, 255, 255, 255, "Redford sagt: Was ist?")
    end

end


return dia_vlk_2006_redford
