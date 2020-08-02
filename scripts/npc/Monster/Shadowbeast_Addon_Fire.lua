function Shadowbeast_Addon_Fire()
	local npc = CreateNPC(GetNewNPCName("Diabolo"));
	
	if(npc == -1)then
		print("Creating Shadowbeast Failed!");
	end
	
	SetPlayerInstance(npc,"Shadowbeast_Addon_Fire");
	
	SetPlayerStrength(npc, 300);
	SetPlayerDexterity(npc, 300);
	SetPlayerLevel(npc, 30);
	SetPlayerMaxHealth(npc, 4050);
	SetPlayerHealth(npc, 4050);
	
	
	npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = nil;
	npcarr.attack_routine = FAI_WOLF_ATTACK;
	npcarr.WeaponMode = 0;
	npcarr.dialogs = nil;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = ON_WOLF_HIT;
	npcarr.Guild = AI_GUILD_Shadowbeast;
	npcarr.func = Shadowbeast;
	npcarr.respawntime = 60;
	
	return npcarr;
end