local debug = {}
local function printPointsForAngle(angle, playerid)
	local ang =  angle * 3.14 / 180

	local pos_x = math.cos(ang)
    local pos_y =  math.sin(ang)
    print("angle: ".. angle)
	print("x: " .. tostring(pos_x))
    print("y: " .. tostring(pos_y))
    
    SendPlayerMessage(playerid,255,255,255,"angle: " .. angle .. ", x: " .. pos_x .. ", y: " .. pos_y .. ".")

end





function debug.OnPlayerCommandText(playerid, cmdtext)
    local cmd, params = GetCommand(cmdtext);
    
    if cmdtext == "/allitems" then
        GiveItem(playerid, "ITMI_SILVERRING", 1)
        GiveItem(playerid, "ITMI_AQUAMARINE", 1)
        GiveItem(playerid, "ITMI_SILVERNECKLACE", 1)
        GiveItem(playerid, "ITMI_GOLDRING", 1)
        GiveItem(playerid, "ITAT_TEETH", 1)
        GiveItem(playerid, "ITAT_SKELETONBONE", 1)
        GiveItem(playerid, "ITMI_DARKPEARL", 1)
    end

    if cmd == "/day" then
        SetTime (8,0)
    end


    if (cmd == "/goto") then
        local spl = params:split(" ");
        spl[1] = trim(spl[1]);
        spl[2] = trim(spl[2]);
        
        if (spl[1] == "wp") then
            local wp = AI_WayNets[GetPlayerOrNPC(playerid).GP_World]:GetWaypoint(spl[2]);
            if (wp ~= nil) then
                SetPlayerPos(playerid, wp.x, wp.y, wp.z);
            end
        end
    
    end

    if cmd == "/setangle" then
        SetPlayerAngle(GetFocus(playerid), tonumber(params))
    end

    if cmd == "/weak" then
        SetPlayerHealth(playerid, 1000);
        SetPlayerMaxHealth(playerid, 1000);
    end

    if cmd == "/op" then
        SetPlayerHealth(playerid, 99999);
        SetPlayerMaxHealth(playerid, 99999);
        SetPlayerMagicLevel(playerid, 3)
    end

    if cmd == "/tools" then
        GiveItem(playerid, "ITMI_SAW",1)
        GiveItem(playerid, "ITMI_BROOM",1)
        GiveItem(playerid, "ITMI_HAMMER",1)
        GiveItem(playerid, "ITMISWORDRAWHOT",1)
        GiveItem(playerid, "ITMI_STOMPER",1)
        GiveItem(playerid, "ITMI_SCOOP",1)
        GiveItem(playerid, "ITMI_PAN",1)
    end

    if cmd == "/weedallday" then
        GiveItem(playerid, "ITPL_HEALTH_HERB_01",10)
    end

    if cmd == "/armor" then
        GiveItem(playerid, "ITAR_PAL_H",10)
    end

    if cmd == "/specialweed" then
        GiveItem(playerid, "ITPL_HEALTH_HERB_03",1)
    end

    if cmd == "/turn" then
        local fid = GetFocus(playerid)
        SetPlayerAngle(fid,180)
    end

    if cmd == "/rosebud" then
        SetPlayerGold(playerid, 100000)
    end

    if cmd == "/furryball" then
        GiveItem(playerid, "ITAT_WARGFUR",10)
        GiveItem(playerid, "ITAT_WOLFFUR",10)
        GiveItem(playerid, "ITAT_SHADOWFUR",10)
        GiveItem(playerid, "ITAT_TROLLFUR",10)
        GiveItem(playerid, "ITAT_ADDON_KEILERFUR",10)
    end
    
    if(cmdtext == "/tomaya") then
        
        SetPlayerPos(playerid,77860,4129,23121);
    end

    if cmdtext == "/tohunter" then
        SetPlayerPos(playerid,52019.8711,7686.00684,32451.3359)
    end

    if cmdtext == "/tohunter2" then
        SetPlayerPos(playerid, 44990.1914,3046.729,3076.68604)
    end

    if cmdtext == "/tomine1" then
        SetPlayerPos(playerid, 36387.3672,5293.35938,29799.7207)
    end

    if cmdtext == "/tobandits" then
        SetPlayerPos(playerid, 57084,1906,-25900)
    end
    
    if cmdtext == "/tofb1" then
        SetPlayerPos(playerid, 15684.7949,4138.38037,11197.3047)
    end
    
    if cmdtext == "/tofb2" then
        SetPlayerPos(playerid, 43922.9805,2939.29736,-27510.2598)
    end
    
    if cmdtext == "/tofb3" then
        SetPlayerPos(playerid, 63704.4727,4980.4834,10376.542)
    end
    
    if cmdtext == "/todb1" then
        SetPlayerPos(playerid, 53775.7148,1612.91565,2181.99805)
    end
    
    if cmdtext == "/todb2" then
        SetPlayerPos(playerid, 23013.9199,2661.21729,19482.3008)
    end
    
    if cmdtext == "/todb3" then
        SetPlayerPos(playerid, 25970.9395,974.527832,-9300.7959)
    end

    if cmdtext == "/oneappleaday" then
        GiveItem(playerid, "ITFO_APPLE",10)
    end

    if cmdtext == "/madscientist" then
        GiveItem(playerid, "ITMI_FLASK",10)
    end


    if cmdtext == "/femr" then
        GiveItem(playerid, "ITGMA_ARMOR_START_FEM",1)
        GiveItem(playerid, "ITGMA_ARMOR_START_FEM2",1)
    end

    if cmdtext == "/npc" then
        --38994, 3901, -2235
        SpawnNPC(PaladinKing("FG"), "TAVERNE", "NEWWORLD\\NEWWORLD.ZEN");
    end

    
    if cmdtext == "/npc1" then
        --38994, 3901, -2235
        SpawnNPC(KnightGuard("FG"), "TAVERNE", "NEWWORLD\\NEWWORLD.ZEN");
    end

    
    if cmdtext == "/npc2" then
        --38994, 3901, -2235
        SpawnNPC(OrcElite(), "TAVERNE", "NEWWORLD\\NEWWORLD.ZEN");
    end

    if cmdtext == "/npc3" then
        --38994, 3901, -2235
        SpawnNPC(MilitiaGuard("FG"), "TAVERNE", "NEWWORLD\\NEWWORLD.ZEN");
    end

    if cmdtext == "/npc4" then
        --38994, 3901, -2235
        SpawnNPC(StrongBandit(), "TAVERNE", "NEWWORLD\\NEWWORLD.ZEN");
    end

    if cmdtext == "/npc5" then
        SpawnNPC(DeadPirateCaptn(), "TAVERNE", "NEWWORLD\\NEWWORLD.ZEN");
    end

    if cmdtext == "/bigby" then
        --38994, 3901, -2235
        SpawnNPC(BigBlackWolf(), "HAFEN", "NEWWORLD\\NEWWORLD.ZEN");
    end

    if cmdtext == "/trex" then
        --38994, 3901, -2235
        SpawnNPC(TRex(), "HAFEN", "NEWWORLD\\NEWWORLD.ZEN");
    end

    if cmdtext == "/panther" then
        --38994, 3901, -2235
        SpawnNPC(Quotemoc(), "HAFEN", "NEWWORLD\\NEWWORLD.ZEN");
    end

    if cmdtext == "/pestarmor" then
        GiveItem(playerid, "ITAR_PESTDOKTOR", 5)
    end

    if cmdtext == "/mi" then
        print("oehm")
        print(IsNPC(playerid))
    end

    if cmdtext == "/heads" then
        GiveItem(playerid, "ITMI_ADDON_BLOODWYN_KOPF", 5)
    end

    if cmdtext == "/brief" then
        GiveItem(playerid, "STANDARDBRIEF", 1)
    end

    


    if cmdtext == "/angle" then
        printPointsForAngle(GetPlayerAngle(playerid),playerid)
    end

    
    
end



return debug