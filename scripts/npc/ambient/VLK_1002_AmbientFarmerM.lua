
function VLK_1002_AmbientFarmerM()
	local npc = CreateNPC(GetNewNPCName("Bauer"));
    local head_model = {"Hum_Head_FatBald", "Hum_Head_Fighter", "Hum_Head_Pony", "Hum_Head_Bald", "Hum_Head_Thief", "Hum_Head_Psionic"}
    
	SetPlayerInstance(npc,"PC_HERO");
	SetPlayerAdditionalVisual(npc,"Hum_Body_Naked0",4, head_model[math.random(1,6)], math.random(35,80));
	SetPlayerWalk(npc, "Humans_Arrogance.mds");
	
	SetPlayerFatness(npc, 0.5);
	SetPlayerStrength(npc, 100);
    SetPlayerHealth(npc, 1000);
	SetPlayerMaxHealth(npc, 1000);
	SetPlayerSkillWeapon(npc, SKILL_1H, 50);
	--Items:
	local armors = {"ITAR_BAU_L","ITAR_BAU_M"}
	EquipArmor(npc, armors[math.random(1,2)]);

	EquipMeleeWeapon(npc,"ItMw_Schiffsaxt");

	
	local npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = DR_GUARD;
	npcarr.attack_routine = FAI_ONEH_MASTER;
	npcarr.WeaponMode = 3;
	npcarr.dialogs = dialogs;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = ON_WOLF_HIT;
	npcarr.Guild = AI_GUILD_HUMANS;
	
	return npcarr;
end


