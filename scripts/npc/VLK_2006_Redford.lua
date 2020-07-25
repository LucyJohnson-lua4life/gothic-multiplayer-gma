
function VLK_2006_Redford()
	local npc = CreateNPC(GetNewNPCName("Redford"));
	
	SetPlayerAdditionalVisual(npc,"Hum_Body_Naked0",2, "Hum_Head_Fighter", 121);
	SetPlayerWalk(npc, "Humans_Arrogance.mds");
	SetPlayerInstance(npc,"PC_HERO");
	SetPlayerFatness(npc, 0.5);
    SetPlayerStrength(npc, 120);
    SetPlayerHealth(npc, 9999);
    SetPlayerMaxHealth(npc, 9999);
	--Items:
	EquipArmor(npc,"ITAR_SLD_H");
	EquipMeleeWeapon(npc,"ItMw_2H_Axe_L_04");
	
	
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
