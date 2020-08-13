require "serverscripts/item_maps"
require "serverscripts/price_table"
local dia_vlk_2003_barney = {}
local buy_dia_helper = require "serverscripts/feature_modules/npc_interaction_module/dialogues/buy_dia_helper"
local items_to_sell = {}
items_to_sell[2008] = true
items_to_sell[2009] = true
items_to_sell[2010] = true 

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
    elseif string.match(text, "vermummten Mann") then
        SendPlayerMessage(playerid, 255, 255, 255, "Jock sagt: Ja... so ein Typ war dabei. Ein gruseliger Mistkerl. Du solltest mal Jack den Piraten fragen. Der hat ein paar Worte mit ihm ausgetauscht.")
        return true
    else
        return false
    end
    
end


local function handleMagicMaterialDia(playerid, text)
    if string.match(text, "magischen Stoffen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Barney sagt: Oh ja, davon habe ich schon viel gehoert. Mindestens ein mal am Abend erlebe ich eine <Pruegelei wegen dem Stoff>.")
        return true
    elseif string.match(text, "Pruegelei wegen dem Stoff") then
        SendPlayerMessage(playerid, 255, 255, 255, "Barney sagt: Letzten Abend hatten sich der Ruestungshaendler und Phillipe betrunken aufeinander gestuerzt. Ich musste die beiden aus der <Taverne schmeissen>.")
        return true
    elseif string.match(text, "Taverne schmeissen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Barney sagt: Dieser Stoff hat <ungesehene Eigenschaften>. Jeder der seine Finger drankriegt kann sich eine goldene Nase daran verdienen.")
        return true
    elseif string.match(text, "ungsehene Eigenschaften") then
        SendPlayerMessage(playerid, 255, 255, 255, "Barney sagt: Es ist so hieb- und stichfest wie Stahl, aber so leicht wie Seide. Es gibt Geruechte, dass der Stoff von einem Tier stammt.")
        return true
    elseif string.match(text, "Stoff magisch") then
        SendPlayerMessage(playerid, 255, 255, 255, "Barney sagt: Das waere die einzige Erklaerung die mir einfaellt. Wenn du aber genaueres wissen willst musst du <Jack den Pirat> fragen. Er scheint genaueres zu wissen.")
        return true
    elseif string.match(text, "Jack den Pirat") then
        SendPlayerMessage(playerid, 255, 255, 255, "Barney sagt: Du findest Jack in der Hafenkneipe. Als Pirat hat er bestimmt geheimes Wissen an die wir Normalbuerger nicht rankommen.")
        return true
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

local function handleTradeDia(playerid, text)
    if string.match(text, "bestellen") then
        buy_dia_helper.handleTradeDia(playerid, items_to_sell, "Barney")
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
    elseif handleMagicMaterialDia(playerid, text) then
        return
    elseif handleTradeDia(playerid, text) == true then
        return
    elseif buy_dia_helper.handleBuyDia(playerid, text, items_to_sell) == true then
        return
    else
        -- INIT DIALOGUE
        SendPlayerMessage(playerid, 255, 255, 255, "Barney sagt: Hallo Fremder! Wie kann ich dir helfen? Willst du dich <ausruhen> oder etwas <bestellen>?")
    end

end


return dia_vlk_2003_barney
