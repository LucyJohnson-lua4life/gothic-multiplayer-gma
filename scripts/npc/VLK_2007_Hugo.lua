
function VLK_2007_Hugo()
	local npc = CreateNPC(GetNewNPCName("Hugo"));
	
	SetPlayerAdditionalVisual(npc,"Hum_Body_Naked0",1, "Hum_Head_FatBald", 47);
	SetPlayerWalk(npc, "Humans_Arrogance.mds");
	SetPlayerInstance(npc,"PC_HERO");
	SetPlayerFatness(npc, 0.5);
    SetPlayerStrength(npc, 10);
    SetPlayerHealth(npc, 9999);
    SetPlayerMaxHealth(npc, 9999);
	--Items:
	EquipArmor(npc,"ITAR_BARKEEPER");
	--EquipMeleeWeapon(npc,"ItMw_1h_Bau_Mace");
	
	
	local npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = DR_GUARD;
	npcarr.attack_routine = FAI_HUMAN_ATTACK_UNEXP;
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

