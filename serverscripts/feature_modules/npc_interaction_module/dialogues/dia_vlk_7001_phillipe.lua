require "serverscripts/utils/script_functions"
require "serverscripts/player_globals"
require "serverscripts/has_item_globals"
require "serverscripts/price_table"
local inventory_dao = require "serverscripts/daos/inventory_dao"
local check_id = DIA_PHILLIPE_BOWQUEST_CHECKID
local dia_vlk_7001_phillipe = {}

local function handleLoverquestDia(playerid, text)
    if string.match(text, "seltenen Bogen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Ah du hast von meiner neusten Errungenschaft erfahren! War ja klar, dass diese Nachricht schnell die Kenner erreicht. Da du so flink mich aufgesucht hast mache ich dir einen <besonderen Preis>.")
        return true
    elseif string.match(text, "besonderen Preis") then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Fuer <1000 Goldstuecke> ueberlasse ich dir dieses Prachtstueck.")
        return true
    elseif string.match(text, "1000 Goldstuecke") then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Tut mir Leid aber der Preis ist nicht <verhandelbar>. Weisst du eigentlich wie viel Wert der Bogen ist?")
        return true
    elseif string.match(text, "verhandelbar") then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: (seufzt) Und ich dachte ich habe es mit einem Kenner zu tun... nun denn. Wenn ich so Recht ueberlege, dann gaebe es durchaus eine <Sache> mit der sich der Preis reduzieren lassen wuerde...")
        return true
    elseif string.match(text, "Sache") then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Seit einigen Wochen ruinieren <Banditen> meine Handelswege. Ich kann meine Boten nicht mehr ohne Soeldner rausschicken.")
        return true

        -- since Banditenkoepfe contains the word 'Banditen', it has to be processed first, otherwise the 'Banditenkoepfe' branch is not reachable.... should think about a solution to fix it
    elseif string.match(text, "Banditenkoepfe") then
        HasItem(playerid, "ITMI_ADDON_BLOODWYN_KOPF", check_id)
        return true
    elseif string.match(text, "Banditen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Wenn du mir 5 <Banditenkoepfe> bringen koenntest, dann schaetze ich wuerde der ersparte Schaden den Preis des Bogens ausgleichen.")
        return true
    else
        return false
    end
end

local function handleMagicMaterialDia(playerid, text)
    if string.match(text, "magischen Stoffen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Ah! Noch ein Abenteurer auf der Suche nachdem <geheimnisvollen Material>!")
        return true
    elseif string.match(text, "geheimnisvollen Material") then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: In der Tat ist das ein grosses Mysterium. Fuer einige Zeit hatte ich die Theorie, dass es sich dabei nur um <verzauberten Stoff> handelt. Doch nach laengerem Ueberlegen muss es doch was anderes sein.")
        return true
    elseif string.match(text, "verzauberten Stoff") then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Zauber halten nur eine kurze Periode an. Die Stoffe selbst schienen nach all den Tagen ihre <Beschaffenheit> nicht verloren zu haben. Kein Zauber der Welt haelt so lange ohne einen magischen Speicher.")
        return true
    elseif string.match(text, "Beschaffenheit") then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Es muss sich um wahrhaftig seltenes Material handeln! Ich wuenschte ich koennte mir die Stoffe <genauer ansehen>.")
        return true
    elseif string.match(text, "genauer ansehen") then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Ich habe einen aeusserst wertvollen Trank in meinem Inventar. Wenn du mir das <Ding> organisieren koenntest, wuerde ich dich grosszuegig damit entlohnen!")
        return true
    end
end



local function handleLoverPresentDia(playerid, item_instance, amount, equipped, checkid)
    if checkid == check_id and item_instance == "ITMI_ADDON_BLOODWYN_KOPF" and amount >= 5 then
        RemoveItem(playerid, "ITMI_ADDON_BLOODWYN_KOPF", 5)
        inventory_dao.updateItemOrDeleteIfAmountIsZero(PLAYER_HANDLER_MAP[playerid], PLAYER_ID_NAME_MAP[playerid], "ITMI_ADDON_BLOODWYN_KOPF", 5)
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Wunderbar! Das sollte meinen Boten einige Tage Ruhe geben. Na gut fuer deine Fleissarbeit sollst du den Bogen bekommen.")
        SendPlayerMessage(playerid, 0, 255, 0, "Ahornbogen erhalten.")
        GiveItem(playerid, "ITRW_BOW_L_01", 1)
    elseif checkid == check_id then
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Hast du die <Banditenkoepfe> dabei?");
    end
end

function dia_vlk_7001_phillipe.handleDialogue(playerid, text)
    
    if handleLoverquestDia(playerid, text) == true then
        return
    elseif handleMagicMaterialDia(playerid, text) == true then
        return
    else
        -- INIT DIALOGUE
        SendPlayerMessage(playerid, 255, 255, 255, "Phillipe sagt: Hallo Fremder. Kann ich dich fuer meine Waren begeistern?")
    end

end

function dia_vlk_7001_phillipe.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)
    handleLoverPresentDia(playerid, item_instance, amount, equipped, checkid)
end


return dia_vlk_7001_phillipe
