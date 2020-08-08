local dia_vlk_1003_farmerf = {}
 

local random_dialogues = {
"Ich habe gehoert, dass in Khorinis zwei riesige Bestien rumstreunen. Ich hoffe die Jaeger schaffen es sie bald aufzuspueren. Sonst traut sich keiner mehr auf die Landstrassen.",
"Hallo, schoen dich zu sehen!",
"Wir essen hier auf dem Land gerne Fleischeintopf. Fuer einen guten brauchst du nicht mehr als Fleisch und Wasser. Einfach simpel, oder?",
"Der Grossbauer ist im Urlaub. Seit dem regeln die Soeldner hier alles. Nicht dass sich etwas geaendert haette. Aber wenn die Soeldner alles machen, wofuer braucht man den Grossbauern dann noch?",
"Das Leben auf dem Land ist sehr einfach und viel passiert hier nicht. Aber dafuer ist man sehr Nah an der Natur.",
"Ich habe gehoert fuer einen Heiltrank benoetigt man mindestens eine Heilwurzel.",
"Wenn du dich entspannen willst, dann solltest du zu Hugo gehen. Er ist der Besitzer der Taverne auf dem Bauernhof."
}

function dia_vlk_1003_farmerf.handleDialogue(playerid, text)
    SendPlayerMessage(playerid, 255, 255, 255, "Baeuerin sagt:" ..random_dialogues[math.random(1, table.getn(random_dialogues))])
end


return dia_vlk_1003_farmerf
