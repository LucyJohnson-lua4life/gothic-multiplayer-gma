require "serverscripts/price_table"
require "serverscripts/item_maps"
local buy_dia_helper = {}

local function hasEnoughGold(playerid, item_instance, anzahl)
    local price = PRICE_TABLE[item_instance]

    if price == nil then
        return false
    elseif price*anzahl > GetPlayerGold(playerid) then
        return false
    elseif price*anzahl <= GetPlayerGold(playerid) then
        return true
    end

    return false
end

function buy_dia_helper.handleBuyDia(playerid, text, sells_this_item)
    local cmd,params = GetCommand(text);
        
    if cmd == "buy" then
        local parameter = params:split(" ")
        local item_id = tonumber(parameter[1])
        local amount = tonumber(parameter[2])
        local item_instance = nil
        local enoughGold = false
        
        if sells_this_item[item_id] == true then
             item_instance = ITEM_ID_MAP[item_id]
        end

        if item_instance ~= nil and amount ~= nil then
            enoughGold = hasEnoughGold(playerid, item_instance, amount)
        end

        if enoughGold == true then
            GiveItem(playerid, item_instance, amount)
            SetPlayerGold(playerid, GetPlayerGold(playerid)-amount*PRICE_TABLE[item_instance])
            SendPlayerMessage(playerid,0,255,0, "Du hast " .. amount .. "x " .. ITEM_NAME_MAP[item_instance] .. " bekommen.")
        elseif item_instance == nil then
            SendPlayerMessage(playerid,255,0,0, "Die angegebene ID ist ungueltig.")
        elseif amount == nil then
            SendPlayerMessage(playerid,255,0,0, "Die Mengenangabe ist ungueltig.")
        else
            SendPlayerMessage(playerid,255,0,0, "Du hast nicht genug Gold.")
        end
    
        return true    


    end
    return false

end

return buy_dia_helper