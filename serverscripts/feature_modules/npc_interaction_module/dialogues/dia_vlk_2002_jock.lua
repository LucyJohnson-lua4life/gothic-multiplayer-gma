local dia_vlk_2002_jock = {}
 
local function handleBuddlertruppDia(playerid, text)
    if string.match(text, "Buddlertrupp") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jock sagt: Mhm ja ich kann mich an die Jungs erinnern. Die sind staendig durch die Strassen gezogen und haben versucht Helfer anzuwerben. Fragst du wegen <Zek>?")
        return true
    elseif string.match(text, "Zek") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jock sagt: Ich weiss nicht genau, was Zek mit den Buddlern wollte. Aber von dem was er erzaehlte, war er sehr unzufrieden in seiner <Beziehung>.")
        return true
    elseif string.match(text, "Beziehung") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jock sagt: Er erzaehlte mir, dass Rose die letzten Tage sehr abweisend ihm gegenueber war. Das letzte mal als sie Intim waren, sei einige <Wochen> her gewesen.")
        return true
    elseif string.match(text, "Wochen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jock sagt: Keine Ahnung was sich in Ihrer Beziehung veraendert hat. Eigentlich war alles genau so wie immer. Es ist gut moeglich, dass die <Routine> Sie einfach getroffen hat.")
        return true
    elseif string.match(text, "Routine") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jock sagt: Wenn junge <Paare> das erste mal zusammenkommen, dann kommt es oft vor dass sie zu hohe Erwartungen an die Beziehung setzen. Viele romantische Abende, jeden Tag Schmetterlinge im Bauch...")
        return true
    elseif string.match(text, "Paare") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jock sagt: Mit der Zeit erfahren sie, dass sie nicht jeden Tag so leben koennen. Ich kann mir gut vorstellen, dass Jock und seine Freundin sich gerade in einem solchen <Tief> befinden.")
        return true
    elseif string.match(text, "Tief") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jock sagt: Aber so ein Tief ist nur etwas temporaeres. Ich bin mir sicher, dass Sie bemerken werden, dass Sie einander vermissen nach etwas <Abstand>")
        return true
    elseif string.match(text, "Abstand") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jock sagt: Bezuglich des Buddlertrupps wuerde ich vorschlagen fragst du mal in der Hafenkneipe nach. Dort waren die Typen auch.")
        return true
    else
        return false
    end
end

function dia_vlk_2002_jock.handleDialogue(playerid, text)
    
    if handleBuddlertruppDia(playerid, text) == true then
        return
    else
        -- INIT DIALOGUE
        SendPlayerMessage(playerid, 255, 255, 255, "Jock sagt: Hallo Fremder! Wie kann ich dir helfen?")
    end

end


return dia_vlk_2002_jock
