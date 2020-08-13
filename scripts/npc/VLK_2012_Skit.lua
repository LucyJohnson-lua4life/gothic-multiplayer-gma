
function VLK_2012_Skit()
	local npc = CreateNPC(GetNewNPCName("Skit"));
	
	SetPlayerAdditionalVisual(npc,"Hum_Body_Naked0",1, "Hum_Head_FatBald", 160);
	SetPlayerWalk(npc, "HumanS_Relaxed.mds");
	SetPlayerInstance(npc,"PC_HERO");
	SetPlayerFatness(npc, 0.5);
    SetPlayerStrength(npc, 100);
    SetPlayerHealth(npc, 9999);
    SetPlayerMaxHealth(npc, 9999);
	--Items:
	EquipArmor(npc,"ITAR_PIR_L_Addon");
	EquipMeleeWeapon(npc,"ITMW_1H_FERROSSWORD_MIS");

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
	
	return npcarr;
end

