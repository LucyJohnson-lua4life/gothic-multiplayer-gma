local npc_drop_and_kill = {}

local INSTAKILL_NPC_NAMES = {}
INSTAKILL_NPC_NAMES["Bandit"] = true
INSTAKILL_NPC_NAMES["Strong Bandit"] = true
INSTAKILL_NPC_NAMES["Captn Hook"] = true
INSTAKILL_NPC_NAMES["Buerger"] = true
INSTAKILL_NPC_NAMES["Buergerin"] = true
INSTAKILL_NPC_NAMES["Bauer"] = true
INSTAKILL_NPC_NAMES["Baeuerin"] = true
INSTAKILL_NPC_NAMES["Betrunkener Schlaeger"] = true


local function getNameWithoutId(name)
	return string.gsub(name, "%s%((%d+)%)","")
end

function npc_drop_and_kill.OnPlayerUnconscious(playerid, p_classid, killerid, k_classid)
    if IsNPC(playerid) == 1 then
        if  INSTAKILL_NPC_NAMES[getNameWithoutId(GetPlayerName(playerid))] == true then
            SetPlayerHealth(playerid, 0)
        end
    elseif IsNPC(killerid) == 1 then
       if INSTAKILL_NPC_NAMES[getNameWithoutId(GetPlayerName(killerid))] == true then
            SetPlayerHealth(playerid, 0)
       end
    end
end


return npc_drop_and_kill 