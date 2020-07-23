function MilitiaGuard(district_name)
    local npc = CreateNPC(GetNewNPCName(district_name.. " Militia Guard"));
	
	SetPlayerAdditionalVisual(npc,"Hum_Body_Naked0",1, "Hum_Head_FatBald", 20);
	SetPlayerWalk(npc, "HumanS_Relaxed.mds");
	SetPlayerInstance(npc,"PC_HERO");
	SetPlayerFatness(npc, 0.5);
    
    SetPlayerStrength(npc, 200);
    SetPlayerDexterity(npc, 90);
    SetPlayerLevel(npc, 18);
    SetPlayerMaxHealth(npc, 1000);
	SetPlayerHealth(npc, 1000);
	SetPlayerSkillWeapon(npc, SKILL_1H, 50);
	--Items:
	EquipArmor(npc,"ITAR_MIL_L");
    EquipMeleeWeapon(npc,"ItMw_1h_Mil_Sword");
    
    local npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = DR_Guard_Lguard;
	npcarr.attack_routine = FAI_TEST;
	npcarr.WeaponMode = 3;
	npcarr.dialogs = dialogs;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = ON_WOLF_HIT;
	npcarr.Guild = AI_GUILD_Dungeon;
	npcarr.aivar = {};
	npcarr.aivar["WARNTIME"] = 0;



	--npcarr.respawntime = 1800;
	
	return npcarr;
end