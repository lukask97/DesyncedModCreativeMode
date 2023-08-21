local package = ...

function package:setup_scenario(settings)
end

function package:on_world_spawn()
end

function package:init()
	Game.GetModPackage("Main/Freeplay").on_player_faction_spawn = nil

	for k,frame in pairs(data.frames) do	
		if data.frames[k].construction_recipe ~= nil then 
			if data.frames[k].construction_recipe.ingredients ~= nil then 
				data.frames[k].construction_recipe.ingredients = { }
				data.frames[k].construction_recipe.ticks = 1
			end	
		end		
	end
end
	


function package:on_player_faction_spawn(faction, is_respawn)
	faction.extra_data.started = Map.GetTick()
	faction.home_location = faction.id == "player" and Map.GetSettings().tutorial and { 13, 20 } or GetPlayerFactionHomeOnGround()
	local loc = faction.home_location

	-- lander bot
	local lander = Map.CreateEntity(faction, "f_bot_2m_as")
	lander:AddComponent("c_deployment", "hidden")
	lander:AddComponent("c_power_cell")
	lander:AddComponent("c_assembler", 1)
	lander:AddComponent("c_fabricator", 2)
	lander:AddItem("metalbar", 20)
	lander:AddItem("metalplate", 20)
	lander:AddItem("reinforced_plate", 20)
	lander:AddItem("energized_plate", 20)
	lander:AddItem("circuit_board", 20) 
	lander:AddItem("wire", 20) 
	lander:Place(loc.x, loc.y)
	lander.disconnected = false
	faction.home_entity = lander

	spawn_bots(faction,10,loc)

	for k,tech in pairs(data.techs) do
		faction:Unlock(k)
	end	

end

function spawn_bots(faction,num,loc)
	for i=1, num do
		local bot = Map.CreateEntity(faction, "f_bot_1s_as")
		bot:AddComponent("c_adv_miner", 1)
		bot:AddComponent("c_power_cell")
		bot:Place(loc.x, loc.y)
		bot.disconnected = false
	end
end