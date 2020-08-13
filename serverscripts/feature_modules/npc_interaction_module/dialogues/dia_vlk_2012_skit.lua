require "serverscripts/utils/script_functions"
require "serverscripts/player_globals"
require "serverscripts/has_item_globals"
require "serverscripts/price_table"
local inventory_dao = require "serverscripts/daos/inventory_dao"
local magic_material_id = DIA_SKIT_MAGICMATERIAL_CHECKID

local dia_vlk_2012_skit = {}
 
local function handleMagicMaterialDia(playerid, text)
    if string.match(text, "magischen Stoffen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Skit sagt: Na endlich hat mal einer <angebissen>. Ich dachte schon die Leute wuerden hier nie <antanzen>.")
        return true
    elseif string.match(text, "angebissen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Skit sagt: Ja wir haben den Stoff vor dem Haus des Ruestungsbauers abgelegt. Ziel war es, unser Produkt zu bewerben und die Haendler aus der Stadt zu locken, damit die Miliz uns nicht beim Handel auf die Pelle rueckt.")
        return true
    elseif string.match(text, "antanzen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Skit sagt: Hehe du willst bestimmt wissen, aus was das Material besteht oder? Leider ist das Betriebsgeheimnis, aber ich kann dir mehr davon <verkaufen>.")
        return true
    elseif string.match(text, "verkaufen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Skit sagt: 1500 Goldstuecke und du bekommst ein <komplettes Buendel>.")
        return true
    elseif string.match(text, "komplettes Buendel") then
        SendPlayerMessage(playerid, 255, 255, 255, "Skit sagt: Wie es ist dir zu teuer. Weisst du wie viel das <Ding> Wert ist!? Ich fass es nicht.")
        return true
    elseif string.match(text, "Ding") then
        SendPlayerMessage(playerid, 255, 255, 255, "Skit sagt: Ich kann Schnaepchenjaeger nicht ausstehen... Wie dem auch sei, es gaebe ansonsten eine Sache die du wenigstens fuer mich <tun> kannst.")
        return true
    elseif string.match(text, "tun") then
        SendPlayerMessage(playerid, 255, 255, 255, "Skit sagt: Einer unserer Kunden ist ein leidenschaftlicher Trophaensammler. Seit einigen Tagen nervt er mich und sucht fuer seine Sammlung verzweifelt nach einem <schwarzen Trollfell>.")
        return true
    elseif string.match(text, "schwarzen Trollfell") then
        SendPlayerMessage(playerid, 255, 255, 255, "Skit sagt: Im Norden von Khorinis soll es einen <schwarzen Troll> geben. Wenn du mir sein Fell besorgst, dann schenke ich dir einen Buendel vom magischen Stoff.")
        return true
    elseif string.match(text, "schwarzen Troll") then
        HasItem(playerid, "ITAT_TROLLFUR", magic_material_id)
        return true
    else
        return false
    end
end


local function handleMagicMaterialRewardDia(playerid, item_instance, amount, equipped, checkid)
    if checkid == magic_material_id and item_instance == "ITAT_TROLLFUR" and amount >= 1 then
        RemoveItem(playerid, "ITAT_TROLLFUR", 1)
        inventory_dao.updateItemOrDeleteIfAmountIsZero(PLAYER_HANDLER_MAP[playerid], PLAYER_ID_NAME_MAP[playerid], "ITAR_VLK_H", 1)
        SendPlayerMessage(playerid, 255, 255, 255, "Skit sagt: Wow, ich haette nicht gedacht, dass du wiederkommst. Hier nimm den Stoff. Versuch den Haendlern unterschwellig klar zu machen wo sie mich finden.")
        SendPlayerMessage(playerid, 0, 255, 0, "Magischen Stoff erhalten.")
        GiveItem(playerid, "ITAR_VLK_H", 1)
    elseif checkid == magic_material_id then
        SendPlayerMessage(playerid, 255, 255, 255, "Skit sagt: Na, hast du den <schwarzen Troll> erledigt?");
    end
end

function dia_vlk_2012_skit.handleDialogue(playerid, text)
    
    if handleMagicMaterialDia(playerid, text) == true then
        return
    else
        -- INIT DIALOGUE
        SendPlayerMessage(playerid, 255, 255, 255, "Skit sagt: Was ist?")
    end

end

function dia_vlk_2012_skit.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)
    handleMagicMaterialRewardDia(playerid, item_instance, amount, equipped, checkid)
end



return dia_vlk_2012_skit
