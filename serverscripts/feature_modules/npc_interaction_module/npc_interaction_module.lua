require "serverscripts/feature_modules/npc_interaction_module/invinsible_npcs"

local dia_vlk_1000_ambientfemale = require "serverscripts/feature_modules/npc_interaction_module/dialogues/dia_vlk_1000_ambientfemale"
local dia_vlk_1001_ambientmale = require "serverscripts/feature_modules/npc_interaction_module/dialogues/dia_vlk_1001_ambientmale"
local dia_vlk_1002_farmerm = require "serverscripts/feature_modules/npc_interaction_module/dialogues/dia_vlk_1002_farmerm"
local dia_vlk_1003_farmerf = require "serverscripts/feature_modules/npc_interaction_module/dialogues/dia_vlk_1003_farmerf"


local dia_vlk_2000_rose = require "serverscripts/feature_modules/npc_interaction_module/dialogues/dia_vlk_2000_rose"
local dia_vlk_2001_olga = require "serverscripts/feature_modules/npc_interaction_module/dialogues/dia_vlk_2001_olga"
local dia_vlk_2002_jock = require "serverscripts/feature_modules/npc_interaction_module/dialogues/dia_vlk_2002_jock"
local dia_vlk_2003_barney = require "serverscripts/feature_modules/npc_interaction_module/dialogues/dia_vlk_2003_barney"
local dia_vlk_2004_olivia = require "serverscripts/feature_modules/npc_interaction_module/dialogues/dia_vlk_2004_olivia"
local dia_vlk_2006_redford = require "serverscripts/feature_modules/npc_interaction_module/dialogues/dia_vlk_2006_redford"
local dia_vlk_2007_hugo = require "serverscripts/feature_modules/npc_interaction_module/dialogues/dia_vlk_2007_hugo"
local dia_vlk_2008_vivi = require "serverscripts/feature_modules/npc_interaction_module/dialogues/dia_vlk_2008_vivi"
local dia_vlk_2009_astren = require "serverscripts/feature_modules/npc_interaction_module/dialogues/dia_vlk_2009_astren"
local dia_vlk_2010_jack = require "serverscripts/feature_modules/npc_interaction_module/dialogues/dia_vlk_2010_jack"
local dia_vlk_7005_bryan = require "serverscripts/feature_modules/npc_interaction_module/dialogues/dia_vlk_7005_bryan"
local dia_vlk_7004_lian = require "serverscripts/feature_modules/npc_interaction_module/dialogues/dia_vlk_7004_lian"
local dia_vlk_7003_ryan = require "serverscripts/feature_modules/npc_interaction_module/dialogues/dia_vlk_7003_ryan"
local dia_vlk_7002_brad = require "serverscripts/feature_modules/npc_interaction_module/dialogues/dia_vlk_7002_brad"
local dia_vlk_7001_phillipe = require "serverscripts/feature_modules/npc_interaction_module/dialogues/dia_vlk_7001_phillipe"
local dia_vlk_7000_goffrey = require "serverscripts/feature_modules/npc_interaction_module/dialogues/dia_vlk_7000_goffrey"


local npc_interaction_module = {}


local function handleNpcInteraction(playerid, npc_id, text)

    local npc_name = GetPlayerName(npc_id)

    if string.match(npc_name, "^Bryan.*") then
        dia_vlk_7005_bryan.handleDialogue(playerid, text)
    elseif string.match(npc_name, "^Lian.*") then
        dia_vlk_7004_lian.handleDialogue(playerid, text)
    elseif string.match(npc_name, "^Ryan.*") then
        dia_vlk_7003_ryan.handleDialogue(playerid, text)
    elseif string.match(npc_name, "^Brad.*") then
        dia_vlk_7002_brad.handleDialogue(playerid, text)
    elseif string.match(npc_name, "^Rose.*") then
        dia_vlk_2000_rose.handleDialogue(playerid, text)
    elseif string.match(npc_name, "^Olga.*") then
        dia_vlk_2001_olga.handleDialogue(playerid, text)
    elseif string.match(npc_name, "^Jock.*") then
        dia_vlk_2002_jock.handleDialogue(playerid, text)
    elseif string.match(npc_name, "^Barney.*") then
        dia_vlk_2003_barney.handleDialogue(playerid, text)
    elseif string.match(npc_name, "^Olivia.*") then
        dia_vlk_2004_olivia.handleDialogue(playerid, text)
    elseif string.match(npc_name, "^Redford.*") then
        dia_vlk_2006_redford.handleDialogue(playerid, text)
    elseif string.match(npc_name, "^Hugo.*") then
        dia_vlk_2007_hugo.handleDialogue(playerid, text)
    elseif string.match(npc_name, "^Vivi.*") then
        dia_vlk_2008_vivi.handleDialogue(playerid, text)
    elseif string.match(npc_name, "^Astren.*") then
        dia_vlk_2009_astren.handleDialogue(playerid, text)
    elseif string.match(npc_name, "^Jack.*") then
        dia_vlk_2010_jack.handleDialogue(playerid, text)
    elseif string.match(npc_name, "^Phillipe.*") then
        dia_vlk_7001_phillipe.handleDialogue(playerid, text)
    elseif string.match(npc_name, "^Goffrey.*") then
        dia_vlk_7000_goffrey.handleDialogue(playerid, text)
    elseif string.match(npc_name, "^Buergerin.*") then
        dia_vlk_1000_ambientfemale.handleDialogue(playerid, text)
    elseif string.match(npc_name, "^Buerger.*") then
        dia_vlk_1001_ambientmale.handleDialogue(playerid, text)
    elseif string.match(npc_name, "^Baeuerin.*") then
        dia_vlk_1003_farmerf.handleDialogue(playerid, text)
    elseif string.match(npc_name, "^Bauer.*") then
        dia_vlk_1002_farmerm.handleDialogue(playerid, text)
    end
    --- depending on NPC, the interaction will be forwarded to the npc handler
end

function npc_interaction_module.OnPlayerCommandText(playerid, cmdtext)
    local cmd, text = GetCommand(cmdtext);
    if cmd == "/i" then
        local npc_id = GetFocus(playerid)
        if IsNPC(npc_id) then
            handleNpcInteraction(playerid, npc_id, text)
        end
    end

end

function npc_interaction_module.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)
    dia_vlk_7005_bryan.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)
    dia_vlk_7004_lian.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)
    dia_vlk_7003_ryan.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)
    dia_vlk_7002_brad.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)
    dia_vlk_2000_rose.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)
    dia_vlk_2008_vivi.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)
    dia_vlk_2010_jack.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)
    dia_vlk_7001_phillipe.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)
    dia_vlk_7000_goffrey.OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)
end

function npc_interaction_module.OnPlayerHit(playerid, killerid)
    if IsNPC(playerid) then
        local npc_name = GetPlayerName(playerid)
        if INVINSIBLE_NPCS[npc_name] == true then
            SetPlayerHealth(playerid, GetPlayerMaxHealth(playerid))
        end
    end
end


function npc_interaction_module.OnPlayerDeath(playerid, p_classid, killerid, k_classid)
  dia_vlk_2001_olga.OnPlayerDeath(playerid, p_classid, killerid, k_classid)
end

function npc_interaction_module.OnPlayerDisconnect(playerid, reason)
    dia_vlk_2001_olga.OnPlayerDisconnect(playerid, reason)
end

return npc_interaction_module