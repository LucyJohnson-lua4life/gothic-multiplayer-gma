
local buy_dia_helper = require "serverscripts/feature_modules/npc_interaction_module/dialogues/buy_dia_helper"

local dia_vlk_2004_olivia = {}

local items_to_sell = {}
items_to_sell[2008] = true
items_to_sell[2009] = true
items_to_sell[2010] = true


function dia_vlk_2004_olivia.handleDialogue(playerid, text)
    if string.match(text, "bestellen") then 
        buy_dia_helper.handleTradeDia(playerid, items_to_sell, "Olivia") 
        return
    elseif buy_dia_helper.handleBuyDia(playerid, text, items_to_sell) == true then
        return
    else
        -- INIT DIALOGUE
        SendPlayerMessage(playerid, 255, 255, 255, "Olivia sagt: Hallo Fremder! Was kann ich fuer dich tun? Willst du dir das Angebot <ansehen>?")
    end

end

return dia_vlk_2004_olivia
