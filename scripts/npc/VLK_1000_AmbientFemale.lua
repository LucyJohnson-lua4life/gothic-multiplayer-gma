
function VLK_1000_AmbientFemale()
	local npc = CreateNPC(GetNewNPCName("Buergerin"));
	local head_model = { "Hum_Head_Pony","Hum_Head_Bald", "Hum_Head_Babe"}
	SetPlayerAdditionalVisual(npc,"Hum_Body_Babe0",4, head_model[math.random(1,3)], math.random(142,155));
	SetPlayerWalk(npc, "Humans_Babe.mds");
	SetPlayerInstance(npc,"PC_HERO");
	SetPlayerFatness(npc, 0.5);
    SetPlayerStrength(npc, 10);
    SetPlayerHealth(npc, 9999);
    SetPlayerMaxHealth(npc, 9999);
	--Items:
	local armors = {"ITAR_VlkBabe_M","ITAR_VlkBabe_L"}
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


function TA_VLK_1000(_playerid)
	
	if(TA_FUNC(_playerid, 0, 0, 24, 0))then
		AI_ClearStates(_playerid);
		AI_SETWALKTYPE(_playerid, 0);--Let him walk!
		--AI_GOTOFP(_playerid, "FP_SMALLTALK_CITY_04_02");
		--AI_ALIGNTOFP(_playerid, "FP_SMALLTALK_CITY_04_02");
		AI_PLAYANIMATION(_playerid, "S_HGUARD");
	end
end