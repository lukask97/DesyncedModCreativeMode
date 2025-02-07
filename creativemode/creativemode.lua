local package = ...
local profile = Game.GetProfile()

function package:setup_scenario(settings)
end

function package:on_world_spawn()
end

function package:init()
	--Game.GetModPackage("Main/Freeplay").on_player_faction_spawn = nil

	--Remove annoying beep of StopVoice. Otherwise will there be beep when skip all Talkinghead Poupups
	data.fx.fx_ui_WINDOW_TUT_NEXT.sound =  	"creativemode/silence.ogg" 
	data.fx.fx_ui_WINDOW_TUT_POPOUT.sound = "creativemode/silence.ogg" 


	if profile.CM_ItemCost then
		for k, item in pairs (data.items) do
			if item and item.production_recipe then
				item.production_recipe.ingredients = {}
				if type(item.production_recipe) == "table" then 
					for p,m in pairs(item.production_recipe.producers) do
						item.production_recipe.producers[p] = 1
					end
				end
			end
		end
	end

	if profile.CM_ComponentCost then
		for k, component in pairs (data.components) do
			if component and component.production_recipe then
				component.production_recipe.ingredients = {}
				if type(component.production_recipe) == "table" then 
					for p,m in pairs(component.production_recipe.producers) do
						component.production_recipe.producers[p]	 = 1
					end
				end

			end
		end
	end

	if profile.CM_BuildingCost or profile.CM_BotCost then
		for k, frame in pairs (data.frames) do
			if frame and frame.construction_recipe and profile.CM_BuildingCost then
				frame.construction_recipe.ingredients = {}
				frame.construction_recipe.ticks = 1
			end
			if frame and frame.production_recipe and profile.CM_BotCost then
				frame.production_recipe.ingredients = {}
				if type(frame.production_recipe) == "table" then 
					for p,m in pairs(frame.production_recipe.producers) do
						frame.production_recipe.producers[p] = 1
					end
				end
				
			end
		end
	end

	-- Custom Values
	data.components.c_power_cell.power = math.tointeger(tonumber(profile.CM_PowerCellPower)/5)
	data.components.c_power_cell.transfer_radius = tonumber(profile.CM_PowerCellRadius)
	data.frames.f_bot_1s_as.visibility_range = tonumber(profile.CM_ScoutViewRadius)

end


function package:on_player_faction_spawn(faction, is_respawn)
	
	faction.extra_data.started = Map.GetTick()
	faction.home_location = GetPlayerFactionHomeOnGround()
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



	if profile.CM_ExtraScouts then
		spawn_bots(faction,profile.CM_ExtraScoutsAmount ,loc)
	else 
		spawn_bots(faction,3,loc)
	end
	





	--Research Unlocked
	if profile.CM_Research then
		for k,tech in pairs(data.techs) do
			faction:Unlock(k)
		end	
	else
		--default_unlock
		faction:Unlock("t_robot_tech_basic")
	end

end

function spawn_bots(faction,num,loc)
	if profile.CM_ScoutCell then
		for i=1, num do
			local bot = Map.CreateEntity(faction, "f_bot_1s_as")
			bot:AddComponent("c_adv_miner", 1)
			bot:AddComponent("c_power_cell")
			bot:Place(loc.x, loc.y)
			bot.disconnected = false
		end
	else 
		for i=1, num do
			local bot = Map.CreateEntity(faction, "f_bot_1s_as")
			bot:AddComponent("c_adv_miner", 1)
			bot:Place(loc.x, loc.y)
			bot.disconnected = false
		end
	end

end




