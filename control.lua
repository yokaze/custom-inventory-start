utility = require("utility")

function fill_armor_grid(grid, roboports)
	grid.put({ name = "night-vision-equipment" })
	for i = 1, roboports do
		grid.put({ name = "personal-roboport-mk2-equipment" })
	end
	grid.put({ name = "belt-immunity-equipment" })
	for i = 0, grid.width - 1 do
		grid.put({
			name = "battery-mk2-equipment",
			position = { i, grid.height - 2 },
		})
	end

	repeat
	until grid.put({ name = "solar-panel-equipment" }) == nil
end

function add_initial_items(event)
	local player = game.players[event.player_index]
	if settings.startup[utility.settings_clear_inventory].value then
		player.clear_items_inside()
	end

	armor_opt = settings.startup[utility.settings_initial_armor].value
	if armor_opt == utility.settings_initial_armor_mk1 then
		arm = player.get_inventory(defines.inventory.character_armor)
		arm.insert({ name = "power-armor", count = 1 })
		fill_armor_grid(arm[1].grid, 1)
	elseif armor_opt == utility.settings_initial_armor_mk2 then
		arm = player.get_inventory(defines.inventory.character_armor)
		arm.insert({ name = "power-armor-mk2", count = 1 })
		fill_armor_grid(arm[1].grid, 2)
	end

	for _, item in ipairs(utility.items) do
		count = settings.startup[utility.get_setting_name(item)].value
		if count > 0 then
			player.insert({ name = item, count = count })
		end
	end
end

script.on_event(defines.events.on_cutscene_cancelled, add_initial_items)
