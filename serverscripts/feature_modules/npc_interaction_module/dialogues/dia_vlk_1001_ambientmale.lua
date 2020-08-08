local dia_vlk_1001_ambientmale = {}
 

local random_dialogues = {
"Hast du auch schon von den zwei riesige Bestien gehoert, die hier rumstreunen sollen? Ich hoffe die Jaeger machen den Mistviechern mal bald den Gar aus!",
"Das obere Viertel wurde vor Kurzem abgeriegelt, weil es anscheinend einige Diebstaehle dort gab. Das war ja klar, dass die edlen Herren dann eine Extrabehandlung bekommen...",
"Weisst du eigentlich was auf dem Marktplatz abgeht? Alle Haendler streiten sich seit Kurzem wegen so nem magischen Stoff!",
"Wie gehts mein Freund?",
"Wusstest du, dass man mit nur 2 Fischen und einer flasche Wasser eine Fischsuppe kochen kann?",
"Ich habe neulich gehoert, dass man aus Heilpflanzen und Wasser einen sehr nahrhafter Eintopf kochen kann.",
"Was hat es eigentlich mit diesem Buddlertrupp von vor paar Tagen auf sich? Es heisst manche Gesicher haette man zum ersten mal hier gesehen. Ich frag mich wo diese Kerle herkamen.",
"Mann, die Preise sind in letzter Zeit so hoch ueberall! Als ich das letzte mal in meine Geldboerse schaute war nichts mehr drinne!",
"Na wie findest du das Wetter?"
}

function dia_vlk_1001_ambientmale.handleDialogue(playerid, text)
    SendPlayerMessage(playerid, 255, 255, 255, "Buerger sagt: "..random_dialogues[math.random(1, table.getn(random_dialogues))])
end


return dia_vlk_1001_ambientmale
