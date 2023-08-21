local profile = Game.GetProfile()
return UI.New([[
	<VerticalList child_padding=8>
		<Text text="Creative Mod" style=h1 size=15 color=title textalign=center/>
		<HorizontalList height = 2><Image color="#FFFFFF" fill=true/></HorizontalList>
		<Text text="Choose the 'cheats' you want to activate" textalign=center/>
		<HorizontalList height = 2></HorizontalList>
		<VerticalList child_align=right>
			<HorizontalList><Text width=500 text="Research Unlocked"/><Button id=CM_Research on_click={on_CM_Research} width=32 height=32/></HorizontalList>
			<HorizontalList><Text width=500 text="Buildings for free"/><Button id=CM_Buildingcost on_click={on_CM_Buildingcost} width=32 height=32/></HorizontalList>
			<HorizontalList><Text width=500 text="Start with extra Miner-Scouts (10 Units)"/><Button id=CM_ExtraScouts on_click={on_CM_ExtraScouts} width=32 height=32/></HorizontalList>
			<HorizontalList><Text width=500 text="Equip starting Scouts with a Power Cell"/><Button id=CM_ScoutCell on_click={on_CM_ScoutCell} width=32 height=32/></HorizontalList>

		</VerticalList>

	</VerticalList>
	]], {
	construct = function(menu)

		-- defaults
		if not profile.CustomStartFirstRun then
			profile.CM_Research = true
			profile.CM_Buildingcost = true
			profile.CM_ExtraScouts  = true
			profile.CM_ScoutCell = true
			profile.CustomStartFirstRun = true
		end

		-- Research
		local cm_Research = profile.CM_Research
		menu.CM_Research.icon = cm_Research and "icon_small_confirm" or nil
		menu.CM_Research.active = cm_Research or false

		--Buildingcost
		local cm_Buildingcost = profile.CM_Buildingcost
		menu.CM_Buildingcost.icon = cm_Buildingcost and "icon_small_confirm" or nil
		menu.CM_Buildingcost.active = cm_Buildingcost or false

		--ExtraScouts 
		local cm_ExtraScouts  = profile.CM_ExtraScouts 
		menu.CM_ExtraScouts.icon = cm_ExtraScouts  and "icon_small_confirm" or nil
		menu.CM_ExtraScouts.active = cm_ExtraScouts  or false

	  	--ExtraScouts 
		local cm_ExtraScouts  = profile.CM_ExtraScouts 
		menu.CM_ExtraScouts.icon = cm_ExtraScouts  and "icon_small_confirm" or nil
		menu.CM_ExtraScouts.active = cm_ExtraScouts  or false

		--ScoutCell
		local cm_ScoutCell  = profile.CM_ScoutCell 
		menu.CM_ScoutCell.icon = cm_ScoutCell  and "icon_small_confirm" or nil
		menu.CM_ScoutCell.active = cm_ScoutCell  or false
	end,

	-- HQ options
	on_CM_Research = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CM_Research = value
	end,
	on_CM_Buildingcost = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CM_Buildingcost = value
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

})
