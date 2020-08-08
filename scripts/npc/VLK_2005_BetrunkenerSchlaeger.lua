
function VLK_2005_BetrunkenerSchlaeger()
	local npc = CreateNPC(GetNewNPCName("Betrunkener Schlaeger"));
	
	SetPlayerAdditionalVisual(npc,"Hum_Body_Naked0",4, "Hum_Head_Fighter", 70);
	SetPlayerWalk(npc, "Humans_Arrogance.mds");
	SetPlayerInstance(npc,"PC_HERO");
	SetPlayerFatness(npc, 0.5);
    SetPlayerStrength(npc, 150);
    SetPlayerHealth(npc, 1400);
    SetPlayerSkillWeapon(npc, SKILL_1H, 50);
    SetPlayerMaxHealth(npc, 1400);
	--Items:
	EquipArmor(npc,"ITAR_VLK_L");
	EquipMeleeWeapon(npc,"ItMw_Nagelknueppel");
	
	
	local npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = DR_CAMP;
	npcarr.attack_routine = FAI_ONEH_MASTER;
	npcarr.WeaponMode = 3;
	npcarr.dialogs = dialogs;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = ON_WOLF_HIT;
	npcarr.Guild = AI_GUILD_GuildLess;
    npcarr.aivar = {};
    npcarr.respawntime = 60;
	npcarr.aivar["WARNTIME"] = 0;
	
	return npcarr;
end

