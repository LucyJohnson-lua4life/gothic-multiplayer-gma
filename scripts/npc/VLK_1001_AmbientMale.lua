
function VLK_1001_AmbientMale()
	local npc = CreateNPC(GetNewNPCName("Buerger"));
    local head_model = {"Hum_Head_FatBald", "Hum_Head_Fighter", "Hum_Head_Pony", "Hum_Head_Bald", "Hum_Head_Thief", "Hum_Head_Psionic"}
    

	SetPlayerAdditionalVisual(npc,"Hum_Body_Naked0",4, head_model[math.random(1,6)], math.random(35,80));
	SetPlayerWalk(npc, "Humans_Arrogance.mds");
	SetPlayerInstance(npc,"PC_HERO");
	SetPlayerFatness(npc, 0.5);
    SetPlayerStrength(npc, 10);
    SetPlayerHealth(npc, 9999);
    SetPlayerMaxHealth(npc, 9999);
	--Items:
	local armors = {"ITAR_VLK_L","ITAR_VLK_M"}
	EquipArmor(npc, armors[math.random(1,2)]);

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


function TA_VLK_1001(_playerid)
	
	if(TA_FUNC(_playerid, 0, 0, 24, 0))then
		AI_ClearStates(_playerid);
		AI_SETWALKTYPE(_playerid, 0);--Let him walk!
		--AI_GOTOFP(_playerid, "FP_SMALLTALK_CITY_04_02");
		--AI_ALIGNTOFP(_playerid, "FP_SMALLTALK_CITY_04_02");
		AI_PLAYANIMATION(_playerid, "S_HGUARD");
	end
end