local dia_vlk_1002_farmerm = {}
 

local random_dialogues = {
"Hast du auch schon von den zwei riesigen Bestien gehoert, die hier rumstreunen sollen? Ich hoffe die Jaeger machen den Mistviechern mal bald den Gar aus!",
"Wenn du einen guten Eintopf machen willst, brauchst du nur Fleisch und Wasser! Mehr nicht. Nicht schlecht oder?",
"Wie gehts mein Freund?",
"Wusstest du, dass man mit nur 2 Fischen und einer flasche Wasser eine Fischsuppe kochen kann?",
"Der Grossbauer ist im Urlaub. Seit dem schmeissen seine Soeldner hier die Bude. Nicht dass es seit dem Anders waere. Aber wenn die Soeldner alles machen, wofuer braucht man ihn denn noch?",
"Das Leben ist entspannt auf dem Land. Die Arbeit ist zwar hart, aber dafuer ist sie ehrlich.",
"Wenn du dich ausruhen willst, wir haben hier auch eine Taverne wo man sich mal einfach gehen lassen kann.",
"Ich habe gehoert fuer einen Heiltrank benoetigt man mindestens eine Heilwurzel.",
"Worin liegt eigentlich die Schwierigkeit in der Alchemie? Im Prinzip schmeisst man doch nur ein paar Pflanzen zusammen!",
"Argh... mein Kopf. Letzte Nach habe ich zu viel gesoffen...."
}

function dia_vlk_1002_farmerm.handleDialogue(playerid, text)
    SendPlayerMessage(playerid, 255, 255, 255, "Bauer sagt: ".. random_dialogues[math.random(1, table.getn(random_dialogues))])
end


return dia_vlk_1002_farmerm
