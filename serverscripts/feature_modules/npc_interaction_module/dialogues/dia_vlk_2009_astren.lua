
local dia_vlk_2009_astren = {}
 
local function handleLoverquestDia(playerid, text)
    if string.match(text, "Interessen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Astren sagt: Meine Interessen? Das ist ja eine komische Frage. Hmm (ueberlegt). Ich arbeite den ganzen Tag weisst du? Da hat man nicht so viel Zeit fuer sowas. Spontan fallen mir vielleicht zwei <Dinge> ein.")
        return true
    elseif string.match(text, "Dinge") then
        SendPlayerMessage(playerid, 255, 255, 255, "Astren sagt: Zum einen interessiere ich mich fuer seltene <Pflanzen>. Zum anderen faszinieren mich <Holzarbeiten>. Am Besten kann man das wohl als Interesse fuer die 'Natur' zusammenfassen.")
        return true
    elseif string.match(text, "Pflanzen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Astren sagt: Als Jaeger bin ich sehr oft draussen. Und in so manchem Wald sieht man oftmals sehr seltene Pflanzen die wunderschoen sind. Manchmal wunschte ich, ich haette mehr Zeit um diese zu studieren...")
        return true
    elseif string.match(text, "Holzarbeiten") then
        SendPlayerMessage(playerid, 255, 255, 255, "Astren sagt: Ich schnitze gerne Abends etwas vorm Lagerfeuer. Mit der Zeit bekommt man dann ein Auge dafuer, was qualitative Holzarbeit ist und lernt es besser zu schaetzen.")
        return true
    else
        return false
    end
end



function dia_vlk_2009_astren.handleDialogue(playerid, text)
    
    if handleLoverquestDia(playerid, text) == true then
        return
    else
        -- INIT DIALOGUE
        SendPlayerMessage(playerid, 255, 255, 255, "Astren sagt: Willkommen Fremder! Wir kann ich dir helfen?")
    end

end


return dia_vlk_2009_astren