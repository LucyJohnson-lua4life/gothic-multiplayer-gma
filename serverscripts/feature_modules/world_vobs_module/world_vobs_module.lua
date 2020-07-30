local world_vobs_module = {}

local rock_on_pyramid = nil

function world_vobs_module.OnGamemodeInit()
    rock_on_pyramid = Vob.Create("aw_crate_01.3DS", "NEWWORLD\\NEWWORLD.ZEN", 74340,6749,29292)--static method
end


return world_vobs_module