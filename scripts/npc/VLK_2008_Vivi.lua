
function VLK_2008_Vivi()
	local npc = CreateNPC(GetNewNPCName("Vivi"));
	
	SetPlayerAdditionalVisual(npc,"Hum_Body_Babe0",7, "Hum_Head_Bald", 157);
	SetPlayerWalk(npc, "Humans_Militia.mds");
	SetPlayerInstance(npc,"PC_HERO");
	SetPlayerFatness(npc, 0.5);
    SetPlayerStrength(npc, 150);
    SetPlayerHealth(npc, 9999);
    SetPlayerMaxHealth(npc, 9999);
	--Items:
	EquipArmor(npc,"ITAR_PAL_M");
	EquipMeleeWeapon(npc,"ItMw_1H_Blessed_03");
	
	
	local npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = DR_GUARD;
	npcarr.attack_routine = FAI_ONEH_MASTER;
	npcarr.WeaponMode = 3;
	npcarr.dialogs = dialogs;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = nil;
	npcarr.Guild = AI_GUILD_GuildLess;
	npcarr.aivar = {};
	npcarr.aivar["WARNTIME"] = 0;
	
	return npcarr;
end
