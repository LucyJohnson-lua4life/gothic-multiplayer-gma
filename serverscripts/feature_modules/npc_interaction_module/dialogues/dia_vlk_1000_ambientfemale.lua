local dia_vlk_1000_ambientfemale = {}
 

local random_dialogues = {
"Ich habe gehoert, dass in Khorinis zwei riesige Bestien rumstreunen. Ich hoffe die Jaeger schaffen es sie bald aufzuspueren. Sonst traut sich keiner mehr aus den Stadtmauern.",
"Hast du schon gehoert? Letzte Nacht gab es wieder eine Pruegellei in der Hafenkneipe. Typisch Maenner. Nach aussen geben sie sich zivilisiert, doch nach ein paar Tropfen Alkohol zeigt sich ihr inneres Tier.",
"Das obere Viertel wurde vor Kurzem abgeriegelt, weil es anscheinend einige Diebstaehle dort gab. Das war ja klar, dass die edlen Herren dann eine Extrabehandlung bekommen...",
"Warst du die letzten Tage auf dem Marktplatz? Anscheinend sind die Haendler gerade alle ganz verrueckt nach einem magischen Material!",
"Oh hallo! Wie geht es dir?",
"Wusstest du, dass man mit nur 2 Fischen und einer flasche Wasser eine wunderbare Fischsuppe kochen kann?",
"Ich habe neulich gehoert dass man aus Heilpflanzen und Wasser einen sehr nahrhafter Eintopf kochen kann.",
"Hast du schon von diesem Buddlertrupp gehoert, der vor ein paar Tagen hier durch die Strassen zog? Es heisst manche Gesicher haette man zum ersten mal hier gesehen. Ich frag mich wo diese Kerle herkamen.",
"Kommt es mir nur so vor, oder sind die Lebensmittelpreise in den letzten Tagen gestiegen? Als ich das letzte mal in meine Geldboerse schaute war ich ueberrascht wie wenig ich uebrig hatte!",
"Wie schnell die Zeit vergeht (seufz). Mir kommt es so vor, als waere meine Jugend erst gestern gewesen. Hast du auch das Gefuehl, dass die Zeit mit dem Alter schneller vergeht?"



}

function dia_vlk_1000_ambientfemale.handleDialogue(playerid, text)
    SendPlayerMessage(playerid, 255, 255, 255, "Buergerin sagt: "..random_dialogues[math.random(1, table.getn(random_dialogues))])
end


return dia_vlk_1000_ambientfemale
