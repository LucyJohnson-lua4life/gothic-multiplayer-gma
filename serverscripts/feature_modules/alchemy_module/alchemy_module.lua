require "serverscripts/item_maps"



local alchemy_module = {}
local flaskContent = {}

function alchemy_module.OnPlayerUseItem(playerid, itemInstance, amount, hand)
    local anim = GetPlayerAnimationName(playerid)   
    print(anim)
    if itemInstance == "ITMI_FLASK" and anim == "T_LAB_S0_2_S1" then
        --T_LAB_S0_2_S0 happens on quit
        SendPlayerMessage(playerid,230,230,230,"Nutze folgende Befehle fuer das Brauen von Traenken.")
        SendPlayerMessage(playerid,230,230,230,"'/inspect' - ueberpruefe Laborflascheninhalt, '/put <item id>' - fuege Zutat hinzu, '/brew' -> braue das Gemisch")
        flaskContent[playerid] = {}
    elseif itemInstance == "ITMI_FLASK" and anim == "T_LAB_S0_2_S0" then    
        flaskContent[playerid] = nil
    end

end

local function printFlaskContent(playerid)

    local msg = "Laborflascheninhalt: "
    for _, value in pairs(flaskContent[playerid]) do
        msg = msg .. ITEM_NAME_MAP[value] .. ", "
    end

    SendPlayerMessage(playerid,230,230,230, msg)
end

local function matchesIngredients(playerid, i1, i2,i3)
    if flaskContent[playerid][1] == i1 and flaskContent[playerid][2] == i2 and flaskContent[playerid][3] == i3 then
        return true
    else
        return false
    end
end

local function brewFlaskContent(playerid)

    if matchesIngredients(playerid, "ItPl_Health_Herb_01","ItPl_Health_Herb_01","ItPl_Health_Herb_01") then
        SendPlayerMessage(playerid,230,230,230, "Heiltrank hergestellt!")
    else
        SendPlayerMessage(playerid,230,230,230, "Schade... nichts brauchbares entstanden.")
    end

end

function alchemy_module.OnPlayerCommandText(playerid, cmdtext)
    if flaskContent[playerid] ~= nil then

        local cmd,params = GetCommand(cmdtext);

        if cmd == "/inspect" then
            printFlaskContent(playerid)
        elseif cmd == "/put" and table.getn(flaskContent[playerid]) < 3 then
            -- todo check if you have the item, than destroy it
            local instanceName = ITEM_ID_MAP[tonumber(params)]
            table.insert(flaskContent[playerid], instanceName)
            SendPlayerMessage(playerid,230,230,230, ITEM_NAME_MAP[instanceName].. " hinzugefuegt.")
        elseif cmd == "/put" and table.getn(flaskContent[playerid]) >= 3 then
            SendPlayerMessage(playerid,230,230,230, "Du kannst nicht mehr als 3 Zutaten hinzufuegen.")
        elseif cmd == "/brew" and table.getn(flaskContent[playerid]) < 3 then
            SendPlayerMessage(playerid,230,230,230,"Du musst insgesamt 3 Zutaten einfuegen")
        elseif cmd == "/brew" and table.getn(flaskContent[playerid]) == 3 then
            brewFlaskContent(playerid)
        end

    end

end

return alchemy_module
