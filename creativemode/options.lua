
--[[ 
Conatiner for a Checkbox --------------------------------------------------------------------------

<HorizontalList><Text width=500 text=""/><Button id= on_click={} width=32 height=32/></HorizontalList>

Conatainer for a Value ---------------------------------------------------------------------------

<HorizontalList><Text width=468 text=""/><InputText id= on_commit={} default=1 min=1 max=65535width=64 height=32 /></HorizontalList>

Conatainer for a Value and Reset ---------------------------------------------------------------------------

<HorizontalList><Text width=400 text=""/><Button text="Defaultt" on_click={} width=65 /><Text width=3 /><InputText id= on_commit={} default=1 min=1 max=255 width=64 height=32 /></HorizontalList>
		
 ]]



local profile = Game.GetProfile()
return UI.New([[
	<VerticalList child_padding=8>
		<Text text="Creative Mod" size=20 color=title textalign=center/>
		<HorizontalList height = 2><Image color="#FFFFFF" fill=true/></HorizontalList>
		<Text text="Cheats" size=15 color=title textalign=center/>
		<HorizontalList height = 2></HorizontalList>
		<VerticalList child_align=right>
			<HorizontalList><Text width=500 text="Research Unlocked"/><Button id=CM_Research on_click={on_CM_Research} width=32 height=32/></HorizontalList>
			<HorizontalList><Text width=500 text="Buildings for free"/><Button id=CM_BuildingCost on_click={on_CM_BuildingCost} width=32 height=32/></HorizontalList>
			<HorizontalList><Text width=500 text="Start with extra Miner-Scouts"/><Button id=CM_ExtraScouts on_click={on_CM_ExtraScouts} width=32 height=32/></HorizontalList>
			<HorizontalList><Text width=500 text="Equip starting Scouts with a Power Cell"/><Button id=CM_ScoutCell on_click={on_CM_ScoutCell} width=32 height=32/></HorizontalList>
			<HorizontalList><Text width=500 text="Componets for free"/><Button id=CM_ComponentCost on_click={on_CM_ComponentCost} width=32 height=32/></HorizontalList>
			<HorizontalList><Text width=500 text="Bots for free"/><Button id=CM_BotCost on_click={on_CM_BotCost} width=32 height=32/></HorizontalList>
			<HorizontalList><Text width=500 text="Items for free"/><Button id=CM_ItemCost on_click={on_CM_ItemCost} width=32 height=32/></HorizontalList>
		</VerticalList>

		<Text text="Custom Values" size=15 color=title textalign=center/>
		<VerticalList child_align=right>	
			<HorizontalList><Text width=400 text="Amount of starting Scouts"/><Button text="Default" on_click={reset_CM_ExtraScoutsAmount} width=65 /><Text width=3 /><InputText id=CM_ExtraScoutsAmount on_commit={on_CM_ExtraScoutsAmount} default=1 min=1 max=65535 width=64 height=32 /></HorizontalList>
			<HorizontalList><Text width=400 text="Power generated from Power Cells"/><Button text="Default" on_click={reset_CM_PowerCellPower} width=65 /><Text width=3 /><InputText id=CM_PowerCellPower on_commit={on_CM_PowerCellPower} default=1 min=1 max=65535 width=64 height=32 /></HorizontalList>
			<HorizontalList><Text width=400 text="Power Radius of Power Cells(max 255)"/><Button text="Default" on_click={reset_CM_PowerCellRadius} width=65 /><Text width=3 /><InputText id=CM_PowerCellRadius on_commit={on_CM_PowerCellRadius} default=1 min=1 max=255 width=64 height=32 /></HorizontalList>
			<HorizontalList><Text width=400 text="View Radius of Scouts(max 255)"/><Button text="Default" on_click={reset_CM_ScoutViewRadius} width=65 /><Text width=3 /><InputText id=CM_ScoutViewRadius on_commit={on_CM_ScoutViewRadius} default=1 min=1 max=255 width=64 height=32 /></HorizontalList>
		</VerticalList>
	</VerticalList>
	]], {
	construct = function(menu)

		-- default values
		if profile.CM_ExtraScoutsAmount == nil then profile.CM_ExtraScoutsAmount = 10 end
		if profile.CM_PowerCellPower == nil then profile.CM_PowerCellPower = 500 end
		if profile.CM_PowerCellRadius == nil then 	profile.CM_PowerCellRadius = 10 end
		if profile.CM_ScoutViewRadius == nil then 	profile.CM_ScoutViewRadius = 10 end
		
		if profile.CM_Research == nil then profile.CM_Research=true end
		if profile.CM_BuildingCost == nil then profile.CM_BuildingCost = true end
		if profile.CM_ExtraScouts == nil then profile.CM_ExtraScouts = true end
		if profile.CM_ScoutCell == nil then profile.CM_ScoutCell = true end
		if profile.CM_ComponentCost == nil then profile.CM_ComponentCost = true end
		if profile.CM_BotCost == nil then profile.CM_BotCost = true end
		if profile.CM_ItemCost == nil then profile.CM_ItemCost = false end
		if profile.CreativeModeFirstRun == nil then profile.CreativeModeFirstRun= true end

		-- Research
		local cm_Research = profile.CM_Research
		menu.CM_Research.icon = cm_Research and "icon_small_confirm" or nil
		menu.CM_Research.active = cm_Research or false

		--Buildingcost
		local cm_BuildingCost = profile.CM_BuildingCost
		menu.CM_BuildingCost.icon = cm_BuildingCost and "icon_small_confirm" or nil
		menu.CM_BuildingCost.active = cm_BuildingCost or false

		--ExtraScouts 
		local cm_ExtraScouts  = profile.CM_ExtraScouts
		menu.CM_ExtraScouts.icon = cm_ExtraScouts  and "icon_small_confirm" or nil
		menu.CM_ExtraScouts.active = cm_ExtraScouts  or false

		--ScoutCell
		local cm_ScoutCell  = profile.CM_ScoutCell
		menu.CM_ScoutCell.icon = cm_ScoutCell  and "icon_small_confirm" or nil
		menu.CM_ScoutCell.active = cm_ScoutCell  or false

		--ComponentCost
		local cm_ComponentCost = profile.CM_ComponentCost
		menu.CM_ComponentCost.icon = cm_ComponentCost and "icon_small_confirm" or nil
		menu.CM_ComponentCost.active = cm_ComponentCost or false
		
		--BotCost
		local cm_BotCost = profile.CM_BotCost
		menu.CM_BotCost.icon = cm_BotCost and "icon_small_confirm" or nil
		menu.CM_BotCost.active = cm_BotCost or false

		--ItemCost
		local cm_ItemCost = profile.CM_ItemCost
		menu.CM_ItemCost.icon = cm_ItemCost and "icon_small_confirm" or nil
		menu.CM_ItemCost.active = cm_ItemCost or false



		--ExtraScoutsAmount
		local cm_ExtraScoutsAmount = profile.CM_ExtraScoutsAmount
		menu.CM_ExtraScoutsAmount.text = cm_ExtraScoutsAmount
		
		--PowerCellPower
		local cm_PowerCellPower = profile.CM_PowerCellPower
		menu.CM_PowerCellPower.text = cm_PowerCellPower

		--PowerCellRadius
		local cm_PowerCellRadius = profile.CM_PowerCellRadius
		menu.CM_PowerCellRadius.text = cm_PowerCellRadius

		--ScoutViewRadius
		local cm_ScoutViewRadius = profile.CM_ScoutViewRadius
		menu.CM_ScoutViewRadius.text = cm_ScoutViewRadius
	end,

	on_CM_Research = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CM_Research = value
	end,
	on_CM_BuildingCost = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CM_BuildingCost = value
	end,
	on_CM_ExtraScouts  = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CM_ExtraScouts  = value
	end,
	on_CM_ScoutCell = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CM_ScoutCell = value
	end,
	on_CM_ComponentCost = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CM_ComponentCost = value
	end,
	on_CM_BotCost = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CM_BotCost = value
	end,
	on_CM_ItemCost = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CM_ItemCost = value
	end,
	
	-- Values --------------------------------------
	on_CM_ExtraScoutsAmount = function(menu,chk)
		local value = chk.text
		if tonumber(value) == nil then MessageBox("Input is Not a number") return end
		profile.CM_ExtraScoutsAmount = value
	end,
	reset_CM_ExtraScoutsAmount = function(menu,chk)
		menu.CM_ExtraScoutsAmount.text = 3
		profile.CM_ExtraScoutsAmount = 3
	end,
	on_CM_PowerCellPower = function(menu,chk)
		local value = chk.text
		if tonumber(value) == nil then MessageBox("Input is Not a number") return end
		profile.CM_PowerCellPower = value
	end,
	reset_CM_PowerCellPower = function(menu,chk)
		menu.CM_PowerCellPower.text = 500
		profile.CM_PowerCellPower = 3
	end,
	on_CM_PowerCellRadius = function(menu,chk)
		local value = chk.text
		if tonumber(value) == nil then MessageBox("Input is Not a number") return end
		profile.CM_PowerCellRadius = value
	end,
	reset_CM_PowerCellRadius = function(menu,chk)
		menu.CM_PowerCellRadius.text = 10
		profile.CM_PowerCellRadius = 3
	end,

	on_CM_ScoutViewRadius = function(menu,chk)
		local value = chk.text
		if tonumber(value) == nil then MessageBox("Input is Not a number") return end
		profile.CM_ScoutViewRadius = value	
	end,
	reset_CM_ScoutViewRadius = function(menu,chk)
		menu.CM_ScoutViewRadius.text = 10
		profile.CM_ScoutViewRadius = 3
	end,
})
--Are you reading this?
-- Hello

