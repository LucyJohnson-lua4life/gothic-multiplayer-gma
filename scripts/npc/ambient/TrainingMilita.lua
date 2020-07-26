function TrainingMilitia()
    local npc = CreateNPC(GetNewNPCName("Militia Guard"));
	local head_model = {"Hum_Head_FatBald", "Hum_Head_Fighter", "Hum_Head_Pony", "Hum_Head_Bald", "Hum_Head_Thief", "Hum_Head_Psionic"}

	SetPlayerAdditionalVisual(npc,"Hum_Body_Naked0",4, head_model[math.random(1,6)], math.random(35,80));
	SetPlayerWalk(npc, "HumanS_Relaxed.mds");
	SetPlayerInstance(npc,"PC_HERO");
	SetPlayerFatness(npc, 0.5);
    
    SetPlayerStrength(npc, 100);
    SetPlayerDexterity(npc, 90);
    SetPlayerLevel(npc, 18);
    SetPlayerMaxHealth(npc, 200);
	SetPlayerHealth(npc, 200);
	SetPlayerSkillWeapon(npc, SKILL_1H, 50);
	--Items:
	EquipArmor(npc,"ITAR_MIL_L");
	EquipMeleeWeapon(npc,"ItMw_1h_Mil_Sword");
	SetPlayerWeaponMode(npc, 3)
    
    local npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = DR_TRAIN;
	npcarr.attack_routine = FAI_ONEH_MASTER;
	npcarr.WeaponMode = 3;
	npcarr.dialogs = dialogs;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = nil;
	npcarr.Guild = AI_GUILD_Dungeon;
	npcarr.aivar = {};
	npcarr.aivar["WARNTIME"] = 0;

	--npcarr.respawntime = 1800;
	
	return npcarr;
end

