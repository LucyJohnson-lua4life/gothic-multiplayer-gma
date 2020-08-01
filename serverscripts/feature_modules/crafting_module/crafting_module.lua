local alchemy_handler = require "serverscripts/feature_modules/crafting_module/alchemy_handler"
local cooking_handler = require "serverscripts/feature_modules/crafting_module/cooking_handler"
local crafting_module = {}


function crafting_module.OnPlayerUseItem(playerid, itemInstance, amount, hand)
    alchemy_handler.OnPlayerUseItem(playerid, itemInstance, amount, hand)
    cooking_handler.OnPlayerUseItem(playerid, itemInstance, amount, hand)
end

function crafting_module.OnPlayerCommandText(playerid, cmdtext)
    alchemy_handler.OnPlayerCommandText(playerid, cmdtext)
    cooking_handler.OnPlayerCommandText(playerid, cmdtext)
end


function crafting_module.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)
    alchemy_handler.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)
    cooking_handler.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)
end

function crafting_module.OnPlayerDisconnect(playerid, reason)
    alchemy_handler.OnPlayerDisconnect(playerid, reason)
    cooking_handler.OnPlayerDisconnect(playerid, reason)
end

return crafting_module
