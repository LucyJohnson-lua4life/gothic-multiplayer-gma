local maya_dungeon = {}

local statue_down = 0


local maya_gate = nil

local maya_gate_state = 1
local open_maya_gate_timer_id = nil
local close_maya_gate_timer_id = nil

function maya_dungeon.OnGamemodeInit()
    maya_gate = Vob.Create("EVT_GATE_LARGE_01.3DS", "NEWWORLD\\NEWWORLD.ZEN", 77846, 4142, 23294)--static method
    -- has to be initialized again, because the inital spawn of the statues, increase this value to 3
    statue_down = 0
end

function OpenMayaDungeonGate()
    if maya_gate_state == 20 then
        KillTimer(open_maya_gate_timer_id)    
        open_maya_gate_timer_id = nil
    else
        maya_gate_state = maya_gate_state + 1
        local x, y, z = maya_gate:GetPosition()
        maya_gate:SetPosition(x + 25, y, z)
    end
end

function CloseMayaDungeonGate()
    if maya_gate_state == 1 then
        KillTimer(close_maya_gate_timer_id)    
        close_maya_gate_timer_id = nil
    else
        maya_gate_state = maya_gate_state - 1
        local x, y, z = maya_gate:GetPosition()
        maya_gate:SetPosition(x - 25, y, z)
    end
end

function maya_dungeon.OnPlayerCommandText(playerid, cmdtext)
    if cmdtext == "/og" then
        open_maya_gate_timer_id = SetTimer("OpenMayaDungeonGate", 100, 1);
    end
    if cmdtext == "/cg" then
        close_maya_gate_timer_id = SetTimer("CloseMayaDungeonGate", 100, 1);
    end

    if cmdtext == "/getSd" then
        SendPlayerMessage(playerid,255,255,255,"statues down: " .. statue_down)
    end


end

local function getNameWithoutId(name)
	return string.gsub(name, "%s%((%d+)%)","")
end

function CloseMayaGateAfterSomeTime()
    close_maya_gate_timer_id = SetTimer("CloseMayaDungeonGate", 100, 1);
end

function maya_dungeon.OnPlayerDeath(playerid, p_classid, killerid, k_classid)
    if IsNPC(playerid) == 1 and getNameWithoutId(GetPlayerName(playerid)) == "Seltsame Statue" then
        statue_down = statue_down + 1
    end

    if statue_down == 3 then
        open_maya_gate_timer_id = SetTimer("OpenMayaDungeonGate", 100, 1);
        SetTimer("CloseMayaGateAfterSomeTime", 600000,0);
        SendMessageToAll(39, 199, 130, "Du spuerst ein kleines Beben ...")
    end
end


function maya_dungeon.OnPlayerSpawn(playerid, classid)
    if IsNPC(playerid) == 1 and getNameWithoutId(GetPlayerName(playerid)) == "Seltsame Statue" then
        statue_down = statue_down - 1 
    end
end


return maya_dungeon
